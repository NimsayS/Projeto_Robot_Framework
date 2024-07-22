*** Settings ***
Resource    ../utils/main.robot
Variables    ../locators/Items.yml


*** Keywords ***

Entao os itens devem ser selecionados de um por um para ver as informacoes deles
    Dado que eu acesse a pagina dos itens
    E que todos os itens estejam visiveis
        FOR    ${indice}    ${itens}    IN ENUMERATE    @{clicar_itens}
          Click Element    ${itens}
          Element Should Be Visible   ${DESCRICAO_MAIOR}
          Click Element    ${BACK_TO_PRODUCTS}
          

        
    END