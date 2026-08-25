const std = @import("std");

pub fn convert(buffer: []u8, n: u32) []const u8 {
    var idx: u8 = 0;

    if (n % 3 == 0) {
        @memcpy(buffer[idx..][0..5], "Pling");
        idx += 5;
    }
    if (n % 5 == 0) {
        @memcpy(buffer[idx..][0..5], "Plang");
        idx += 5;
    }
    if (n % 7 == 0) {
        @memcpy(buffer[idx..][0..5], "Plong");
        idx += 5;
    }

    if (idx > 0) {
        return buffer[0..idx];
    }

    return std.fmt.bufPrint(buffer, "{d}", .{n}) catch buffer[0..0];
}
