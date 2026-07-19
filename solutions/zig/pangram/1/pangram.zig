const std = @import("std");

pub fn isPangram(str: []const u8) bool {
    var letters: [26]bool = .{false} ** 26;
    for (str) |value| {
        if (std.ascii.isAlphabetic(value)) {
            letters[std.ascii.toLower(value) - 'a'] = true;
        }
    }

    for (letters) |v| {
        if (!v) {
            return false;
        }
    }

    return true;
}
