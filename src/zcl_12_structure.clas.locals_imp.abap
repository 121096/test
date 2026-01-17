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

      METHODS get_output
          RETURNING VALUE(r_output) TYPE string_table.

  protected section.
  private section.

*    DATA carrier_id    TYPE /dmo/carrier_id.
*    DATA connection_id TYPE /dmo/connection_id.
*    DATA airport_from_id type /DMO/AIRPORT_FROM_ID.
*    DATA airport_to_id TYPE /DMO/AIRPORT_TO_ID.
TYPES: BEGIN OF ST_DETAILS,
       DepartureAirport TYPE /dmo/airport_from_id,
       DestinationAirport TYPE /dmo/airport_to_id,
       AirlineName TYPE  /dmo/carrier_name,
       END OF st_details.
DATA carrier_id    TYPE /dmo/carrier_id.
DATA connection_id TYPE /dmo/connection_id.

DATA DETAILS TYPE ST_DETAILS.

endclass.

class lcl_connection implementation.

method constructor.

if i_carrier_id is INITIAL or i_connection_id is INITIAL.
 RAISE EXCEPTION TYPE cx_abap_invalid_value.
ENDIF.

SELECT SINGLE
       from /dmo/I_connection
       FIELDS DepartureAirport, DestinationAirport, \_Airline-Name as AirlineName
       WHERE AirlineID    = @i_carrier_id
       AND ConnectionID = @i_connection_id
*       INTO ( @airport_from_id, @airport_to_id ).
       INTO CORRESPONDING FIELDS OF @details.
 IF sy-subrc <> 0.
  RAISE EXCEPTION TYPE cx_abap_invalid_value.
 ENDIF.

    me->connection_id = i_connection_id.
    me->carrier_id = i_carrier_id.

conn_counter = conn_counter + 1.
  endmethod.

method get_output.

*    APPEND |--------------------------------|             TO r_output.
*    APPEND |Carrier:     { carrier_id      }|             TO r_output.
*    APPEND |Connection:  { connection_id   }|             TO r_output.
*    APPEND |Departure:   { airport_from_id }|             TO r_output.
*    APPEND |Destination: { airport_to_id   }|             TO r_output.

    APPEND |--------------------------------|                    TO r_output.
    APPEND |Carrier:     { carrier_id } { details-airlinename }| TO r_output.
    APPEND |Connection:  { connection_id   }|                    TO r_output.
    APPEND |Departure: { details-departureairport }| TO r_output.
    APPEND |Destination: { details-destinationairport }| TO r_output.

  endmethod.


endclass.
