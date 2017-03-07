*** Settings ***
Resource  ../resource.robot

*** Test Cases ***
Login and go to Quotation & Pricing page
    go to template test page
    click quotation & pricing
    log new,pending,accepted quotations number

[teardown]
  close browser

*** Keywords ***

Log new,pending,accepted quotations number
    sleep  3
    ${COUNT} =  Get Matching Xpath Count  //div[@data-test='QuotationItem new']
    log  ${COUNT} new quotations
    ${COUNT} =  Get Matching Xpath Count  //div[@data-test='QuotationItem pending']
    log  ${COUNT} pending quotations
    ${COUNT} =  Get Matching Xpath Count  //div[@data-test='QuotationItem accepted']
    log  ${COUNT} accepted quotations
    capture page screenshot
