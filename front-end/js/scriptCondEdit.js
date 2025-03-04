let condutorCnh;
document.addEventListener('DOMContentLoaded', () => {
    // Recupera os dados armazenados no sessionStorage
    condutorCnh = sessionStorage.getItem('condutorCnhEdit');
    loadPage(condutorCnh);
});

async function loadPage(condutorCnh) {

  const selectElement = document.getElementById('cabecalhoCondutor');
  const selectElementBody = document.getElementById('corpoDiv');
  
  selectElement.innerHTML = '';
  selectElementBody.innerHTML = '';

  if (condutorCnh) {
      const response = await fetch('http://localhost:8080/condutores/' + condutorCnh, { method: "GET" });
      const jsonData = await response.json();
     
      const selectElement = document.getElementById('cabecalhoCondutor');
      const selectElementBody = document.getElementById('corpoDiv');

      let cond = document.createElement("div");
      let linhas = document.createElement("div");

      let HTML;
      let HTML2 = '';
      
      HTML = `
      <div class="w3-display-container">
        <img src="../img/users-image/${jsonData.imgPath}" style="width:100%">
        <a href="index.html" class="w3-button w3-display-topleft w3-xlarge w3-yellow"><i class="fa fa-reply fa-fw w3-text-black"></i></a>
        <div class="w3-container w3-yellow w3-topbar w3-bottombar w3-border-black">
          <h2><i class="w3-margin-right"></i>${jsonData.name}</h2>
        </div>
      </div>`;
      HTML = HTML + `<div class="w3-container">`;

      const responseCel = await fetch('http://localhost:8080/celulares/' + jsonData.cnh, { method: "GET" });
      const subJsonCel = await responseCel.json();
      subJsonCel.forEach(cel => {
          HTML = HTML + `<p><i class="fa fa-phone fa-fw w3-margin-right w3-large"></i>${cel.celular}</p>`
      });
      const responseEmail = await fetch('http://localhost:8080/emails/' + jsonData.cnh, { method: "GET" });
      const subJsonEmail = await responseEmail.json();
      subJsonEmail.forEach(email => {
          HTML = HTML + `<p><i class="fa fa-envelope fa-fw w3-margin-right w3-large"></i>${email.email}</p>`
      });
      HTML = HTML + `<hr>
      <p class="w3-large"><b><i class="fa fa-clock-o fa-fw w3-margin-right"></i>Horários</b></p>
      <ul class="w3-ul w3-padding-16">`;

      const responseLinhas = await fetch('http://localhost:8080/linhas/' + jsonData.cnh, { method: "GET" });
      const subJsonLinhas = await responseLinhas.json();
      
      const linesHTML = await Promise.all(subJsonLinhas.map(async (linha) => {
          HTML = HTML + `<li>`;
          if (linha.periodo == "Período da Manhã") {
              HTML = HTML + `<i class="fa fa-coffee w3-margin-right w3-large"></i> ${linha.periodo}`;
          } else if (linha.periodo == "Período da Tarde") {
              HTML = HTML + `<i class="fa fa-sun-o w3-margin-right w3-large"></i> ${linha.periodo}`;
          } else if (linha.periodo == "Período da Noite") {
              HTML = HTML + `<i class="fa fa-moon-o w3-margin-right w3-large"></i> ${linha.periodo}`;
          } else if (linha.periodo == "Período Integral") {
              HTML = HTML + `<i class="fa fa-clock-o w3-margin-right w3-large"></i> ${linha.periodo}`;
          }
          
          const switchElement = linha.possuiVagas
              ? `<label class="switch w3-right">
                  <input type="checkbox" checked data-linha-id="${linha.id}">
                  <span class="slider round"></span>
              </label>`
              : `<label class="switch w3-right">
                  <input type="checkbox" data-linha-id="${linha.id}">
                  <span class="slider round"></span>
              </label>`;
          
          HTML = HTML + switchElement;
          HTML = HTML + `</li>`;

          if (linha.possuiVagas) {
            const linhaHTML = await montaHTML(linha);
            HTML2 += linhaHTML; // Se o checkbox estiver marcado, já adicione a linha no HTML
          }
          // Não acumular HTML aqui, vamos fazer isso no evento de mudança do checkbox
          return;
      }));

      HTML2 += linesHTML.join('');

      HTML = HTML + `</ul>
      </div>`;

      cond.innerHTML = HTML;
      linhas.innerHTML = HTML2;
      
      selectElement.append(cond);
      selectElementBody.append(linhas);

      // Adiciona evento de mudança para os checkboxes
      const checkboxes = document.querySelectorAll('.switch input[type="checkbox"]');
      checkboxes.forEach(checkbox => {
          checkbox.addEventListener('change', async (event) => {
              const linhaId = event.target.getAttribute('data-linha-id');
              const linha = subJsonLinhas.find(l => l.id == linhaId); // Encontre a linha correspondente

              // Atualiza o estado de 'possuiVagas' e faz o PUT para a API
              linha.possuiVagas = event.target.checked ? 1 : 0;

              // Chama a API para salvar a alteração no banco de dados
              await fetch('http://localhost:8080/linhas', {
                  method: 'PUT',
                  headers: {
                      'Content-Type': 'application/json'
                  },
                  body: JSON.stringify(linha) // Envia a linha com o campo 'possuiVagas' atualizado
              });

              if (event.target.checked) {
                  // Se o checkbox for marcado, chame o montaHTML
                  const linhaHTML = await montaHTML(linha);
                  // Adicione o HTML da linha à seção
                  selectElementBody.innerHTML += linhaHTML;
              } else {
                  // Se o checkbox for desmarcado, remova a linha correspondente
                  const linhaHTML = await montaHTML(linha);
                  selectElementBody.innerHTML = selectElementBody.innerHTML.replace(linhaHTML, '');
              }
          });
      });
  } else {
      console.error('Dados do condutor não encontrados no sessionStorage');
  }
}


