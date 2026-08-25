const std = @import("std");

pub fn twoFer(buffer: []u8, name: ?[]const u8) ![]u8 {
    var writer = std.Io.Writer.fixed(buffer);

    try writer.writeAll("One for ");
    try writer.writeAll(name orelse "you");
    try writer.writeAll(", one for me.");

    return writer.buffered();
}
