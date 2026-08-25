const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    var set = std.AutoHashMap(u32, void).init(allocator);
    defer set.deinit();

    if (limit <= 1 or factors.len == 0) return 0;

    for (factors) |factor| {
        if (factor == 0) continue;

        var val = factor;
        while (val < limit) : (val += factor) {
            if (val % factor == 0) {
                try set.put(val, {});
            }
        }
    }

    var total: u64 = 0;
    var iterator = set.keyIterator();
    while (iterator.next()) |key| {
        total += @intCast(key.*);
    }

    return total;
}
