def w:
  if (. | type) == "array" then .[] | w
  elif . == null then empty
  else
    .
  end
;

[.array | w ]
