*** Settings ***
Library    SeleniumLibrary
Resource    locators.robot
Variables    Python_Variables.py


# Suite setup execute only once before all test cases excution.
Suite Setup       Open browser and launch url     ${url}      ${browser}
Suite Teardown     Close All Browser On the System

#Test Timeout     20s




*** Variables ***
${url}            https://www.globalsqa.com/demo-site/frames-and-windows/#iFrame
${browser}        chrome
${Search_data}    Selenium

${dropdown_locator}         xpath=//span[@id='current_filter']
${automation_dropdown_Value}      xpath=//div[text()='Automation']
${frame_locator}            xpath=//iframe[@name='globalSqa']


*** Test Cases ***

Launch Browser and Search
    wait until element is visible      ${frame_locator}      10s
    select frame      ${frame_locator}
    wait until element is visible       ${dropdown_locator}       10s
    click element        ${dropdown_locator}
    wait until element is visible       ${automation_dropdown_Value}       10s
    capture page screenshot
    click element        ${automation_dropdown_Value}
    sleep      5s
    unselect frame
    ${elements}=     get webelements      //div[@id='menu']//*[text()='CheatSheets']
    FOR   ${elem}    IN    @{elements}
           ${text_Value}=     get text     ${elem}
           click element      ${elem}
           Log     ${text_Value}
    END


*** Keywords ***

Open browser and launch url
    [Documentation]    This keyword will open browser and launch url
    [Arguments]     ${server_url}     ${test_browser}
    open browser   ${server_url}     ${test_browser}
    maximize browser window


Close All Browser On the System
    [Documentation]     Close all opened browser
    close all browsers
