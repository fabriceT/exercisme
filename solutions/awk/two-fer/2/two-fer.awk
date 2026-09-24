BEGIN {
    printf("One for %s, one for me.\n", ARGC > 1 ? ARGV[1] : "you")
}
