.PHONY: install dev i18n pretty test rubocop brakeman reset

install:
	@echo "Installing dependencies..."
	bundle install

dev:
	@echo "Starting the development server..."
	./bin/dev

i18n:
	@echo "Normalizing and checking i18n tasks..."
	i18n-tasks normalize && i18n-tasks health

pretty:
	@echo "Formatting ERB templates..."
	erb-format app/views/**/*.html.erb --write

test:
	@echo "Running tests..."
	rspec

rubocop:
	@echo "Running RuboCop for linting and auto-corrections..."
	rubocop -A

brakeman:
	@echo "Running Brakeman for security analysis..."
	brakeman -z -q

reset:
	echo "Dropping database, reloading with current schema, and seeding..."
	bin/rails db:reset && bin/rails db:seed
