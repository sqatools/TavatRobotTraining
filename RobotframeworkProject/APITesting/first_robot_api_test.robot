*** Settings ***
# Installation of the request library
# pip install robotframework-requests
# https://crossfield.chromeriver.com/doc/keywords/13/
# https://marketsquare.github.io/robotframework-requests/
# https://reqres.in/

Library           RequestsLibrary
Library           JSONLibrary

Suite Setup        Create Session    ${session_json}  ${protocol}://${server2}

*** Variables ***
${protocol}      https
${server}        www.google.com
${server2}       jsonplaceholder.typicode.com
${api_url}       ${protocol}://${server}
${session_name}      google
${session_json}     jsonplaceholder

*** Test Cases ***
Quick Get Request Test
    ${response}=    GET     ${api_url}
    Log      ${response}
    Status Should Be  201

Create Post Session Test and Validate
     ${request_body}=     create dictionary     title=Robotframework Request   userId=111    body=Robotframework request body
     ${resp}=    POST On Session    ${session_json}  /posts  json=${request_body}  expected_status=anything
     Log    ${resp.json()}

Read Json File request body and validate
     ${json_object}=	     Load JSON From File	         request_data.json
     ${resp}=    POST On Session    ${session_json}  /posts  json=${json_object}  expected_status=anything
     Log    ${resp.json()}

Create Session Test and Validate
     Create Session    ${session_name}    ${api_url}
     Create Session  jsonplaceholder  ${protocol}://${server2}
     ${resp_google}=   GET On Session  ${session_name}   /  expected_status=200
     ${resp_json}=     GET On Session  ${session_json}  /posts     expected_status=200
     Log     ${resp_json}
     Log     ${resp_google}

     Log     ${resp_json.json()}
     Log     title : ${resp_json.json()}
     FOR      ${data}     IN     @{resp_json.json()}
               log to console      id: ${data}[id], title:${data}[title]
     END

Apply Put API and Validate the response
