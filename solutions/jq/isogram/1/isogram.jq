.phrase | ascii_downcase
| [ match("\\w"; "gm") | .string ] | add  // ""
| explode
| group_by(.)
| map(select(. |length > 1))
| length == 0
