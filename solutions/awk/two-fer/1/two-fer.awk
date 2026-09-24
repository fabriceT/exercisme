BEGIN {
   name="you"
}
{
    if ($1) {
        name = $1
    }
    printf("One for %s, one for me.", name)
}
