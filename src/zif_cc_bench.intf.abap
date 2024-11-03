INTERFACE zif_cc_bench
  PUBLIC .

  CONSTANTS: BEGIN OF mcs_result_status,
               completed TYPE zbench_result_status VALUE 'c',
               error     TYPE zbench_result_status VALUE 'e',
               warmup    TYPE  zbench_result_status VALUE 'w',
             END OF mcs_result_status.

  CONSTANTS: BEGIN OF mcs_bench_run_status,
               started     TYPE zbench_run_status VALUE 's',
               in_progress TYPE zbench_run_status VALUE 'p',
               done        TYPE zbench_run_status VALUE 'd',
               error       TYPE zbench_run_status VALUE 'e',
             END OF mcs_bench_run_status.

ENDINTERFACE.
