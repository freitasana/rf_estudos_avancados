*** Test Cases ***
### Falhas previstas

Exemplo 01: Teste lidando com falhas previstas
    Essa Keyword vai falhar, mas vou ignorar ( a suíte irá passar)!
    Essa Keyword encerra a execução da suíte!  Não pare, por favor!
    Essa keyword vai falhar, mas é uma falha que deve acontecer para meu teste ser considerado OK!
    Essa keyword vai falhar, não vou ignorar ( a suíte irá falhar), mas vou continuar a execução!
    Essa keyword encerra a execução da suíte!    Para tudo !

*** Keywords ***


Essa Keyword vai falhar, mas vou ignorar ( a suíte irá passar)!
    Run Keyword And Ignore Error    Should Be True        "Ana" == "João"   
    Log    Continuo a execução!!! 



Essa Keyword encerra a execução da suíte!
    [Arguments]    ${STOP}  
    Run Keyword If    "${STOP}"=="para tudo!"    Fatal Error    msg=Para tudo, não adianta continuar com essa falha aqui!!!  

Essa keyword vai falhar, mas é uma falha que deve acontecer para meu teste ser considerado OK! 
## aqui vai validar que ocorreu o erro, não se importando com a mensagem exata 
    Run Keyword And Expect Error    *   Should Be True    "Ana" == "João"

## aqui vai validar parte da mensage, verifica que o erro contém "shpuld be true", sem exigir igualdade
    #Run Keyword And Expect Error    *should be true*   Should Be True    "Ana" == "João"

Essa keyword vai falhar, não vou ignorar ( a suíte irá falhar), mas vou continuar a execução!
    Run Keyword And Continue On Failure   Should Be True    "Ana" == "João"
    Log    Continue a execução 1!!
    Log    Continue a execução 2!!
    Log    Continue a execução 3!! 

