pub fn isIsogram(str: []const u8) bool {
    var letters: [26]u8 = .{0} ** 26;

    for (s) |value| {
        if (!std.ascii.isAlphabetic(value)) {
            continue;
        }

        const index = std.ascii.toLower(value) - 'a';
        if (letters[index] > 1) {
            return true;
        }
    }

    return false;
}
