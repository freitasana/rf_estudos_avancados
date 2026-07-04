*** Settings ***

Suite Teardown    Controlando o teardown da suite
Test Teardown     Controlando o teardown do teste

*** Test Cases ***

### Sucesso
Exemplo 01: Teste lidando com Suite e Test Teardowns
    Essa Keyword fará o teste passar, não executando as keywords abaixo!
    Essa Keyword vai passar sozinha!
    Essa Keyword fará o teste falhar, não executando as keywords abaixo!
    
    

Exemplo 02: teste lidando com Suite e Test Teardowns
    Essa Keyword vai passar sozinha!    
    Essa Keyword vai passar sozinha!
    Essa aqui também vai passar com uma condição e vai parar de executar as keywords abaixo!
    Essa Keyword vai passar sozinha!
    Essa Keyword vai passar sozinha!

### Falhas
Exemplo 03: teste lidando com Suite e Test Teardowns
    Essa Keyword vai passar sozinha! 
    Essa Keyword fará o teste falhar, não executando as keywords abaixo!
    Essa Keyword vai passar sozinha!
    Essa Keyword vai falhar sozinha! 


Exemplo 04: teste lidando com Suite e Test Teardowns    
    Essa Keyword vai falhar sozinha! 

*** Keywords ***
### SUITE TEARDOWNS
Controlando o teardown da suite
    Run Keyword If All Tests Passed    Log    Todos os testes passaram, posso enviar um e-mail, por exemplo!
    Run Keyword If Any Tests Failed    Log    Alguns testes falharam, posso enviar um e-amil , por exemplo!

### TEST TEARDOWNS
Controlando o teardown do teste        
    Run Keyword If Test Passed        Log    Meu teste passou , não preciso apagar dados do banco de dados, por exemplo!
    Run Keyword If Test Failed        Log    Meu teste falhou, posso imprmir ou manter informação no banco de dados para analisar o erro, por exemplo!



### Controlando o STATUS
Essa Keyword fará o teste passar, não executando as keywords abaixo!
    Pass Execution    message=Estou forçando meu teste a passar com sucesso!

Essa Keyword fará o teste falhar, não executando as keywords abaixo!
    Fail        msg=Estou forçando o meu teste falhar!

Essa aqui também vai passar com uma condição e vai parar de executar as keywords abaixo!    
    ${STATUS}    Run Keyword And Return Status    Should Be True    "Ana" == "Ana"
    Log     ${STATUS}    
    Pass Execution If    ${STATUS}    message=Ana é igual a Ana, então passou!

Essa Keyword vai passar sozinha!
    Should Be True    "Ana" == "Ana"

Essa Keyword vai falhar sozinha!
    Should Be True    "Ana" == "João"