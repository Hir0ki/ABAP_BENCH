CLASS zcl_bench_maneger DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS run_benchmark
      IMPORTING io_benchmark TYPE REF TO zif_bench_benchmark.
ENDCLASS.



CLASS zcl_bench_maneger IMPLEMENTATION.


  METHOD run_benchmark.

    DATA(lo_dao) = NEW zcl_bench_dao(  ).
    io_benchmark->mv_run_id = cl_system_uuid=>create_uuid_c32_static(  ).


    lo_dao->write_benchmark_run( is_benchmark_run = VALUE #( client = sy-mandt
      run_uuid = io_benchmark->mv_run_id
      run_status = zif_cc_bench=>mcs_bench_run_status-started
      name = io_benchmark->get_bechmark_metadata(  )-name
      version = io_benchmark->get_bechmark_metadata(  )-version
      start_time = utclong_current(  )
      interations = io_benchmark->get_bechmark_settings(  )-interations
      do_warmup = io_benchmark->get_bechmark_settings(  )-do_warmup
     ) ).


    DATA(lo_bench_executor) = NEW zcl_bench_executor(  ).

    DATA(lt_benchmark_results) = lo_bench_executor->execute_benchmark(  io_benchmark = io_benchmark ).

    "calculate statistics

    "write statistics to db

    "write full results to db


  ENDMETHOD.
ENDCLASS.
