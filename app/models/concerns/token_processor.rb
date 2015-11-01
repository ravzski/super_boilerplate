module TokenProcessor
  extend ActiveSupport::Concern

  #
  # NOTE: set identifier if you want to tag request from andriod, osx or desktop
  #
  def set_access_token
    access_tokens.create(token: SecureRandom.urlsafe_base64(20))
  end

  #
  # NOTE: current_access_token_id is in select() on authenticable
  #
  def destroy_current_access_token
    AccessToken.find(current_access_token_id).destroy
  end

end
