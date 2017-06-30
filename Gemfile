source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem "bcrypt"
gem "bootstrap-sass", "3.3.7"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "eslint-rails"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "puma", "~> 3.0"
gem "rails", "~> 5.0.4"
gem "rails_best_practices"
gem "rubocop", require: false
gem "rubocop-checkstyle_formatter", require: false
gem "sass-rails", "~> 5.0"
gem "scss_lint", require: false
gem "sqlite3"
gem "therubyracer"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "brakeman", require: false
  gem "byebug", platform: :mri
  gem "capybara", "~> 2.13"
  gem "rspec-rails"
  gem "selenium-webdriver"
end
group :development do
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
