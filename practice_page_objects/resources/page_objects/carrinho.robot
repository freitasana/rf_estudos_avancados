*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CARRINHO_DELETAR}    xpath=//a[contains(@class,"cart_quantity_delete")]
${CARRINHO_MSG}        id=empty_cart


*** Keywords ***
Excluir o produto do carrinho
    Wait Until Element Is Visible    ${CARRINHO_DELETAR}
    Click Element                    ${CARRINHO_DELETAR}

###Conferências  
Conferir se o carrinho fica vazio
    Wait Until Element Is Visible    ${CARRINHO_MSG} 
    Element Text Should Be           ${CARRINHO_MSG}     Cart is empty! Click here to buy products.