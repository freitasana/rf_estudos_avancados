*** Settings ***
Documentation    https://github.com/MarketSquare/robotframework-difflibrary/tree/master    
...              Instale: "pip install -U robotframework-databaselibrary"
...              coinfirme a instalação "python -m pip show robotframework-difflibrary"  

Library          DiffLibrary

*** Test Cases ***
Exemplo 01: Comparar arquivos iguais
    Comparar dois arquivos iguais

Exemplo 02: Comaprar arquivos diferentes
    Comparar dois arquivos diferentes

*** Keywords ***
Comparar dois arquivos iguais
    ## Esta keyword compara dois arquivos de texto
    Diff Files    
    ...     file1=${CURDIR}${/}my_files${/}arquivo_esperado.txt
    ...     file2=${CURDIR}${/}my_files${/}arquivo_atual_igual.txt

Comparar dois arquivos diferentes    
    ## A keyword 'Run Keyword And Expect Error' ela executa uma keyword esperando que ela falhe , se a keyword falhar o teste continua normalmente
    ## se a keyword passar , o teste falha. Ela espera uma mensagem de erro , o '*' significa eu aceito qualquer mensahem de erro
    ## No terminal o status fica como PASSOU , porque a keyword espera uma falha, acessando o relatório é possível verificar que a keyword identificou a diferença ficando com a falha
    ## A'Run Keyword And Expect Error' é muito utilizada para validar cenários negativos: como validar login inválido, validar que um arquivo existe etc.


    Run Keyword And Expect Error
    ...    *
    ...    Diff Files
    ...    ${CURDIR}${/}my_files${/}arquivo_esperado.txt
    ...    ${CURDIR}${/}my_files${/}arquivo_atual_diferente.txt