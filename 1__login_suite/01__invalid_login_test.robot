*** Settings ***
Documentation       this file contains test casses related to invalid login

Resource    ../Resource/base/common_functionalities.resource

Library     DataDriver        file=../test_data/orange_data.xlsx       sheet_name=Invalid_Login_Test
Test Setup      Launch Browser And Navigate TO Url
Test Teardown       Close Browser

Test Template       Invalid Login Template



*** Test Cases ***
TC1

*** Keywords ***
Invalid Login Template
    [Arguments]     ${username}     ${password}     ${expected_error}
    Input Text    name:username    ${username}
    Input Text    name:password    ${password}
    Click Element   xpath=//button[@class="oxd-button oxd-button--medium oxd-button--main orangehrm-login-button" ]
    Element Should Contain    xpath=//p[contains(@class,'oxd-alert')]    Invalid credentials