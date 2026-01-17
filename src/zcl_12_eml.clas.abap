CLASS zcl_12_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_eml IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
      DATA agencies_upd TYPE TABLE FOR UPDATE /DMO/I_AgencyTP.

      agencies_upd = VALUE #( ( AgencyID = '070003' name = 'Howkins' ) ).

      MODIFY ENTITIES OF /DMO/I_AgencyTP
             ENTITY /DMO/Agency
             UPDATE FIELDS ( name )
             with agencies_upd.

      COMMIT ENTITIES.

      out->write( 'Method Execution finished!' ).


  ENDMETHOD.
ENDCLASS.
