*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}            https://www.google.co.in
${browser}        chrome
${Search_data}    Selenium Learning


*** Test Cases ***
Launch Browser and Search
    Open browser and launch url     ${url}      ${browser}
    maximize browser window
    input text      name=q      ${Search_data}
    wait until element is visible     name=btnK      10s
    click element    name=btnK
    sleep    5
    close browser

*** Keywords ***

Open browser and launch url
    [Documentation]    This keyword will open browser and launch url
    [Arguments]     ${server_url}     ${test_browser}
    open browser   ${server_url}     ${test_browser}
