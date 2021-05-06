# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  before_action :account_update_params, only: :update

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    @user = User.new(sign_up_params)
    render :new and return unless @user.valid?

    session['devise.regist_data'] = { user: @user.attributes }
    session['devise.regist_data'][:user]['password'] = params[:user][:password]
    @profile = @user.build_profile
    render :new_profile
  end

  def create_profile
    @user = User.new(session['devise.regist_data']['user'])
    @profile = Profile.new(profile_params)
    render :new_profile and return unless @profile.valid?

    @user.save
    @profile.user_id = @user.id
    @profile.save
    session['devise.regist_data']['user'].clear
    sign_in(:user, @user)
    redirect_to root_path
  end

  # GET /resource/edit
  def edit
    @user = User.find(params[:format])
  end

  # PUT /resource
  def update
    @user = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    
    @user.email = account_update_params[:email]
    @user.password = account_update_params[:password]

    if @user.valid?
      # bypass_sign_in @user, scope: @user_name if sign_in_after_change_password?
      session['devise.regist_data'] = { user: @user.attributes }
      session['devise.regist_data'][:user]['password'] = params[:user][:password]
      @profile = @user.build_profile
      render :edit_profile
    else
      render :edit
    end
  end

  def update_profile
    @user = User.new(session['devise.regist_data']['user'])
    @profile = Profile.new(profile_params)
    render :new_profile and return unless @profile.valid?

    @user.save
    @profile.user_id = @user.id
    @profile.save
    session['devise.regist_data']['user'].clear
    sign_in(:user, @user)
    redirect_to root_path
  end

  private

  def profile_params
    params.require(:profile).permit(:text, :age, :sex, :job, :image)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end


  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
