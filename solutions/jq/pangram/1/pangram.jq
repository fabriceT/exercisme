.sentence
| explode
| map(if 65 <= . and . <= 90 then . + 32  else . end)
| map (select(. >= 97 and . <= 122))
| unique
| implode
| length == 26
