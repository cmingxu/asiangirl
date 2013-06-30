class PasswordsController < Devise::PasswordsController
  layout "public"
  skip_before_filter :user_signin_required
  append_before_filter :assert_reset_token_passed, :only => :edit

  def new
    super
  end

  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)

    if successfully_sent?(resource)
      redirect_to new_user_session_path, :notice => "Instruction Send To Your Email"
    else
      respond_with(resource)
    end
  end

  def edit
    super
  end

  def update
    self.resource = resource_class.reset_password_by_token(resource_params)

    if resource.errors.empty?
      resource.unlock_access! if unlockable?(resource)
      flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
      set_flash_message(:notice, flash_message) if is_navigational_format?
      sign_in(resource_name, resource)
      redirect_to home_subdomain_path, :notice => "Password changed"
    else
      respond_with resource
    end
  end

  protected

    def after_sending_reset_password_instructions_path_for(resource_name)
      new_user_session_path
    end

    def assert_reset_token_passed
      if params[:reset_password_token].blank?
        set_flash_message(:error, :no_token)
        redirect_to new_user_session_path
      end
    end

    def unlockable?(resource)
      resource.respond_to?(:unlock_access!) &&
        resource.respond_to?(:unlock_strategy_enabled?) &&
        resource.unlock_strategy_enabled?(:email)
    end

end

