.PHONY: install rails-c dev db-console db-reset db-seed redis-start redis-stop i18n pretty rspec rubocop brakeman

install:
	@echo "Installing dependencies..."
	bundle install

rails-c:
	@echo "Opening the Rails console..."
	bundle exec rails c

dev:
	@echo "Starting the development server..."
	./bin/dev

db-console:
	@echo "Opening the database console..."
	bundle exec rails db

db-reset:
	@echo "Resetting the database..."
	bundle exec rails db:reset

db-seed:
	@echo "Seeding database..."
	bundle exec rails db:seed

redis-start:
	@echo "Starting Redis server..."
	brew services start redis

redis-stop:
	@echo "Stopping Redis server..."
	brew services stop redis

i18n:
	@echo "Normalizing and checking i18n tasks..."
	i18n-tasks normalize && i18n-tasks health

pretty:
	@echo "Formatting ERB templates..."
	bundle exec erb-format app/views/**/*.html.erb --write

rspec:
	@echo "Running specs..."
	bundle exec rspec

rubocop:
	@echo "Running RuboCop for linting and auto-corrections..."
	bundle exec rubocop -A

brakeman:
	@echo "Running Brakeman for security analysis..."
	bundle exec brakeman -z -q
