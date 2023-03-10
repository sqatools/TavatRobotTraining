*** Settings ***
# Patbot libary we can use to run test cases parallel
# pip install -U robotframework-pabot

Library    SeleniumLibrary
Resource    locators.robot
Library     Collections
Library     OperatingSystem


# Suite setup execute only once before all test cases excution.
Test Setup       Open browser and launch url     ${url}      ${browser}
Test Teardown     Close All Browser On the System

#Test Timeout     20s

*** Variables ***
${url}            https://automationbysqatools.blogspot.com/2021/05/dummy-website.html
${browser}        chrome
${rbutton1}       //input[@value='radio_123']
${rbutton2}       //input[@value='radio_345']
${rbutton3}       //input[@value='radio_678']
${rbutton4}       (//input[@value='radio_558'])[1]
${rbutton5}       (//input[@value='radio_558'])[2]

@{RadioButton}      ${rbutton1}    ${rbutton2}    ${rbutton3}        ${rbutton4}      ${rbutton5}
@{City_List}        Mumbai     Pune     Indore     Kolkata     Hyderabad     Orangabad      Delhi

${InputCity}        Indore1
${linksfile}        links_data.txt
${alert_msg}         Hello friends, this is message.
${confirm_msg}       Press a button!
${Accept_confirm}    You pressed OK!!
${Prompt_Confirm}    Hello SQA Tools! How are you today?

*** Test Cases ***


#Scroll to the element and verify
#     go to      https://automationbysqatools.blogspot.com/p/python.html
#     scroll element into view       xpath=//a[text()='onlinetraining']
#     sleep    2s
#     page should contain element    xpath=//a[text()='onlinetraining']
#
#Handle Browser Prompt Alert
#    [Documentation]  This test cases is for handling the alerts
#    ...     we will excute script for the all the alerts
#    go to      https://automationbysqatools.blogspot.com/2020/08/alerts.html
#    scroll element into view       id=promptbtn
#    click element      id=promptbtn
#    sleep    2s
#    input text into alert       SQA Tools
#    sleep    2s
#    #should be equal      ${message}      ${confirm_msg}
#    ${ui_confirm}=     get text     prompt
#    Log     ${ui_confirm}
#    capture page screenshot    prompt_alert.png
#    should be equal      ${ui_confirm}    ${Prompt_Confirm}
#    sleep    2s

Handle Browser Confirm Alerts
    [Documentation]  This test cases is for handling the alerts
    ...     we will excute script for the all the alerts
    go to      https://automationbysqatools.blogspot.com/2020/08/alerts.html
    click element      id=button
    sleep    2s
    ${message}=     Handle Alert
    Log      ${message}
    should be equal      ${message}      ${confirm_msg}
    ${ui_confirm}=     get text     demo
    Log     ${ui_confirm}
    capture page screenshot    confrim_alert.png
    should be equal      ${ui_confirm}     ${Accept_confirm}
    sleep    2s



#Handle Browser Alerts
#    [Documentation]  This test cases is for handling the alerts
#    ...     we will excute script for the all the alerts
#    go to      https://automationbysqatools.blogspot.com/2020/08/alerts.html
#    click element      id=btnShowMsg
#    sleep    2s
#    ${message}=     Handle Alert
#    Log      ${message}
#    should be equal      ${message}      ${alert_msg}
#    sleep    2s
#

#Switch To Multiple Browser Windows
#     go to      https://automationbysqatools.blogspot.com/p/manual-testing.html
#     click element       //a[text()='Software Testing Methods ']
#     ${window_list}=     get window handles
#     Log    ${window_list}
#     switch window    ${window_list}[1]
#     sleep    5s
#     page should contain        Software Testing Methods
#     switch window    ${window_list}[0]
#     wait until element is visible       //div[@class='widget-content']//a[text()='Home']
#     click element       //div[@class='widget-content']//a[text()='Home']
#     sleep    5s
#     page should contain         Recent Updates
#     switch window    ${window_list}[1]
#     input text       name=q         Python
#     wait until element is visible     //input[@value='Search']
#     click element      //input[@value='Search']
#     sleep    2s



#Get All Link From Target Page.
#    go to      https://automationbysqatools.blogspot.com/p/manual-testing.html
#    ${all_link_element}=      Get WebElements      //div[@id='manual']//a
#    Create File      ${CURDIR}/${linksfile}
#    FOR      ${elem}      IN     @{all_link_element}
#        ${link}=      get element attribute      ${elem}       href
#        Log      ${link}
#        append to file       ${CURDIR}/${linksfile}       ${link}\n
#    END



#Select Value from Dropdown
#    #select from list by index      admorepass            2
#    select from list by value       admorepass            2
#    sleep     2s
#    select from list by value       billing_country         AI
#    #select from list by label      billing_country         India
#    #select from list by index      billing_country         4
#    sleep     2s
#


#Select Checkboxe with Specific City Name and Retry if Name Doesnt Exis
#     Wait Until Keyword Succeeds	10 Sec	2 sec	 click element      //td[text()='${inputcity}']//parent::tr//input[@type='checkbox']

#Select Checkboxe with Specific City Name and Fail If Doesnt Exist
#     ${web_elements_city}=    Get WebElements       //table[@id='cities']//tr//td[3]
#     ${Execution}=     set variable    ${False}
#     log     ${False}
#     log     ${CURDIR}
#     log     ${LOG_FILE}
#     Log     ${Execution}
#     FOR     ${city_elem}     IN    @{web_elements_city}
#         ${city_name}=     get text     ${city_elem}
#         Log    ${city_name}
#         run keyword if  '${city_name}' == '${InputCity}'       click element      //td[text()='${city_name}']//parent::tr//input[@type='checkbox']
#         ${Execution}=     set variable if     '${city_name}' == '${InputCity}'     ${True}
#         sleep       2s
#     END
#     run keyword if     ${Execution} == ${False}     fail     Target City Name couldn't find ${InputCity}

#Select Checkboxe with Specific City Name
#     ${web_elements_city}=    Get WebElements       //table[@id='cities']//tr//td[3]
#     FOR     ${city_elem}     IN    @{web_elements_city}
#         ${city_name}=     get text     ${city_elem}
#         Log    ${city_name}
#         run keyword if    '${city_name}' == '${InputCity}'       click element      //td[text()='${city_name}']//parent::tr//input[@type='checkbox']
#         sleep       2s
#     END


#Dynamic Get City Name and Select Checkboxes
#     ${web_elements_city}=    Get WebElements       //table[@id='cities']//tr//td[3]
#     FOR     ${city_elem}     IN    @{web_elements_city}
#         ${city_name}=     get text     ${city_elem}
#         Log    ${city_name}
#         click element      //td[text()='${city_name}']//parent::tr//input[@type='checkbox']
#         sleep       2s
#
#     END

#Select Checkbox with the help of CityName
#    FOR    ${city}     IN     @{city_list}
#        click element      //td[text()='${city}']//parent::tr//input[@type='checkbox']
#        sleep       2s
#    END
#

#Get Text of Multiple Element With Range
#    ${result_list}      create list
#    ${web_elements}=    Get WebElements       //li/span
#    log      ${web_elements}
#    ${list_length}=     get length     ${web_elements}
#    Log     ${list_length}
#    FOR    ${i}    IN RANGE    ${list_length}
#        ${result}=     get text     ${web_elements}[${i}]
#        Log     ${result}
#        Append To List      ${result_list}      ${result}
#    END
#    Log     ${result_list}
#
#    FOR     ${button}     IN     @{RadioButton}
#        ${result}=    run keyword and return status    wait until element is visible    ${button}    10s
#        #Log     ${result}
#        run keyword if    ${result}    click element      ${button}
#        sleep       2s
#   END



#Get Text of Multiple Element
#    ${result_list}      create list
#    ${web_elements}=    Get WebElements       //li/span
#    log      ${web_elements}
#    FOR    ${element}    IN     @{web_elements}
#        ${result}=     get text     ${element}
#        Log     ${result}
#        Append To List      ${result_list}      ${result}
#    END
#    Log     ${result_list}
#
#    FOR     ${button}     IN     @{RadioButton}
#        ${result}=    run keyword and return status    wait until element is visible    ${button}    10s
#        #Log     ${result}
#        run keyword if    ${result}    click element      ${button}
#        sleep       2s
#   END


*** Keywords ***

Open browser and launch url
    [Documentation]    This keyword will open browser and launch url
    [Arguments]     ${server_url}     ${test_browser}
    open browser   ${server_url}     ${test_browser}
    maximize browser window


Close All Browser On the System
    [Documentation]     Close all opened browser
    close all browsers
