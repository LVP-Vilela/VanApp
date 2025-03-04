var escolasList = [];
var bairrosList = [];

function preencherSelectEscolas(jsonData) {
    // Obtém o elemento select pelo ID
    const selectElement = document.getElementById('escolaSelect');
    
    // Limpa qualquer opção existente
    selectElement.innerHTML = '';

    // Cria uma opção padrão
    const optionPadrao = document.createElement('option');
    optionPadrao.text = 'Selecione uma escola';
    optionPadrao.value = '';
    selectElement.appendChild(optionPadrao);

    // Adiciona as opções do JSON
    jsonData.forEach(escola => {
      const option = document.createElement('option');
      option.text = escola.desc;
      escolasList.push(escola)
      selectElement.appendChild(option);
    });
}

function preencherSelectBairros(jsonData) {
  // Obtém o elemento select pelo ID
  const selectElement = document.getElementById('bairroSelect');
  
  // Limpa qualquer opção existente
  selectElement.innerHTML = '';

  // Cria uma opção padrão
  const optionPadrao = document.createElement('option');
  optionPadrao.text = 'Selecione um bairros';
  optionPadrao.value = '';
  selectElement.appendChild(optionPadrao);

  // Adiciona as opções do JSON
  jsonData.forEach(bairro => {
    const option = document.createElement('option');
    option.text = bairro.desc;
    bairrosList.push(bairro)
    selectElement.appendChild(option);
  });
}

async function preencherSelectCondutores(jsonData) {
  // Obtém o elemento select pelo ID
  const selectElement = document.getElementById('CondutoresChild');
  
  // Limpa qualquer opção existente
  selectElement.innerHTML = '';

  // Adiciona as opções do JSON
  jsonData.forEach(async condutor => {

    const response = await fetch('http://localhost:8080/linhas/'+condutor.cnh,{method: "GET"});
    const subJson = await response.json();

    let cond = document.createElement("div");

    let HTML;
    
    HTML = 
      `<div class="w3-third w3-margin-bottom">
        <img src="../img/users-image/${condutor.imgPath}" alt="Norway" style="width:100%" height="300">
        <div class="w3-container w3-white">
          <h3>${condutor.name}</h3>
          <div name="Horários" class="w3-row w3-border-bottom w3-border-black" style="min-height:160px">
            <ul class="w3-ul">`
            
            subJson.forEach(linha => {
              HTML = HTML + `<li>`    
              if(linha.periodo == "Período da Manhã"){
                HTML = HTML + `<i class="fa fa-coffee"></i> ${linha.periodo}`
              }else if(linha.periodo == "Período da Tarde"){
                HTML = HTML + `<i class="fa fa-sun-o"></i> ${linha.periodo}`
              }else if(linha.periodo == "Período da Noite"){
                HTML = HTML + `<i class="fa fa-moon-o"></i> ${linha.periodo}`
              }else if(linha.periodo == "Período Integral"){
                HTML = HTML + `<i class="fa fa-clock-o"></i> ${linha.periodo}`
              }
              if(linha.possuiVagas){
                HTML = HTML + `<span class="w3-tag w3-right w3-green">Há vagas</span>`
              }else{
                HTML = HTML + `<span class="w3-tag w3-right w3-red">Não há vagas</span>`
              }
              HTML = HTML + `</li>` 
            });
            HTML = HTML +
            `</ul>
          </div>
          <div class="w3-row-padding">
            <div name="Celulares" class="w3-col w3-right" style="width:180px;min-height:130px">
              <h6 class="w3-opacity w3-right"><b>Celulares:</b>
                <ul>`;
                const responseCel = await fetch('http://localhost:8080/celulares/'+condutor.cnh,{method: "GET"});
                const subJsonCel = await responseCel.json();
                subJsonCel.forEach(cel => {
                  HTML = HTML + `<li>${cel.celular}</li>`
                });                
                HTML = HTML +
                `</ul>
              </h6>
            </div>
            <div name="Email" class="w3-rest" style="min-height:130px">
              <h6 class="w3-opacity"><b>Email: </b>
              <ul>`;
                const responseEmail = await fetch('http://localhost:8080/emails/'+condutor.cnh,{method: "GET"});
                const subJsonEmail = await responseEmail.json();
                subJsonEmail.forEach(email => {
                  HTML = HTML + `<li>${email.email}</li>`
                });                
                HTML = HTML +
              `</ul>
              </h6>
            </div>
          </div>
          <button class="w3-button w3-block w3-black w3-margin-bottom" onclick="selecionaCondutor('${condutor.cnh}')">Selecionar Condutor</button></a>
        </div>
      </div>`
    cond.innerHTML = HTML;
    selectElement.append(cond);
  });
  
}

