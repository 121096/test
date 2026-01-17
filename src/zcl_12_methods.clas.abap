CLASS zcl_12_methods DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_methods IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  DATA connection TYPE REF TO lcl_connection.
  data connections type table OF ref to lcl_connection.

  "first instance
  connection = NEW #( ).

  try.
      connection->set_attributes(
                  EXPORTING
                   i_carrier_id    = 'LH'
            i_connection_id = '0400' ).
      APPEND connection TO connections.
    catch cx_abap_invalid_value.
    out->write( `Method call failed` ).
  endtry.

  "second instance
  connection = NEW #(  ).

    TRY.
        connection->set_attributes(
          EXPORTING
            i_carrier_id    = 'AA'
            i_connection_id = '0017'
        ).

*        connection->carrier_id    = 'AA'.
*        connection->connection_id = '0017'.

        APPEND connection TO connections.

      CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
    ENDTRY.

    "output
    LOOP AT connections INTO connection.
     out->write( connection->get_output(  ) ).
    endloop.

  ENDMETHOD.
ENDCLASS.
