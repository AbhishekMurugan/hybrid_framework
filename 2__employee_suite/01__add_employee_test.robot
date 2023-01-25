*** Settings ***
Documentation       this file contains test casses related to invalid login

Resource    ../Resource/base/common_functionalities.resource
Library     DataDriver        file=../test_data/orange_data.xlsx       sheet_name=Add Valid Employee Test


Test Setup      Launch Browser And Navigate TO Url
Test Teardown       Close Browser
Test Template       Add Valid Employee Template

*** Test Cases ***
TC1

*** Keywords ***
Add Valid Employee Template
    [Arguments]     ${username}     ${password}     ${firstname}    ${middlename}   ${lastname}     ${expected_header}      ${expected_firstname}
    Input Text    name=username    ${username}
    Input Password    name=password     ${password}
    Click Element    xpath=//button[@class='oxd-button oxd-button--medium oxd-button--main orangehrm-login-button']
    Click Element    xpath=//span[contains(normalize-space(),'PIM')]
    Click Element    link=Add Employee
    Input Text    name=firstName    ${firstname}
    Input Text    name=middleName    ${middlename}
    Input Text    name=lastName    ${lastname}
    Click Element    xpath=//button[contains(normalize-space(),'Save')]
    Wait Until Page Contains    ${expected_header}
    Element Should Contain    xpath=//h6[contains(normalize-space(),'${firstname}')]      ${expected_header}
    Sleep    5s
    Element Attribute Value Should Be    name:firstName    value    ${expected_firstname}


    
