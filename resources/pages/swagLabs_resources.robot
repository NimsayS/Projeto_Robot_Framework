*** Settings ***
Resource    ../main.robot

*** Variables ***
${URL}                                    https://www.saucedemo.com
${Campo_Username}                         id:user-name
${Campo_Senha}                            id:password
${BOTAO_LOGIN}                            id:login-button

@{adcionar_itens}
...                                       id:add-to-cart-sauce-labs-backpack
...                                       id:add-to-cart-sauce-labs-bike-light
...                                       id:add-to-cart-sauce-labs-bolt-t-shirt
...                                       id:add-to-cart-sauce-labs-fleece-jacket
...                                       id:add-to-cart-sauce-labs-onesie
...                                       id:add-to-cart-test.allthethings()-t-shirt-(red)

${CARRINHO_COM_6}                         //span[@class='shopping_cart_badge'][contains(.,'6')]


@{clicar_itens}
...                                       //div[@class='inventory_item_name '][contains(.,'Sauce Labs Fleece Jacket')]
...                                       //div[@class='inventory_item_name '][contains(.,'Sauce Labs Backpack')]
...                                       //div[@class='inventory_item_name '][contains(.,'Sauce Labs Bolt T-Shirt')]
...                                       //div[@class='inventory_item_name '][contains(.,'Test.allTheThings() T-Shirt (Red)')]
...                                       //div[@class='inventory_item_name '][contains(.,'Sauce Labs Bike Light')]
...                                       //div[@class='inventory_item_name '][contains(.,'Sauce Labs Onesie')]

${BACK_TO_PRODUCTS}                       id:back-to-products
${DESCRICAO_MAIOR}                        class:inventory_details_desc_container
${user_padrao}                            standard_user
${senha_padrao}                           secret_sauce
${LOGO_TWITTER}                          //a[contains(@data-test,'social-twitter')]
${LOGO_FACEBOOK}                         //a[contains(@data-test,'social-facebook')]
${LOGO_LINKEDIN}                         //a[contains(@data-test,'social-linkedin')]

                     

*** Keywords ***


  



Então a home page com username password devem ser visiveis
    Wait Until Element Is Visible    locator=${Campo_Username}
    Wait Until Element Is Visible    locator=${Campo_Senha}

E coloque os dados de username e password
    Input Text       ${Campo_Username}       ${user_padrao}
    Input Password    ${Campo_Senha}         ${senha_padrao}


Entao o login deve ser efetuado
    Click Element    ${BOTAO_LOGIN}




Dado que eu coloque 6 itens no carrinho
        Dado que eu abra o navegador
         E coloque os dados de username e password
         Entao o login deve ser efetuado 
       FOR    ${indice}    ${itens}    IN ENUMERATE    @{adcionar_itens}
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


Dado que eu acesse a pagina dos itens
         Dado que eu abra o navegador
         E coloque os dados de username e password
         Entao o login deve ser efetuado 

E que todos os itens estejam visiveis
    Element Should Be Visible    //div[@class='inventory_item_desc'][contains(.,'carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.')]
    Element Should Be Visible    (//div[contains(@class,'inventory_item_description')])[2]
    Element Should Be Visible    //div[@class='inventory_item_desc'][contains(.,'Get your testing superhero on with the Sauce Labs bolt T-shirt. From American Apparel, 100% ringspun combed cotton, heather gray with red bolt.')]
    Element Should Be Visible    (//div[contains(@class,'inventory_item_desc')])[8]
    Element Should Be Visible    (//div[contains(@class,'inventory_item_desc')])[10]
    Element Should Be Visible    //div[@class='inventory_item_desc'][contains(.,'This classic Sauce Labs t-shirt is perfect to wear when cozying up to your keyboard to automate a few tests. Super-soft and comfy ringspun combed cotton.')]

Então verificar se precos estao corretor
   
    Element Should Contain   (//div[contains(@class,'inventory_item_description')])[1]   Sauce Labs Backpack    
    Element Should Contain    (//div[contains(@class,'inventory_item_description')])[1]    $29.99    

    Element Should Contain   (//div[contains(@class,'inventory_item_description')])[2]   Sauce Labs Bike Light    
    Element Should Contain    (//div[contains(@class,'inventory_item_description')])[2]    $9.99 

    Element Should Contain   (//div[contains(@class,'inventory_item_description')])[3]   Sauce Labs Bolt T-Shirt  
    Element Should Contain    (//div[contains(@class,'inventory_item_description')])[3]    $15.99      

    Element Should Contain   (//div[contains(@class,'inventory_item_description')])[4]   Sauce Labs Fleece Jacket  
    Element Should Contain    (//div[contains(@class,'inventory_item_description')])[4]    $49.99       
    
    Element Should Contain   (//div[contains(@class,'inventory_item_description')])[5]  Sauce Labs Onesie 
    Element Should Contain    (//div[contains(@class,'inventory_item_description')])[5]    $7.99    

    Element Should Contain   (//div[contains(@class,'inventory_item_description')])[6]  Test.allTheThings() T-Shirt (Red)
    Element Should Contain    (//div[contains(@class,'inventory_item_description')])[6]    $15.99    
   
Entao os itens devem ser selecionados de um por um para ver as informacoes deles
    Dado que eu acesse a pagina dos itens
    E que todos os itens estejam visiveis
        FOR    ${indice}    ${itens}    IN ENUMERATE    @{clicar_itens}
          Click Element    ${itens}
          Element Should Be Visible   ${DESCRICAO_MAIOR}
          Click Element    ${BACK_TO_PRODUCTS}
          

        
    END

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