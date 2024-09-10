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