# Sessions NEW
get '/sessions/new' do
  erb :"sessions/new"
end

# Sessions CREATE
post '/sessions' do
  @user = User.find_by_email(params[:email])
  if @user && @user.authenticate(params[:password])
    p "gooooooooooooooooood"
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else

    p "Errrrrrrrrrrrrrrrrrrrrrrrrr"
    @errors = ["Login NonLEgit, please try again..... "]
    redirect'/users'
  end
end

# Sessions DELETE
delete '/sessions' do
  session[:id] = nil
  redirect '/'
end
