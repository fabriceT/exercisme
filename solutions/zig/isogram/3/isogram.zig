const std = @import("std");

pub fn isIsogram(str: []const u8) bool {
    var letters: [26]bool = .{false} ** 26;

    for (str) |value| {
        if (std.ascii.isAlphabetic(value)) {
            const index = std.ascii.toLower(value) - 'a';
            if (letters[index]) {
                return false;
            }
            letters[index] = true;
        }
    }

    return true;
}
