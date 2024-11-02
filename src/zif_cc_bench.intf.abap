INTERFACE zif_cc_bench
  PUBLIC .

  CONSTANTS: BEGIN OF mcs_result_status,
               completed TYPE zbench_result_status VALUE 'c',
               error     TYPE zbench_result_status VALUE 'e',
               warmup    TYPE  zbench_result_status VALUE 'w',
             END OF mcs_result_status.

ENDINTERFACE.
