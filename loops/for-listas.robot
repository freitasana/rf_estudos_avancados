*** Test Cases ***
Teste FOR ysando várias variáveis
    Cria dicionário de traduções

*** Keywords ***

### Usando várias variáveis
Cria dicionário de traduções
    FOR    ${index}    ${english}        ${finnish}    ${spanish}    ${portuguese-brazil}          IN
    ...    1            cat               kissa          gato                 gato           
    ...    2            dog               koira          perro                cachorro
    ...    3            horse             hevonem        caballo              cavalo 
    ...    4            bird              lintu          pájaro               pássaro 
        Log    ${index}:\nem inglês:${english}\nem finlandês:${finnish}\nem espanhol:${spanish}\nem português:${portuguese-brazil}
    END
        
