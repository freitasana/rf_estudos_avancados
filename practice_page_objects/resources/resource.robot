*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${BROWSER}    chrome
${URL}        https://automationexercise.com/

*** Keywords ***
### Setup e Teardown
Abrir navegador
    Open Browser    about:blank    ${BROWSER}
    Maximize Browser Window

Fechar navegador
    Close Browser


