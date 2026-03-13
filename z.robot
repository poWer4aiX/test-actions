*** Settings ***
Library    Browser

*** Test Cases ***
a
    New Browser    browser=chromium    headless=${True}
    New Context    colorScheme=dark    viewport={"width": 1920, "height": 1080}
    New Page    url=file:${CURDIR}/z.html

    Wait For Load State    domcontentloaded    timeout=3s
    Click With Options    selector=id=d    position_x=120    position_y=10
    Take Screenshot

    Close Page
    Close Context