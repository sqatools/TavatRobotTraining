*** Settings ***
Library    SeleniumLibrary
Resource    locators.robot

*** Variables ***
${url}            https://www.google.co.in
${browser}        chrome
${Search_data}    Selenium Learning


*** Test Cases ***
Launch Browser and Search
    Open browser and launch url     ${url}      ${browser}
    maximize browser window
    input text     ${google_search_textbox}      ${Search_data}
    wait until element is visible     ${google_search_button}      10s
    click element    ${google_search_button}
    sleep    5
    close browser

*** Keywords ***

Open browser and launch url
    [Documentation]    This keyword will open browser and launch url
    [Arguments]     ${server_url}     ${test_browser}
    open browser   ${server_url}     ${test_browser}
