*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Scalar Variable
${url}            https://www.google.co.in
${browser}        chrome
${Search_data}    Selenium Learning

# List Variable
@{days_of_week}      sun    mon    tue wed    thu    fri    sat

# Dictionary Var
&{dict_data}        name=Mohan      age=50      address=Pune     mobile=5000



*** Test Cases ***
Read List Variable
    Log    ${days_of_week}
    Log    ${days_of_week}[0]
    FOR    ${val}     IN     @{days_of_week}
        Log      ${val}
    END


Read Dict Data
    Log     ${dict_data}
    Log     ${dict_data}[age]

    FOR     ${data}   IN      &{dict_data}
        log      ${data}
    END
