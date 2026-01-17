*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
class lcl_connection definition.

  public section.
    CLASS-DATA conn_counter TYPE i READ-ONLY.

METHODS constructor
    IMPORTING
      i_connection_id TYPE /dmo/connection_id
      i_carrier_id TYPE /dmo/carrier_id
    RAISING
      CX_ABAP_INVALID_VALUE.

*METHODS set_attributes
*          IMPORTING
*            i_carrier_id    TYPE /dmo/carrier_id
*            i_connection_id TYPE /dmo/connection_id
*          RAISING
*       cx_abap_invalid_value.

  METHODS get_output
          RETURNING VALUE(r_output) TYPE string_table.

  protected section.
  private section.
    data carrier_id  TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.

endclass.

class lcl_connection implementation.

  method constructor.

if i_carrier_id is INITIAL or i_connection_id is INITIAL.
 RAISE EXCEPTION TYPE cx_abap_invalid_value.
ENDIF.
    me->connection_id = i_connection_id.
    me->carrier_id = i_carrier_id.

conn_counter = conn_counter + 1.
  endmethod.



*  method set_attributes.
*
*   if i_carrier_id is INITIAL or i_connection_id is INITIAL.
*    RAISE EXCEPTION TYPE cx_abap_invalid_value.
*   ENDIF.
*
*   carrier_id = i_carrier_id.
*   connection_id = i_connection_id.
*
*  endmethod.

   method get_output.

     APPEND |------------------------------| TO r_output.
     APPEND |Carrier:     { carrier_id    }| TO r_output.
     APPEND |Connection:  { connection_id }| TO r_output.

  endmethod.

endclass.
