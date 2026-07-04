*** Settings ***
Documentation    https://robotframework.org/robotframework/latest/libraries/OperatingSystem.html
Library          OperatingSystem     

*** Test Cases ***
Exemplo 01: Criando arquivos
    Criando um arquivo texto
    Criando um arquivo JSON

Exemplo 02: Copiando arquivos
    Copiando meu arquivo

Exemplo 03: Lendo meu arquivo
    Lendo o conteúdo
    Lendo o binário

Exemplo 04: Excluindo arquivos
    Listando os arquivos do meu diretório
    Excluir arquivo    arquivo_TEXTO_COPIA.txt
    Excluir arquivo    arquivo_JSON_COPIA.json
    Listando os arquivos do meu diretório


*** Keywords ***
Criando um arquivo texto
    Create File    ./libraries/operating_system/my_files/arquivo_TEXTO.txt     Esse curso vai me tormar num ninja em Robot Framework!!!!

Criando um arquivo JSON
    Create File    ./libraries/operating_system/my_files/arquivo_JSON.json    {"teste 01": "valor 01","teste 02": "2","teste 03":[1,2,3]}

Copiando meu arquivo
    Copy File    ./libraries/operating_system/my_files/arquivo_TEXTO.txt    ./libraries/operating_system/my_files/arquivo_TEXTO_COPIA.txt
    Copy File    ./libraries/operating_system/my_files/arquivo_JSON.json    ./libraries/operating_system/my_files/arquivo_JSON_COPIA.json

Lendo o conteúdo
    ## O conteúdo é retornado em String
    ${MEU_ARQUIVO}    Get File         ./libraries/operating_system/my_files/arquivo_TEXTO.txt
    ${SIZE}           Get File Size    ./libraries/operating_system/my_files/arquivo_TEXTO.txt 
    Log    ${MEU_ARQUIVO}           

Lendo o binário
    ## O binário é retornado
    Should Exist    ./libraries/operating_system/my_files/arquivo_PDF.pdf    msg=O arquivo não existe!! Verifique
    ${MEU_ARQUIVO}  Get Binary File    ./libraries/operating_system/my_files/arquivo_PDF.pdf
    ${SIZE}         Get File Size      ./libraries/operating_system/my_files/arquivo_PDF.pdf
    Log    ${MEU_ARQUIVO}

Listando os arquivos do meu diretório
    List Directory   ./libraries/operating_system/my_files

Excluir arquivo 
    [Arguments]    ${ARQUIVO}
    Remove File    ./libraries/operating_system/my_files/${ARQUIVO}
