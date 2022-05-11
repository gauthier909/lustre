node ConnectionAlarm
  (up: bool)
returns
  (alarm: bool;
  short_drop: bool;
  count_short: int;
  total: int);

var
  V17_prev_count_short: int;
  V18_prev_total: int;

let
  alarm = (if (total >= 7) then true else false);
  short_drop = (false -> (if (((count_short mod 2) = 0) and (count_short <> 0)) 
  then true else false));
  count_short = (if (not up) then (V17_prev_count_short + 1) else 0);
  total = (if (short_drop = true) then (V18_prev_total + 1) else V18_prev_total
  );
  V17_prev_count_short = (0 -> (pre count_short));
  V18_prev_total = (0 -> (pre total));
tel

