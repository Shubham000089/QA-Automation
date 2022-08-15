*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Library     Collections
Library     String
Library     StringFormat
Library     OperatingSystem


*** Variables ***

*** Test Cases ***
Table Validation_01
    ${e} =      set variable        A
    ${a} =      set variable        30,0
    ${b} =      set variable        (
    ${c} =      set variable        )
    ${d} =      set variable        ${e} ${b}${a}${c}
    ${d} =      StringFormat.Format String      ${e} (${a})
    log to console      ${d}
    set global variable     ${a}

Table Validation_02
        @{z} =      create list
        ${q} =      set variable        300
        ${w} =      set variable        300
        ${x} =      set variable        None
        ${Is_check} =       run keyword and return status     should be equal         ${q}    ${w}
        ${x} =      run keyword if      ${Is_check} == True     set variable     400
        log to console      ${x}