node System
  (up: bool;
  rnd: real;
  brk: real;
  human: real;
  speed: real;
  battery: real)
returns
  (clinch: bool;
  asst_lvl: real);

var
  V48_alarm: bool;
  V49_isRegenBraking: bool;
  V50_brk_rcvd: real;
  V51_isHumanRequest: bool;
  V52_check_assist_level: bool;
  V53_isAssisting: bool;
  V54_isBraking: bool;
  V55_assistAndBreak: bool;
  V155_prev_count_short: int;
  V156_prev_total: int;
  V157_prev_count_long: int;
  V158_count_short: int;
  V159_total_short: int;
  V160_count_long: int;
  V161_short_drop: bool;
  V178_alarm: bool;
  V179_prev_count_short: int;
  V180_prev_total: int;
  V181_prev_count_long: int;
  V182_count_short: int;
  V183_total_short: int;
  V184_count_long: int;
  V185_short_drop: bool;
  V212_alarm: bool;
  V213_prev_count_short: int;
  V214_prev_total: int;
  V215_prev_count_long: int;
  V216_count_short: int;
  V217_total_short: int;
  V218_count_long: int;
  V219_short_drop: bool;

let
  assert (not (V48_alarm and V49_isRegenBraking));
  assert (not ((not V51_isHumanRequest) and V49_isRegenBraking));
  assert V52_check_assist_level;
  clinch = (if (brk = 0.000000) then false else (if (brk > 1.000000) then true 
  else (if (((brk <= 1.000000) and (V178_alarm = true)) and (brk >= 0.000000)) 
  then true else false)));
  asst_lvl = (if V212_alarm then 0.000000 else (if (((speed <= 7.000000) and (
  battery > 0.000000)) and (V50_brk_rcvd = 0.000000)) then human else (if (up 
  and (V50_brk_rcvd > 0.000000)) then (-V50_brk_rcvd) else 0.000000)));
  V48_alarm = (if (V159_total_short >= 7) then true else (if (V160_count_long 
  >= 10) then true else false));
  V49_isRegenBraking = (if (asst_lvl < 0.000000) then true else false);
  V50_brk_rcvd = (if up then brk else rnd);
  V51_isHumanRequest = (if ((asst_lvl < 0.000000) and (V50_brk_rcvd <> rnd)) 
  then true else false);
  V52_check_assist_level = (if (((asst_lvl = 0.000000) or (asst_lvl = (-brk))) 
  or (asst_lvl = human)) then true else false);
  V53_isAssisting = (if (asst_lvl > 0.000000) then true else false);
  V54_isBraking = (if ((brk > 0.000000) and (V50_brk_rcvd <> rnd)) then true 
  else false);
  V55_assistAndBreak = (if (V54_isBraking and V53_isAssisting) then true else 
  false);
  V155_prev_count_short = (0 -> (pre V158_count_short));
  V156_prev_total = (0 -> (pre V159_total_short));
  V157_prev_count_long = (0 -> (pre V160_count_long));
  V158_count_short = (if (not up) then (V155_prev_count_short + 1) else 0);
  V159_total_short = (if (V161_short_drop = true) then (V156_prev_total + 1) 
  else V156_prev_total);
  V160_count_long = (if (not up) then (V157_prev_count_long + 1) else (if (
  V157_prev_count_long >= 10) then 10 else 0));
  V161_short_drop = (false -> (if (((V158_count_short mod 2) = 0) and (
  V158_count_short <> 0)) then true else false));
  V178_alarm = (if (V183_total_short >= 7) then true else (if (V184_count_long 
  >= 10) then true else false));
  V179_prev_count_short = (0 -> (pre V182_count_short));
  V180_prev_total = (0 -> (pre V183_total_short));
  V181_prev_count_long = (0 -> (pre V184_count_long));
  V182_count_short = (if (not up) then (V179_prev_count_short + 1) else 0);
  V183_total_short = (if (V185_short_drop = true) then (V180_prev_total + 1) 
  else V180_prev_total);
  V184_count_long = (if (not up) then (V181_prev_count_long + 1) else (if (
  V181_prev_count_long >= 10) then 10 else 0));
  V185_short_drop = (false -> (if (((V182_count_short mod 2) = 0) and (
  V182_count_short <> 0)) then true else false));
  V212_alarm = (if (V217_total_short >= 7) then true else (if (V218_count_long 
  >= 10) then true else false));
  V213_prev_count_short = (0 -> (pre V216_count_short));
  V214_prev_total = (0 -> (pre V217_total_short));
  V215_prev_count_long = (0 -> (pre V218_count_long));
  V216_count_short = (if (not up) then (V213_prev_count_short + 1) else 0);
  V217_total_short = (if (V219_short_drop = true) then (V214_prev_total + 1) 
  else V214_prev_total);
  V218_count_long = (if (not up) then (V215_prev_count_long + 1) else (if (
  V215_prev_count_long >= 10) then 10 else 0));
  V219_short_drop = (false -> (if (((V216_count_short mod 2) = 0) and (
  V216_count_short <> 0)) then true else false));
tel

