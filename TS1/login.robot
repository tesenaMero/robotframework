*** Settings ***
Resource  ../resource.robot

*** Test Cases ***
Login and go to Quotation & Pricing page
    go to template test page
    click quotation & pricing
    log new,pending,accepted quotations number
