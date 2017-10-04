# get to new user / register page
get '/users/new' do
  @user = User.new
  erb :"users/new"
end

# submit register form
post '/users' do
  @user = User.new(params[:user])

  if @user.save
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :"users/new"
  end
end

# get to user profile/entries
get '/users/:id/entries' do
  authenticate!
  @user = User.find_by(id: params[:id])
  @entry = Entry.find_by(author_id: @user.id)
  erb :"users/show"
end
