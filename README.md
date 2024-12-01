# CS 598 - Project 4 - Movie Recommender
## Fall 2024 - Sasandi Hettiarachchi

## About
- This is an app where the users can rate the movies in the database to get personalized movie recommendations.

## How to use
- The pre-calculated similarity matrix (S.txt), popular ranking (popularity_rank), and the data used to calculate the above (movies.csv), along with the server (server.R) and UI (ui.R) source code and necesary helper functions and styling are included in this folder.
After downloading this folder, open R console and run the follwing commands to deploy the app remotely.

library(rsconnect)
rsconnect::deployApp('path/to/the/downloaded/folder')

- If you haven't installed "rsconnect" package yet, run the following command.

install.packages('rsconnect')

- If you haven't set your shinyapps.io account yet locally, run the following command. The credential can be found in the profile information.

rsconnect::setAccountInfo(name='NAME',
			  token='TOKEN',
			  secret='SECRET')
