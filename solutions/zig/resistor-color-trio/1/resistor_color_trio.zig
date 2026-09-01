const std = @import("std");
const mem = std.mem;

pub const ColorBand = enum(u8) {
    black = 0,
    brown = 1,
    red = 2,
    orange = 3,
    yellow = 4,
    green = 5,
    blue = 6,
    violet = 7,
    grey = 8,
    white = 9,
};

pub fn label(allocator: mem.Allocator, colors: []const ColorBand) mem.Allocator.Error![]u8 {
    const value: usize = @intFromEnum(colors[0]) * 10 + @intFromEnum(colors[1]);

    var idx: u8 = 0;
    var multiplier: usize = 1;
    while (idx < @intFromEnum(colors[2])) : (idx += 1) {
        multiplier *= 10;
    }

    const total_value = value * multiplier;
    var display_value: f64 = 0;
    var unit: []const u8 = "";

    if (total_value >= 1_000_000_000) {
        unit = "gigaohms";
        display_value = @as(f64, @floatFromInt(total_value)) / 1_000_000_000.0;
    } else if (total_value >= 1_000_000) {
        unit = "megaohms";
        display_value = @as(f64, @floatFromInt(total_value)) / 1_000_000.0;
    } else if (total_value >= 1_000) {
        unit = "kiloohms";
        display_value = @as(f64, @floatFromInt(total_value)) / 1_000.0;
    } else {
        unit = "ohms";
        display_value = @as(f64, @floatFromInt(total_value));
    }

    if (display_value == @floor(display_value)) {
        return std.fmt.allocPrint(allocator, "{d:.0} {s}", .{ display_value, unit });
    } else {
        return std.fmt.allocPrint(allocator, "{d} {s}", .{ display_value, unit });
    }
}
