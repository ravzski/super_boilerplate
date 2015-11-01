module Authenticator
  extend ActiveSupport::Concern

  #
  # NOTE: for a request to be verified
  # two things are required inside the header
  # 1: AuthToken
  # 2: UserId
  # NOTE: UserId to optimize query where SQL will not "find by" access_tokens rather by id
  #

  def current_user
    @current_user ||= User.find_by_request_details request_details
  end

  def authenticate_request
    render_expired_session unless current_user.present?
  end

  def render_expired_session
    render json: { error: 'Your session has expired' }, status: 401
  end

  def render_access_denied
    render json: { error: 'Access Denied' }, status: 403
  end

  private

  def request_details
    @request_details ||=
      {
        access_token:  request.headers['AuthToken'],
        user_id: request.headers['UserId']
      }
  end

end
