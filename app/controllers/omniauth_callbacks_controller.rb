class OmniauthCallbacksController < ApplicationController
  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "ログインしました!!"
      user.skip_confirmation!
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      flash.notice = "ログインしました!!"
      sign_in_and_redirect user
    end
  end
  alias_method :twitter, :all
end
