source 'https://rubygems.org'

ruby(File.read(".ruby-version").strip) if ENV["GEMFILE_LOAD_RUBY_VERSION"].to_i == 1 && File.exist?(".ruby-version")

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.3'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'attr_encrypted', :github => "attr-encrypted/attr_encrypted"
gem 'countries'
gem 'aasm'
gem 'responders'
gem 'validate_url', :github => "perfectline/validates_url"
gem 'money-rails'
gem 'twilio-ruby'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'bootswatch-rails'
gem 'haml-rails'
gem 'font-awesome-rails'

group :production do
  gem 'rails_12factor'
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'pry'
  gem 'rspec-rails'
end

group :test do
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'vcr'
  gem 'webmock'
  gem 'capybara'
  gem "simplecov", :require => false
  gem "codeclimate-test-reporter", "~> 1.0.0"
end
