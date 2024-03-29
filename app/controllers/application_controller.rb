class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_out_path_for(user)
    root_path
  end

  def after_sign_in_path_for(user)
    current_user.admin? ? admin_resources_path : dashboard_path
  end
end
