const std = @import("std");
const mem = std.mem;

pub fn transform(allocator: mem.Allocator, legacy: std.AutoHashMap(i5, []const u8)) mem.Allocator.Error!std.AutoHashMap(u8, i5) {
    var etl = std.AutoHashMap(u8, i5).init(allocator);
    errdefer etl.deinit();

    var iterator = legacy.iterator();
    while (iterator.next()) |letter| {
        for (letter.value_ptr.*) |l| {
            const lower = std.ascii.toLower(l);
            const val: i5 = switch (lower) {
                'a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't' => 1,
                'd', 'g' => 2,
                'b', 'c', 'm', 'p' => 3,
                'f', 'h', 'v', 'w', 'y' => 4,
                'k' => 5,
                'j', 'x' => 8,
                'q', 'z' => 10,
                else => 0,
            };
            try etl.put(lower, val);
        }
    }

    return etl;
}
