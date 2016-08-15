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
  @stocks = []
  @user.stocks.each do |current_stock|
    @stocks << current_stock.quote
  end

  # p "******************************"
  # p @stocks
  @stock = StockQuote::Stock.quote(@stocks)
  # @stock = []
  # ustock = @user.stocks
  # ustock.each do |current_stock|
  #  @stock << StockQuote::Stock.quote(current_stock)
  # end
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

