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

// pub fn isArmstrongNumber(num: u128) bool {
//     if (num == 0) return true;

//     // Comptage des chiffres
//     var digits: u32 = 0;
//     var temp: u128 = num;

//     while (temp != 0) {
//         digits += 1;
//         temp /= 10;
//     }

//     // Somme des chiffres élevés à la puissance digits
//     temp = num;
//     var sum: u128 = 0;

//     while (temp != 0) {
//         const digit = temp % 10;
//         sum += std.math.pow(u128, digit % 10, digits);
//         // sum += powInt(digit, digits);
//         temp /= 10;
//     }

//     return sum == num;
// }
