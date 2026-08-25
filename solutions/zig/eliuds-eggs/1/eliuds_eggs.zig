pub fn eggCount(number: usize) usize {
    var temp = number;
    var count: usize = 0;
    while (temp > 0) {
        if (temp & 1 == 1) count += 1;
        temp = temp >> 1;
    }

    return count;
}
