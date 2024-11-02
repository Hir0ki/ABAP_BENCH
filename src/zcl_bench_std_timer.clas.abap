CLASS zcl_bench_std_timer DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_bench_timer .
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mo_timer TYPE REF TO if_abap_runtime.
    DATA mv_start_tmsp TYPE utclong.
    DATA mv_end_tmsp TYPE utclong.
    DATA mv_start_runtime TYPE int4.
    DATA mv_end_runtime TYPE int4.
ENDCLASS.



CLASS zcl_bench_std_timer IMPLEMENTATION.
  METHOD zif_bench_timer~start_mesurement.
    mo_timer = cl_abap_runtime=>create_hr_timer( ).
*    mv_start_tmsp = utclong_current(  ).
    mv_start_runtime = mo_timer->get_runtime( ).
  ENDMETHOD.

  METHOD zif_bench_timer~end_mesurment.

    mv_end_runtime = mo_timer->get_runtime(  ).
*    mv_start_tmsp = utclong_current(  ).
    " TODO add runtime overflow detection wtih utc timestamp
  ENDMETHOD.


  METHOD zif_bench_timer~get_last_mesurment.
    rv_runtime_in_mirco_s = mv_end_runtime - mv_start_runtime.
  ENDMETHOD.


ENDCLASS.
