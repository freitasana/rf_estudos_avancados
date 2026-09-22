*** Settings ***
Documentation       Exemplos da própria Library: https://github.com/bulkan/robotframework-requests/blob/master/tests/testcase.robot
...                 Doc da API do GitHub: https://developer.github.com/v3/issues/comments/#create-a-comment
Library             RequestsLibrary
Library             Collections
Library             String
Resource            ./variables/my_user_and_passwords.robot



*** Variables ***
${GITHUB_HOST}      https://api.github.com
${ISSUES_URI}       /repos/freitasana/rf_estudos_avancados/issues

*** Test Cases ***

Exercício 01: Utilizando a API do GitHub, crie um teste no Robot que CRIA UM COMENTÁRIO na ISSUE de número 2.
    Conectar com autenticação por token na API do GitHub
    Criar o comentário na issue "2"

*** Keywords ***

Conectar com autenticação por token na API do GitHub
    ${HEADERS}          Create Dictionary    Authorization=Bearer ${MY_GITHUB_TOKEN}
    Create Session      alias=mygithubAuth   url=${GITHUB_HOST}     headers=${HEADERS}     disable_warnings=True


Criar o comentário na issue "${ISSUE_NUMBER}"
    ${BODY}         Format String    ${CURDIR}/data/input/post_comentario_issue.json
    ...             user_git=${MY_GITHUB_USER}
    ...             issue=${ISSUE_NUMBER}
    Log             Meu Body ficou:\n${BODY}
    ${RESPONSE}     POST On Session    alias=mygithubAuth    url=${ISSUES_URI}/${ISSUE_NUMBER}/comments   data=${BODY}
    Confere sucesso na requisição   ${RESPONSE}

Confere sucesso na requisição
    [Arguments]      ${RESPONSE}
    Should Be True   '${RESPONSE.status_code}'=='200' or '${RESPONSE.status_code}'=='201'
    ...  msg=Erro na requisição! Verifique: ${RESPONSE}    