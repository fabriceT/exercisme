const std = @import("std");

pub fn response(s: []const u8) []const u8 {
    const sentence = std.mem.trim(u8, s, "\n\t\r ");

    var isUpperCase: bool = true;
    var isQuestion: bool = false;
    var isSentence: bool = false;

    if (sentence.len == 0) return "Fine. Be that way!";

    if (sentence[sentence.len - 1] == '?') isQuestion = true;

    for (sentence) |c| {
        if (isUpperCase and std.ascii.isAlphabetic(c) and std.ascii.isLower(c)) {
            isUpperCase = false;
        }

        if (std.ascii.isAlphabetic(c)) isSentence = true;
    }

    if (isUpperCase and isSentence) {
        if (isQuestion) {
            return "Calm down, I know what I'm doing!";
        } else {
            return "Whoa, chill out!";
        }
    } else if (isQuestion) {
        return "Sure.";
    }

    return "Whatever.";
}
