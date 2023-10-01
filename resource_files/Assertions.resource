*** Settings ***
Resource    GlobalLibrary.resource

*** Keywords ***

Element Should be Visible
    [Arguments]    ${locator}    ${msg}
    Wait Until Keyword Succeeds    30x    1s    SeleniumLibrary.Element Should Be Visible    ${locator}
    ${status}   Run Keyword And Return Status    SeleniumLibrary.Element Should Be Visible    ${locator}
    [Return]    ${status}
     
Element Should be InVisible
    [Arguments]    ${locator}    ${msg}
    Wait Until Keyword Succeeds    30x    1s    SeleniumLibrary.Element Should Not Be Visible   ${locator}
    ${status}   Run Keyword And Return Status    SeleniumLibrary.Element Should Not Be Visible    ${locator}
    Should Be True    ${status}==${True}

Element Is Visible
    [Arguments]    ${element}    ${msg}
    ${status}   Run Keyword And Return Status    SeleniumLibrary.Element Should Be Visible    ${element}
    [Return]    ${status}

Element Is Selected
    [Arguments]    ${element}    ${msg}
    ${is_selected}    Run Keyword And Return Status    Checkbox Should Be Selected    ${element}
    [Return]    ${is_selected}

Verify Greater Than
    [Arguments]    ${value1}    ${value2}
    Should Be True    ${value1}>${value2}    ${value1} is greater than ${value2}

Element Should Be Clickable
    [Arguments]    ${element}    ${msg}
    ${status}=    Run Keyword And Return Status    Wait Until Keyword Succeeds    45x    1s    Click Element    ${element}
    Run Keyword If    'False'=='${status}'    Fail   ${msg}     

List Should Not Be Empty
    [Arguments]    ${list_loc}    ${msg}
    ${list}    Get WebElements    ${list_loc}
    ${length}    Get Length    ${list}
    Should Be True    ${length}>0    ${msg}
   
Element Is Disabled
    [Arguments]    ${locator}    ${msg}
    ${true}    Run Keyword And Return Status    Element Should Be Disabled    ${locator}
    Should Be True    ${true}    ${msg}

Element Is Not Disabled
    [Arguments]    ${locator}    ${msg}
    ${false}    Run Keyword And Return Status    Element Should Be Disabled    ${locator}
    Should Not Be True    ${false}    ${msg}     

Is Element Visible
    [Arguments]    ${locator}    ${msg}
    ${is_visible}=    Element Is Visible    ${locator}    "element is not visible"
    [Return]    ${is_visible}


Check Difference is in +-1 Range
    [Arguments]    ${value1}    ${value2}    ${lower_range}=-1    ${upper_range}=1
    ${difference}       Evaluate        ${value1}-${value2}
    IF      ${lower_range} <= ${difference} <= ${upper_range}
        Should be True      ${True}         ${value1} is not same as : ${value2}
    ELSE 
        Should Not Be True        ${True}       ${value1} is not same as : ${value2}
    END


Check Difference is in Range
    [Arguments]    ${list}
    ${cnt}=  Get length    ${list}  
    ${cnt}=    Evaluate    ${cnt} - 1 
    FOR    ${i}    IN RANGE    ${cnt}
       # ${i} = Evaluate ${i} + 1
        ${value1} =	Get From List	${list}	${i}	
        ${value2} =	Get From List	${list}	${i+1}
        ${difference}       Evaluate        ${value1}-${value2}
        IF      -2 <= ${difference} <= 2
            Should be True      ${True}         ${value1} is not same as : ${value2} with difference of : ${difference}
        ELSE 
            Should Not Be True        ${True}       ${value1} is not same as : ${value2}
        END
    END