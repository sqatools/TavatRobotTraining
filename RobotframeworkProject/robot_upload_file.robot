*** Settings ***
Library    SeleniumLibrary
Resource    locators.robot
Library     Collections
Library     OperatingSystem
Library     CustomLibrary.py      10


# Suite setup execute only once before all test cases excution.
Suite Setup       Open browser and launch url     ${url1}      ${browser}
Suite Teardown     Close All Browser On the System

#Test Timeout     20s

*** Variables ***
${browser}         chrome
${url1}            https://automationbysqatools.blogspot.com/2021/05/dummy-website.html

*** Test Cases ***


Upload File and Verify
      [Tags]    upload
      Go to    https://easyupload.io/
      wait until element is visible      //button[@class='dz-button']        10s
      click button      //button[@class='dz-button']
      sleep       5s
      upload_file      "E:\\Filesdata\\count_name.txt"
      sleep       5s
      input text        id=password        P@ssw0rdpassw2ord
      click element         id=upload
      sleep       5s


*** Keywords ***

Open browser and launch url
    [Documentation]    This keyword will open browser and launch url
    [Arguments]     ${server_url}     ${test_browser}
    open browser   ${server_url}     ${test_browser}
    maximize browser window


Close All Browser On the System
    [Documentation]     Close all opened browser
    close all browsers