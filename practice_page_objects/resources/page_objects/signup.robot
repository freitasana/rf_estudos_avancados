*** Settings ***
Library    SeleniumLibrary
Resource            home.robot
Resource            login.robot

*** Variables ***
${SIGNUP_TITLE}                    xpath=//b[contains(text(),"Enter Account Information")] 
${SIGNUP_INPUT_PASSWORD}           id=password    
${SIGNUP_INPUT_FIRST_NAME}         id=first_name 
${SIGNUP_INPUT_LAST_NAME}          id=last_name
${SIGNUP_INPUT_ADDRESS}            id=address1
${SIGNUP_SELECT_COUNTRY}           id=country
${SIGNUP_INPUT_STATE}              id=state
${SIGNUP_INPUT_CITY}               id=city
${SIGNUP_INPUT_ZIPCODE}            id=zipcode
${SIGNUP_INPUT_MOBILE_NUMBER}      id=mobile_number 
${SIGNUP_BUTTON_CREATE_ACCOUNT}    xpath=//button[@data-qa="create-account"] 
${SIGNUP_TEXT_CREAT_ACCOUNT}       xpath=//b[contains(text(),"Account Created!")]
${SIGNUP_TEXT}                     xpath=//b[contains(text(),"Ana Paula de Freitas da Silva")]
${SIGNUP_DELETE_ACCOUNT}           xpath= //a[@href="/delete_account"]
${SIGNUP_TEXT_DELETE_ACCOUNT}      xpath=//b[contains(text(),"Account Deleted!")] 
${SIGNUP_CLOSE_AD}                 xpath=//*[normalize-space(text())="Close"]


*** Keywords ***
Preencher os dados obrigatórios
    Wait Until Element Is Visible    ${SIGNUP_TITLE}
    Wait Until Element Is Visible    ${SIGNUP_INPUT_PASSWORD}
    Input Password                   ${SIGNUP_INPUT_PASSWORD}          123456
    Wait Until Element Is Visible    ${SIGNUP_INPUT_FIRST_NAME}
    Input Text                       ${SIGNUP_INPUT_FIRST_NAME}        Ana Paula
    Wait Until Element Is Visible    ${SIGNUP_INPUT_LAST_NAME} 
    Input Text                       ${SIGNUP_INPUT_LAST_NAME}         de Freitas da Silva
    Wait Until Element Is Visible    ${SIGNUP_INPUT_ADDRESS} 
    Input Text                       ${SIGNUP_INPUT_ADDRESS}           Rua Abel Scuissiato, 2829
    Wait Until Element Is Visible    ${SIGNUP_SELECT_COUNTRY}
    Select From List By Value        ${SIGNUP_SELECT_COUNTRY}          Australia
    Wait Until Element Is Visible    ${SIGNUP_INPUT_STATE}  
    Input Text                       ${SIGNUP_INPUT_STATE}             Paraná
    Wait Until Element Is Visible    ${SIGNUP_INPUT_CITY}
    Input Text                       ${SIGNUP_INPUT_CITY}              Colombo
    Wait Until Element Is Visible    ${SIGNUP_INPUT_ZIPCODE}
    Input Text                       ${SIGNUP_INPUT_ZIPCODE}           83408-280
    Wait Until Element Is Visible    ${SIGNUP_INPUT_MOBILE_NUMBER}
    Input Text                       ${SIGNUP_INPUT_MOBILE_NUMBER}     41999999999  

Submeter cadastro
    Wait Until Element Is Visible    ${SIGNUP_BUTTON_CREATE_ACCOUNT}
    Click Button                     ${SIGNUP_BUTTON_CREATE_ACCOUNT}
    Wait Until Element Is Visible    ${SIGNUP_TEXT_CREAT_ACCOUNT}

Conferir se o cadastro foi efetuado com sucesso    
    Clicar em "Signup/Login"
    Wait Until Element Is Visible    ${SIGNUP_TEXT} 

Excluir cadastro

    Wait Until Element Is Visible    ${SIGNUP_DELETE_ACCOUNT}
    Click Element                    ${SIGNUP_DELETE_ACCOUNT}
    Tratar anúncio modal
    Wait Until Element Is Visible    ${SIGNUP_TEXT_DELETE_ACCOUNT}
          
Tratar anúncio modal
   ${tem_anuncio}=    Run Keyword And Return Status    Location Should Contain    \#google_vignette
    
    IF    ${tem_anuncio}
        Go To    https://automationexercise.com/delete_account
    END


