<!-- **Project Image (Optional)** -->
<div align="center">
    <a href="">
        <img src="public/images/logo.png?raw=true" alt="Alchemical Finance Logo" height="140" />
    </a>
    <h5 align="center">
      Alchemical Finance
    </h5>
    <p align="center">
        <a target="_blank" href="">💵</a>
        &middot;
        <a target="_blank" href="">💷</a>
        &middot;
        <a target="_blank" href="">💴</a>
        &middot;
        <a target="_blank" href="">💶</a>
    </p>
</div>

<!-- **Project Title** -->

## Alchemical Finance

<!-- **Project Badges** -->
<p align="center">
    <a href="https://github.com/rubocop/rubocop">
        <img alt="Code Style: RuboCop" src="https://img.shields.io/badge/code_style-rubocop-brightgreen.svg">
    </a>
    <a href="/coverage">
        <img alt="Coverage Status" src="/coverage/coverage.svg">
    </a>
    <a href="/LICENSE.md">
        <img alt="License: MIT" src="https://img.shields.io/github/license/HarrisFauntleroy/alchemical-finance">
    </a>
    <a href="https://github.com/HarrisFauntleroy/alchemical-finance/graphs/contributors">
        <img alt="Contributors" src="https://img.shields.io/github/contributors-anon/HarrisFauntleroy/alchemical-finance">
    </a>
    <a href="https://github.com/HarrisFauntleroy/alchemical-finance/actions">
        <img alt="Build Status" src="https://img.shields.io/github/checks-status/HarrisFauntleroy/alchemical-finance/main">
    </a>
    <a href="https://github.com/HarrisFauntleroy/alchemical-finance/issues?q=is%3Aopen+is%3Aissue">
        <img alt="Issues" src="https://img.shields.io/github/issues/HarrisFauntleroy/alchemical-finance">
    </a>
    <a href="https://github.com/HarrisFauntleroy/alchemical-finance/issues?q=is%3Aopen+is%3Aissue">
        <img alt="Last Commit" src="https://img.shields.io/github/last-commit/HarrisFauntleroy/alchemical-finance">
    </a>
    <a href="https://github.com/HarrisFauntleroy/alchemical-finance/issues?q=is%3Aopen+is%3Aissue">
        <img alt="Commit Activity" src="https://img.shields.io/github/commit-activity/w/HarrisFauntleroy/alchemical-finance">
    </a>
</p>

<!-- **Project Description** -->

Alchemical Finance is a platform for managing and tracking personal finances. It is currently in alpha development, but it already includes a number of features, such as user account creation and management, manual input account tracking, and robust security features.

### Planned Features
- Automated account tracking
- Budgeting and expense tracking
- Investment tracking
- Financial goal setting
- Double-entry accounting
- Multi-currency support

<!-- **Table of Contents** -->
<!-- **Architecture (Optional)** -->
<!-- **Local Development** -->

## Local Development

To get started, the Makefile has a number of commands to help you get up and running.

### Dependencies

This application uses Ruby on Rails. To install the dependencies, use the following command:

```bash
bundle install
```

To start the Rails server in development mode, use the following command:

```bash
./bin/dev
```

This will start the Rails server on `http://localhost:3000`.

## Ruby Version

See the `.ruby-version` file for the current Ruby version.

Install the correct Ruby version using your preferred Ruby version manager. For example, using [rvm](https://rvm.io/) or [rbenv](https://github.com/rbenv/rbenv):

## Testing

This application uses RSpec for testing. To run the test suite, use the following command:

```bash
bundle exec rspec
```

## Postgres

This application uses Postgres for the database. Set up Postgresql using Homebrew or [Postgress.app](https://postgresapp.com/)

To create the database, run the migrations and seed it, use the following commands:

```bash
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
```

## Redis

This application uses Redis for caching and background jobs.

To install Redis on macOS, use Homebrew:

```bash
brew install redis
```

To start & stop the Redis service, use the following commands:


```bash
brew services start redis
brew services stop redis
```

## Sidekiq

This application uses Sidekiq for background job processing. To start the Sidekiq service, use the following command:

```bash
bundle exec sidekiq
```

To generate a new job, use the following command:

```bash
bundle exec rails generate job MyJob
```

_Please refer to the Makefile for additional commands._

<!-- **Contributing** -->

## Contributing

If you'd like to contribute, please see our contribution guidelines:
[CONTRIBUTING](CONTRIBUTING.md)

<!-- **License** -->

## License

This software is distributed under the terms of the MIT License. See the
full license here: [LICENSE](LICENSE.md)

<!-- **Disclaimer** -->

## Disclaimer

This software is currently in alpha development and should be used with caution.
Features may evolve and APIs may change as the project continues to develop. We
appreciate your patience and value your feedback!