async function carregaEscolaLinhas(id){
  const responseEscolasLinha = await fetch('http://localhost:8080/escolaslinhas/'+id,{method: "GET"});
  const subJsonEscolasLinha = await responseEscolasLinha.json();
  
  const escolasHTML = await Promise.all(subJsonEscolasLinha.map(async (escolaLinha) => {
    const escolaHTML = await carregaEscolas(escolaLinha.idEscolas);
    return escolaHTML;
  }));

  return escolasHTML.join('');
}
async function carregaEscolas(idEscolas){
    const responseEscola = await fetch('http://localhost:8080/escolas/'+idEscolas,{method: "GET"});
    const subJsonEscola = await responseEscola.json();
    return `<li>${subJsonEscola.desc}</li>`;
}

async function carregaBairroLinhas(id){
  const responseBairrosLinha = await fetch('http://localhost:8080/bairroslinhas/'+id,{method: "GET"});
  const subJsonBairrosLinha = await responseBairrosLinha.json();
  
  const bairrosHTML = await Promise.all(subJsonBairrosLinha.map(async (bairroLinha) => {
    const bairroHTML = await carregaBairros(bairroLinha.idBairros);
    return bairroHTML;
  }));

  return bairrosHTML.join('');
}

async function carregaBairros(idBairros){
  const responseBairro = await fetch('http://localhost:8080/bairros/'+idBairros,{method: "GET"});
  const subJsonBairro = await responseBairro.json();
  return `<li>${subJsonBairro.desc}</li>`;
}

