package parsinglogfiles

import "regexp"

var logPrefixRe = regexp.MustCompile(`^\s*\[(TRC|DBG|INF|WRN|ERR|FTL)\]`)
var splitPrefixRe = regexp.MustCompile(`\<[=\-~\*]*>`)
var passwordRe = regexp.MustCompile(`\"[\w\s]*(?i)password\"`)
var endoflineRe = regexp.MustCompile(`end-of-line[0-9]+`)
var userRe = regexp.MustCompile(`User\s+(?P<name>\w{6,})`)

func IsValidLine(text string) bool {
	return logPrefixRe.MatchString(text)
}

func SplitLogLine(text string) []string {
	return splitPrefixRe.Split(text, -1)
}

func CountQuotedPasswords(lines []string) int {
	var count int
	for _, s := range lines {
		if passwordRe.MatchString(s) {
			count += 1
		}
	}
	return count
}

func RemoveEndOfLineText(text string) string {
	return string(endoflineRe.ReplaceAllString(text, ""))
}

func TagWithUserName(lines []string) []string {
	var result []string
	for _, s := range lines {
		if matches := userRe.FindStringSubmatch(s); matches != nil {
			s = "[USR] " + matches[1] + " " + s
		}
		result = append(result, s)
	}
	return result
}
