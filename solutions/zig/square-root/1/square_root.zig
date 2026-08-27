pub fn squareRoot(radicand: usize) usize {
    if (radicand == 0) return 0;
    if (radicand == 1) return 1;

    var x: usize = radicand / 2 + 1;
    while (true) {
        const next_x = (x + radicand / x) >> 1;
        if (next_x >= x) return x;

        x = next_x;
    }
}
