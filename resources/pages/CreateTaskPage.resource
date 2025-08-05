*** Settings ***

Documentation        Ações e elementos da página de cadastro de tarefas

Resource        ../base.resource

*** Keywords ***

Submit task form
    [Arguments]    ${task}
    Fill Text    css=input[placeholder="Nome da tarefa"]    ${task}[name]
    # Fill Text    css=input[placeholder$=tarefa]    ${task}[name] $ = ultima palavra
    # Fill Text    css=input[placeholder^="Nome"]    ${task}[name] ^ = primeira palavra
    # Fill Text    css=input[placeholder*="da"]    ${task}[name] * = contem a palavra
    # Fill Text    css=input[placeholder*="até"]    ${task}[tasks]

    ${tags_element}    Set Variable    css=input[name=tags] 
      
    FOR    ${tag}    IN    @{task}[tags]
        Fill Text     ${tags_element}    ${tag}
        Sleep         1
        Press Keys    ${tags_element}    Enter
    END

    Click    css=button[type="submit"]
    # Click    css=button >> text=Cadastrar

    