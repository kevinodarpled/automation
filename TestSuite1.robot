*** Settings ***
Library    SeleniumLibrary       
*** Variables ***
${Browser}    Chrome
${SiteUrl}    https://login.optimyapp.com/
${InvalidEmail}    kevin.delprado
${Email}    kevin.delprado@gmail.com
${Password}    Password123
${WarningMessage}    Login Failed!
${Delay}    5s
*** Test Cases ***
Empty Email and Password
    Given Open Optimy Page
    Maximize Browser
    sleep    ${Delay}   
    Click Login   
    Sleep    3
    Assert Required Field Message
    Close All Browsers
Empty Email
    Given Open Optimy Page
    Maximize Browser
    sleep    ${Delay}
    Enter Password
    Click Login    
    Sleep    3
    Assert Required Field Message
    Close All Browsers
Empty Password
    Given Open Optimy Page
    Maximize Browser
    sleep    ${Delay}
    Enter Email
    Click Login    
    Sleep    3
    Assert Required Field Message
    Close All Browsers
Invalid Email ID
    Given Open Optimy Page
    Maximize Browser
    sleep    ${Delay}
    Enter Invalid Email
    Enter Password
    Click Login    
    Sleep    3
    Assert Invalid Email Message
    Close All Browsers
Incorrect Password
    Given Open Optimy Page
    Maximize Browser
    sleep    ${Delay}
    Enter Email
    Enter Password
    Click Login    
    Sleep    3
    Close All Browsers
Incorrect Email ID and Password
    Given Open Optimy Page
    Maximize Browser
    sleep    ${Delay}
    Enter Invalid Email
    Enter Password
    Click Login    
    Sleep    3
    Assert Incorrecr Email or Password Message
    Close All Browsers
Lost Password but Empty Email
    Given Open Optimy Page
    Maximize Browser
    sleep    ${Delay}
    Click Lost Password
    Click Recover Access  
    Sleep    3
    Assert Required Field Message
    Close All Browsers
Lost Password but Invalid Email
    Given Open Optimy Page
    Maximize Browser
    sleep    ${Delay}
    Click Lost Password
    Enter Invalid Email
    Click Recover Access   
    Sleep    3
    Assert Invalid Email Message
    Close All Browsers
*** Keywords ***
Open Optimy Page
    Open Browser    url=${SiteUrl}    browser=${Browser}
Maximize Browser
    Maximize Browser Window
Enter Email
    Input Text    name=email   ${Email}
Enter Invalid Email
    Input Text    name=email   ${InvalidEmail}
Enter Password
    Input Text    name=password   ${Password}
Click Login
    Click Button    xpath=//button[contains(text(),'Login')]  
Click Lost Password
    Click Button    xpath=//button[contains(text(),'Lost password')]  
Click Recover Access
    Click Button    xpath=//button[contains(text(),'Recover my access')]  
Assert Required Field Message   
    Page Should Contain    This field is required    
Assert Invalid Email Message
    Page Should Contain    Please enter a valid email address     
Assert Incorrecr Email or Password Message
    Page Should Contain    The email address or password is incorrect
