*** Settings ***
Resource            ../resources/resource.robot
Resource            ../resources/page_objects/home.robot
Resource            ../resources/page_objects/carrinho.robot
Resource            ../resources/page_objects/login.robot
Resource            ../resources/page_objects/signup.robot

Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Cases ***
Caso de Teste com Page Objects 01: Remover produtos do Carrinho
    Acessar página home do site
    Adicionar o produto "Blue Top" no carrinho
    Excluir o produto do carrinho
    Conferir se o carrinho fica vazio

### EXERCÍCIO
Caso de Teste com PO 02: Adicionar Cliente
      Acessar página home do site
      Clicar em "Signup/Login"
      Informar um e-mail válido
      Clicar em "Signup"
      Preencher os dados obrigatórios
      Submeter cadastro
      Conferir se o cadastro foi efetuado com sucesso
      Excluir cadastro


