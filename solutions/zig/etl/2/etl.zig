const std = @import("std");
const mem = std.mem;

pub fn transform(allocator: mem.Allocator, legacy: std.AutoHashMap(i5, []const u8)) mem.Allocator.Error!std.AutoHashMap(u8, i5) {
    var etl = std.AutoHashMap(u8, i5).init(allocator);
    errdefer etl.deinit();

    var iterator = legacy.iterator();
    while (iterator.next()) |letter| {
        for (letter.value_ptr.*) |l| {
            try etl.put(std.ascii.toLower(l), letter.key_ptr.*);
        }
    }

    return etl;
}
