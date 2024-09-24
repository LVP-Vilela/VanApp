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

function pesquisar() {
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