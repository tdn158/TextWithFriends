# Step 2 of analysis: Correlate rankings from Friends sentiment statistics with user polls 


# Generating Rankings from the data

sentimentList <- c("phoebe" = 1, "rachel" = 2, "chandler" = 3, "joey" = 4, "monica" = 5, "ross" = 6)
varianceList <- c("phoebe" = 1, "rachel" = 2, "chandler" = 4, "joey" = 5, "monica" = 3, "ross" = 6)
maxSentList <- c("phoebe" = 3, "rachel" = 5, "chandler" = 4, "joey" = 1, "monica" = 6, "ross" = 2)
rangeSentList <- c("phoebe" = 4, "rachel" = 5, "chandler" = 3, "joey" = 1, "monica" = 6, "ross" = 2)
minSentList <- c("phoebe" = 5, "rachel" = 2, "chandler" = 1, "joey" = 3, "monica" = 6, "ross" = 4)
seasonRankSentiment <- c("one" = 7, "two" = 8, "three" = 3, "four" = 2, "five" = 10, "six" = 1, "seven" = 6, "eight" = 4, "nine" = 5, "ten" = 9)
seasonRankVariance <- c("one" = 10, "two" = 6, "three" = 3, "four" = 8, "five" = 5, "six" = 2, "seven" = 9, "eight" = 7, "nine" = 1, "ten" = 4)
seasonRankMaxSentiment <- c("one" = 5, "two" = 10, "three" = 1, "four" = 2, "five" = 8, "six" = 4, "seven" = 9, "eight" = 3, "nine" = 6, "ten" = 7)
seasonRankRangeSentiment <- c("one" = 7, "two" = 10, "three" = 1, "four" = 2, "five" = 6, "six" = 8, "seven" = 4, "eight" = 3, "nine" = 5, "ten" = 9)

# Below are rankings from user polls

# Source  - http://www.puckermob.com/entertainment/ranking-the-friends-characters-from-least-to-most-tolerable
onlineList <- c("phoebe" = 1, "rachel" = 4, "chandler" = 2, "joey" = 3, "monica" = 5, "ross" = 6)
# Source  - http://metro.co.uk/2016/10/10/the-uks-favourite-friends-character-has-been-revealed-but-is-it-the-one-you-like-best-6183589/
onlineList2 <- c("phoebe" = 4, "rachel" = 5, "chandler" = 2, "joey" = 3, "monica" = 6, "ross" = 1)
# Source  - https://www.joe.co.uk/entertainment/the-six-main-characters-of-friends-ranked/78420
onlineList3 <- c("phoebe" = 3, "rachel" = 2, "chandler" = 1, "joey" = 4, "monica" = 5, "ross" = 6)
# Source  - http://collider.com/friends-seasons-ranked-from-worst-to-best/
seasonRankOnline <- c("one" = 9, "two" = 7, "three" = 3, "four" = 8, "five" = 2, "six" = 5, "seven" = 4, "eight" = 1, "nine" = 10, "ten" = 6)
# Source - http://www.digitalspy.com/tv/friends/feature/a669684/as-friends-turns-21-a-definitive-ranking-which-season-is-the-best/
seasonRankOnline2 <- c("one" = 10, "two" = 3, "three" = 2, "four" = 1, "five" = 4, "six" = 5, "seven" = 7, "eight" = 6, "nine" = 9, "ten" = 8)
# Source - https://www.buzzfeed.com/andyk12/the-definitive-ranking-of-friends-seasons-10-1-6cmo?utm_term=.eubN6Qd0K9#.ywxRlN6xgj
seasonRankOnline3 <- c("one" = 4, "two" = 1, "three" = 2, "four" = 3, "five" = 6, "six" = 9, "seven" = 8, "eight" = 7, "nine" = 10, "ten" = 5)

