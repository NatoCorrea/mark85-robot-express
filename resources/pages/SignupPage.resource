*** Settings ***

Documentation        Elementos e ações da página de cadastro

Resource        ../base.resource

*** Keywords ***
Go to signup page
    Go To    ${BASE_URL}/signup
    
    ${element}    Set Variable    css=h1

    #Checkpoints
    Wait For Elements State    ${element}    visible    5
    Get Text                   ${element}    equal    Faça seu cadastro

 Submit signup page
    [Arguments]    ${user}
    #Preenchendo formulario e enviando
    Fill Text    id=name        ${user}[name]
    Fill Text    id=email       ${user}[email]
    Fill Text    id=password    ${user}[password]

    Click        id=buttonSignup





