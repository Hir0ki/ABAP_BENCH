CLASS zcl_benchmark_testing DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  INHERITING FROM zcl_bench_adt_runable.
  .

  PUBLIC SECTION.
    METHODS: zif_bench_benchmark~get_bechmark_metadata REDEFINITION,
      zif_bench_benchmark~get_bechmark_settings REDEFINITION,
      zif_bench_benchmark~generate_benchmark_data REDEFINITION,
      zif_bench_benchmark~execute_iteration REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_benchmark_testing IMPLEMENTATION.



  METHOD zif_bench_benchmark~execute_iteration.

  ENDMETHOD.

  METHOD zif_bench_benchmark~generate_benchmark_data.
    field-SYMBOLS <test> type SORTED TABLE.
    CREATE DATA et_data TYPE STANDARD TABLE OF zbench_metadata.
    DATA benchmark_data TYPE STANDARD TABLE OF zbench_metadata.
    benchmark_data = VALUE #( ( name = 'test' version = 1 ) ).

    CREATE DATA et_data like benchmark_data.
    et_data =  benchmark_data .

  ENDMETHOD.

  METHOD zif_bench_benchmark~get_bechmark_metadata.

  ENDMETHOD.

  METHOD zif_bench_benchmark~get_bechmark_settings.

  ENDMETHOD.

ENDCLASS.