async function getListEscolas(){
  const response = await fetch('http://localhost:8080/escolas',{method: "GET"});
  const json = await response.json();
  preencherSelectEscolas(json);
}

async function getListBairros(){
  const response = await fetch('http://localhost:8080/bairros',{method: "GET"});
  const json = await response.json();
  preencherSelectBairros(json);
}

// Simula a obtenção de dados JSON e preenche o select
document.addEventListener('DOMContentLoaded', () => {
  getListEscolas();
  getListBairros();
});


function openOption(evt, option) {
  var i, x, tablinks;
  x = document.getElementsByClassName("option");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" w3-border-yellow", "");
  }
  document.getElementById(option).style.display = "block";
  document.getElementById("Cadastro2").style.display = "none";
  document.getElementById("Cadastro2").style.visibility = "hidden";
  evt.currentTarget.firstElementChild.className += " w3-border-yellow";
}

function openCondutor() {
  document.getElementById("cliente").style.visibility = "hidden";
  document.getElementById("condutor").style.visibility = "visible";
}

function openCliente() {
  document.getElementById("condutor").style.visibility = "hidden";
  document.getElementById("cliente").style.visibility = "visible";
}

async function pesquisar() {

  let periodo = document.getElementById('periodoSelect').value;
  let escola = document.getElementById('escolaSelect').value;
  let bairro = document.getElementById('bairroSelect').value;


  escolasList.forEach((item, index) => {
    if(item.desc == escola){
      escola = item.id;
    }
  });

  bairrosList.forEach((item, index) => {
    if(item.desc == bairro){
      bairro = item.id;
    }
  });
  const response = await fetch(`http://localhost:8080/condutores/filtro?periodo=${periodo}&escola=${escola}&bairro=${bairro}`,{method: "GET"});
  const json = await response.json();



  preencherSelectCondutores(json);

  document.getElementById("Condutores").style.display = "block";
  document.getElementById("Condutores").style.visibility = "visible";
  window.location.href = "#Pesquisa";
}

async function cadastrar1() {
  
  let cnhCad = document.getElementById('cnhCad').value;
  let nomeCad = document.getElementById('nomeCad').value;
  let cel1Cad = document.getElementById('cel1Cad').value;
  let cel2Cad = document.getElementById('cel2Cad').value;
  let email1Cad = document.getElementById('email1Cad').value;
  let email2Cad = document.getElementById('email2Cad').value;
  let senhaCad = document.getElementById('senhaCad').value;
  let confirmaSenhaCad = document.getElementById('confirmaSenhaCad').value;

  const fileInput = document.getElementById('imageUpload');
  const file = fileInput.files[0];

  if (cnhCad == "" | nomeCad == "" | cel1Cad == "" | email1Cad == "" | senhaCad == "") {
      alert("Existem campos não preenchidos");
      return;
  }

  if(senhaCad != confirmaSenhaCad){
    alert("A confirmação da senha não é igual a senha inserida");
  }else{
    document.getElementById("Cadastro").style.display = "none";
    document.getElementById("Cadastro2").style.display = "block";
    document.getElementById("Cadastro2").style.visibility = "visible";
  }
}

async function fetchPost(url,data){
  try {
    const resposta = await fetch(url, {
      method: 'POST', // Método HTTP
      headers: {
        'Content-Type': 'application/json', // Especifica que estamos enviando JSON
      },
      body: JSON.stringify(data), // Corpo da requisição com os dados em formato JSON
    });

    if (!resposta.ok) {
      throw new Error('Erro ao fazer requisição');
    }

    // Resposta da API, que é retornada como JSON
    const resultado = await resposta.json();
    return resultado;
  } catch (erro) {
    console.error('Erro:', erro);
  }
}