async function montaHTML(linha) {
  let HTML = `<div class="w3-container w3-card w3-white w3-margin-bottom">
      <h2 class="w3-container w3-yellow w3-topbar w3-bottombar w3-border-black w3-padding-16">
          <i class="fa fa-coffee fa-fw w3-margin-right w3-xxlarge"></i>${linha.periodo}
      </h2>
      <div class="w3-container">
          <div class="w3-half">
              <h3 class="w3-container w3-padding-16 ">
                  <i class="fa fa-mortar-board fa-fw w3-margin-right w3-xlarge"></i>Escolas
              </h3>
              <ul class="w3-ul w3-padding-16 w3-margin">`;

  // Espera pela função assíncrona carregaEscolaLinhas antes de continuar
  HTML = HTML + await carregaEscolaLinhas(linha.id);

  HTML = HTML + `</ul>
          </div>
          <div class="w3-half">
              <h3 class="w3-container w3-padding-16 ">
                  <i class="fa fa-home fa-fw w3-margin-right w3-xlarge"></i>Bairros
              </h3>
              <ul class="w3-ul w3-padding-16 w3-margin">`;

  // Espera pela função assíncrona carregaBairroLinhas antes de continuar
  HTML = HTML + await carregaBairroLinhas(linha.id);

  HTML = HTML + `</ul>
          </div>
      </div>
      <button onclick="openEscolas(${linha.id});" class="w3-left w3-button w3-black w3-margin"><i class="fa fa-edit w3-margin-right"></i> Editar Escolas</button>
      <button onclick="openBairros(${linha.id});" class="w3-right w3-button w3-black w3-margin"><i class="fa fa-edit w3-margin-right"></i> Editar Bairros</button>    
  </div>`;

  // Retorna o HTML final
  return HTML;
}

async function openEscolas(id) {
  const response = await fetch('http://localhost:8080/escolas', { method: "GET" });
  const json = await response.json();

  const selectElement = document.getElementById('escolasEdit');

  let HTML = await montaHTMLEscolasEdit(id);
  let escolas = document.createElement("div");
  escolas.innerHTML = HTML;
  selectElement.append(escolas);

  preencherEscolasEdit(json, id);
  selectElement.style.visibility = "visible";
}

async function montaHTMLEscolasEdit(id) {
  let HTML = `<div class="w3-container w3-black">
      <h2 class="w3-text-yellow"><i class="fa fa-coffee w3-margin-right w3-text-yellow"></i>Período da manhã:</h2>
    </div>
    <div class="w3-container w3-white w3-padding-16">
      <div class="w3-half" style.height="800px" style.overflow="overflow">
        <h3 class="w3-container w3-padding-16 "><i class="fa fa-mortar-board fa-fw w3-margin-right w3-xlarge"></i>Escolas Disponíveis:</h3>
        <form class="w3-margin">
            <div class="w3-row">
              <input class="w3-input w3-border w3-threequarter">
              <button class="w3-button w3-quarter w3-black"><i class="fa fa-search"></i></button>
            </div>
        </form>
        <ul class="w3-ul w3-margin w3-border" id="listaEscolasEdit"></ul>
      </div>
      <div class="w3-half">
        <h3 class="w3-container w3-padding-16 "><i class="fa fa-bus fa-fw w3-margin-right w3-xlarge"></i>Escolas na minha linha:</h3>
        <form class="w3-margin">
          <div class="w3-row">
            <input class="w3-input w3-border w3-threequarter">
            <button class="w3-button w3-quarter w3-black"><i class="fa fa-search"></i></button>
          </div>
      </form>
        <ul class="w3-ul w3-margin w3-border" id="listaSuasEscolasEdit"></ul>
      </div>
      <button onClick="cancelOpenEscolas()" class="w3-left w3-button w3-black w3-margin"><i class="fa fa-close w3-margin-right"></i> Cancelar</button>
      <button onClick="salvarEscolas(${id})" class="w3-right w3-button w3-black w3-margin"><i class="fa fa-arrow-right w3-margin-right"></i> Salvar</button>  
    </div>`;

  return HTML;
}

async function preencherEscolasEdit(jsonData, id) {
  const selectElement = document.getElementById('listaEscolasEdit');
  selectElement.innerHTML = ''; // Limpa a lista de escolas disponíveis

  // Primeiro, carrega as escolas na minha linha
  const escolasNaMinhaLinha = await carregaEscolaLinhasEdit(id);

  jsonData.forEach(escola => {
    // Se a escola já está nas "minhas escolas", não a adiciona
    if (!escolasNaMinhaLinha.includes(escola.id)) {
      const esc = document.createElement("li");
      esc.classList.add("w3-display-container");
      esc.innerHTML = `
        ${escola.desc}
        <span onclick="adicionarEscolaNaLinha(this, ${escola.id})"
              class="w3-button w3-display-right"><i class="fa fa-plus w3-text-green"></i></span>
      `;
      selectElement.append(esc);
    }
  });
  
  // Carregar as escolas na minha linha
  carregaEscolaLinhasEdit(id);
}

