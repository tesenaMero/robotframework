*** Settings ***
Documentation    Suite description
...              1. The Main screen header will be divide in 3 columns, the first one will display the number of quotes that are new and the description New Quotes to be review. New Quotes means the quotes that are new and the customer hasnt have any interaction with it.
...              2. The second columns will display the number of quotes that are pending, with the description Pending Quotes. Pending Quotes are quotes that the customer already interact with it but didnt take any action.
...              3. The third column will display the number of quotes that are already accepted, with the description Accepted Quotations. Accepted Quotations are the quotes that the customer already interact and accepted the whole quote or items of the quote.
Resource   ../resource.robot
Suite Setup  Run Keywords   Go to template test page
...                         Click Quotation & Pricing
Suite Teardown  Run Keywords  Close browser

*** Variables ***
${SHOWNNEW}
${SHOWNPENDING}
${SHOWNACCEPTED}
${REALNEW}
${REALPENDING}
${REALACCEPTED}

*** Test Cases ***
The main screen contains 3 columns containg new, pending, accepted quotes
    wait until page contains element  //div[text()="Quotation and pricing"]
    wait until page does not contain element  //span[contains(text(),"new")]//preceding::span[1][text()="0"]
    ${REALNEW} =  get matching xpath count  //div[@data-test="QuotationItem new"]
    ${REALPENDING} =  get matching xpath count  //div[@data-test="QuotationItem pending"]
    ${REALACCEPTED} =  get matching xpath count  //div[@data-test="QuotationItem accepted"]
    Log  Found new: ${REALNEW} pending: ${REALPENDING} accepted: ${REALACCEPTED}

    ${SHOWNNEW} =  get text  //span[contains(text(),"new")]//preceding::span[1]
    ${SHOWNPENDING} =  get text  //span[contains(text(),"pending")]//preceding::span[1]
    ${SHOWNACCEPTED} =  get text  //span[contains(text(),"accepted")]//preceding::span[1]
    Log  Shown new: ${SHOWNNEW} pending: ${SHOWNPENDING} accepted: ${SHOWNACCEPTED}

    should be equal  ${REALNEW}  ${SHOWNNEW}
    should be equal  ${REALPENDING}  ${SHOWNPENDING}
    should be equal  ${REALACCEPTED}  ${SHOWNACCEPTED}









