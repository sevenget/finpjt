# finalpjt
library(rJava)
library(memoise)
library(KoNLP)
library(dplyr)
library(stringr)

useNIADic()

# 데이터 불러오기
getwd()
setwd("C:/workspace/R/")
txt <- readLines("hiphop.txt")
head(txt)

# 특수문자 제거
txt <- str_replace_all(txt, "\\W", " ")

# 가사에서 명사 추출
nouns <- extractNoun(txt)

# 추출한 명사 list를 문자열 벡터로 변환, 단어별 빈도표 생성
wordcount <- table(unlist(nouns))

# 데이터 프레임으로 변환
df_word <- as.data.frame(wordcount, stringsAsFactors = F)

# 변수명 수정
df_word <- rename(df_word,
                  word = Var1,
                  freq = Freq)

# 두 글자 이상 단어 추출
df_word <- filter(df_word, nchar(word) >= 2)

top_20 <- df_word %>%
  arrange(desc(freq)) %>%
  head(20)
top_20

library(wordcloud)
library(RColorBrewer)

pal <- brewer.pal(8, "Dark2")

set.seed(1)
setwd("C:/workspace/spring/sevenget/src/main/webapp/resources/img")
png(filename = 'wordcloud.png', width = 510, height = 400)
wordcloud(words = df_word$word, #단어
          freq = df_word$freq, #빈도
          min.freq = 2, # 최소 단어 빈도
          max.words = 200, # 표현 단어 수
          random.order = F, # 고빈도 단어 중앙 배치
          rot.per = .1, # 회전 단어 비율
          scale = c(4, 0.3), # 단어 크기 범위
          colors = pal) # 색상 목록

#dev.copy (png, 'wordcloud.png')
dev.off ()



# require(devtools)
# install_github("lchiffon/wordcloud2")
# library(wordcloud2)
# wordcloud_img <- wordcloud2(data = df_word[,c("word","freq")],
#                             size = 1,
#                             fontWeight = "normal",
#                             color = "random-light",
#                             minSize = 2,
#                             backgroundColor = "white",
#                             # gridSize = 10, # 문자간 간격
#                             minRotation = 10,
#                             maxRotation = 100,
#                             rotateRatio = .1,
#                             shape = "circle")
# wordcloud_img
