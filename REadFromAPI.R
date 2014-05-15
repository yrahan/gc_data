library(httr)

myapp = oauth_app("twitter", 
                  key="key", 
                  secret="key_secret")

sig = sign_oauth1.0("My Simply Statistics",
                    token = "token",
                    token_secret = "secret")

homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)
json1 = content(homeTL)

json2 = jsonlite::fromJSON(toJSON(json1))


json2 = jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]
