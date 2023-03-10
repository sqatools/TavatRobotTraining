*** Settings ***
Library    SeleniumLibrary
Resource    locators.robot



# Suite setup execute only once before all test cases excution.
Suite Setup       Open browser and launch url     ${url}      ${browser}
Suite Teardown     Close All Browser On the System


# Test setup execute before and after execution of each test case.
#Test Setup        Open browser and launch url     ${url}      ${browser}
#Test Teardown     Close All Browser On the System




*** Variables ***
${url}            https://www.google.co.in
${browser}        chrome
${Search_data}    Selenium


*** Test Cases ***
Launch Browser and Search
    [Setup]       Log    Test Setup Execution started
    wait until element is visible     ${google_search_textbox}       10s
    input text     ${google_search_textbox}      ${Search_data}
    wait until element is visible     ${google_search_button}      10s
    click element    ${google_search_button}
    [Teardown]      Log      Cleaup of test data started.

Navigate to Selenium Website
    Log     Selenium

Look for the element
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