# spearman and kendall correlation for rank
cor.test(sentimentList, onlineList, method="spearman")
cor.test(sentimentList, onlineList, method="kendall")
cor.test(varianceList, onlineList, method = 'spearman')
cor.test(varianceList, onlineList, method = 'kendall')
cor.test(maxSentList, onlineList, method = "spearman")
cor.test(maxSentList, onlineList, method = "kendall")
cor.test(rangeSentList, onlineList, method = "spearman")
cor.test(rangeSentList, onlineList, method = "kendall")


cor.test(sentimentList, onlineList2, method="kendall")
cor.test(sentimentList, onlineList2, method="spearman")
cor.test(varianceList, onlineList2, method = "kendall")
cor.test(varianceList, onlineList2, method = "spearman")
cor.test(maxSentList, onlineList2, method = "kendall")
cor.test(maxSentList, onlineList2, method = "spearman")
cor.test(rangeSentList, onlineList2, method = "kendall")
cor.test(rangeSentList, onlineList2, method = "spearman")


cor.test(sentimentList, onlineList3, method = "kendall")
cor.test(sentimentList, onlineList3, method = "spearman")
cor.test(varianceList, onlineList3, method = "kendall")
cor.test(varianceList, onlineList3, method = "spearman")
cor.test(maxSentList, onlineList3, method = "kendall")
cor.test(maxSentList, onlineList3, method = "spearman")
cor.test(rangeSentList, onlineList3, method = "kendall")
cor.test(rangeSentList, onlineList3, method = "spearman")


cor.test(seasonRankOnline, seasonRankSentiment, method = "kendall")
cor.test(seasonRankOnline, seasonRankSentiment, method = "spearman")
cor.test(seasonRankVariance, seasonRankOnline, method = "kendall")
cor.test(seasonRankVariance, seasonRankOnline, method = "spearman")
cor.test(seasonRankMaxSentiment, seasonRankOnline, method = "kendall")
cor.test(seasonRankMaxSentiment, seasonRankOnline, method = "spearman")
cor.test(seasonRankRangeSentiment, seasonRankOnline, method = "kendall")
cor.test(seasonRankRangeSentiment, seasonRankOnline, method = "spearman")

cor.test(seasonRankOnline2, seasonRankSentiment, method = "kendall")
cor.test(seasonRankOnline2, seasonRankSentiment, method = "spearman")
cor.test(seasonRankOnline2, seasonRankVariance, method = "kendall")
cor.test(seasonRankOnline2, seasonRankVariance, method = "spearman")
cor.test(seasonRankMaxSentiment, seasonRankOnline2, method = "kendall")
cor.test(seasonRankMaxSentiment, seasonRankOnline2, method = "spearman")
cor.test(seasonRankRangeSentiment, seasonRankOnline2, method = "kendall")
cor.test(seasonRankRangeSentiment, seasonRankOnline2, method = "spearman")


cor.test(seasonRankOnline3, seasonRankSentiment, method = "kendall")
cor.test(seasonRankOnline3, seasonRankSentiment, method = "spearman")
cor.test(seasonRankOnline3, seasonRankVariance, method = "kendall")
cor.test(seasonRankOnline3, seasonRankVariance, method = "spearman")
cor.test(seasonRankMaxSentiment, seasonRankOnline3, method = "kendall")
cor.test(seasonRankMaxSentiment, seasonRankOnline3, method = "spearman")
cor.test(seasonRankRangeSentiment, seasonRankOnline3, method = "kendall")
cor.test(seasonRankRangeSentiment, seasonRankOnline3, method = "spearman")

cor.test(seasonRankOnline, seasonRankOnline2, method = "kendall")
cor.test(seasonRankOnline, seasonRankOnline2, method = "spearman")
cor.test(seasonRankOnline, seasonRankOnline3, method = "kendall")
cor.test(seasonRankOnline, seasonRankOnline3, method = "spearman")
cor.test(seasonRankOnline2, seasonRankOnline3, method = "kendall")
cor.test(seasonRankOnline2, seasonRankOnline3, method = "spearman")
