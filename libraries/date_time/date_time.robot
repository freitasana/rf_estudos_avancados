*** Settings ***

Documentation    https://robotframework.org/robotframework/latest/libraries/DateTime.html
Library          DateTime

*** Test Cases ***

Exemplo 01: Pegando data e hora atuais
    Teste pegando data atual
    Teste pegando data e horas atuais
    Teste pegando ano - mês - dia separadamente


Exemplo 02: Manipulando o tempo
    Trabalhando com o tempo
    Adicionando tempo de data
    Subtraindo tempo de data


*** Keywords ***
Teste pegando data atual
    ${AGORA}    Get Current Date    result_format=%d-%m-%y   ##neste formato vai exibir apenas os dois últimos dígitos do ano por conta de informa o 'y' em minúsculo
    Log    ${AGORA}

Teste pegando data e horas atuais
    ${AGORA}    Get Current Date    result_format=%Y-%m-%dT%H:%M:%S   ##neste formato vai exibir os 4 dígitos do ano por conta de informar o 'Y' em maiúsculo
    Log    ${AGORA}

Teste pegando ano - mês - dia separadamente 
    ${HOJE}    Get Current Date
    ${HOJE}    Convert Date    ${HOJE}    datetime
    Log        ${HOJE.day}-${HOJE.month}-${HOJE.year}

Trabalhando com o tempo
    ${HORA}    Convert Time    1 minute 30 seconds
    Log        São ${HORA} segundos em 1 minuto e 30 segundos!
    ${HORA}    Convert Time    5400    verbose
    Log        5400 segundos são ${HORA}!
    ${HORA}    Convert Time    5500     timer     exclude_millis=yes
    Log        5500 segundos é ${HORA}!

Adicionando tempo de data
    ${ANTES}    Get Current Date
    ${DEPOIS}   Add Time To Date    ${ANTES}    4 hours    result_format=%d-%m-%Y %H:%M:%S
    Log    Antes: ${ANTES} - Depois: ${DEPOIS}
    ${ANTES}    Get Current Date
    ${DEPOIS}   Add Time To Date    ${ANTES}    7 days    result_format=%d-%m-%Y %H:%M:%S
    Log    Antes: ${ANTES} - Depois: ${DEPOIS}

Subtraindo tempo de data
    ${ANTES}    Get Current Date
    ${DEPOIS}   Subtract Time From Date    ${ANTES}    25 minutes    result_format=%d-%m-%Y %H:%M%S
    Log    Antes:${ANTES} - Depois: ${DEPOIS}
    ${ANTES}    Get Current Date
    ${DEPOIS}   Subtract Time From Date    ${ANTES}    2 days   result_format=%d-%m-%Y %H:%M%S
    Log    Antes:${ANTES} - Depois: ${DEPOIS}