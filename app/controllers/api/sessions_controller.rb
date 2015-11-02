class Api::SessionsController < ApiController

  skip_before_action :authenticate_request, only: :create
  before_action :find_user, only: :create

  def show
    if current_user.present?
      render json: Sessions::Builder.new(current_user).show
    else
      render_expired_session
    end
  end

  def create
    if @user.present? && @user.set_access_token
      render json: Sessions::Builder.new(@user).create
    else
      render json: Sessions::Builder.error, status: :unauthorized
    end
  end

  def destroy
    if current_user.destroy_current_access_token
      render_update_success
    else
      render_obj_errors
    end
  end

  private

  def find_user
    @user = User.find_by_credentials(params[:credentials])
  end

end
