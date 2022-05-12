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
  V79_prev_count_short: int;
  V80_prev_total: int;
  V81_prev_count_long: int;
  V82_count_short: int;
  V83_total_short: int;
  V84_count_long: int;
  V85_short_drop: bool;

let
  asst_lvl = (if V38_alarm then 0.000000 else (if ((human <= 7.000000) and (
  battery > 0.000000)) then human else (if (human > 7.000000) then 7.000000 
  else 3.000000)));
  V38_alarm = (if (V83_total_short >= 7) then true else (if (V84_count_long >= 
  10) then true else false));
  V79_prev_count_short = (0 -> (pre V82_count_short));
  V80_prev_total = (0 -> (pre V83_total_short));
  V81_prev_count_long = (0 -> (pre V84_count_long));
  V82_count_short = (if (not up) then (V79_prev_count_short + 1) else 0);
  V83_total_short = (if (V85_short_drop = true) then (V80_prev_total + 1) else 
  V80_prev_total);
  V84_count_long = (if (not up) then (V81_prev_count_long + 1) else (if (
  V81_prev_count_long >= 10) then 10 else 0));
  V85_short_drop = (false -> (if (((V82_count_short mod 2) = 0) and (
  V82_count_short <> 0)) then true else false));
tel

