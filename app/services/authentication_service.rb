class AuthenticationService

  def authenticated?(user_token, user_secret)
    if auth = Auth.find_by_token_and_secret(user_token, user_secret)
      return auth.user
    else
      return nil
    end
  end

end