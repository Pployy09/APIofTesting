*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/RegisterKeywords.robot
Resource    ../keywords/HomePageKeyword.robot
Variables    ../resources/config/config.yaml
Variables    ../resources/testdata/testdata.yaml
Suite Setup    Open Browser    ${baseUrl}    Chrome
Suite Teardown    Close Browser

*** Test Cases ***
As a user, I want to register success with valid credentials
    When user register to future skill platform    
    ...    ${email}    ${firstName}    ${lastName}    ${phoneNumber}    ${newPassword}    ${confirmPassword}
    Then future skill should display home page and disply message as "ระบบได้ส่งรหัส OTP ไปยังเบอร์โทรศัพท์"
    [Teardown]    Close Browser