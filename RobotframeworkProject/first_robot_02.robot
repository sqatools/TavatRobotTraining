*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
#${ExecutablePath}     C:/Users/vikram.nadella/Videos/Driver/chromedriver_110.exe
${Browser}    Chrome
${URL_1}   https://automationbysqatools.blogspot.com/p/manual-testing.html
${FilePath}    Sample.txt

*** Test Cases ***
Test Switch Between Browsers
    @{Links}    create list
    launch browser    ${URL_1}    ${Browser}
    log to console    get title
    
    @{Links}    get all links
    create file    ${FilePath}
    append to file    ${FilePath}    @{Links}

    close browser

*** Keywords ***
Launch Browser
    [Arguments]    ${url}    ${browser}
    open browser    ${url}    ${browser}
