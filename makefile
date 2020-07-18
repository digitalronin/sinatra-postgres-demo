# After cloning this repo, run `make setup` to create a heroku application and
# a sample database.
# NB: You will need to run `heroku login` before this.
setup:
	bin/setup.sh

# Create tables and populate with CSV data
# Run this using `heroku run make setup-db` - it needs to execute on Heroku, not locally
setup-db:
	cat init-db/create-tables.sql | psql $$DATABASE_URL
	cat init-db/users.csv | psql $$DATABASE_URL -c "COPY users(first_name, last_name, password, email) FROM STDIN DELIMITER ',' CSV HEADER"
