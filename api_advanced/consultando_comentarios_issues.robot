*** Settings ***
Documentation       Exemplos da própria Library: https://github.com/bulkan/robotframework-requests/blob/master/tests/testcase.robot
...                 Doc da API do GitHub:  https://developer.github.com/v3/issues/comments/#list-comments-in-a-repository
Library             RequestsLibrary
Library             Collections
Resource            ./variables/my_user_and_passwords.robot



*** Variables ***
${GITHUB_HOST}      https://api.github.com
${ISSUES_URI}       /repos/freitasana/rf_estudos_avancados/issues/comments

*** Test Cases ***

Exercício 02: Utilizando a API do GitHub, crie um teste no Robot que CONSULTA OS COMENTÁRIOS das issues existentes.
    Conectar com autenticação por token na API do GitHub
    Consultar comentários nas issues

*** Keywords ***

Conectar com autenticação por token na API do GitHub
    ${HEADERS}          Create Dictionary    Authorization=Bearer ${MY_GITHUB_TOKEN}
    Create Session      alias=mygithubAuth   url=${GITHUB_HOST}     headers=${HEADERS}     disable_warnings=True


Consultar comentários nas issues 
    ${MY_COMMENTS}       GET On Session          alias=mygithubAuth       url=${ISSUES_URI}    

    Conferir sucesso na requisição  ${MY_COMMENTS}   
    Log     Lista de comentários: ${MY_COMMENTS.json()}

Conferir sucesso na requisição    
   [Arguments]    ${RESPONSE}
   Should Be True   '${RESPONSE.status_code}' == '200'
   