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
    selectElement.appendChild(option);
  });
}

function preencherSelectCondutores(jsonData) {
  // Obtém o elemento select pelo ID
  const selectElement = document.getElementById('CondutoresChild');
  
  // Limpa qualquer opção existente
  selectElement.innerHTML = '';

  // Adiciona as opções do JSON
  jsonData.forEach(condutor => {
    let cond = document.createElement("div");

    cond.innerHTML = 
      `<div class="w3-third w3-margin-bottom">
        <img src="../img/users-image/${condutor.imgPath}" alt="Norway" style="width:100%" height="300">
        <div class="w3-container w3-white">
          <h3>${condutor.name}</h3>
          <div name="Horários" class="w3-row w3-border-bottom w3-border-black" style="min-height:160px">
            <ul class="w3-ul">
              <li>
                <i class="fa fa-coffee"></i> Manhã
                <span class="w3-tag w3-right w3-red">Não há vagas</span>
              </li>
              <li><i class="fa fa-sun-o"></i> Tarde
                <span class="w3-tag w3-right w3-green">Há vagas</span>
              </li>
              <li>
                <i class="fa fa-moon-o"></i> Noite
                <span class="w3-tag w3-right w3-red">Não há vagas</span>
              </li>
            </ul>
          </div>
          <div class="w3-row-padding">
            <div name="Celulares" class="w3-col w3-right" style="width:200px">
              <h6 class="w3-opacity w3-right"><b>Celulares:</b>
                <ul>
                  <li>(11)11111-1111</li>
                  <li>(22)22222-2222</li>
                </ul>
              </h6>
            </div>
            <div name="Email" class="w3-rest" >
              <h6 class="w3-opacity"><b>Email: </b>
                <p>Alguem@algo.com.br</p>
              </h6>
            </div>
          </div>
          <a href="condutor.html" class="w3-button w3-block w3-black w3-margin-bottom ">Selecionar Condutor</button>
        </div>
      </div>`

    selectElement.append(cond);

    //const option = document.createElement('option');
    //option.text = bairro.desc;
    //selectElement.appendChild(cond);

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
  evt.currentTarget.firstElementChild.className += " w3-border-yellow";

  document.getElementById("Cadastro2").style.display = "none";
  document.getElementById("Cadastro2").style.visibility = "hidden";
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
  const response = await fetch('http://localhost:8080/condutores',{method: "GET"});
  const json = await response.json();
  preencherSelectCondutores(json);

  document.getElementById("Condutores").style.display = "block";
  document.getElementById("Condutores").style.visibility = "visible";
  window.location.href = "#Pesquisa";
}

function cadastrar1() {
  document.getElementById("Cadastro").style.display = "none";
  document.getElementById("Cadastro2").style.display = "block";
  document.getElementById("Cadastro2").style.visibility = "visible";
}

function cancelCadastro() {
  document.getElementById("Cadastro2").style.display = "none";
  document.getElementById("Cadastro2").style.visibility = "hidden";
  document.getElementById("Cadastro").style.display = "block";
  document.getElementById("Cadastro").style.visibility = "visible";
}