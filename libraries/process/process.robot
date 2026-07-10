*** Settings ***
Documentation    https://robotframework.org/robotframework/latest/libraries/Process.html
Library          Process

*** Test Cases ***
Exemplo 01: Abrindo programas
    Abra e feche o Notepad

Exemplo 02: Executando e aguardando scripts/programas
    Execute um script e aguarde ele finalizar com sucesso
    Execute um script e aguarde ele finalizar com falha

Exemplo 03: Execute comandos de prompt
    Executando comandos diversos de prompt

*** Keywords ***
Abra e feche o Notepad
    ##Inicia o processo e não espera por resposta dele
    ## Lembrete: Para caminhos no Windows usa aspas duplas!!!
    Start Process    notepad.exe
    Sleep    3s
    Run Process    taskkill    /F    /IM    notepad.exe

Verifica sucesso na execução do processo
    [Arguments]    ${PROCESSO}
    ## RC igual a  ZERO indica SUCESSO na execução do processo
    Run Keyword And Continue On Failure        Should Be Equal As Integers    ${PROCESSO.rc}    0
    ...    msg=ATENÇÃO! Seu processo não executou com sucesso
    ## Se ocorreu erro , vamos logar ele usando o stderr que equivale a erro
    Run Keyword If    ${PROCESSO.rc}!=0    log    FALHA OCORRIDA: "${PROCESSO.stderr}"


Execute um script e aguarde ele finalizar com sucesso
    #Inicia o processo e espera pelo término
    ${MEU_PROCESSO}    Run Process    python    ${CURDIR}${/}/hello_world.py
    # rc é o retorno 0 ou 1 , 0 é igual a sucesso e 1 é igual a falha
    Log    Resultado da execução (sucesso/falha): ${MEU_PROCESSO.rc} 
    #stdout é a saída que o script retornou
    Log    Saída da execução:${MEU_PROCESSO.stdout}
    Verifica sucesso na execução do processo      ${MEU_PROCESSO}

Execute um script e aguarde ele finalizar com falha
    #Inicia o processo e espera pelo término
    ${MEU_PROCESSO}    Run Process    python    ${CURDIR}${/}/hello_world_fail.py
    # rc é o retorno 0 ou 1 , 0 é igual a sucesso e 1 é igual a falha
    Log    Resultado da execução (sucesso/falha): ${MEU_PROCESSO.rc} 
    #stdout é a saída que o script retornou
    Log    Saída da execução:${MEU_PROCESSO.stdout}
    Verifica sucesso na execução do processo      ${MEU_PROCESSO}

Executando comandos diversos de prompt
    ## Use o atributo shell=True para habilitar as funções de shell, como criar um diretório por exemplo
    Run Process    mkdir robot_teste    cwd=${CURDIR}    shell=True
    Run Process    rmdir robot_teste    cwd=${CURDIR}    shell=True