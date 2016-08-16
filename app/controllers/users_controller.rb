require 'stock_quote'

# Users INDEX
get '/users' do
  @users = User.all
  erb :'users/index'
end

# Users NEW
get '/users/new' do
  erb :'users/new'
end

# Users SHOW
get '/users/:id' do
  @user = User.find(params[:id])
  @stock = @user.favorite_stocks
  @hdiv = @user.high_dividend
  @value = @user.value_stocks
  @growth = @user.growth_stocks
  @combination = @user.combination_stocks
  erb :'users/show'
end

# Users EDIT
get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'users/edit'
end

# Users CREATE
post '/users' do
  if params[:user][:password] != params[:password_confirmation]
    @errors = ["passwords need to match MOFO"]
    erb :'users/new'
  else
    @user = User.new(params[:user])
    if @user.save
      session[:id] = @user.id
      redirect "/users/#{@user.id}"
    else
      @errors = @user.errors.full_messages
      erb :'users/new'
    end
  end
end

# Users UPDATE
put '/users/:id' do
  @user = User.find(params[:id])
  @user.update(params[:user])
  redirect "/users/#{@user.id}"
end

# Users DELETE
delete '/users/:id' do
  @user = User.find(params[:id])
  @user.destroy
  redirect "/users"
end

