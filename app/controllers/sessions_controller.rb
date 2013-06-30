class SessionsController < Devise::SessionsController
  skip_before_filter :user_signin_required, :only => ["new", "create"]

  def new
    render :layout => "public"
  end
end
