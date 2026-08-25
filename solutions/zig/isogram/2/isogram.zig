const std = @import("std");

pub fn isIsogram(str: []const u8) bool {
    var letters: [26]u8 = .{0} ** 26;

    if (str.len == 0) {
        return true;
    }

    for (str) |value| {
        if (std.ascii.isAlphabetic(value)) {
            const index = std.ascii.toLower(value) - 'a';
            letters[index] = letters[index] + 1;
            if (letters[index] > 1) {
                return false;
            }
        }
    }

    return true;
}
