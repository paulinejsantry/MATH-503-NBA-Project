# MATH-503-NBA-Project
- Final Project for my Senior Seminar in Statistics @ Hamilton College  
- Research Question: What makes a playoff-caliber NBA team?
- Completed: Fall 2020

## Steps to Reproduce
1. R version: 4.0.2
2. Libraries: ggplot2, tidyverse, rpart, rpart.plot, randomForest
3. Dataset: NBA_teams.csv  
    - Source: https://www.nba.com/stats/teams/traditional  
    - We built our dataset from taking season-long summary statistics for each team from years 2000-2020.  
    - Each statistic reports the average for the team per game in that season.  
    - Next, we added a binary variable, 'Playoffs_Made', to denote whether the team made (1) or did not make (0) the playoffs that year  
5. Code: NBA_Project.R

## Conclusions
Combining patterns seen in Principle Component Analysis, Logistic Regression, our Tree, and Random Forest:

1. Having a high scoring offense is the most important trait of successful teams
    - By increasing three-point attempts, not necessarily improving accuracy, teams make more three-pointers and score more points 
3. Maintaining possession is also an important factor:
    - defensive rebounds and steals are important and positively impacted team’s success  
    - turnovers represent losing possession and negatively impact the team’s success

### I. Summary Statistics
1. Average total points per game increases from from 2000 (~90 points/game) to 2020 (~130 points/game)  
   <img width="501" alt="Screenshot 2024-04-18 at 8 29 45 PM" src="https://github.com/paulinejsantry/MATH-503-NBA-Project/assets/166664713/3f3fdb37-1aed-4673-a40e-f3430f38063d">
3. Average three-point shots **attempted** per game doubles from 2000 (~15 attempts/game) to 2020 (~35 attempts/game)  
   <img width="501" alt="Screenshot 2024-04-18 at 8 30 42 PM" src="https://github.com/paulinejsantry/MATH-503-NBA-Project/assets/166664713/98e40f47-3d71-450d-a5cb-0d9c28e1878b">
5. Average three-point shots **made** per game increases from 2000-2020  
   <img width="501" alt="Screenshot 2024-04-18 at 8 31 13 PM" src="https://github.com/paulinejsantry/MATH-503-NBA-Project/assets/166664713/a8c8a06c-4106-4746-8cae-9b58d9cc3ed2">
6. Accuracy of three-point shots made is **constant** from 2000-2020  
   <img width="501" alt="Screenshot 2024-04-18 at 8 31 47 PM" src="https://github.com/paulinejsantry/MATH-503-NBA-Project/assets/166664713/9d68de62-5f1f-47d2-95e6-283f16fcef69">
### II. Principle Component Analysis
1. Significant variables in predicting if a team will make the playoffs:  
       - Points  
       - Field goals made (FGM)  
       - Field goal percentage (FG_pct)  
       - Three pointers made (three_PM)  
       - Three pointers attempted (three_PA)  
       - Defensive rebounds (DRB)  
 <img width="400" alt="Screenshot 2024-04-18 at 8 32 26 PM" src="https://github.com/paulinejsantry/MATH-503-NBA-Project/assets/166664713/af685d72-080f-446c-b567-5d4e953f9a35">  
 <img width="400" alt="Screenshot 2024-04-18 at 8 26 16 PM" src="https://github.com/paulinejsantry/MATH-503-NBA-Project/assets/166664713/e59f384f-e814-426d-b646-06ddabef31b0">

### III. Logistic Model predicting whether a team will make the playoffs yielded 78% accuracy
  <img width="501" alt="Screenshot 2024-04-18 at 8 27 11 PM" src="https://github.com/paulinejsantry/MATH-503-NBA-Project/assets/166664713/bdbdd663-5a7e-4191-9743-647ed02a6655">

### IV. Decision Tree for significant variables yielded 80% accuracy
  <img width="632" alt="image" src="https://github.com/paulinejsantry/MATH-503-NBA-Project/assets/166664713/7e78c167-44a1-430a-a646-331db02336d4">

### V. Random Forest Model predicting whether a team will make the playoffs yielded 81% accuracy
  <img width="400" alt="Screenshot 2024-04-18 at 8 27 32 PM" src="https://github.com/paulinejsantry/MATH-503-NBA-Project/assets/166664713/564ed035-c5c1-4509-886e-2914362497b2">  
  <img width="400" alt="Screenshot 2024-04-18 at 8 28 37 PM" src="https://github.com/paulinejsantry/MATH-503-NBA-Project/assets/166664713/a221d68d-bcde-4671-8aa9-7ec5b8026cfd">  

