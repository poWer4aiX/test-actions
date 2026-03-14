*** Settings ***
Library    Browser

*** Test Cases ***
Test With American Style
    Test Lang    en_US

Test With German Style
    Test Lang    de_DE

*** Keywords ***
Test Lang
    [Arguments]    ${lang}
    &{e}    Create Dictionary    XAUTHORITY=%{XAUTHORITY}    DISPLAY=%{DISPLAY}     LANG=${lang}
    Log    ${e}
    New Browser    browser=chromium    headless=${False}    env=${e}
    New Context    colorScheme=dark    viewport={"width": 640, "height": 480}
    New Page    url=file:${CURDIR}/z.html
    Wait For Load State    domcontentloaded    timeout=3s
    # Take Screenshot
    
    Click With Options    selector=id=d    position_x=120    position_y=10
    Take Screenshot

    Close Page
    Close Context
