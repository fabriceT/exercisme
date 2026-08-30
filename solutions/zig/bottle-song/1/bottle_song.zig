const std = @import("std");

fn numberToWord(count: u32) []const u8 {
    return switch (count) {
        1 => "One",
        2 => "Two",
        3 => "Three",
        4 => "Four",
        5 => "Five",
        6 => "Six",
        7 => "Seven",
        8 => "Eight",
        9 => "Nine",
        10 => "Ten",
        else => unreachable,
    };
}

fn numberToWordLower(count: u32) []const u8 {
    return switch (count) {
        1 => "one",
        2 => "two",
        3 => "three",
        4 => "four",
        5 => "five",
        6 => "six",
        7 => "seven",
        8 => "eight",
        9 => "nine",
        10 => "ten",
        else => unreachable,
    };
}

pub fn recite(buffer: []u8, start_bottles: u32, take_down: u32) ![]const u8 {
    if (start_bottles == 0 or take_down == 0 or take_down > start_bottles) {
        return error.InvalidInput;
    }

    var writer = std.Io.Writer.fixed(buffer);

    const end_bottles = start_bottles - take_down;
    var current_bottle = start_bottles;

    while (current_bottle > end_bottles) {
        const bottles_asc = numberToWord(current_bottle);

        if (current_bottle < start_bottles) {
            try writer.writeByte('\n');
            try writer.writeByte('\n');
        }

        const bottle_str = if (current_bottle == 1) "bottle" else "bottles";

        try writer.print("{s} green {s} hanging on the wall,\n", .{ bottles_asc, bottle_str });
        try writer.print("{s} green {s} hanging on the wall,\n", .{ bottles_asc, bottle_str });

        try writer.print("And if one green bottle should accidentally fall,\n", .{});

        current_bottle -= 1;

        if (current_bottle == 0) {
            try writer.print("There'll be no green bottles hanging on the wall.", .{});
        } else {
            const next_word_lower = numberToWordLower(current_bottle);
            const next_bottle_str = if (current_bottle == 1) "bottle" else "bottles";

            try writer.print("There'll be {s} green {s} hanging on the wall.", .{ next_word_lower, next_bottle_str });
        }
    }
    return writer.buffered();
}
