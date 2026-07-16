*** Settings ***
Documentation    https://github.com/MarketSquare/robotframework-difflibrary/tree/master    
...              Instale: "-m pip install robotframework-difflibrary""
...              confirme a instalação "python -m pip show robotframework-difflibrary"  

Library          DiffLibrary

*** Test Cases ***
Exemplo 01: Comparar arquivos iguais
    Comparar dois arquivos iguais

Exemplo 02: Comparar arquivos diferentes
    Comparar dois arquivos diferentes

*** Keywords ***
Comparar dois arquivos iguais
    ## Esta keyword compara dois arquivos de texto
    Diff Files    
    ...     file1=${CURDIR}${/}my_files${/}arquivo_esperado.txt
    ...     file2=${CURDIR}${/}my_files${/}arquivo_atual_igual.txt

Comparar dois arquivos diferentes    
    ## Run Keyword And Expect Error executa uma keyword esperando que ela falhe.
    ## Se a keyword falhar com a mensagem esperada, o teste continua e passa.
    ## Se a keyword passar, o teste falha.
    ## O * aceita qualquer mensagem de erro.
    ## É útil para validar cenários negativos e comportamentos de falha esperados.


    Run Keyword And Expect Error
    ...    *
    ...    Diff Files
    ...    ${CURDIR}${/}my_files${/}arquivo_esperado.txt
    ...    ${CURDIR}${/}my_files${/}arquivo_atual_diferente.txt