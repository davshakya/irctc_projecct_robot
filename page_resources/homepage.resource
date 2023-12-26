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
${train_refresh}        //div[@class='tbis-div']//*[contains(text(),'{}')]/parent::div/parent::div/parent::div/div[5]//td[1]//span
${seat_status}        //div[@class='tbis-div']//*[contains(text(),'{}')]/parent::div/parent::div/parent::div/div[7]/div/div[3]//strong[contains(text(),'CURR_AVBL-') or contains(text(),'AVAILABLE-')]
${book_buttonloc}    //div[@class='tbis-div']//*[contains(text(),'{}')]/ancestor::app-train-avl-enq/div[2]//button
${not_available}    //div[@class='tbis-div']//*[contains(text(),'{}')]/ancestor::app-train-avl-enq/div/div[7]//div[3]//td//strong[contains(text(),'NOT AVAILABLE') or contains(text(),'TRAIN DEPARTED')]
${available_seat}        (//div[@class='tbis-div']//*[contains(text(),'{}')]/ancestor::app-train-avl-enq/div/div[7]//div[3]//td//strong[contains(text(),'AVAILABLE-')])[1]
${seat_select_button}        //div[@class='tbis-div']//*[contains(text(),'{}')]/ancestor::app-train-avl-enq/div/div[7]//li//strong/span[contains(text(),'{}')][1]
${show_available_trains_button}        //span[contains(text(),'Show Available Trains')]
${yes_button_booking}    //button/span[contains(text(),'Yes')]
${passenger_details_page}        //span[contains(text(),'Passenger Details')]


*** Keywords ***


get captcha text from image
    Wait Until Element Is Visible    ${captcha_image}    120
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

User should book ticket
    Wait Until Element Is Visible    ${show_available_trains_button}     120
    ${get_seat_cetagory}        seat_cetagory
    ${get_train_number}        train_number
    Click Element    ${show_available_trains_button} 

    ${refresh_button_xpath}    Format String     ${train_refresh}    ${get_train_number}
    Scroll Element Into View    ${refresh_button_xpath}      
    Click Element    ${refresh_button_xpath}
    ${select_seat_cetagory}    Format String    ${seat_select_button}     ${get_train_number}        ${get_seat_cetagory}        
    Wait Until Element Is Visible    ${select_seat_cetagory}      60
    Scroll Element Into View    ${select_seat_cetagory}      
    Click Element    ${select_seat_cetagory}
    ${get_seat_vacant_status}    Format String    ${not_available}     ${get_train_number}
    ${isExist}=    Run Keyword And Return Status    Element Should Be Enabled      ${get_seat_vacant_status}
    IF    ${isExist} == $True
        Pass Execution    No ticket booked, Seat not available     
    END
    ${select_available_seat}    Format String    ${available_seat}     ${get_train_number}  
    Wait Until Element Is Visible    ${select_available_seat}      60
    Click Element    ${select_available_seat}
    ${get_book_buttonloc}    Format String     ${book_buttonloc}    ${get_train_number}
    Wait Until Element Is Visible    ${get_book_buttonloc}      60
    Click Element    ${get_book_buttonloc}  
    Sleep    5   
    ${isExist}=    Run Keyword And Return Status    Element Should Be Enabled      ${yes_button_booking} 
    IF   ${isExist} == $True
        Click Element    ${yes_button_booking}     
    END
    Wait Until Element Is Visible    ${passenger_details_page}      60


Login irctc portal
    Wait Until Element Is Enabled    ${login_button}  
    Click Element    ${login_button}  
    Wait Until Element Is Enabled    ${user_name}  
    Input Text    ${user_name}    davshakya
    Input Text    ${password}      Ranjana21#
    # Enter captcha text

User should search train
    Sleep    2
    Enter journey details to search train
    Set date of journey
    Click Element    ${search_button_loc} 



    
    
    
    