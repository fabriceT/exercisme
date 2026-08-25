const std = @import("std");

pub fn squareOfSum(number: usize) usize {
    // var sum: usize = 0;
    // for (1..number + 1) |val| {
    //     sum += val;
    // }
    const sum = (number * (number + 1)) / 2;
    return sum * sum;
}

pub fn sumOfSquares(number: usize) usize {
    var sum: usize = 0;
    for (1..number + 1) |val| {
        sum += val * val;
    }
    return sum;
}

pub fn differenceOfSquares(number: usize) usize {
    return squareOfSum(number) - sumOfSquares(number);
}
