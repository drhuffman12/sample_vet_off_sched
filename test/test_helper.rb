ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def seed_data
    require "#{Rails.root}/db/seeds.rb"
  end

end

class ActionController::TestCase
  include Devise::TestHelpers
  def setup
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    # sign_in FactoryGirl.create(:admin)
    sign_in users(:user_admin)
  end
end