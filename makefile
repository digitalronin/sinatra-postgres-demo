# After cloning this repo, run `make setup` to create a heroku application and
# a sample database.
# NB: You will need to run `heroku login` before this.
setup:
	heroku create
	git push heroku master
	heroku open
