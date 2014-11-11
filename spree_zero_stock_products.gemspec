# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform              = Gem::Platform::RUBY
  s.name                  = 'spree_zero_stock_products'
  s.version               = '2.3.0'
  s.summary               = 'Restore show_zero_stock_products functionality in Spree 2.0+'
  s.description           = 'Restore show_zero_stock_products functionality in Spree 2.0+'
  s.required_ruby_version = '>= 2.1.1'

  s.authors  = ['Stefan Wrobe', 'Nima Shariatian']
  s.email    = ['swrobel@gmail.com', 'nima.s@coryvines.com']
  s.homepage = 'https://github.com/swrobel/spree_zero_stock_products'
  s.license  = 'MIT'

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'durable_decorator', '~> 0.2.0'
  s.add_dependency 'spree_core', '~> 2.4.0.beta'

  s.add_development_dependency 'rspec-rails', '~> 3.0.0'
  s.add_development_dependency 'coffee-rails', '~> 4.0.0'
  s.add_development_dependency 'sass-rails', '~> 4.0.0'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl_rails', '~> 4.4.1'
  s.add_development_dependency 'rspec-activemodel-mocks'
  s.add_development_dependency 'capybara', '~>2.4.1'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'launchy', '~> 2.4.2'
  s.add_development_dependency 'durable_decorator_rails', '~> 0.2.0'
  s.add_development_dependency 'coveralls'
end
