package highscores

import "slices"

type HighScores struct {
	scores []int
}

// NewHighScores returns a new HighScores object.
func NewHighScores(scores []int) *HighScores {
	temp := make([]int, len(scores))
	copy(temp, scores)

	return &HighScores{scores: temp}
}

// Scores returns all the scores.
func (s *HighScores) Scores() []int {
	return s.scores
}

// Latest returns the latest (last) score.
func (s *HighScores) Latest() int {
	if len(s.scores) == 0 {
		return 0
	}
	return s.scores[len(s.scores)-1]
}

// PersonalBest returns the best (highest) score.
func (s *HighScores) PersonalBest() int {
	if len(s.scores) == 0 {
		return 0
	}
	return slices.Max(s.scores)
}

// TopThree returns the top three scores.
func (s *HighScores) TopThree() []int {
	if len(s.scores) == 0 {
		return []int{}
	}

	temp := make([]int, len(s.scores))
	copy(temp, s.scores)

	slices.SortFunc(temp, func(a, b int) int {
		return b - a
	})

	count := 3
	if len(temp) < count {
		count = len(temp)
	}

	return temp[:count]
}
