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
    @user = users(:user_admin)
    sign_in @user
    @ability = Ability.new(@user)
    session[:user_id] = @user.id
    # current_user = user

    # @ability = Object.new
    # @ability.extend(CanCan::Ability)
    # @controller.stubs(:current_ability).returns(@ability)
  end
end