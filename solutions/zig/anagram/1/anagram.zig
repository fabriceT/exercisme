const std = @import("std");
const mem = std.mem;

const LetterFrequencies = struct {
    counts: [26]u8,

    fn init() LetterFrequencies {
        return .{ .counts = [_]u8{0} ** 26 };
    }

    fn compute(word: []const u8) LetterFrequencies {
        var freq = LetterFrequencies.init();
        for (word) |letter| {
            if (std.ascii.isAlphabetic(letter)) {
                const lower = std.ascii.toLower(letter);
                const index = lower - 'a';
                if (index < 26) {
                    freq.counts[index] += 1;
                }
            }
        }
        return freq;
    }

    fn eql(self: LetterFrequencies, other: LetterFrequencies) bool {
        return mem.eql(u8, &self.counts, &other.counts);
    }
};

/// Returns the set of strings in `candidates` that are anagrams of `word`.
/// Caller owns the returned memory.
pub fn detectAnagrams(
    allocator: mem.Allocator,
    word: []const u8,
    candidates: []const []const u8,
) !std.BufSet {
    var result = std.BufSet.init(allocator);
    errdefer result.deinit();

    const word_freq = LetterFrequencies.compute(word);

    for (candidates) |candidate| {
        if (mem.eql(u8, word, candidate)) {
            continue;
        }

        const candidate_freq = LetterFrequencies.compute(candidate);
        if (!std.ascii.eqlIgnoreCase(word, candidate) and word_freq.eql(candidate_freq)) {
            try result.insert(candidate);
        }
    }
    return result;
}
