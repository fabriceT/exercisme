const std = @import("std");
const mem = std.mem;

fn ordinalSuffix(n: u10) []const u8 {
    const last_two = n % 100;
    if (last_two >= 11 and last_two <= 13) {
        return "th"; // 11th, 12th, 13th, 111th, 112th, 113th, etc.
    }
    switch (n % 10) {
        1 => return "st",
        2 => return "nd",
        3 => return "rd",
        else => return "th",
    }
}

pub fn format(allocator: mem.Allocator, name: []const u8, number: u10) ![]u8 {
    const suffix = ordinalSuffix(number);
    return std.fmt.allocPrint(allocator, "{s}, you are the {d}{s} customer we serve today. Thank you!", .{ name, number, suffix });
}
