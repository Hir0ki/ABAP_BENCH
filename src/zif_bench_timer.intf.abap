INTERFACE zif_bench_timer
  PUBLIC .

  METHODS start_mesurement.


  METHODS end_mesurment.

  METHODS get_last_mesurment
   RETURNING VALUE(rv_runtime_in_mirco_s) type zbench_runtime.


ENDINTERFACE.
