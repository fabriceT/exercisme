const std = @import("std");

pub fn isArmstrongNumber(num: u128) bool {
    var sum: u128 = 0;

    var digits: u32 = 0;
    var temp: u128 = num;

    while (temp != 0) {
        digits += 1;
        temp /= 10;
    }

    temp = num;
    while (temp != 0) {
        sum += std.math.pow(u128, temp % 10, digits);
        temp /= 10;
    }

    return sum == num;
}
