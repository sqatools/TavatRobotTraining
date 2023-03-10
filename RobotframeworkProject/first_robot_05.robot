*** Settings ***
Documentation       An example of working with multiple browser windows.

Library             RPA.Browser.Selenium


*** Tasks ***
Navigate to app, open new windows, close it, click on alert button
    Open Available Browser    https://www.google.com/
    Click Button When Visible    id:openwindow
    Switch Window    new
    Click Button When Visible    id:closewindow
    Switch Window    main
    Click Button When Visible    id:openalert