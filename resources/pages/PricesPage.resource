*** Settings ***
Resource    ../utils/main.robot
Resource     ../../test/SwagLabs_test.robot


*** Keywords ***
Dado que eu acesse a pagina dos itens
         Dado que eu abra o navegador
         Dado que coloque os dados de username e password
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