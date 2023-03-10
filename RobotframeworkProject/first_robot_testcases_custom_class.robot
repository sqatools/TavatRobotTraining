*** Settings ***
Library    SeleniumLibrary
Resource    locators.robot
Variables    Python_Variables.py
Library    CustomLibrary.py      ${UserInput}


# Suite setup execute only once before all test cases excution.
#Suite Setup       Open browser and launch url     ${url}      ${browser}
#Suite Teardown     Close All Browser On the System

Test Timeout     20s




*** Variables ***
${url}            https://www.google.co.in
${browser}        chrome
${Search_data}    Selenium
${UserInput}      6
@{input_list}        5    8    3     2    11


*** Test Cases ***
Read Keyword from custom class
    ${factorial}=     calculate_factorial
    Log     Factorial of give value is ${factorial}


Get square of all the values in the list
    [Documentation]    Get square of all the values in the list
    Log       ${input_list}
    ${square_values}=     print_square_of_all_values      ${input_list}
    Log  ${square_values}

*** Keywords ***

Open browser and launch url
    [Documentation]    This keyword will open browser and launch url
    [Arguments]     ${server_url}     ${test_browser}
    open browser   ${server_url}     ${test_browser}
    maximize browser window


Close All Browser On the System
    [Documentation]     Close all opened browser
    close all browsers
