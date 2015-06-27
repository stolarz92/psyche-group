class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  def signed_in
    flash[:danger] = 'You have no permission.'
    redirect_to new_user_session_path unless user_signed_in?
  end
end
