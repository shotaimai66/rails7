class Users::Base < ApplicationController
  layout 'user'
  before_action :authenticate_user!
end