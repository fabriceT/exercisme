# test is value is equals to its uppercase version and if it contains letters
def is_upper_case:
    . == (. | ascii_upcase) and (. | test("[A-Z]+"))
;

def question:
    if . | is_upper_case  then
        "Calm down, I know what I'm doing!"
    else
        "Sure."
    end
;

.heyBob as $bob |
if $bob | test(".*\\?\\s*$") then
    $bob | question
elif $bob | is_upper_case then
    "Whoa, chill out!"
elif ($bob | sub("\\W"; ""; "g")) == "" then
    "Fine. Be that way!"
else
    "Whatever."
end
