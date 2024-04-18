# MATH-503-NBA-Project
- Final Project for my Senior Seminar in Statistics @ Hamilton College  
- Research Question: What makes a playoff-caliber NBA team?
- Completed: Fall 2020

## Steps to Reproduce
1. R version: 4.0.2
2. Dataset: NBA_teams.csv  
    - Source: https://www.nba.com/stats/teams/traditional  
    - We built our dataset from taking season-long summary statistics for each team from years 2000-2020.  
    - Each statistic reports the average for the team per game in that season.  
    - Next, we added a binary variable, 'Playoffs_Made', to denote whether the team made (1) or did not make (0) the playoffs that year  
4. Libraries: ggplot2, tidyverse, rpart, rpart.plot, randomForest
5. Code: NBA_Project.R
