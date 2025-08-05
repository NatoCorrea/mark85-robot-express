*** Settings ***
Documentation        Cenários de login de usuário

Library         Collections
Resource        ../resources/base.resource

Test Setup        Start session
Test Teardown        Take Screenshot

*** Test Cases ***
Deve poder logar com um usuário pré-cadastrado
    ${user}        Create Dictionary
    ...    name=Renato Correa
    ...    email=renato@hotmail.com
    ...    password=pwd123

    Check the login page

    Remove user from database    ${user}[email]
    Insert user from database    ${user}
    
    Submit login form           ${user}
    User should be logged in    ${user}[name]

Não deve logar com senha com senha inválida
    ${user}        Create Dictionary
    ...    name=Steve Win
    ...    email=win@apple.com
    ...    password=123456

    Check the login page

    Remove user from database    ${user}[email]
    Insert user from database    ${user}
    
    # ALterando a senha atraves da library collections
    Set To Dictionary    ${user}    password=abc123
    
    Submit login form           ${user}
    Notice should be    Ocorreu um erro ao fazer login, verifique suas credenciais.           






