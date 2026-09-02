*** Settings ***
Library    SeleniumLibrary
Library    String


*** Variables ***
${HOME_URL}                https://automationexercise.com/
${HOME_TOP_MENU}           xpath=//*[@id="header"]
${HOME_TITLE}              Automation Exercise 
${HOME_MENU_PRODUTO}       xpath=//a[@href="/products"]
${HOME_FIELD_PESQUISAR}    id=search_product 
${HOME_BOTAO_PESQUISAR}    id=submit_search 
${ELEMENTO_DO_CARD}        xpath=//div[@class= "single-products"]
${HOME_BOTAO_ADDCART}      xpath=//div[@class="overlay-content"]//a[@data-product-id="1"]
${HOME_VIEW_CART}          xpath=//u[contains(text(),"View Cart")]
${HOME_BOTAO_CHECKOUT}     xpath=//a[contains(text(),"Proceed To Checkout")]
${HOME_BOTAO_ONCART}       xpath=//button[@data-dismiss="modal"] 
${HOME_MENU_SIGNUP_LOGIN}  xpath=//a[@href="/login"]

*** Keywords ***
### Ações

Adicionar o produto "${PRODUTO}" no carrinho
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão pesquisar   
    Clicar no botão "Add to Cart" do produto
    Clicar no botão "Proceed to checkout"

Acessar Página home do site  
    Go To                           ${HOME_URL}
    Wait Until Element Is Visible   ${HOME_TOP_MENU} 
    Title Should Be                 ${HOME_TITLE}

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Wait Until Element Is Visible    ${HOME_MENU_PRODUTO}
    Click Element                    ${HOME_MENU_PRODUTO}
    Tratar anúncio Google Vignette
    Wait Until Element Is Visible    ${HOME_FIELD_PESQUISAR}
    Input Text                       ${HOME_FIELD_PESQUISAR}      ${PRODUTO}

Clicar no botão pesquisar
    Click Element                    ${HOME_BOTAO_PESQUISAR}

Clicar no botão "Add to Cart" do produto
    Mouse Over                       ${ELEMENTO_DO_CARD}
    Verificar anúncio inferior
    Wait Until Element Is Visible    ${HOME_BOTAO_ADDCART}
# Clique via JavaScript devido ao anúncio inferior interceptar o clique do Selenium    
    Execute Javascript
    ...   document.querySelector('.overlay-content a[data-product-id="1"]').click() 
    Wait Until Element Is Visible    ${HOME_VIEW_CART}
    Click Element                    ${HOME_VIEW_CART} 

Clicar no botão "Proceed to checkout"
    Wait Until Element Is Visible    ${HOME_BOTAO_CHECKOUT}
    Click Element                    ${HOME_BOTAO_CHECKOUT}
    Wait Until Element Is Visible    ${HOME_BOTAO_ONCART}
    Click Element                    ${HOME_BOTAO_ONCART}   


Tratar anúncio Google Vignette
    ${tem_anuncio}=    Run Keyword And Return Status    Location Should Contain    \#google_vignette
    
    IF    ${tem_anuncio}
        Go To    https://automationexercise.com/products
    END

Verificar anúncio inferior    
    ${tem_iframe}=    Run Keyword And Return Status
     ...    Page Should Contain Element    xpath=//iframe[@title="Advertisement"]
     Log    ${tem_iframe}

# Este trecho não está sendo utilizado , pois não deu certo para o tipo de anúncio na página, mesmo rolando a página o anúncio continua fixo na tela.
#    IF     ${tem_iframe}
#        Execute JavaScript    window.scrollBy(0, -200)
#    END

Clicar em "Signup/Login"   
    Wait Until Element Is Visible    ${HOME_MENU_SIGNUP_LOGIN}
    Click Element                    ${HOME_MENU_SIGNUP_LOGIN} 
  