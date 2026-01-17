CLASS zcl_12_sturctred_data_types DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_sturctred_data_types IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  DATA connection_full type /dmo/i_connection.

  SELECT SINGLE
         from /DMO/I_Connection
         FIELDS AirlineID, ConnectionID, DepartureAirport, DestinationAirport,
                DepartureTime, ArrivalTime, Distance, DistanceUnit
         WHERE AirlineID = 'LH'
         and ConnectionID = '0400'
         INTO @connection_full.

  out->write(  `--------------------------------------` ).
  out->write(  `Example 1: CDS View as Structured Type` ).
  out->write( connection_full ).

  data message TYPE symsg.

   out->write(  `---------------------------------` ).
    out->write(  `Example 2: Global Structured Type` ).
    out->write( message ).

  TYPES : BEGIN OF st_connection,
          airport_from_id type /dmo/airport_from_id,
          airport_to_id TYPE /dmo/airport_to_id,
          carrier_name TYPE /dmo/carrier_name,
          END OF st_connection.

  data connection type st_connection.

  SELECT SINGLE
         from /DMO/I_Connection
         FIELDS DepartureAirport, DestinationAirport, \_Airline-Name
         WHERE AirlineID = 'LH'
         AND ConnectionID = '0400'
         INTO @connection.

  out->write(  `---------------------------------------` ).
    out->write(  `Example 3: Local Structured Type` ).
    out->write( connection ).


  TYPES: BEGIN OF st_nested,
          airport_from_id type /dmo/airport_from_id,
          airport_to_id TYPE /dmo/airport_to_id,
          message TYPE symsg,
          carrier_name TYPE /dmo/carrier_name,
          END OF ST_NESTED.

   data connection_nested TYPE st_nested.

   out->write(  `---------------------------------` ).
    out->write(  `Example 4: Nested Structured Type` ).
    out->write( connection_nested ).
  ENDMETHOD.
ENDCLASS.
