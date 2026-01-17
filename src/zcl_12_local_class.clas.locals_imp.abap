*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
class lcl_connection definition.

  public section.

  data carrier_id TYPE /DMO/CARRIER_ID.
  data connection_id TYPE /DMO/CONNECTION_ID.
  CLASS-DATA conn_counter TYPE i.

  protected  section.
  private section.

endclass.

class lcl_connection implementation.

endclass.
