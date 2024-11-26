document.addEventListener('DOMContentLoaded', () => {
    // Recupera os dados armazenados no sessionStorage
    const condutorCnh = sessionStorage.getItem('condutorCnh');
    loadPage(condutorCnh);
});

async function loadPage(condutorCnh){
    if (condutorCnh) {
        const response = await fetch('http://localhost:8080/condutores/'+condutorCnh,{method: "GET"});
        const jsonData = await response.json();
       
        // Obtém o elemento 'cabecalhoCondutor'
        const selectElement = document.getElementById('cabecalhoCondutor');
        const selectElementBody = document.getElementById('corpoDiv');

        let cond = document.createElement("div");
        let linhas = document.createElement("div");

        let HTML;
        let HTML2='';
          
        // Preenche o HTML com os dados do condutor
        HTML = `
        <div class="w3-display-container">
        <img src="../img/users-image/${jsonData.imgPath}" style="width:100%">
            <a href="index.html" class="w3-button w3-display-topleft w3-xlarge w3-yellow">
                <i class="fa fa-reply fa-fw w3-text-black"></i>
            </a>
        <div class="w3-container w3-yellow w3-topbar w3-bottombar w3-border-black">
            <h2><i class="w3-margin-right"></i>${jsonData.name}</h2>
        </div>
        </div>`;
        HTML = HTML + `<div class="w3-container">`;

        const responseCel = await fetch('http://localhost:8080/celulares/'+jsonData.cnh,{method: "GET"});
        const subJsonCel = await responseCel.json();
        subJsonCel.forEach(cel => {
            HTML = HTML + `<p><i class="fa fa-phone fa-fw w3-margin-right w3-large"></i>${cel.celular}</p>`
        });
        const responseEmail = await fetch('http://localhost:8080/emails/'+jsonData.cnh,{method: "GET"});
        const subJsonEmail = await responseEmail.json();
        subJsonEmail.forEach(email => {
            HTML = HTML + `<p><i class="fa fa-envelope fa-fw w3-margin-right w3-large"></i>${email.email}</p>`
        });
        HTML = HTML + `<hr>
        <p class="w3-large"><b><i class="fa fa-clock-o fa-fw w3-margin-right"></i>Horários</b></p>
        <ul class="w3-ul w3-padding-16">`;

        const responseLinhas = await fetch('http://localhost:8080/linhas/'+jsonData.cnh,{method: "GET"});
        const subJsonLinhas = await responseLinhas.json();
        
        // Usando uma variável local para acumular HTML2 corretamente
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
          if (linha.possuiVagas) {
              HTML = HTML + `<span class="w3-tag w3-right w3-green">Há vagas</span>`;
          } else {
              HTML = HTML + `<span class="w3-tag w3-right w3-red">Não há vagas</span>`;
          }
          HTML = HTML + `</li>`;

          // Agora acumulando as informações de cada linha corretamente
          const lineHTML = await montaHTML(linha);
          return lineHTML;  // Retorna o HTML gerado para ser acumulado

        }));

        HTML2 = linesHTML.join('');

        HTML = HTML + `</ul>
        </div>`;

        cond.innerHTML = HTML;
        linhas.innerHTML = HTML2;
        // Adiciona o conteúdo ao elemento
        selectElement.append(cond);
        selectElementBody.append(linhas);
        console.log(linhas);
        
      } else {
        // Se não houver dados no sessionStorage (por exemplo, se alguém acessar diretamente a página)
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
  </div>`;

  // Retorna o HTML final
  return HTML;
}