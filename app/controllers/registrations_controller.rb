class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :user_signin_required, :only => ["new", "create"]

  def new
    @user = User.new
    render :layout => "public"
  end
end
