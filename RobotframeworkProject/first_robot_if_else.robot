*** Settings ***
Library    SeleniumLibrary
Resource    locators.robot
Library     Collections
Library     OperatingSystem


# Suite setup execute only once before all test cases excution.
#Suite Setup       Open browser and launch url     ${url1}      ${browser}
#Suite Teardown     Close All Browser On the System

#Test Timeout     20s

*** Variables ***
${num1}      12
${num2}      15
${Num3}      15

${round1}      Pass
${round2}      Pass
${round3}      Pass

*** Test Cases ***
Simple IF Else Condition
     IF   ${num1} == ${num2}
          Log    Both variable has same value
     ELSE
          #Log    Both variables are not equal
          Fail     Both variables are not equal

     END

Simple ifelse if Condition
     [Tags]    elseif
     IF  ${num1} > ${num2} and ${num1} > ${num3}
          Log   Num1 has greater value ${num1}
          log to console      ${num1} has greater value
     ELSE IF   ${num2} > ${num1} and ${num2} > ${num3}
          Log   Num2 has greater value ${num2}
          log to console    ${num2} has greater value
     ELSE IF   ${num3} > ${num1} and ${num3} > ${num2}
          Log   Num3 has greater value ${num3}
          log to console    Num3 has greater value ${num3}
     ELSE
          log to console    No one has greater value
     END

Nested If condition in robot
    [Tags]    nestedif
    IF  '${round1}' == 'Pass'
        log to console     Congrats First round is cleared
        IF    '${round2}' == 'Pass'
               log to console     Congrats Second round is cleared
               IF    '${round3}' == 'Pass'
                        log to console     Congrats third round is cleared, welcome to the company
               ELSE
                         log to console     Sorry Third round is not cleared, try nest time
                         Fail      Sorry Third round  is not cleared, try next time
               END

        ELSE
                log to console     Sorry second round is not cleared
                Fail      Sorry second round  is not cleared, try next time
        END
    ELSE
        log to console     Sorry first round is not cleared, try next time
        Fail      Sorry first round is not cleared, try next time

    END



Single Line If Condition
    [Tags]     oneline
    ${var1}     set variable      ${False}
    IF    ${var1}     Log to console     result is positive      ELSE     log to console    result is negative


Nested For Loop Condition in RobotFramework
    [Tags]     nestedloop
    #${msg}=     Good Morning
    ${msg2}=     set variable      Good Morning How are you?
    #Log     ${msg}
    Log      ${msg2}
    @{variables}     create list      p     q     r    s
    Log     ${variables}
    @{values}        create list      20    31     41     50
    @{even_values}   create list
    Log     ${values}
    FOR      ${var}    IN   @{variables}
        #Log     ${var}
        FOR     ${val}    IN     @{values}
            #Log     ${var} ${val}
            IF      ${val}%2 == 0
                  Log     ${var} ${val}
                  APPEND TO LIST     ${even_values}    ${val}
            END
        END
    END

    Log    Even values list ${even_values}


For Loop with Dictionary data Type
    [Tags]     dict
    ${input_str}      set variable     Pythonnnn PPPPPrograPPPPmming
    @{char_list}      convert to list      ${input_str}
    Log       ${char_list}
    &{dict_ouput}     create dictionary
    Log     ${dict_ouput}
    FOR    ${char}   IN     @{char_list}
            log      ${char}
            ${status}=      run keyword and return status      dictionary should contain key     ${dict_ouput}    ${char}
            IF    ${status}
                  ${dict_value}=     convert to integer    ${dict_ouput}[${char}]
                  ${increament}=     set variable          1
                  ${inct_int}=        convert to integer     ${increament}
                  #${increamented_value}=     evaluate    ${dict_value} + ${inct_int}
                  ${increamented_value}=     set variable    ${${dict_value}+${inct_int}}
                  set to dictionary   ${dict_ouput}      ${char}     ${increamented_value}
            ELSE
                   set to dictionary   ${dict_ouput}      ${char}     1
            END
    END
    Log     ${dict_ouput}


While Loop in the RobotFramework
    [Tags]     whileloop
    ${var1}     set variable    5
    ${var1_int}     convert to integer     ${var1}
    ${temp}     set variable    1
    ${temp_int}      convert to integer     ${temp}
    WHILE    ${temp_int} <= 10
            ${multiply}=      evaluate       ${temp_int} * ${var1_int}
            Log    ${var1} * ${temp_int} = ${multiply}
            log to console     ${var1} * ${temp_int} = ${multiply}
            ${increament}=     set variable          1
            ${inct_int}=        convert to integer     ${increament}
            ${temp_int}=      evaluate    ${temp_int} + ${inct_int}
    END