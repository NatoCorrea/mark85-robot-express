*** Settings ***
Documentation        Cenários de testes de atualização de tarefas

Resource             ../../resources/base.resource

Test Setup           Start session
Test Teardown        Take Screenshot

*** Test Cases ***
Deve poder apagar uma tarefa indesejada
    
    ${data}    Get fixture    tasks    delete

    #Reiniciar a massa de teste do usuário
    Reset user from data base    ${data}[user]

    #Cadastrar tarefa
    Create a new task from API    ${data}
    
    #Fazer login do usuário
    Do login    ${data}[user]

    Request removal           ${data}[task][name]
    Task should not exist     ${data}[task][name]

    

