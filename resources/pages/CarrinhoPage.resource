*** Settings ***
Variables    ../locators/carrinho.yml
Resource     ../../test/SwagLabs_test.robot
*** Keywords ***

Dado que eu coloque 6 itens no carrinho
        Dado que eu abra o navegador
         Dado que coloque os dados de username e password
         Entao o login deve ser efetuado 
       FOR    ${indice}    ${itens}    IN ENUMERATE    @{adicionar_itens}
          Click Element    ${itens}
        
    END
    Sleep    10s

Então o icone carrinho com os 6 itens deve estar visivel
    Element Should Be Visible     ${CARRINHO_COM_6}

Então deve ter 6 itens dentro de carrinho

    Element Should Be Visible     ${CARRINHO_COM_6}
    Click Element    ${CARRINHO_COM_6}
    Element Should Be Visible    //div[@class='inventory_item_name'][contains(.,'Sauce Labs Backpack')]
    Element Should Be Visible    //div[@class='inventory_item_name'][contains(.,'Sauce Labs Bike Light')]
    Element Should Be Visible    //div[@class='inventory_item_name'][contains(.,'Sauce Labs Fleece Jacket')]
    Element Should Be Visible    //div[@class='inventory_item_name'][contains(.,'Sauce Labs Bolt T-Shirt')]
    Element Should Be Visible    //div[@class='inventory_item_name'][contains(.,'Sauce Labs Onesie')]
    Element Should Be Visible    //div[@class='inventory_item_name'][contains(.,'Test.allTheThings() T-Shirt (Red)')]
