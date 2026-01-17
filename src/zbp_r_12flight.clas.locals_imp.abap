CLASS LHC_ZR_12FLIGHT DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR Flight
        RESULT result,
      validatePrice FOR VALIDATE ON SAVE
            IMPORTING keys FOR Flight~validatePrice.
ENDCLASS.

CLASS LHC_ZR_12FLIGHT IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
  METHOD validatePrice.
  DATA failed_record LIKE LINE OF failed-flight.
  DATA reported_record LIKE LINE OF REPORTED-flight.

  READ ENTITIES OF ZR_12FLIGHT IN LOCAL MODE
    ENTITY Flight
      FIELDS ( Price ) WITH CORRESPONDING #( keys )
    RESULT DATA(flights).

  LOOP AT flights INTO DATA(flight).
    IF flight-Price <= 0.
    failed_record-%tky = flight-%tky.
    APPEND failed_record to failed-flight.

    reported_record-%tky = flight-%tky.
    reported_record-%msg = new_message(
                      id       = '/LRN/S4D400'
                      number   = '101'
                      severity = ms-error ).
  APPEND reported_record TO reported-flight.
      ENDIF.

      ENDLOOP.
  ENDMETHOD.

ENDCLASS.
