module Sessions
  class Builder

    def initialize current_user
      @current_user = current_user
    end

    def self.error
      {
        error: 'Incorrect email or password'
      }
    end

    #
    # note: only put fields that are neccessary for session request
    #
    def show
      {
        id: @current_user.id,
        first_name: @current_user.first_name,
        last_name: @current_user.last_name,
        email: @current_user.email
      }
    end

    def create
      {
        auth_token: @current_user.access_token,
        user_id: @current_user.id
      }
    end

  end

end
