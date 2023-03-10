*** Settings ***
#Library    SeleniumLibrary
#Resource    locators.robot
#Library     Collections
#Library     OperatingSystem
Library      AutoItLibrary

# Install autoit library in robotframework
# pip install robotframework-autoitlibrary

#Test Timeout     20s

*** Variables ***
${browser}         chrome
${facebook_url}      https://facebook.com

*** Test Cases ***
Launch Notepad and enter Content
     Run    E:\\AutoScript\\startnotepad.bat
     Win Wait Active         Untitled - Notepad
     sleep      5s
     Control send        strTitle=Untitled - Notepad       strControl=Edit1     strSendText=This is my desktop application
     sleep      5s
     Process close    notepad.exe
