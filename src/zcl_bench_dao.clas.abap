CLASS zcl_bench_dao DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS write_full_results
      IMPORTING it_results TYPE zbench_db_result_itab.
    METHODS write_benchmark_run
      IMPORTING is_benchmark_run TYPE zbench_b_run.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bench_dao IMPLEMENTATION.

  METHOD write_full_results.

    INSERT zbench_db_result FROM TABLE @it_results.

    ASSERT sy-subrc = 0.

  ENDMETHOD.


  METHOD write_benchmark_run.

    INSERT zbench_b_run FROM @is_benchmark_run.

    ASSERT sy-subcs = 0.

  ENDMETHOD.
ENDCLASS.
