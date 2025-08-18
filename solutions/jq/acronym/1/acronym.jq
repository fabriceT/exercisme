.phrase |
[ match("([a-z])[\\'a-z]*[\\s\\W]?";"ig")] |
reduce .[].captures[].string as $item ("";  . + $item | ascii_upcase)
