const std = @import("std");

pub fn isPangram(str: []const u8) bool {
    var seen: u32 = 0; // bitmap des 26 lettres

    for (str) |c| {
        const lower = std.ascii.toLower(c);
        if (lower >= 'a' and lower <= 'z') {
            seen |= @as(u32, 1) << @intCast(lower - 'a');
        }
    }

    return seen == 0x3FFFFFF; // bits 0..25 tous à 1
}
