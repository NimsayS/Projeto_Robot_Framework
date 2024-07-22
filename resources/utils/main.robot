*** Settings ***
Library     SeleniumLibrary
Library     FakerLibrary   locale=pt_BR
Resource    ../pages/swagLabs_resources.robot

*** Keywords ***
Dado que eu abra o navegador
    Open Browser    browser= chrome
    Go To    url=https://www.saucedemo.com

Fechar o navegador
    Close Browser