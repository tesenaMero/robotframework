*** Settings ***
Documentation     This TC is verifying story DCM006CX1294-213
...
...                 1. Have in the main screen a upper bar where at the right side of the bar will have a dropdown with the options quotes and pricing.
...                 2. If you click in the dropdown will appear quotes, pricing
...                 3. If you click quotes will go to quotes screen
...                 4. If you click pricing will go to pricing screen and in the bar just left of pricing will appear an icon of a calendar
Resource  ../resource.robot
Suite Setup  Run Keywords    Go to template test page
...                         Click Quotation & Pricing

*** Variables ***


*** Test Cases ***
Check dropdown visibility
    wait until element is visible  //div[span[text()="Quotation"]]
    wait until page contains element  //div[span[text()="Quotation"]]


Check dropdown and assert its content
    click element   //div[span[text()="Quotation"]]
    wait until page contains element  //div[span[text()="Quotation"]]/div/a/div[text()="Quotations"]
    wait until page contains element  //div[span[text()="Quotation"]]/div/a/div[text()="Pricing"]
    click element   //div[span[text()="Quotation"]]

Check dropdown navigation
    click element   //div[span[text()="Quotation"]]
    wait until page contains element  //div[span[text()="Quotation"]]/div/a/div[text()="Quotations"]
    click element  //div[span[text()="Quotation"]]/div/a/div[text()="Quotations"]
    wait until page contains element  //div[span[text()="Quotation"]]


    click element   //div[span[text()="Quotation"]]
    wait until page contains element  //div[span[text()="Quotation"]]/div/a/div[text()="Pricing"]
    click element  //div[span[text()="Quotation"]]/div/a/div[text()="Pricing"]
    wait until page contains element  //div[span[text()="Pricing"]]