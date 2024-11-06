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
        
        let cond = document.createElement("div");
        let HTML;
          
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
        subJsonLinhas.forEach(linha => {
            HTML = HTML + `<li>`    
            if(linha.periodo == "Período da Manhã"){
              HTML = HTML + `<i class="fa fa-coffee w3-margin-right w3-large"></i> ${linha.periodo}`
            }else if(linha.periodo == "Período da Tarde"){
              HTML = HTML + `<i class="fa fa-sun-o w3-margin-right w3-large"></i> ${linha.periodo}`
            }else if(linha.periodo == "Período da Noite"){
              HTML = HTML + `<i class="fa fa-moon-o w3-margin-right w3-large"></i> ${linha.periodo}`
            }else if(linha.periodo == "Período Integral"){
              HTML = HTML + `<i class="fa fa-clock-o w3-margin-right w3-large"></i> ${linha.periodo}`
            }
            if(linha.possuiVagas){
              HTML = HTML + `<span class="w3-tag w3-right w3-green">Há vagas</span>`
            }else{
              HTML = HTML + `<span class="w3-tag w3-right w3-red">Não há vagas</span>`
            }
            HTML = HTML + `</li>` 
          });

        HTML = HTML + `</ul>
        </div>`;

        cond.innerHTML = HTML;
        // Adiciona o conteúdo ao elemento
        selectElement.append(cond);
        
      } else {
        // Se não houver dados no sessionStorage (por exemplo, se alguém acessar diretamente a página)
        console.error('Dados do condutor não encontrados no sessionStorage');
      }   
}