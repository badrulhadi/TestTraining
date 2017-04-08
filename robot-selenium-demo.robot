*** Settings ***
Library            Selenium2Library
Suite Setup        Open Browser    ${HOMEPAGE}    ${BROWSER}
Test Setup         Go To    ${HOMEPAGE}
Suite Teardown     Close All Browsers

*** Variables ***
${HOMEPAGE}    https://www.google.com
${BROWSER}     chrome

*** Test Cases ***
Google Search & verifing results
    [Tags]    templated-tests
    [Template]    Google and check results
    eficode    www.eficode.com
    deveo      deveo.com
    robot framework    robotframework.org
    
Google eficode and find eficode
    [Tags]    eficode    smoke
    Google and check results    eficode    www.eficode.com

Google deveo and find its wesite
    [Tags]    deveo    eficode
    Google and check results    deveo    deveo.com
    
Google robot and find its website
    [Tags]    robot
    Google and check results    robot framework    robotframework.org        
    
*** Keywords ***
Google and check results
    [Arguments]    ${searchkey}    ${result}
    Input Text     id=lst-ib    ${searchkey}
    Click Button    id=_fZl
    Wait Until Page Contains   ${result}