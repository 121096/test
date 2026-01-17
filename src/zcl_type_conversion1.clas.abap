CLASS zcl_type_conversion1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_type_conversion1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

"Successful Assignments
*DATA var_string TYPE string.
*DATA var_int TYPE i.
*DATA var_date TYPE d.
*data var_pack type p length 3 decimals 2.
*
*var_string = `12345`.
*var_int = var_string.
*
**out->write( var_int ).
*
*var_string = `20230101`.
*var_date = var_string.
**out->write( var_date ).
*
*out->write( |String value: { var_string }| ).
*out->write( |Date Value: { var_date date = user }| ).

"Truncation and Rounding
*DATA long_char TYPE c LENGTH 10.
*DATA short_char TYPE c LENGTH 5.
*
*DATA result TYPE p LENGTH 3 DECIMALS 2.
*long_char = 'ABCDEFGHIJ'.
*short_char = long_char.
*
*
*out->write( long_char ).
*out->write( short_char ).
*
*result = 1 / 8.
*out->write( |1 / 8 is rounded to { result NUMBER = USER }| ).

"Unexpected Results of Assignments
*DATA var_date TYPE d.
*DATA var_int TYPE i.
*DATA var_string TYPE string.
*DATA var_n TYPE n LENGTH 4.
*
*var_date = cl_abap_context_info=>get_system_date( ).
*var_int = var_date.
*
*out->write( |Date as date| ).
*out->write( var_date ).
*out->write( |Date assigned to integer| ).
*out->write( var_int ).
*
*var_string = `R2D2`.
*var_n = var_string.
*out->write( |String| ).
*out->write( var_string ).
*out->write( |String assigned to type N| ).
*out->write( var_n ).

"Conversions of Forced Type
*DATA(result1) = '20230101'.
*   out->write( result1 ).
*
*     DATA(result2) = CONV d( '20230101' ).
*   out->write( result2 ).

  " Prevention of Truncation and Rounding

  DATA var_date   TYPE d.
  DATA var_pack   TYPE p LENGTH 3 DECIMALS 2.
  DATA var_string TYPE string.
  DATA var_char   TYPE c LENGTH 3.

* var_pack = 1 / 8.
* out->write( |1/8 = { var_pack NUMBER = USER }| ).
*
* TRY.
*   var_pack = EXACT #( 1 / 8 ).
* CATCH cx_sy_conversion_error.
*   out->write( |1/8 has to be rounded. EXACT triggered an exception| ).
* ENDTRY.

*  var_string = 'ABCDE'.
* var_char   = var_string.
* out->write( var_char ).
*
* TRY.
*   var_char = EXACT #( var_string ).
* CATCH cx_sy_conversion_error.
*   out->write( 'String has to be truncated. EXACT triggered an exception' ).
* ENDTRY.

* var_

var_date = '20221232'.
out->write( var_date ).


TRY.
var_date = EXACT #( '20221232' ).
CATCH cx_sy_conversion_error.
out->write( |2022-12-32 is not a valid date. EXACT triggered an exception| ).
ENDTRY.



  ENDMETHOD.
ENDCLASS.
