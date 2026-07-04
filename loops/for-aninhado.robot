*** Test Cases ***
Teste FOR aninhado
    Cria cadastro de produtos (FOR aninhado)

*** Keywords ***
### FOR dentro de FOR (Loop aninhado)
### Não é possível fazer aninhamentos diretamente
### O recomendado é criar uma keyword que chama a outra no laço

Cria cadastro de produtos (FOR aninhado)
    FOR    ${produto}    IN    baby look    camiseta    blusa
        Imprime tamanhos para o produto  $(produto)
    
    END
    
Imprime tamanhos para o produto    
    [Arguments]    ${produto}
    FOR    ${tamanho}    IN    P    M    G
        Log    Produto: ${produto} - Tam:${tamanho}
        
    END
    