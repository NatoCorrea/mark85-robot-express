*** Settings ***
Documentation        Elementos e ações da página de login

Resource        ../base.resource

*** Keywords ***
Check the login page
    ${element}    Set Variable    css=form > h1        
        
    Wait For Elements State    ${element}    visible    3
    Get Text    ${element}    equal    Faça seu login

Submit login form
    [Arguments]    ${user}

    Fill Text    css=input[placeholder$=mail]        ${user}[email]
    Fill Text    css=input[placeholder=Senha]     ${user}[password]

    # Click        xpath=//button[text()="Entrar"]
    Click        css=button >> text=Entrar


