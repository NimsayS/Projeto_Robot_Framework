*** Settings ***
Test Setup     Dado que eu abra o navegador
Resource       ../resources/utils/main.robot
Resource       ../resources/pages/LoginPage.resource
Resource       ../resources/pages/CarrinhoPage.resource
Resource       ../resources/pages/PricesPage.resource
Resource       ../resources/pages/ItemsPage.resource
Resource       ../resources/pages/Redes.resource


Test Teardown  Fechar o navegador

*** Test Cases ***

Verificar se os campos username e password estão visiveis
  Então a home page com username password devem ser visiveis


Verificar se o login esta funcionando corretamente
    Dado que coloque os dados de username e password
    Entao o login deve ser efetuado 

Verificar se os itens escolhidos vao pro carrinho
     Dado que eu coloque 6 itens no carrinho
     Então o icone carrinho com os 6 itens deve estar visivel

Verificar que existem 6 itens dentro do carrinho
    Dado que eu coloque 6 itens no carrinho
    Então deve ter 6 itens dentro de carrinho
    
Verificar que os precos dos itens estao corretos
    Dado que eu acesse a pagina dos itens
    E que todos os itens estejam visiveis
    Então verificar se precos estao corretor

Verificar que ao clicar no item escolhido ele ira abrir as informacoes do item
    Dado que eu acesse a pagina dos itens
    E que todos os itens estejam visiveis
    Entao os itens devem ser selecionados de um por um para ver as informacoes deles

Verificar se os botoes que levam as redes sociais estao funcionando
    Dado que eu acesse a pagina dos itens
    E os icones das redes sociais estejam visiveis
    Então os links das redes sociais devem abrir