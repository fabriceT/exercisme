const std = @import("std");

pub fn score(s: []const u8) u32 {
    var total: u8 = 0;

    for (s) |c| {
        switch (std.ascii.toLower(c)) {
            'a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't' => total += 1,
            'd', 'g' => total += 2,
            'b', 'c', 'm', 'p' => total += 3,
            'f', 'h', 'v', 'w', 'y' => total += 4,
            'k' => total += 5,
            'j', 'x' => total += 8,
            'q', 'z' => total += 10,
            else => {},
        }
    }

    return total;
}
