class AuthenticateUserService
  def self.authenticate_user(headers)
    token_regex = /Bearer (\w+)/
    # verify token is valid
    if headers['Authorization'].present? && headers['Authorization'].match(token_regex)
      token = headers['Authorization'].match(token_regex)[1]
      # verify token correspond to the user
      if (Current.user = User.find_by_token_auth(token))
        return
      end
    end
    render json: {error: 'Unauthorized'}, status: :unauthorized
  end
end