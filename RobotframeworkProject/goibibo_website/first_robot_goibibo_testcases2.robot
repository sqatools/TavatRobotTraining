*** Settings ***
Library      SeleniumLibrary
Library      Collections
Library      OperatingSystem
Library      ExcelLibrary
Library      JSONLibrary
Resource     robot_goibibokeyword.robot


 #Suite setup execute only once before all test cases excution.
Suite Setup      Run Keyword if   '${url}' == 'https://www.goibibo.com/'      Run Keywords
           ...     Open Excel Document       test_data.xlsx        doc_id=2
           ...     AND     Get Url
           ...     AND     Open browser and launch url     ${url}      ${browser}
           ...     AND     maximize browser window
           ...     AND     Close Signup Popup IfExist
           ...     ELSE     Fail      Wrong URL ${url}
Suite Teardown     Close All Browser On the System

#Test Timeout     20s



*** Variables ***
${url}           https://www.goibibo.com/
${browser}       chrome
${trip_type}     'multicity'
@{url_cell}       5      1
*** Test Cases ***

Book A Flight on Go Ibibogo and Verify
    Select Trip Type     ${trip_type}
    Sleep   5s

Open Excel File and Read Content
    [Tags]     excel
    ${data}=     Read Excel Cell           1      1
    Log      ${data}

Book a Bus and Verify
    [Tags]     bus
    Navigate to Bus Booking Page
    ${source_city}=     Read Excel Cell           3      1
    ${dest_city}=       Read Excel Cell           4      1
    Enter Bus Source and Destination      ${source_city}       ${dest_city}
    sleep    5s


Read Content from Json File
    [Tags]    json
    ${json_object}=	     Load JSON From File	         test_json_file.json
    ${value}=	Get Value From Json     	${json_object}	    $..url
    Log     ${value}
    log to console         ${value}
    ${object_to_add}=	Create Dictionary	     country=India
    ${json_object}=	    Add Object To Json	     ${json_object}	      $..address	     ${object_to_add}
    ${cvalue}=	     Get Value From Json     	 ${json_object}	      $..country
    Log     ${cvalue}
    log to console         ${cvalue}


*** Keywords ***

read data excel sheet
    [Arguments]       ${row}      ${colom}       ${file_path}=test_data.xlsx
    Open Excel Document      ${file_path}        doc_id=1
    ${cell_value}=     Read Excel Cell         ${row}       ${colom}
    [Return]       ${cell_value}


Get Url
    ${url}=    read data excel sheet     ${url_cell}[0]       ${url_cell}[1]
    set global variable     ${url}
    Close All Excel Documents



