class ApiController < ActionController::Base
  include Authenticator

  # disabled XSS and CRSF because this is an api driven controller
  protect_from_forgery with: :null_session

  # methods here can be found in authenticator
  before_action :authenticate_request



end
