*** Settings ***
Library    SeleniumLibrary
#Resource    locators.robot
Library     Collections
Library     OperatingSystem

*** Variables ***
${SignupPopup}                 //span[@class='lgRightSection__close']
${one_way_radio_button}        xpath=//span[text()='One-way']//parent::li
${round_trip_radio_button}     xpath=//span[text()='Round-trip']//parent::li
${multicity_radio_button}      xpath=//span[text()='Multi-city']//parent::li

${buse_page_link}               xpath=//a[@href='/bus/']
${bus_source_city_input}        id=autosuggestBusSRPSrcHome
${bus_dest_city_input}          id=autosuggestBusSRPDestHome


*** Keywords ***
Close Signup Popup IfExist
     [Documentation]    Close Signup Popup IfExist
     ${status}=     run keyword and return status     wait until element is visible      ${SignupPopup}      10s
     IF    ${status}     click element      ${SignupPopup}      END

Open browser and launch url
    [Documentation]    This keyword will open browser and launch url
    [Arguments]     ${server_url}     ${test_browser}
    IF    '${test_browser}' == 'chrome'
        open browser   ${server_url}     chrome
    ELSE IF   '${test_browser}' == 'firefox'
        open browser   ${server_url}     firefox
    ELSE IF    '${test_browser}' == 'edge'
        open browser   ${server_url}     edge
    ELSE
        Log     Invalid browser name
    END

#    maximize browser window
#    Close Signup Popup IfExist

Close All Browser On the System
    [Documentation]     Close all opened browser
    close all browsers

Select Trip Type
    [Documentation]    Select Trip Type to Book Flight
    [Arguments]      ${trip_type}
    log      ${trip_type}
    IF    ${trip_type} == 'oneway'
            wait until element is visible     ${one_way_radio_button}          10s
            click element                     ${one_way_radio_button}
    ELSE IF    ${trip_type} == 'roundtrip'
            wait until element is visible     ${round_trip_radio_button}        10s
            click element                     ${round_trip_radio_button}
    ELSE IF    ${trip_type} == 'multicity'
            wait until element is visible     ${multicity_radio_button}          10s
            click element                     ${multicity_radio_button}
    END


Navigate to Bus Booking Page
       wait until element is visible         ${buse_page_link}       10s
       click element        ${buse_page_link}

Enter Bus Source and Destination
       [Arguments]      ${source_name}      ${target_name}
       wait until element is visible      ${bus_source_city_input}
       clear element text    ${bus_source_city_input}
       input text    ${bus_source_city_input}      ${source_name}
       wait until element is visible     //span[text()='${source_name}']//parent::li       10s
       click element      //span[text()='${source_name}']//parent::li
       wait until element is visible      ${bus_dest_city_input}        10s
       clear element text    ${bus_dest_city_input}
       input text    ${bus_dest_city_input}      ${target_name}
       wait until element is visible      //span[text()='${target_name}']//parent::li      10s
       click element      //span[text()='${target_name}']//parent::li


