pub const HighScores = struct {
    game_scores: [3]i32,
    // This struct, as well as its fields and methods, needs to be implemented.
    last_score: i32,

    pub fn init(scores: []const i32) HighScores {
        var init_last: i32 = 0;
        var init_top = [3]i32{ 0, 0, 0 };

        for (scores) |score| {
            init_last = score;

            if (score > init_top[0]) {
                init_top[2] = init_top[1];
                init_top[1] = init_top[0];
                init_top[0] = score;
            } else if (score > init_top[1]) {
                init_top[2] = init_top[1];
                init_top[1] = score;
            } else if (score > init_top[2]) {
                init_top[2] = score;
            }
        }

        return HighScores{
            .last_score = init_last,
            .game_scores = init_top,
        };
    }

    pub fn latest(self: *const HighScores) ?i32 {
        return self.last_score;
    }

    pub fn personalBest(self: *const HighScores) ?i32 {
        return self.game_scores[0];
    }

    pub fn personalTopThree(self: *const HighScores) []const i32 {
        for (self.game_scores, 1..) |score, i| {
            if (score == 0) return self.game_scores[0 .. i - 1];
        }

        return &self.game_scores;
    }
};
