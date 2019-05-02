require 'rails_helper'
require 'simplecov'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
end

RSpec.describe UpDownVotesController, type: :controller do

end
