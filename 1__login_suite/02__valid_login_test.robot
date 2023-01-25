*** Settings ***
Documentation       this file contains test casses related to invalid login

Resource    ../Resource/base/common_functionalities.resource

Library     DataDriver        file=../test_data/orange_data.xlsx       sheet_name=valid_Login_Test

Test Setup      Launch Browser And Navigate TO Url
Test Teardown       Close Browser
Test Template       valid Login Template

*** Test Cases ***
Valid Login Template      admin       admin123        Dashboard
Valid Login Template      admin       admin123        Dashboard

*** Keywords ***
Valid Login Template
    [Arguments]     ${username}     ${password}     ${expected_header}
    Input Text    name:username    ${username}
    Input Text    name:password    ${password}
    Click Element   xpath=//button[@class="oxd-button oxd-button--medium oxd-button--main orangehrm-login-button" ]
    Element Should Contain    xpath=//h6[contains(@class,'oxd-text')]     ${expected_header}


