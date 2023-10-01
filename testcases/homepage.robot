*** Settings ***
Resource    ../resource_files/GlobalLibrary.resource
Library     SeleniumLibrary


Suite Setup     Initialise the browser
Suite Teardown      close browser


*** Test Cases ***

user should login irctc portal
    Wait Until Element Is Enabled    ${login_button}  
    Click Element    ${login_button}  
    Wait Until Element Is Enabled    ${user_name}  
    Input Text    ${user_name}    davshakya
    Input Text    ${password}      Ranjana21#
    Enter captcha text
    Sleep    2
    




    


    
    
     



