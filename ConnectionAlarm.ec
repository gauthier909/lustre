node ConnectionAlarm
  (up: bool)
returns
  (alarm: bool);

var
  V14_prev_count_short: int;
  V15_prev_total: int;
  V16_prev_count_long: int;
  V17_count_short: int;
  V18_total_short: int;
  V19_count_long: int;
  V20_short_drop: bool;

let
  alarm = (if (V18_total_short >= 7) then true else (if (V19_count_long >= 10) 
  then true else false));
  V14_prev_count_short = (0 -> (pre V17_count_short));
  V15_prev_total = (0 -> (pre V18_total_short));
  V16_prev_count_long = (0 -> (pre V19_count_long));
  V17_count_short = (if (not up) then (V14_prev_count_short + 1) else 0);
  V18_total_short = (if (V20_short_drop = true) then (V15_prev_total + 1) else 
  V15_prev_total);
  V19_count_long = (if (not up) then (V16_prev_count_long + 1) else (if (
  V16_prev_count_long >= 10) then 10 else 0));
  V20_short_drop = (false -> (if (((V17_count_short mod 2) = 0) and (
  V17_count_short <> 0)) then true else false));
tel

