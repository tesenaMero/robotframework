*** Settings ***
Library           Selenium2Library

*** Variables ***
${USER}           readymix
${PASSWORD}       qNm3opIGZcG5E07rRqhb2JSXk6fBI8
${SERVER}         ${USER}:${PASSWORD}@react-template-test.mybluemix.net
${BROWSER}        chrome
${BROWSER_VERSION}  56
${DELAY}          0
${LOGIN URL}      http://${SERVER}/
${STACKUSER}      janpippal1
${ACCESSKEY}      sYGVo4XEixNpfukncpWm
${BROWSERSTACK}  http://${STACKUSER}:${ACCESSKEY}@hub.browserstack.com:80/wd/hub
${COUNT}

*** Keywords ***
Go to template test page
    open browser  ${LOGIN URL}   ${BROWSER}
    wait until keyword succeeds  1 min  3 sec  title should be  Cemex Products


Click Quotation & Pricing
    wait until page contains  Quotation and Pricing
    click link  Quotation and Pricing

Log new,pending,accepted quotations number
    sleep  3
    ${COUNT} =  Get Matching Xpath Count  //div[@data-test='QuotationItem new']
    log  ${COUNT} new quotations
    ${COUNT} =  Get Matching Xpath Count  //div[@data-test='QuotationItem pending']
    log  ${COUNT} pending quotations
    ${COUNT} =  Get Matching Xpath Count  //div[@data-test='QuotationItem accepted']
    log  ${COUNT} accepted quotations
