const std = @import("std");
const mem = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var list: std.ArrayList(u8) = .empty;
    defer list.deinit(allocator);

    var it = std.mem.tokenizeAny(u8, words, "_- ");

    while (it.next()) |word| {
        try list.append(allocator, std.ascii.toUpper(word[0]));
    }

    return try list.toOwnedSlice(allocator);
}
