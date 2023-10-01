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
${select_dropdown_city_name_1}    (//div//ul/li/span[contains(text(),'{} -')])[1]
${select_dropdown_city_name_2}    (//div//ul/li/span[contains(text(),'{} -')])[2]

${enter_start_city_code}        (//input[contains(@class,'ui-inputtext')])[1]
${enter_destination_city_code}        (//input[contains(@class,'ui-inputtext')])[2] 
${open_calendar}    (//input[contains(@class,'ui-inputtext')])[3]    
${select_city_from_station_section}    
${select_to_city_name}     //span[contains(text(),'-- Stations --')]/parent::li/following-sibling::li
${invalid_captcha_text}    //div[contains(text(),'Invalid Captcha')]
${select_date_of_journey}    (//span/following::td[normalize-space()='{}'])[1]
${month_name_loc}     //span[normalize-space()='{}']
${search_button_loc}        //button[contains(text(),'Search')]
${date_formate_loc}    //*[@dateformat='dd/mm/yy']/span/input



*** Keywords ***


get captcha text from image
    Wait Until Element Is Visible    ${captcha_image}
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
        Sleep    5
        ${isExist}    Return From Keyword    Element Should Be Visible    ${invalid_captcha_text} 
    END




Enter journey details to search train
    ${start_city}=    get_from_city
    ${destination_city}     get_to_city   

    Input Text    ${enter_start_city_code}    ${start_city}  
    Sleep    5
    select city from dropdown    ${start_city} 

    Input Text    ${enter_destination_city_code}    ${destination_city}  
    Sleep    5
    select city from dropdown    ${destination_city} 



select city from dropdown
    [Arguments]     ${city_name}
    ${check_city_name}    Format String    ${select_dropdown_city_name_1}        ${city_name}    
    ${isExist}=    Run Keyword And Return Status    Element Should Be Enabled      ${check_city_name}
    IF    ${isExist} == $True
        Click Element    ${check_city_name}
    ELSE
        ${get_city_name}    Format String    ${select_dropdown_city_name_2}        ${city_name}    
        Click Element    ${get_city_name}   
    END


Set date of journey
    Click Element    ${open_calendar} 
    ${get_date}=    journey_date
    Input Text    ${date_formate_loc}    ${get_date}
    ${get_only_date}    Get Substring	${get_date}    0		2     
    ${get_xpath_for_date}    Format String    ${select_date_of_journey}    ${get_only_date} 
    Click Element    ${get_xpath_for_date}   