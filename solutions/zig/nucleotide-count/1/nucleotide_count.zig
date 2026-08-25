pub const NucleotideError = error{Invalid};

pub const Counts = struct {
    a: u32,
    c: u32,
    g: u32,
    t: u32,
};

pub fn countNucleotides(s: []const u8) NucleotideError!Counts {
    var count = Counts{ .a = 0, .c = 0, .g = 0, .t = 0 };
    for (s) |nucleotide| {
        switch (nucleotide) {
            'A', 'a' => count.a += 1,
            'C', 'c' => count.c += 1,
            'G', 'g' => count.g += 1,
            'T', 't' => count.t += 1,
            else => return NucleotideError.Invalid,
        }
    }

    return count;
}
