node MotorController
  (brk_rcvd: real;
  up: bool;
  human: real;
  speed: real;
  battery: real)
returns
  (asst_lvl: real);

var
  V38_alarm: bool;
  V78_prev_count_short: int;
  V79_prev_total: int;
  V80_prev_count_long: int;
  V81_count_short: int;
  V82_total_short: int;
  V83_count_long: int;
  V84_short_drop: bool;

let
  asst_lvl = (if V38_alarm then 0.000000 else (if (((speed <= 7.000000) and (
  battery > 0.000000)) and (brk_rcvd = 0.000000)) then human else (if (up and (
  brk_rcvd > 0.000000)) then (-brk_rcvd) else 0.000000)));
  V38_alarm = (if (V82_total_short >= 7) then true else (if (V83_count_long >= 
  10) then true else false));
  V78_prev_count_short = (0 -> (pre V81_count_short));
  V79_prev_total = (0 -> (pre V82_total_short));
  V80_prev_count_long = (0 -> (pre V83_count_long));
  V81_count_short = (if (not up) then (V78_prev_count_short + 1) else 0);
  V82_total_short = (if (V84_short_drop = true) then (V79_prev_total + 1) else 
  V79_prev_total);
  V83_count_long = (if (not up) then (V80_prev_count_long + 1) else (if (
  V80_prev_count_long >= 10) then 10 else 0));
  V84_short_drop = (false -> (if (((V81_count_short mod 2) = 0) and (
  V81_count_short <> 0)) then true else false));
tel