function cancelOpenEscolas(){
  const selectElement = document.getElementById('escolasEdit');
  selectElement.innerHTML = '<div id="escolasEdit" class="w3-border w3-border-black w3-display-middle w3-col l6 m8" style="visibility: hidden"></div>'
  selectElement.style.visibility = "hidden";
}

async function carregaEscolaLinhasEdit(id) {
  const responseEscolasLinha = await fetch('http://localhost:8080/escolaslinhas/' + id, { method: "GET" });
  const subJsonEscolasLinha = await responseEscolasLinha.json();

  const escolasHTML = await Promise.all(subJsonEscolasLinha.map(async (escolaLinha) => {
    const escolaHTML = await carregaEscolasEdit(escolaLinha.idEscolas);
    return escolaHTML;
  }));

  const listaSuasEscolasEdit = document.getElementById('listaSuasEscolasEdit');
  listaSuasEscolasEdit.innerHTML = escolasHTML.join('');

  // Retorna uma lista com os IDs das escolas para verificar quais estão na linha
  return subJsonEscolasLinha.map(escola => escola.idEscolas);
}

async function carregaEscolasEdit(idEscolas) {
  const responseEscola = await fetch('http://localhost:8080/escolas/' + idEscolas, { method: "GET" });
  const subJsonEscola = await responseEscola.json();
  return `
    <li class="w3-display-container">
      ${subJsonEscola.desc}
      <span onclick="removerEscolaDaLinha(this, ${subJsonEscola.id})"
            class="w3-button w3-display-right"><i class="fa fa-close w3-text-red"></i></span>
    </li>`;
}

function adicionarEscolaNaLinha(button, idEscola) {
  const li = button.closest("li");
  const listaSuasEscolasEdit = document.getElementById('listaSuasEscolasEdit');
  
  // Remover a escola da lista de disponíveis
  li.remove();
  
  // Buscar dados da escola
  fetch(`http://localhost:8080/escolas/${idEscola}`)
    .then(response => response.json())
    .then(data => {
      // Criar o item para a lista de "Escolas na minha linha"
      const novaEscola = document.createElement("li");
      novaEscola.classList.add("w3-display-container");
      novaEscola.dataset.id = data.id;
      novaEscola.innerHTML = `${data.desc}
        <span onclick="removerEscolaDaLinha(this, ${data.id})"
              class="w3-button w3-display-right"><i class="fa fa-close w3-text-red"></i></span>`;
      
      // Adicionar a escola na lista e ordenar a lista de "Escolas na minha linha"
      listaSuasEscolasEdit.appendChild(novaEscola);
      
      // Ordenar a lista em ordem alfabética
      ordenarLista(listaSuasEscolasEdit);
    });
}

function removerEscolaDaLinha(button, idEscola) {
  const li = button.closest("li");
  const listaEscolasEdit = document.getElementById('listaEscolasEdit');
  
  // Remover a escola da lista "Minha linha"
  li.remove();
  
  // Buscar dados da escola
  fetch(`http://localhost:8080/escolas/${idEscola}`)
    .then(response => response.json())
    .then(data => {
      // Criar o item para a lista de "Escolas disponíveis"
      const novaEscola = document.createElement("li");
      novaEscola.classList.add("w3-display-container");
      novaEscola.dataset.id = data.id;
      novaEscola.innerHTML = `${data.desc}
        <span onclick="adicionarEscolaNaLinha(this, ${data.id})"
              class="w3-button w3-display-right"><i class="fa fa-plus w3-text-green"></i></span>`;
      
      // Adicionar a escola na lista e ordenar a lista de "Escolas disponíveis"
      listaEscolasEdit.appendChild(novaEscola);
      
      // Ordenar a lista em ordem alfabética
      ordenarLista(listaEscolasEdit);
    });
}

