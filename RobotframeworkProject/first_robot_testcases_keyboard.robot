*** Settings ***
Library    SeleniumLibrary
Resource    locators.robot
Variables    Python_Variables.py


# Suite setup execute only once before all test cases excution.
Suite Setup       Open browser and launch url     ${url}      ${browser}
Suite Teardown     Close All Browser On the System

#Test Timeout     20s




*** Variables ***
${url}            https://www.google.co.in
${browser}        chrome
${Search_data}    Selenium


*** Test Cases ***

Launch Browser and Search
    [Tags]      SMOKE
    [Setup]       Log    Test Setup Execution started
    wait until element is visible     ${google_search_textbox}       10s
    input text     ${google_search_textbox}      ${Search_data}
    sleep    2s
    #wait until element is visible     ${google_search_button}      10s
    #click element    ${google_search_button}
    #press keys      ${google_search_button}    ENTER
    press keys      ${None}      ENTER
    sleep    10s
    press keys    ${None}      CTRL+A
    sleep    10s
    press keys    ${None}      F12
    sleep    10s

*** Keywords ***

Open browser and launch url
    [Documentation]    This keyword will open browser and launch url
    [Arguments]     ${server_url}     ${test_browser}
    open browser   ${server_url}     ${test_browser}
    maximize browser window


Close All Browser On the System
    [Documentation]     Close all opened browser
    close all browsers
