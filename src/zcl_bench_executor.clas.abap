CLASS zcl_bench_executor DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS execute_benchmark
      IMPORTING io_benchmark      TYPE REF TO zif_bench_benchmark
      RETURNING VALUE(rt_results) TYPE zbench_results.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bench_executor IMPLEMENTATION.
  METHOD execute_benchmark.
    FIELD-SYMBOLS <lt_test_data> TYPE STANDARD TABLE.
    FIELD-SYMBOLS <ls_test_data> TYPE any.
    DATA ls_result LIKE LINE OF rt_results.
    DATA lv_runtime TYPE zbench_runtime.
    DATA lv_reference_id TYPE zbench_reference_id.

    DATA(ls_benchmark_settings) = io_benchmark->get_bechmark_settings( ).

    " get test data
    io_benchmark->generate_benchmark_data( EXPORTING iv_amount = CONV #( ls_benchmark_settings-interations )
                                           IMPORTING et_data   = <lt_test_data>  ).

    " warmup

    IF ls_benchmark_settings-do_warmup EQ abap_true.
      DATA(lo_timer) = NEW zcl_bench_std_timer( ).
      DATA(lv_last_index) = lines( <lt_test_data> ).
      ASSIGN <lt_test_data>[ lv_last_index ] TO <ls_test_data>.
      lv_runtime = io_benchmark->execute_iteration( EXPORTING it_data  = <lt_test_data>
                                                 io_timer = lo_timer
                                                  IMPORTING ev_reference_id = lv_reference_id ).
      APPEND VALUE zbench_result( status = zif_cc_bench=>mcs_result_status-warmup
                                  runtime = lv_runtime
                                  reference_id = lv_reference_id  ) TO rt_results.
    ENDIF.
    " run benchmark
    LOOP AT <lt_test_data> ASSIGNING <ls_test_data>.
      lo_timer = NEW zcl_bench_std_timer( ).
      lv_runtime = io_benchmark->execute_iteration( EXPORTING it_data         = <ls_test_data>
                                                                    io_timer        = lo_timer
                                                          IMPORTING ev_reference_id = lv_reference_id ).
      APPEND VALUE zbench_result( runtime      = lv_runtime
                                  status       = zif_cc_bench=>mcs_result_status-completed
                                  reference_id = lv_reference_id  ) TO rt_results.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
