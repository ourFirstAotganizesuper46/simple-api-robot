*** Settings ***
Library           RequestsLibrary


*** Keywords ***

Get Calculation JSON
    [Arguments]    ${num1}    ${num2}
    ${resp}=     GET    http://127.0.0.1:5000/calculate/${num1}/${num2}

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    RETURN    ${resp.json()}

Get Plus Operation
    [Arguments]    ${num1}    ${num2}

    ${resp}=     GET    http://127.0.0.1:5000/plus/${num1}/${num2}

    Should Be Equal    ${resp.status_code}    ${200}

    RETURN    ${resp.json()}


*** Test Cases ***
Test Calculate Numbers 4 and 2 (ฺBefore Using Keywords)

    ${resp}=     GET    http://127.0.0.1:5000/calculate/4/2

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    ${json_resp}=    Set Variable  ${resp.json()}

    # Verify the response of plus operation
    Should Be Equal    ${json_resp['plus']}    ${6}

    # Verify the response of minus operation
    Should Be Equal    ${json_resp['minus']}    ${2}

    # Verify the response of multiply operation
    Should Be Equal    ${json_resp['multiply']}    ${8}

    # Verify the response of divide operation
    Should Be Equal    ${json_resp['divide']}    ${2}


Test Calculate Numbers 8.4 and 4 (ฺBefore Using Keywords)

    ${resp}=     GET    http://127.0.0.1:5000/calculate/8.4/4

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    ${json_resp}=    Set Variable  ${resp.json()}

    # Verify the response of plus operation
    Should Be Equal    ${json_resp['plus']}    ${12.4}

    # Verify the response of minus operation
    Should Be Equal    ${json_resp['minus']}    ${4.4}

    # Verify the response of multiply operation
    Should Be Equal    ${json_resp['multiply']}    ${33.6}

    # Verify the response of divide operation
    Should Be Equal    ${json_resp['divide']}    ${2.1}


Test Calculate Numbers 4 and 2

    ${json_resp}=    Get Calculation JSON    ${4}    ${2}

    # Verify the response of plus operation
    Should Be Equal    ${json_resp['plus']}    ${6}

    # Verify the response of minus operation
    Should Be Equal    ${json_resp['minus']}    ${2}

    # Verify the response of multiply operation
    Should Be Equal    ${json_resp['multiply']}    ${8}

    # Verify the response of divide operation
    Should Be Equal    ${json_resp['divide']}    ${2}


Test Calculate Numbers 8.4 and 4

    ${json_resp}=    Get Calculation JSON    ${8.4}    ${4}

    # Verify the response of plus operation
    Should Be Equal    ${json_resp['plus']}    ${12.4}

    # Verify the response of minus operation
    Should Be Equal    ${json_resp['minus']}    ${4.4}

    # Verify the response of multiply operation
    Should Be Equal    ${json_resp['multiply']}    ${33.6}

    # Verify the response of divide operation
    Should Be Equal    ${json_resp['divide']}    ${2.1}

Test Plus Operation 5 and 6

    ${json_resp}=    Get Plus Operation    ${5}    ${6}

    Should Be Equal    ${json_resp['result']}    ${11}

Test Is Prime Number 17

    ${resp}=     GET    http://localhost:5000/is_prime/17

    Should Be Equal    ${resp.status_code}    ${200}

    ${json_resp}=    Set Variable    ${resp.json()}

    Should Be Equal    ${json_resp['result']}    ${true}

Test Is Prime Number 36

    ${resp}=     GET    http://localhost:5000/is_prime/36

    Should Be Equal    ${resp.status_code}    ${200}

    ${json_resp}=    Set Variable    ${resp.json()}

    Should Be Equal    ${json_resp['result']}    ${false}

Test Is Prime Number 13219

    ${resp}=     GET    http://localhost:5000/is_prime/13219

    Should Be Equal    ${resp.status_code}    ${200}

    ${json_resp}=    Set Variable    ${resp.json()}

    Should Be Equal    ${json_resp['result']}    ${true}

Test Is fibonacci Number 3

    ${resp}=     GET    http://localhost:5000/is_fibonacci/3

    Should Be Equal    ${resp.status_code}    ${200}

    ${json_resp}=    Set Variable    ${resp.json()}

    Should Be Equal    ${json_resp['result']}    ${true}

Test Is fibonacci Number 4
    
    ${resp}=     GET    http://localhost:5000/is_fibonacci/4

    Should Be Equal    ${resp.status_code}    ${200}

    ${json_resp}=    Set Variable    ${resp.json()}

    Should Be Equal    ${json_resp['result']}    ${false}

Test Is fibonacci Number 5
    
    ${resp}=     GET    http://localhost:5000/is_fibonacci/5

    Should Be Equal    ${resp.status_code}    ${200}

    ${json_resp}=    Set Variable    ${resp.json()}

    Should Be Equal    ${json_resp['result']}    ${true}

Test Is Next5 Number 1
    
    ${resp}=     GET    http://localhost:5000/next5/1

    Should Be Equal    ${resp.status_code}    ${200}

    ${json_resp}=    Set Variable    ${resp.json()}

    Should Be Equal    ${json_resp['result']}    ${6}


Test Is Next5 Number -10
    
    ${resp}=     GET    http://localhost:5000/next5/-10

    Should Be Equal    ${resp.status_code}    ${200}

    ${json_resp}=    Set Variable    ${resp.json()}

    Should Be Equal    ${json_resp['result']}    ${-5}


Test Is Next5 Number 1.5
    
    ${resp}=     GET    http://localhost:5000/next5/1.5

    Should Be Equal    ${resp.status_code}    ${200}

    ${json_resp}=    Set Variable    ${resp.json()}

    Should Be Equal    ${json_resp['result']}    ${6.5}