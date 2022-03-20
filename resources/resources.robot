*** Settings ***

*** Variables ***
${url}   http://automationpractice.com/index.php
${browser}   chrome
@{dataArrays}   1   2   3   4   5   6   7

*** Keywords ***
open Homepage
    open browser   ${url}    ${browser}
    ${width}    ${height}=   Get Window Size
    set Global Variable     ${width}
    set selenium speed   0.2s
close Homepage
    close browser