function ordenarLista(lista) {
  // Obter todos os itens da lista
  const items = Array.from(lista.getElementsByTagName('li'));
  
  // Ordenar os itens pela descrição (texto)
  items.sort((a, b) => {
    const textA = a.innerText.toLowerCase();
    const textB = b.innerText.toLowerCase();
    return textA.localeCompare(textB);
  });
  
  // Adicionar os itens de volta à lista na ordem correta
  items.forEach(item => lista.appendChild(item));
}

async function salvarEscolas(idLinha) {
  // Coleta todos os IDs das escolas selecionadas
  const escolasSelecionadas = Array.from(document.getElementById('listaSuasEscolasEdit').children)
      .map(li => {
          const idEscola = parseInt(li.dataset.id); // Supondo que você tenha um atributo data-id nos itens da lista
          return { idLinhas: idLinha, idEscolas: idEscola }; // Utilizando o formato correto com idLinhas e idEscolas
      });

  // Coleta todas as escolas removidas de listaSuasEscolasEdit (aquelas que foram movidas para listaEscolasEdit)
  const escolasRemovidas = Array.from(document.getElementById('listaEscolasEdit').children)
      .map(li => {
          const idEscola = parseInt(li.dataset.id); // Aqui você precisa garantir que o id da escola seja corretamente atribuído
          return { idLinhas: idLinha, idEscolas: idEscola }; // Objeto no formato esperado para remoção
      });

  // Verifica se há escolas para salvar ou remover
  if (escolasSelecionadas.length > 0 || escolasRemovidas.length > 0) {
      try {
          // Primeiro, envia as escolas para salvar
          if (escolasSelecionadas.length > 0) {
              const responseSalvar = await fetch('http://localhost:8080/escolaslinhas/escolasList', {
                  method: 'POST',
                  headers: {
                      'Content-Type': 'application/json',
                  },
                  body: JSON.stringify(escolasSelecionadas), // Envia como um array de objetos EscolaLinha
              });

              if (!responseSalvar.ok) {
                  alert('Falha ao salvar escolas');
                  return;
              }
          }

          // Agora, envia as escolas para excluir
          if (escolasRemovidas.length > 0) {
              const responseRemover = await fetch('http://localhost:8080/escolaslinhas/escolasDelete', {
                  method: 'DELETE',
                  headers: {
                      'Content-Type': 'application/json',
                  },
                  body: JSON.stringify(escolasRemovidas), // Envia a lista de escolas removidas para remoção
              });

              if (!responseRemover.ok) {
                  alert('Falha ao remover escolas');
                  return;
              }
          }

          alert('Escolas salvas e removidas com sucesso!');
      } catch (error) {
          console.error('Erro ao salvar ou remover escolas:', error);
          alert('Erro ao salvar ou remover escolas');
      }
  } else {
      alert('Nenhuma escola selecionada ou removida.');
  }
}

async function openBairros(id) {
  const response = await fetch('http://localhost:8080/bairros', { method: "GET" });
  const json = await response.json();

  const selectElement = document.getElementById('bairrosEdit');

  let HTML = await montaHTMLBairrosEdit(id);
  let bairros = document.createElement("div");
  bairros.innerHTML = HTML;
  selectElement.append(bairros);

  preencherBairrosEdit(json, id);
  selectElement.style.visibility = "visible";
}

async function montaHTMLBairrosEdit(id) {
  let HTML = `
    <div class="w3-container w3-black">
        <h2 class="w3-text-yellow"><i class="fa fa-coffee w3-margin-right w3-text-yellow"></i>Período da manhã:</h2>
    </div>
    <div class="w3-container w3-white w3-padding-16">
        <div class="w3-half" style.height="800px" style.overflow="overflow">
            <h3 class="w3-container w3-padding-16 "><i class="fa fa-mortar-board fa-fw w3-margin-right w3-xlarge"></i>Bairros Disponíveis:</h3>
            <form class="w3-margin">
                <div class="w3-row">
                  <input class="w3-input w3-border w3-threequarter">
                  <button class="w3-button w3-quarter w3-black"><i class="fa fa-search"></i></button>
                </div>
            </form>
            <ul class="w3-ul w3-margin w3-border" id="listaBairrosEdit"></ul>
        </div>
        <div class="w3-half">
            <h3 class="w3-container w3-padding-16 "><i class="fa fa-bus fa-fw w3-margin-right w3-xlarge"></i>Bairros na minha linha:</h3>
            <form class="w3-margin">
              <div class="w3-row">
                <input class="w3-input w3-border w3-threequarter">
                <button class="w3-button w3-quarter w3-black"><i class="fa fa-search"></i></button>
              </div>
          </form>
            <ul class="w3-ul w3-margin w3-border" id="listaSeusBairrosEdit"></ul>
        </div>
        <button onClick="cancelOpenBairros()" class="w3-left w3-button w3-black w3-margin"><i class="fa fa-close w3-margin-right"></i> Cancelar</button>
        <button onClick="salvarBairros(${id})" class="w3-right w3-button w3-black w3-margin"><i class="fa fa-arrow-right w3-margin-right"></i> Salvar</button>  
    </div>`;

  return HTML;
}

