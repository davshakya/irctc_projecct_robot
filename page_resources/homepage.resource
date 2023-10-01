*** Settings ***
Library    Screenshot
Library    Process
Resource   ../resource_files/GlobalLibrary.resource
Library    RequestsLibrary
Library    OperatingSystem

Library    SeleniumLibrary
Library    RequestsLibrary
Library    OperatingSystem


*** Variables ***

${login_button}    //a[contains(text(),'LOGIN')]
${user_name}    //input[@placeholder='User Name']
${password}        //input[@placeholder='Password']
${captcha_image}        //img[@class='captcha-img']
${captcha_input_box}      //input[@id='captcha']
${sign_in_button}    //button[normalize-space()='SIGN IN']
${input_from_city_name_1}    (//div//ul/li/span[contains(text(),'- {}')])[1]
${input_from_city_name_2}    (//div//ul/li/span[contains(text(),'- {}')])[2]
${select_first_city_code}        //span[contains(text(),'-- Stations --')]/parent::li/following-sibling::li 
${select_city_from_station_section}     (//div/ul[@id='pr_id_2_list']/li/span)[1]
${input_to_city_name}    (//input[contains(@class,'ui-inputtext')])[2]
${select_to_city_name}     //span[contains(text(),'-- Stations --')]/parent::li/following-sibling::li
${invalid_captcha_text}    //div[contains(text(),'Invalid Captcha')]

*** Keywords ***


get captcha text from image
    ${image_element} =    Get WebElement    ${captcha_image}
    ${text}=        get captcha text    ${image_element}
    [Return]      ${text}  

Enter captcha text
    ${get_text_captcha}=    get captcha text from image
    Log To Console     ${get_text_captcha}
    Input Text    ${captcha_input_box}     ${get_text_captcha}    
    Click Element    ${sign_in_button}
    Sleep    5
    ${isExist}=    Run Keyword And Return Status    Element Should Be Enabled      ${invalid_captcha_text}
    WHILE    ${isExist}==$True
        ${get_text_captcha}=    get captcha text from image
        Log To Console     ${get_text_captcha}
        Input Text    ${captcha_input_box}     ${get_text_captcha}    
        Click Element    ${sign_in_button}
        Sleep    2
        ${exist}    Return From Keyword    Element Should Be Visible    ${invalid_captcha_text} 
    END




Enter journy details to in search train
    Wait Until Element Is Enabled    ${input_from_city_name}
    Input Text    ${input_from_city_name}    Orai
    Sleep    5
    ${isExist}=    Run Keyword And Return Status    Element Should Be Enabled      ${invalid_captcha_text}
    Click Element    ${select_from_city_name}
    Sleep    2


    Wait Until Element Is Enabled    ${input_to_city_name}
    Input Text    ${input_to_city_name}    Lucknow nr
    Sleep    5
    Click Element    ${select_from_city_name}