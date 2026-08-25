const std = @import("std");
const mem = std.mem;

pub fn toRna(allocator: mem.Allocator, dna: []const u8) mem.Allocator.Error![]const u8 {
    const rna = try allocator.alloc(u8, dna.len);
    errdefer allocator.free(rna);

    for (dna, 0..) |c, i| {
        rna[i] = switch (c) {
            'G' => 'C',
            'C' => 'G',
            'T' => 'A',
            'A' => 'U',
            else => unreachable,
        };
    }

    return rna;
}