async function preencherBairrosEdit(jsonData, id) {
  const selectElement = document.getElementById('listaBairrosEdit');
  selectElement.innerHTML = ''; // Limpa a lista de bairros disponíveis

  // Primeiro, carrega os bairros na minha linha
  const bairrosNaMinhaLinha = await carregaBairroLinhasEdit(id);

  jsonData.forEach(bairro => {
    // Se o bairro já está nas "minhas linhas", não o adiciona
    if (!bairrosNaMinhaLinha.includes(bairro.id)) {
      const bairroItem = document.createElement("li");
      bairroItem.classList.add("w3-display-container");
      bairroItem.innerHTML = `
        ${bairro.desc}
        <span onclick="adicionarBairroNaLinha(this, ${bairro.id})"
              class="w3-button w3-display-right"><i class="fa fa-plus w3-text-green"></i></span>
      `;
      selectElement.append(bairroItem);
    }
  });
  
  // Carregar os bairros na minha linha
  carregaBairroLinhasEdit(id);
}

function cancelOpenBairros(){
  const selectElement = document.getElementById('bairrosEdit');
  selectElement.innerHTML = '<div id="bairrosEdit" class="w3-border w3-border-black w3-display-middle w3-col l6 m8" style="visibility: hidden"></div>'
  selectElement.style.visibility = "hidden";
}

async function carregaBairroLinhasEdit(id) {
  const responseBairrosLinha = await fetch('http://localhost:8080/bairroslinhas/' + id, { method: "GET" });
  const subJsonBairrosLinha = await responseBairrosLinha.json();

  const bairrosHTML = await Promise.all(subJsonBairrosLinha.map(async (bairroLinha) => {
    const bairroHTML = await carregaBairrosEdit(bairroLinha.idBairros);
    return bairroHTML;
  }));

  const listaSeusBairrosEdit = document.getElementById('listaSeusBairrosEdit');
  listaSeusBairrosEdit.innerHTML = bairrosHTML.join('');

  // Retorna uma lista com os IDs dos bairros para verificar quais estão na linha
  return subJsonBairrosLinha.map(bairro => bairro.idBairros);
}

async function carregaBairrosEdit(idBairros) {
  const responseBairro = await fetch('http://localhost:8080/bairros/' + idBairros, { method: "GET" });
  const subJsonBairro = await responseBairro.json();
  return `
    <li class="w3-display-container">
      ${subJsonBairro.desc}
      <span onclick="removerBairroDaLinha(this, ${subJsonBairro.id})"
            class="w3-button w3-display-right"><i class="fa fa-close w3-text-red"></i></span>
    </li>`;
}

function adicionarBairroNaLinha(button, idBairro) {
  const li = button.closest("li");
  const listaSeusBairrosEdit = document.getElementById('listaSeusBairrosEdit');
  
  // Remover o bairro da lista de disponíveis
  li.remove();
  
  // Buscar dados do bairro
  fetch(`http://localhost:8080/bairros/${idBairro}`)
    .then(response => response.json())
    .then(data => {
      // Criar o item para a lista de "Bairros na minha linha"
      const novoBairro = document.createElement("li");
      novoBairro.classList.add("w3-display-container");
      novoBairro.dataset.id = data.id;
      novoBairro.innerHTML = `
        ${data.desc}
        <span onclick="removerBairroDaLinha(this, ${data.id})"
              class="w3-button w3-display-right"><i class="fa fa-close w3-text-red"></i></span>`;
      
      // Adicionar o bairro na lista e ordenar a lista de "Bairros na minha linha"
      listaSeusBairrosEdit.appendChild(novoBairro);
      
      // Ordenar a lista em ordem alfabética
      ordenarLista(listaSeusBairrosEdit);
    });
}

