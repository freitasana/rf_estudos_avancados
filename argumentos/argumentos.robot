*** Test Cases ***
Relembrando argumentos posicionais X nomeados
    Teste de Argumentos Básico    1    2    3    4 
    Teste de Argumentos Básico    arg4=1    arg3=2    arg2=3    arg1=4               

Teste de Argumentos opcionais
    Passando argumentos opcionais como parâmetro    nome=Ana Paula    ultimo_nome=da Silva
    Passando argumentos opcionais como parâmetro    nome=Ana Paula    nome_meio=de Freitas    ultimo_nome=da Silva

Criando lista e dicionário via parâmetro
    [Documentation]    No Python é conhecido como "kwargs"
    Teste criando um Dicionário    cwd=/home/user shell=True env=False
    Teste criando uma Lista        Ana    João    Maria 
    Teste criando os dois          Ana    João    Maria    shell=True    env=False


*** Keywords ***
Teste de Argumentos Básico
    [Arguments]    ${arg1}    ${arg2}    ${arg3}    ${arg4}
    Log    ${arg1} - ${arg2} - ${arg3} -${arg4}

Passando argumentos opcionais como parâmetro    
### Parâmetros OPCIONAIS ficam por último
### O Robot é case-sensitive, se o parãmetro está minúsculo, lá na keyword tem que estar também!

    [Arguments]    ${nome}    ${ultimo_nome}    ${nome_meio}=de Freitas
    Log    Nome completo: ${nome} ${nome_meio} ${ultimo_nome}

Teste criando um Dicionário
### Regra: Somente um dicionário pode ser criado
    [Arguments]    &{meu_dicionario}
    Log    ${meu_dicionario}

Teste criando uma Lista
### Regra: Somente uma lista pode ser criada
    [Arguments]    @{minha_lista}
    Log    ${minha_lista}

Teste criando os dois
    [Arguments]    @{minha_lista}     &{meu_dicionario}
    Log    ${minha_lista}\n${meu_dicionario}