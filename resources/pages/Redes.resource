*** Settings ***
Resource    ../utils/main.robot
Variables    ../locators/redes.yml

*** Keywords ***

   

E os icones das redes sociais estejam visiveis
   Element Should Be Visible  ${LOGO_TWITTER}  
   Element Should Be Visible  ${LOGO_FACEBOOK}
   Element Should Be Visible  ${LOGO_LINKEDIN}

E o link do twitter abra
    Click Element    ${LOGO_TWITTER}
    Wait Until Page Contains   Sauce Labs

E o link do facebook abra
    Click Element    ${LOGO_FACEBOOK}
    Wait Until Page Contains   Sauce Labs
E o link do linkedin abra
    Click Element    ${LOGO_LINKEDIN}
    Wait Until Page Contains   Sauce Labs

Então os links das redes sociais devem abrir
    E o link do twitter abra
    E o link do facebook abra
    E o link do linkedin abra