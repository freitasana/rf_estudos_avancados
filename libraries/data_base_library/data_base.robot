*** Settings ***
Documentation    https://github.com/MarketSquare/Robotframework-Database-Library 
...              Instale: "pip install -U robotframework-databaselibrary"
...              Para acessar o BD o Robot precisa conhecer o DRIVER de cada banco, então precisamos instalar esse DRIVER também ( instale apenas para o DB que for utilizar!)...
...              Para PostgreSQL: "pip install psycopg2"
...              Para SQLite 3: não precisa instalar nada!
...              Para MySQL: "pip install pymysql"
...              Para SQL Server: "pip install pymssql"
...              Para Oracle: "pip install cx-Oracle"
Library          DatabaseLibrary
Test Setup       Conectar no Banco de Dados
Test Teardown    Desconectar do Banco de Dados


*** Test Cases ***
Exemplo 01: Executando scripts SQL via Arquivos
    Executar script via ARQUIVO no Banco de Dados    ${CURDIR}${/}my_sql_scripts${/}create_table_accounts.sql
    Executar script via ARQUIVO no Banco de Dados    ${CURDIR}${/}my_sql_scripts${/}insert_into_accounts.sql
    Confere se usuário foi inserido com sucesso      Ana Paula


Exemplo 02: Executando scripts SQL via STRING
    Executar script via STRING no Banco de Dados     INSERT INTO public.account(user_id, username, password, email) VALUES (2, 'Luiz Silva', 'robot987', 'robotizando2@robot.com')
    Confere se usuário foi inserido com sucesso      Luiz Silva

Exemplo 03: Select Statement
    ${RESPOSTA_SELECT}    Executar a query no Banco de dados        SELECT * from account
    Log    ${RESPOSTA_SELECT}
    ##Para pegar um campo específico , utilize as tuplas [NUM_LINHA][NUM_COLUNA]
    Log    Usuário ${RESPOSTA_SELECT [0][0]} - Nome: ${RESPOSTA_SELECT [0][1]} - Email: ${RESPOSTA_SELECT [0][3]}
    Log    Usuário ${RESPOSTA_SELECT [1][0]} - Nome: ${RESPOSTA_SELECT [1][1]} - Email: ${RESPOSTA_SELECT [1][3]}

Exemplo 04: Alterando dados de um registro no banco
    Executar script via STRING no Banco de Dados      SCRIPT=UPDATE account SET email = 'robot@robot.com' where user_id=1

Exemplo 05: Limpando Tabelas
    ##Esta linha limpa os registros da tabela caso existam
    Limpar Tabela    account
    ##Esta linha exclui a tabela passando o sql DROP tabel account
    Executar script via STRING no Banco de Dados     DROP table account

*** Keywords ***
Conectar no Banco de Dados
## PostgreSQL
    Connect To Database   dbapiModuleName=psycopg2   dbName=robot   dbUsername=postgres   dbPassword=postgres   dbHost=localhost   dbPort=5432
    ## SQLite 3
      # Connect To Database Using Custom Params   dbapiModuleName=sqlite3    db_connect_string=database="./${DBName}.db", isolation_level=None
    ## MySQL
      # Connect To Database   dbapiModuleName=pymysql   dbName=${DBName}   dbUsername=${DBUser}   dbPassword=${DBPass}   dbHost=${DBHost}   dbPort=${DBPort}
    ## SQL Server
      # Connect To Database   dbapiModuleName=pymssql   dbName=${DBName}   dbUsername=${DBUser}   dbPassword=${DBPass}   dbHost=${DBHost}   dbPort=${DBPort}	  
    ## Oracle
      # Connect To Database Using Custom Params    dbapiModuleName=cx_Oracle    db_connect_string="${DBName}/${DBUser}@${DBHost}:${DBPort}/${DBalias}"

Desconectar do Banco de Dados
    Disconnect From Database

Executar script via ARQUIVO no Banco de Dados
    ## Keyword 'Execute Sql Script' executa um arquivo sql , recebe o caminho do arquivo , não retorna nada
    [Arguments]    ${FILE}
    Execute Sql Script        ${FILE}

Confere se usuário foi inserido com sucesso
    ## Keyword 'Check Row Count' confere quantidade de linhas , recebendo SQL + operador+quantidade , não retorna nada passa ou falha 
    [Arguments]           ${USER}
    Check Row Count       SELECT * FROM account WHERE username = '${USER}'  ==  1

Executar script via STRING no Banco de Dados    
    ## Keyword 'Execute Sql String' executa o comando sql escrito no código , recebe uma string contendo um comando SQL , não retorna nenhum valor , apenas executa o sql
    [Arguments]           ${SCRIPT}
    Execute Sql String    sql_string=${SCRIPT}

Executar a query no Banco de dados
    [Arguments]          ${QUERY}
    ${RESPONSE_QUERY}    Query    select_statement=${QUERY}
    RETURN               ${RESPONSE_QUERY}                

Limpar Tabela  
    [Arguments]         ${TABELA}
    ${REGISTROS}        Row Count         select_statement= SELECT * FROM ${TABELA}
    Run Keyword If      ${REGISTROS} > 0    Delete All Rows From Table    ${TABELA}