function removerBairroDaLinha(button, idBairro) {
  const li = button.closest("li");
  const listaBairrosEdit = document.getElementById('listaBairrosEdit');
  
  // Remover o bairro da lista "Minha linha"
  li.remove();
  
  // Buscar dados do bairro
  fetch(`http://localhost:8080/bairros/${idBairro}`)
    .then(response => response.json())
    .then(data => {
      // Criar o item para a lista de "Bairros disponíveis"
      const novoBairro = document.createElement("li");
      novoBairro.classList.add("w3-display-container");
      novoBairro.dataset.id = data.id;
      novoBairro.innerHTML = `
        ${data.desc}
        <span onclick="adicionarBairroNaLinha(this, ${data.id})"
              class="w3-button w3-display-right"><i class="fa fa-plus w3-text-green"></i></span>`;
      
      // Adicionar o bairro na lista e ordenar a lista de "Bairros disponíveis"
      listaBairrosEdit.appendChild(novoBairro);
      
      // Ordenar a lista em ordem alfabética
      ordenarLista(listaBairrosEdit);
    });
}

function ordenarLista(lista) {
  // Obter todos os itens da lista
  const items = Array.from(lista.getElementsByTagName('li'));
  
  // Ordenar os itens pela descrição (texto)
  items.sort((a, b) => {
    const textA = a.innerText.toLowerCase();
    const textB = b.innerText.toLowerCase();
    return textA.localeCompare(textB);
  });
  
  // Adicionar os itens de volta à lista na ordem correta
  items.forEach(item => lista.appendChild(item));
}

async function salvarBairros(idLinha) {
  // Coleta todos os IDs dos bairros selecionados
  const bairrosSelecionados = Array.from(document.getElementById('listaSeusBairrosEdit').children)
      .map(li => {
          const idBairro = parseInt(li.dataset.id); 
          return { idLinhas: idLinha, idBairros: idBairro }; // Utiliza o formato correto com idLinhas e idBairros
      });

  // Coleta todos os bairros removidos
  const bairrosRemovidos = Array.from(document.getElementById('listaBairrosEdit').children)
      .map(li => {
          const idBairro = parseInt(li.dataset.id); 
          return { idLinhas: idLinha, idBairros: idBairro };
      });

  if (bairrosSelecionados.length > 0 || bairrosRemovidos.length > 0) {
      try {
          // Enviar bairros para salvar
          if (bairrosSelecionados.length > 0) {
              const responseSalvar = await fetch('http://localhost:8080/bairroslinhas/bairrosList', {
                  method: 'POST',
                  headers: {
                      'Content-Type': 'application/json',
                  },
                  body: JSON.stringify(bairrosSelecionados), 
              });

              if (!responseSalvar.ok) {
                  alert('Falha ao salvar bairros');
                  return;
              }
          }

          // Enviar bairros para excluir
          if (bairrosRemovidos.length > 0) {
              const responseRemover = await fetch('http://localhost:8080/bairroslinhas/bairrosDelete', {
                  method: 'DELETE',
                  headers: {
                      'Content-Type': 'application/json',
                  },
                  body: JSON.stringify(bairrosRemovidos),
              });

              if (!responseRemover.ok) {
                  alert('Falha ao remover bairros');
                  return;
              }
          }

          alert('Bairros salvos e removidos com sucesso!');
      } catch (error) {
          console.error('Erro ao salvar ou remover bairros:', error);
          alert('Erro ao salvar ou remover bairros');
      }
  } else {
      alert('Nenhum bairro selecionado ou removido.');
  }

  cancelOpenBairros();
  loadPage(condutorCnh);
}

