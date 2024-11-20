CLASS zcl_bench_adt_runable DEFINITION
  PUBLIC
  ABSTRACT
   .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

    INTERFACES zif_bench_benchmark ALL METHODS ABSTRACT.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bench_adt_runable IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    data(lo_manager) = new zcl_bench_maneger(  ).

    lo_manager->run_benchmark( me ).

  ENDMETHOD.

ENDCLASS.
