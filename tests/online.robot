*** Settings ***

Documentation        Online

Resource    ../resources/base.resource

*** Test Cases ***
Webapp deve estar Online
   
    Start session
    Get Title    equal    Mark85 by QAx  

