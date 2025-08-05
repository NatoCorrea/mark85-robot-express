*** Settings ***

Documentation        Cenários de testes do cadastro de usuários

Resource        ../resources/base.resource

Test Setup        Start session
Test Teardown     Take Screenshot

*** Test Cases ***
Deve poder cadastrar um novo usuário

    ${user}    Create Dictionary    
    ...    name=Renato Correa
    ...    email=renato@hotmail.com
    ...    password=pwd123
 
    Remove User From Database    ${user}[email]
    #Acessando a página de cadastro
    Go to signup page
    #Preenchendo formulario e enviando
    Submit signup page    ${user}
    #Valindando mensagem de retorno
    Notice should be    Boas vindas ao Mark85, o seu gerenciador de tarefas.    

Não deve permitir um cadastro com email duplicado
    [Tags]    dup

    ${user}    Create Dictionary    
    ...    name=Correa Renato    
    ...    email=correa@hotmail.com    
    ...    password=pwd123    
    
    Remove user from database    ${user}[email]
    Insert user from database    ${user}

    Go to signup page
    Submit signup page    ${user}
    Notice should be    Oops! Já existe uma conta com o e-mail informado.  

Campos obrigatórios
    [Tags]    required
    ${user}    Create Dictionary
    ...    name=${EMPTY}
    ...    email=${EMPTY}
    ...    password=${EMPTY}
    
    Go to signup page
    Submit signup page    ${user}

    Alert should be    Informe seu nome completo
    Alert should be    Informe seu e-email
    Alert should be    Informe uma senha com pelo menos 6 digitos
       
Não deve cadastrar com email incorreto
    [Tags]    inv_email

    ${user}    Create Dictionary
    ...    name=Renato Correa
    ...    email=renato.com.br
    ...    password=pwd123
    
    Go to signup page
    Submit signup page    ${user}

    Alert should be    Digite um e-mail válido

Não deve cadastrar com senha que tenha menos que 6 digitos
    [Tags]    temp
    @{password_list}    Create List    1    12    123    1234    12345

    FOR    ${password}    IN    @{password_list}
    
        ${user}    Create Dictionary
    ...    name=Jose Peixoto
    ...    email=testesenha@msn.com
    ...    password=${password}
    
        Go to signup page
        Submit signup page    ${user}

        Alert should be    Informe uma senha com pelo menos 6 digitos
        
    END

    









    


    
    

