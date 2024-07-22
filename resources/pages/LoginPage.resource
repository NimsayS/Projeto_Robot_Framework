*** Settings ***
Resource    ../utils/main.robot
Variables    ../locators/login.yml


*** Keywords ***

Então a home page com username password devem ser visiveis
    Wait Until Element Is Visible    locator=${Campo_Username}
    Wait Until Element Is Visible    locator=${Campo_Senha}

Dado que coloque os dados de username e password
    Input Text       ${Campo_Username}       ${user_padrao}
    Input Password    ${Campo_Senha}         ${senha_padrao}


Entao o login deve ser efetuado
    Click Element    ${BOTAO_LOGIN}
