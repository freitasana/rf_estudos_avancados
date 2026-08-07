*** Settings ***
Library    ${CURDIR}${/}hash_library${/}gerador_hash.py  
Library    ${CURDIR}${/}SeleniumLibrary
Library    ${CURDIR}${/}minha_library.py


*** Test Cases ***
Teste de conversão de string para HASH sha256
    Converter "Estou ficando ninja em Robot Framework !!!" para sha256

Teste de conversão de arquivo para HASH sha256
    Converter o arquivo "${CURDIR}${/}arquivo_PDF.pdf" para sha256

Teste minha SeleniumLibrary
    Abrir meu browser

Teste minha Library
    Testar minha library    

*** Keywords ***
Converter "${CONTEUDO}" para sha256
    ${HASH}    Gerar Hash      ${CONTEUDO}
    Log    ${HASH}

Converter o arquivo "${FILE}" para sha256
    ${HASH}    Gerar Hash Arquivo    ${FILE}
    Log    ${HASH}

Abrir meu browser
    My Open Browser    https://robotframework.org/    chrome 

Testar minha library
    ${email}=    Gerar Email    Ana
    Log    ${email}

    Exibir Email    ${email} 