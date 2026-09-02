*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_USER_SIGNUP}     xpath=//form[@action="/signup"] 
${LOGIN_INPUT_NAME}      xpath=//input[@data-qa="signup-name"]
${LOGIN_INPUT_EMAIL}     xpath=//input[@data-qa="signup-email"]   
${LOGIN_BOTAO_SIGNUP}    xpath=//button[@data-qa="signup-button"]  
       


*** Keywords ***
Informar um e-mail válido    
    Wait Until Element Is Visible       ${LOGIN_USER_SIGNUP}
    Wait Until Element Is Visible       ${LOGIN_INPUT_NAME}   
    Input Text                          ${LOGIN_INPUT_NAME}    Ana Paula de Freitas da Silva
    Wait Until Element Is Visible       ${LOGIN_INPUT_EMAIL}
    Input Text                          ${LOGIN_INPUT_EMAIL}   anapaulafsilva@email.com   
    
Clicar em "Signup"
    Wait Until Element Is Visible      ${LOGIN_BOTAO_SIGNUP}
    Click Button                       ${LOGIN_BOTAO_SIGNUP}