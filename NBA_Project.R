#NBA Team Stats Project

library(ggplot2)
library(tidyverse)

ggplot(data = NBA_teams, aes(x = Season, y = three_PA, color = Playoffs_made)) + geom_point()

playoff_logit_all <- glm(Playoffs_made ~ FG_pct + FGA + three_PM + three_PA + FTM + FT_pct + TOV + PF + ORB + DRB  + AST + STL + BLK, data = NBA_teams, family = 'binomial')
summary(playoff_logit_all)

#logistic regression with significant variables only

playoff_logit_sig <- glm(Playoffs_made ~ FTM + 
                         FGM + 
                         three_P_pct + 
                         TOV + 
                         AST + 
                         STL + 
                         DRB, data = NBA_teams, family = 'binomial')
summary(playoff_logit_sig)

#testing accuracy of logistic regression
predicted_logistic <- predict(playoff_logit_sig, type = 'response')
predicted_logistic
plot(predicted_logistic, col = NBA_teams$Playoffs_made +1)
predicted_group <- ifelse(predicted_logistic > 0.5, 1, 0)
table(actual = NBA_teams$Playoffs_made, predicted = predicted_group)

library(rpart)
library(rpart.plot)

#tree
ix = seq(1,625)
train_ix = sample(ix, 500)

NBA_training_sample = NBA_teams[train_ix,]
NBA_testing_sample = NBA_teams[-train_ix,]
NBA_teams_tree <- rpart(Playoffs_made ~ FTM + 
                          FGM + 
                          three_P_pct + 
                          TOV + 
                          AST + 
                          STL + 
                          DRB, method = 'class', data = NBA_teams)

myplot=rpart.plot(NBA_teams_tree, type = 1, extra = 101 , cex = .5)

predicted_playoffs <- predict(NBA_teams_tree, 
                              newdata = NBA_testing_sample[,-1],
                              type = 'class')
#testing accuracy of tree
table(actual = NBA_testing_sample$Playoffs_made, predicted = predicted_playoffs)


#principle component analysis
NBA_pcmodel <- prcomp(NBA_teams[,-c(1,2,3,4,5,6,7,28,29)], center = T, scale = T )
summary(NBA_pcmodel)
NBA_pcmodel

NBA_PCscores <- predict(NBA_pcmodel)
NBA_PCscores <- data.frame(NBA_PCscores)
NBA_PCscores$group <- NBA_teams$Team


ggplot(data = NBA_PCscores) +
  geom_point(mapping = aes(x = PC1, 
                           y = PC3, 
                           col = NBA_teams$Playoffs_made))

#random forest
library(randomForest)
myforest <- randomForest(as.factor(Playoffs_made) ~ FG_pct + FGA + three_PM + three_PA + FTM + FT_pct + TOV + PF + ORB + DRB  + AST + STL + BLK, mtry = 5, data = NBA_training_sample)
myforest
importance(myforest)

