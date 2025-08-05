*** Settings ***

Documentation        Ações e elementos do componente de notificações

Resource        ../../base.resource

*** Keywords ***

Notice should be 
    [Arguments]    ${expected_text}

    ${element}    Set Variable    css=.notice p

    #Verificando que teste passou
    Wait For Elements State    ${element}    visible    5
    Get Text    ${element}    equal    ${expected_text}
