*** Settings ***
Library           Selenium2Library
Library           BuiltIn
Library           String

*** Variables ***
${USER}           readymix
${PASSWORD}       qNm3opIGZcG5E07rRqhb2JSXk6fBI8
${SERVER}         ${USER}:${PASSWORD}@react-template-test.mybluemix.net
${BROWSER}
${BROWSER_VERSION}
${DELAY}          0
${LOGIN URL}      http://${SERVER}/
${STACKUSER}      janpippal1
${ACCESSKEY}      sYGVo4XEixNpfukncpWm
${BROWSERSTACK}  http://${STACKUSER}:${ACCESSKEY}@hub.browserstack.com:80/wd/hub

*** Keywords ***
Go to template test page
    #open browser  ${LOGIN URL}  chrome
    open browser  url=${LOGIN URL}  remote_url=${BROWSERSTACK}  desired_capabilities=browser:${BROWSER},browser_version:${BROWSER_VERSION},os:Windows,os_version:10
    maximize browser window
    wait until keyword succeeds  1 min  3 sec  title should be  Cemex Products


Click Quotation & Pricing
    wait until page contains  Quotation and Pricing
    click link  Quotation and Pricing

