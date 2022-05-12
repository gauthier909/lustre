node BrakeCableActuator
  (brk: real;
  up: bool)
returns
  (clinch: bool);

var
  V25_alarm: bool;
  V56_prev_count_short: int;
  V57_prev_total: int;
  V58_prev_count_long: int;
  V59_count_short: int;
  V60_total_short: int;
  V61_count_long: int;
  V62_short_drop: bool;

let
  clinch = (if (brk = 0.000000) then false else (if (brk > 1.000000) then true 
  else (if (((brk <= 1.000000) and (V25_alarm = true)) and (brk >= 0.000000)) 
  then true else false)));
  V25_alarm = (if (V60_total_short >= 7) then true else (if (V61_count_long >= 
  10) then true else false));
  V56_prev_count_short = (0 -> (pre V59_count_short));
  V57_prev_total = (0 -> (pre V60_total_short));
  V58_prev_count_long = (0 -> (pre V61_count_long));
  V59_count_short = (if (not up) then (V56_prev_count_short + 1) else 0);
  V60_total_short = (if (V62_short_drop = true) then (V57_prev_total + 1) else 
  V57_prev_total);
  V61_count_long = (if (not up) then (V58_prev_count_long + 1) else (if (
  V58_prev_count_long >= 10) then 10 else 0));
  V62_short_drop = (false -> (if (((V59_count_short mod 2) = 0) and (
  V59_count_short <> 0)) then true else false));
tel

