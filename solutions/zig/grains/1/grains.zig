pub const ChessboardError = error{
    IndexOutOfBounds,
};

pub fn square(index: usize) ChessboardError!u64 {
    if (index <= 0 or index > 64) return ChessboardError.IndexOutOfBounds;

    return @as(u64, 1) << @intCast(index - 1);
}

pub fn total() u64 {
    var sum: u64 = 0;
    for (0..65) |i| {
        sum += square(i) catch 0;
    }
    return sum;
}
