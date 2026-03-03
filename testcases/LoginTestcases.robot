*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/LoginKeywords.robot
Resource    ../keywords/HomePageKeyword.robot
Variables    ../resources/config/config.yaml
Variables    ../resources/testdata/testdata.yaml
Suite Setup    Open Browser    ${baseUrl}    Chrome
Suite Teardown    Close Browser

*** Test Cases ***
As a user, I want to login success with valid credentials
    When user login to future skill platform with ${email} and ${valid_password}
    Then future skill should display home page and disply message as "แนะนำคอร์สเรียนที่คุณสนใจ"
    [Teardown]    user logout from future skill platform

As a user, I fail to login with invalid credentials
    When user login to future skill platform with ${email} and ${invalid_password}
    Then future skill should display validate login fail message as "กรอกรหัสผ่านไม่ถูกต้อง"