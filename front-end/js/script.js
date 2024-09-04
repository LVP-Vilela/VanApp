function preencherSelectComJson(jsonData) {
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

async function getImage(){
  const response = await fetch('http://localhost:8080/escolas',{method: "GET"});
  const json = await response.json();
  preencherSelectComJson(json);
}

// Simula a obtenção de dados JSON e preenche o select
document.addEventListener('DOMContentLoaded', () => {
  getImage();
});