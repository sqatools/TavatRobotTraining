*** Settings ***
Library    SeleniumLibrary
Resource    locators.robot
Variables    Python_Variables.py


# Suite setup execute only once before all test cases excution.
Suite Setup       Open browser and launch url     ${url}      ${browser}
Suite Teardown     Close All Browser On the System

Test Timeout     20s




*** Variables ***
${url}            https://www.google.co.in
${browser}        chrome
${Search_data}    Selenium


*** Test Cases ***

Launch Browser and Search
    [Tags]      SMOKE
    [Timeout]    1s
    [Setup]       Log    Test Setup Execution started
    wait until element is visible     ${google_search_textbox}       10s
    input text     ${google_search_textbox}      ${Search_data}
    wait until element is visible     ${google_search_button}      10s
    click element    ${google_search_button}
    [Teardown]      Log      Cleaup of test data started.

Navigate to Selenium Smoke Test Cases
    [Tags]    SMOKE
    [Setup]     Open browser and launch url     ${smoke_url}      ${browser}
    wait until element is visible      ${email_id}     10s
    input text    ${email_id}       testuser@gmail.com
    input text    ${password_id}     P@ssw0rdpasss2worfd
    click element    ${login_button_name}

Look for the element Regression One
    [Tags]   REGRESSION
    Log     Selenium Data

Navigate to Selenium Website Regression Two
    [Tags]    REGRESSION      SANITY
    [Documentation]        REGRESSION Documentation
    Log     Selenium

Look for the element Sanity One
    [Tags]    SANITY
    Log     Selenium Data

Navigate to Selenium Website Sanity Two
    [Tags]    SANITY    robot:skip
    Log     Selenium

Look for the element Sanity Three
    [Tags]    SANITY
    Log     Selenium Data


*** Keywords ***

Open browser and launch url
    [Documentation]    This keyword will open browser and launch url
    [Arguments]     ${server_url}     ${test_browser}
    open browser   ${server_url}     ${test_browser}
    maximize browser window


Close All Browser On the System
    [Documentation]     Close all opened browser
    close all browsers
