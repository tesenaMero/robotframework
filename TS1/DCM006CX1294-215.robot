*** Settings ***
Documentation    Suite description
...              1. Below the the columns will display the list of quotes in a block shape will consist of 3 lists, new quotes, pending quotes and accepted quotes.
...              2. The information in each block depending in the column will be, New Quote #XXXXX in blue, Pending Quote #XXXXX in orange, Accepted Quote #XXXXX in green, in the upper left side of the block.
...              3. The date submitted of the quote in the upper right side of the block
...              4. In the Middle left side will be the name of the jobsite, and below this name will be the segmentation of the jobsite.
...              5. Bottom left side will show Quote Total and the total amount of the quote incluiding taxes
Resource            ../resource.robot
Suite Setup  Run Keywords   Go to template test page
...                         Click Quotation & Pricing
Suite Teardown  Run Keywords  Close browser

*** Variables ***
${text}
${elementCount}

*** Test Cases ***
Test title
    wait until page does not contain element  //span[contains(text(),"new")]//preceding::span[1][text()="0"]
    :FOR    ${element}    IN    //div[@data-test="QuotationItem new"]    //div[@data-test="QuotationItem pending"]  //div[@data-test="QuotationItem accepted"]
    \    ${elementCount} =  get matching xpath count  ${element}
    \    Get quotation header text  ${elementCount}  ${element}




*** Keywords ***
Get quotation header text
    [Arguments]    ${elementCount}  ${element}
    :FOR    ${index}    IN RANGE    1  ${elementCount}+1
    \        ${text} =  get text  ${element}[${index}]/div/div
    \       run keyword if  '${element}'=='//div[@data-test="QuotationItem new"]'  should match regexp  ${text}  \New Quote: \\d+
    \       run keyword if  '${element}'=='//div[@data-test="QuotationItem pending"]'  should match regexp  ${text}  \Pending Quote: \\d+
    \       run keyword if  '${element}'=='//div[@data-test="QuotationItem accepted"]'  should match regexp  ${text}  \Accepted Quote: \\d+
    \       Log    ${text}