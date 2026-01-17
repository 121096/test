CLASS zcl_12_iterate DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_iterate IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  CONSTANTS max_count TYPE i value 20.
  data numbers TYPE TABLE OF i.
  data output type table of string.
    DO max_count TIMES.
   CASE sy-index.
      WHEN 1.
        APPEND 0 TO numbers.
      WHEN 2.
        APPEND 1 TO numbers.
      WHEN OTHERS.
          APPEND numbers[  sy-index - 2 ]
               + numbers[  sy-index - 1 ]
              TO numbers.
   ENDCASE.
  ENDDO.
  data(counter) = 0.
  LOOP AT numbers into data(number).
  counter = counter + 1.
  APPEND |{ counter WIDTH = 4 }: { number WIDTH = 10 ALIGN = RIGHT }|
         TO output.
  ENDLOOP.

  out->write(
         data   = output
         name   = |The first { max_count } Fibonacci Numbers|
                ) .
  ENDMETHOD.
ENDCLASS.
