# Quiz 2.
# Problem 1.
library(httr)
oauth_endpoints("github")
# 
myapp <- oauth_app("github", 
                   "", 
                   "")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
req <- GET("https://api.github.com/rate_limit", config(token = github_token))
stop_for_status(req)
content(req)
# curl -u Access Token:x-oauth-basic "https://api.github.com/users/jtleek/repos"
BROWSE("https://api.github.com/users/jtleek/repos",authenticate("Access Token","x-oauth-basic","basic"))