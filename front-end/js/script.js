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

async function openEscolasManha() {
  const response = await fetch('http://localhost:8080/escolas',{method: "GET"});
  const json = await response.json();
  preencherEscolasEdit(json);

  document.getElementById("escolasManha").style.visibility = "visible";
}

function preencherEscolasEdit(jsonData) {
  // Obtém o elemento select pelo ID
  const selectElement = document.getElementById('listaEscolasEdit');
  
  // Limpa qualquer opção existente
  selectElement.innerHTML = '';

  // Adiciona as opções do JSON
  jsonData.forEach(escola => {
    let esc = document.createElement("li");

    esc.innerHTML = 
    `<li class="w3-display-container"> ${escola.desc}
    <span onclick="this.parentElement.style.display='none'"
    class="w3-button w3-display-right"><i class="fa fa-plus w3-text-green"></i></span>
    </li>`

    selectElement.append(esc);
  });
  
}

async function selecionaCondutor(cnh) {
  // Armazena os dados no sessionStorage
  sessionStorage.setItem('condutorCnh', cnh);

  // Redireciona para a página condutor.html
  window.location.assign('condutor.html');
}