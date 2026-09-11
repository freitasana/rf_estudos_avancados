*** Settings ***
Documentation       Exemplos da própria Library: https://github.com/bulkan/robotframework-requests/blob/master/tests/testcase.robot
...                 Doc da API do GitHub: https://docs.github.com/pt/rest?apiVersion=2026-03-10
Library             RequestsLibrary
Library             Collections
Library             String
Resource            ./variables/my_user_and_passwords.robot

*** Variables ***

${GITHUB_HOST}      https://api.github.com
${ISSUES_URI}       /repos/freitasana/rf_estudos_avancados/issues

*** Test Cases ***
Exemplo: Postando com body template
    Conectar com autenticação por token na API do GitHub
    Postar uma nova issue com label "robot framework"


*** Keywords ***
Conectar com autenticação por token na API do GitHub
    ${HEADERS}          Create Dictionary    Authorization=Bearer ${MY_GITHUB_TOKEN}
    Create Session      alias=mygithubAuth   url=${GITHUB_HOST}     headers=${HEADERS}     disable_warnings=True

Postar uma nova issue com label "${LABEL}"
    ${BODY}         Format String    ${CURDIR}/data/input/post_issue.json
    ...             user_git=${MY_GITHUB_USER}
    ...             label=${LABEL}
    Log             Meu Body ficou:\n${BODY}
    ${RESPONSE}     POST On Session    alias=mygithubAuth    url=${ISSUES_URI}   data=${BODY}
    Confere sucesso na requisição   ${RESPONSE}

Confere sucesso na requisição
    [Arguments]      ${RESPONSE}
    Should Be True   '${RESPONSE.status_code}'=='200' or '${RESPONSE.status_code}'=='201'
    ...  msg=Erro na requisição! Verifique: ${RESPONSE}
