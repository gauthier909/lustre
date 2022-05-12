node LossyChannel
  (rnd: real;
  brk: real;
  up: bool)
returns
  (brk_rcvd: real);

let
  brk_rcvd = (if up then brk else rnd);
tel

