*** Settings ***
Library    SeleniumLibrary
Resource    locators.robot
Library     Collections
Library     OperatingSystem


# Suite setup execute only once before all test cases excution.
Suite Setup       Open browser and launch url     ${url1}      ${browser}
Suite Teardown     Close All Browser On the System

#Test Timeout     20s

*** Variables ***
${browser}         chrome
${url1}            https://automationbysqatools.blogspot.com/2021/05/dummy-website.html
${url2}            https://facebook.com
${url3}            https://google.co.in
${url4}            https://sqatools.in

${facebook_url}      https://facebook.com

*** Test Cases ***
Lanch Different URL and Verify
     [Template]      Nagivate To Url
     ${url1}
     ${url2}
     ${url3}
     ${url4}


Login to Facebook Website and Verify
    [Tags]    facebook
    [Documentation]      Login to Facebook Website and Verify
    [Template]          Login to Facebook
    user1        email1
    admin1       admin@123
    admin2       admin@1234
    admin3       admin@1235
    admin4       admin@1236


Execute Java Script and Result
     [Tags]    script
     #Go to     https://www.google.co.in
     execute javascript  window.open('https://www.google.co.in')
     sleep       5s
     ${window_handle} =      get window handles
     switch window     ${window_handle}[1]
     ${url_val}=    execute javascript    return document.URL
     Log    ${url_val}
     ${domain_val}=    execute javascript    return document.Domain
     Log    ${domain_val}
     ${search_box}=    execute javascript    return document.getElementsByName("q")
     input text       ${search_box}     Selenium
#     ${search_button}=    execute javascript    return document.getElementsByName("btnK")[0]
#     wait until element is visible       ${search_button}     10s
#     click element       ${search_button}
      execute javascript   document.getElementsByName("btnK")[0].click()
      sleep       5s
      execute javascript   window.close()
      switch window     ${window_handle}[0]
      execute javascript  window.open('${facebook_url}')
      ${window_handle} =      get window handles
      switch window     ${window_handle}[1]
      input text      email         admiun@facebook.com
      input text      pass          P@ssw0rd
      sleep       5s
      execute javascript    window.close()
      switch window     ${window_handle}[0]
      sleep       5s

Upload File and Verify
      [Tags]    upload
      Go to     https://automationbysqatools.blogspot.com/2020/08/login.html
      wait until element is visible      id=myFile
      choose file      id=myFile      E:\\Filesdata\\file1.txt
      sleep       5s
      click element       xpath=//input[@type='file']//following-sibling::input[@type='submit']
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

Nagivate To Url
     [Arguments]      ${url}
      Go to      ${url}

Login to Facebook
     [Arguments]       ${username}     ${password}
     Go to     ${facebook_url}
     wait until element is visible     email
     input text        email      ${username}
     input text        pass       ${password}
     sleep    2s


