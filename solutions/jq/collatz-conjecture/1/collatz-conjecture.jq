def steps:
  if . <= 0 then "Only positive integers are allowed" | halt_error end |
  [ while(
    . > 1 ;
    if . % 2 == 0 then
      . / 2
    else
      . * 3 + 1
    end
  ) ] | length // 0
;
