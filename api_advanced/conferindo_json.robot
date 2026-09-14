*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem
Library    Collections

*** Variables ***
${MEU_DICT_ESPERADO}    {"primeiro_nome": "Ana Paula", "nome_do_meio": " de Freitas","ultimo_nome": "da Silva","apelido": "Ana"}


*** Test Cases ***
Exemplo: Conferindo JSON complexo
    Confere objetos e sub-objetos do JSON
    Confere Listas no JSON



*** Keywords ***
Pega JSON
    ${MEU_JSON_COMPLEXO}    Get File    ${CURDIR}/data/output/json_complexo.json
   ### A Get File retrona uma STRING, vamos transformá-la em JSON

   ### Evaluate executa uma expressão Python e json.loads(...) transforma uma string JSON em um objeto Python. 
   # O $ sem {} dentro do Evaluate é proposital, nesse contexto, ele passa o valor da variável do Robot diretamente para o Python
    ${MEU_JSON_COMPLEXO}    Evaluate    json.loads($MEU_JSON_COMPLEXO)    json
    RETURN           ${MEU_JSON_COMPLEXO}

Confere objetos e sub-objetos do JSON
    ${MEU_JSON_COMPLEXO}    Pega JSON    
    
     ### Evaluate executa uma expressão Python e json.loads(...) transforma uma string JSON em um objeto Python. 
   # O $ sem {} dentro do Evaluate é proposital, nesse contexto, ele passa o valor da variável do Robot diretamente para o Python
    ${MEU_DICT_ESPERADO}    Evaluate    json.loads($MEU_DICT_ESPERADO)    json

    ### Conferindo um sub-dicionário dentro de um JSON
    Dictionary Should Contain Sub Dictionary    ${MEU_JSON_COMPLEXO["pessoa"]["nome"]}
    ...    ${MEU_DICT_ESPERADO}

    ### Conferindo campo a campo
    Dictionary Should Contain Item    ${MEU_JSON_COMPLEXO["pessoa"]["nome"]}    apelido    Ana

    ### Chegando em um valor dentro de uma lista de dicionários
    Dictionary Should Contain Item    ${MEU_JSON_COMPLEXO["pessoa"]["hobbies"]["livros"][0]}    titulo    O Evangelho o segundo o Espiritismo
    Dictionary Should Contain Item    ${MEU_JSON_COMPLEXO["pessoa"]["hobbies"]["livros"][1]}    titulo    Se abrindo pra vida  
    Dictionary Should Contain Item    ${MEU_JSON_COMPLEXO["pessoa"]["hobbies"]["livros"][2]}    titulo    Chatgpt Explicado

Confere Listas no JSON
    ${MEU_JSON_COMPLEXO}     Pega JSON

    ### Conferindo valor contido em uma lista
    List Should Contain Value    ${MEU_JSON_COMPLEXO["pessoa"]["hobbies"]["games"]["minigame"]}    Mario

    ### Pegando o valor de uma determinada posição da lista
    ${GAME}    Get From List    ${MEU_JSON_COMPLEXO["pessoa"]["hobbies"]["games"]["PS5"]}           2
    Log    Game da posição 2 da lista: ${GAME}

    ### Conferindo se não há duplicidade da lista
    List Should Not Contain Duplicates    ${MEU_JSON_COMPLEXO["pessoa"]["hobbies"]["games"]["PS5"]}

    ### Percorrendo uma lista
    @{LISTA DE LIVROS}    Get From Dictionary    ${MEU_JSON_COMPLEXO["pessoa"]["hobbies"]}    livros
    FOR    ${LIVRO}    IN    @{LISTA DE LIVROS}
        Log    Título: ${LIVRO["titulo"]}\nAutor: ${LIVRO["autor"]}
    END
    
