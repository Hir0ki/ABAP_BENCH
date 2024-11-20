INTERFACE zif_bench_benchmark
  PUBLIC .

  DATA mv_run_id TYPE zbench_run_id.

  METHODS get_bechmark_metadata
    RETURNING VALUE(rs_bechmark_metadata) TYPE zbench_metadata.

  METHODS get_bechmark_settings
    RETURNING VALUE(rs_benchmark_settings) TYPE zbench_settings.



  METHODS generate_benchmark_data
    IMPORTING iv_amount TYPE int8
    EXPORTING et_data   TYPE any
    RAISING   zcx_bench_benchmark_error.

  METHODS execute_iteration
    IMPORTING it_data           TYPE any
              io_timer          TYPE REF TO zif_bench_timer
    EXPORTING ev_reference_id   TYPE zbench_reference_id
    RETURNING VALUE(rv_runtime) TYPE zbench_runtime
    RAISING   zcx_bench_benchmark_error.

ENDINTERFACE.
