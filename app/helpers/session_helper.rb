module SessionHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # check if user is logged in
  def logged_in?
    session[:user_id] != nil
  end

  # redirect if user is not logged in
  def authenticate!
    redirect '/sessions/new' unless logged_in?
  end

  # redirect if user is not authorized to edit/delete
  def authorize!(user)
    redirect '/not_authorized' unless authorized?(user)
  end

  # check if current user is the owner
  def authorized?(user)
    current_user == user
  end
end

helpers SessionHelper
