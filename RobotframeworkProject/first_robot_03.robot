*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ExecutablePath}     C:/Users/vikram.nadella/Driver/chromedriver_110.exe
${Browser}    Chrome
${URL_1}    https://google.co.in/
${URL_2}    http://microsoft.com/

*** Test Cases ***
Test Switch Between Browsers
    launch browser    ${URL_1}    ${Browser}
    launch browser    ${URL_2}    ${Browser}

    switch browser    1
    ${title1}=      get title
    log to console    ${title1}

    switch browser    2
    ${title2}=      get title
    log to console    ${title2}

    close all browsers

*** Keywords ***
Launch Browser
    [Arguments]    ${url}    ${browser}
    open browser    ${url}    ${browser}
