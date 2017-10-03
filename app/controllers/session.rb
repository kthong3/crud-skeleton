# get to login page
get '/sessions/new' do
  erb :'sessions/new'
end

# submit log in info
post '/sessions' do
  @user = User.find_by(username: params[:username])

  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @message = "You have either entered your username or password incorrectly."
    erb :"sessions/new"
  end
end

# log out
delete '/sessions' do
  session.delete(:user_id)
  redirect '/'
end

# user is not authorized!
get '/not_authorized' do
  erb :not_authorized
end
