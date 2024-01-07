*** Settings ***
Resource            ../resource_files/GlobalLibrary.resource
Library             SeleniumLibrary

Suite Setup         Initialise the browser
Suite Teardown      close browser


*** Test Cases ***
User should login to irctc portal
    Login irctc portal
    # User should search train
    # User should book ticket
    # User should fill passenger details
    # User should do payment successfully

