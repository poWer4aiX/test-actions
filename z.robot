*** Settings ***
Library    Collections
Library    OperatingSystem
Library    Browser

*** Test Cases ***
Test With American Style
    Test Lang    en_US

Test With German Style
    Test Lang    de_DE

*** Keywords ***
Test Lang
    [Arguments]    ${lang}
    &{e}    Get Environment Variables
    FOR    ${key}   IN   @{e.keys()}
        IF    '${key}'.startswith('LC_') or '${key}'.startswith('LANG') 
            Remove From Dictionary    ${e}    ${key}
        END
    END
    Set To Dictionary    ${e}    LANG=${lang}
    Log    ${e}    
#    &{e}    Create Dictionary    XAUTHORITY=%{XAUTHORITY}    DISPLAY=%{DISPLAY}     LANG=${lang}
    New Browser    browser=chromium    headless=${True}    env=${e}
    New Context    colorScheme=dark    viewport={"width": 640, "height": 480}
    New Page    url=file:${CURDIR}/z.html
    Wait For Load State    domcontentloaded    timeout=3s
    # Take Screenshot
    
    Click With Options    selector=id=d    position_x=100    position_y=10
    Take Screenshot
    Sleep   1s

    Close Page
    Close Context
