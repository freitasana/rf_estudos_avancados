*** Test Cases ***

Teste FOR com numeração na lista para exibir a posição de cada elemento
    For com numeração


*** Keywords ***
For com numeração
        FOR    ${index}    ${item}    IN ENUMERATE    PP    P    M    G    GG    XG    XXG
            Log    Item da lista: ${item} - Posição do item na lista: ${index}
            
        END
        