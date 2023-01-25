*** Settings ***
Documentation        this resource file contains browser configuation
...                  and resuable scripts


Library     SeleniumLibrary


*** Variables ***
${BROWSER_NAME}     chrome
${URL}  https://opensource-demo.orangehrmlive.com/

*** Keywords ***
Launch Browser And Navigate TO Url
    Open Browser        browser=${BROWSER_NAME}
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=${URl}


Capture Screenshots And Close Browser
    Run Keyword And Ignore Error    Capture Page Screenshot
    Close Browser