function cancelCadastro() {
  document.getElementById("Cadastro2").style.display = "none";
  document.getElementById("Cadastro2").style.visibility = "hidden";
  document.getElementById("Cadastro").style.display = "block";
  document.getElementById("Cadastro").style.visibility = "visible";
}

async function selecionaCondutor(cnh) {
  // Armazena os dados no sessionStorage
  sessionStorage.setItem('condutorCnh', cnh);

  // Redireciona para a página condutor.html
  window.location.assign('condutor.html');
}

async function logaCondutor(cnh) {
  // Armazena os dados no sessionStorage
  sessionStorage.setItem('condutorCnhEdit', cnh);

  // Redireciona para a página condutor.html
  window.location.assign('condutorEdit.html');
}

async function logar(){  
  let cnhLogin = document.getElementById('cnhLogin').value;
  let senhaLogin = document.getElementById('senhaLogin').value;

  if (cnhLogin == "" | senhaLogin == "") {
    alert("Existem campos não preenchidos");
    return;
  }
  const response = await fetch(`http://localhost:8080/condutores/`+cnhLogin,{method: "GET"});
  const jsonData = await response.json();
  jsonData.senha = senhaLogin;
  
  let resultData = await fetchPost('http://localhost:8080/condutores/login',jsonData)

  if(resultData !== undefined){
    logaCondutor(resultData.cnh);
  }else{
    alert("O usuário ou senha inseridos não existem!");
  }
}

async function cadastrar2() {
  let cnhCad = document.getElementById('cnhCad').value;
  let nomeCad = document.getElementById('nomeCad').value;
  let cel1Cad = document.getElementById('cel1Cad').value;
  let cel2Cad = document.getElementById('cel2Cad').value;
  let email1Cad = document.getElementById('email1Cad').value;
  let email2Cad = document.getElementById('email2Cad').value;
  let senhaCad = document.getElementById('senhaCad').value;

  const fileInput = document.getElementById('imageUpload');
  const file = fileInput.files[0];

  if (!file) {
      alert("Por favor, selecione uma imagem.");
      return;
  }

  let data = {
    cnh: cnhCad,
    name: nomeCad,
    imgPath: file.name,
    senha: senhaCad
  };

  // Aguardando a resposta da API 'condutores' antes de continuar com as outras requisições
  const resultado = await fetchPost('http://localhost:8080/condutores', data);
  
  if (!resultado) {
    console.error('Falha ao cadastrar condutor.');
    return;
  }

  // Após obter o resultado, faça as outras requisições
  data = { 
    cnh: resultado.cnh,
    celular: cel1Cad
  };
  await fetchPost('http://localhost:8080/celulares', data);

  data = {
    cnh: resultado.cnh,
    celular: cel2Cad
  };
  await fetchPost('http://localhost:8080/celulares', data);

  data = {
    cnh: resultado.cnh,
    email: email1Cad
  };
  await fetchPost('http://localhost:8080/emails', data);

  data = {
    cnh: resultado.cnh,
    email: email2Cad
  };
  await fetchPost('http://localhost:8080/emails', data);

  // Enviando a imagem após as requisições anteriores
  const formData = new FormData();
  formData.append("image", file);

  const apiUrl = 'http://localhost:8080/condutores/uploadImage';  // URL para upload da imagem
  await fetch(apiUrl, {
      method: 'POST',
      body: formData,
  });
  
  data = {
    possuiVagas: 0,
    periodo: 'Período da Manhã',
    cnhCondutor: resultado.cnh
  }
  await fetchPost('http://localhost:8080/linhas', data);
  
  data = {
    possuiVagas: 0,
    periodo: 'Período da Tarde',
    cnhCondutor: resultado.cnh
  }
  await fetchPost('http://localhost:8080/linhas', data);

  data = {
    possuiVagas: 0,
    periodo: 'Período Integral',
    cnhCondutor: resultado.cnh
  }
  await fetchPost('http://localhost:8080/linhas', data);

  data = {
    possuiVagas: 0,
    periodo: 'Período da Noite',
    cnhCondutor: resultado.cnh
  }
  await fetchPost('http://localhost:8080/linhas', data);

  alert("Cadastro realizado com sucesso");



  openOption(event,'Login');
}
