const std = @import("std");
const EnumSet = std.EnumSet;

pub const Allergen = enum {
    eggs,
    peanuts,
    shellfish,
    strawberries,
    tomatoes,
    chocolate,
    pollen,
    cats,
};

pub fn isAllergicTo(score: u8, allergen: Allergen) bool {
    const mask: u8 = @as(u8, 1) << @intFromEnum(allergen);
    return (score & mask) != 0;
}

pub fn initAllergenSet(score: usize) EnumSet(Allergen) {
    var set = EnumSet(Allergen).empty;

    const count = std.meta.fields(Allergen).len;

    for (0..count) |idx| {
        const bit_mask = @as(usize, 1) << @intCast(idx);

        if (score & bit_mask != 0) {
            const allergen = @as(Allergen, @enumFromInt(idx));
            set.insert(allergen);
        }
    }

    return set;
}
