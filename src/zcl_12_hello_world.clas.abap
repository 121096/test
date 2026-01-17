CLASS zcl_12_hello_world DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_hello_world IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

out->write( 'Hello World' ).

    DATA result TYPE p LENGTH 8 DECIMALS 2.

    DATA number1 TYPE i.
    DATA number2 TYPE i.

* Input Values
**************************
    number1 = -8.
    number2 =  3.
* Calculation
**************************

    result = number1 / number2.

    DATA(output) = |{ number1 } / { number2 } = { result }|.


    out->write( output ).


  ENDMETHOD.
ENDCLASS.
