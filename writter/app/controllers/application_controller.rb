class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_user!
  def after_sign_in_path_for(resource)
    posts_path  # Redirect to posts index or any other path
  end

  def after_sign_out_path_for(resource)
    root_path  # Redirect to home page or any other path
  end
end