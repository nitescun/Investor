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
  @stock = StockQuote::Stock.quote(@stocks)
# High dividend
  @all_stocks_quote = []
  Stock.all.each do |current_stock|
    @all_stocks_quote << current_stock.quote
  end
  @all_stocks = StockQuote::Stock.quote(@all_stocks_quote)
  hdiv_raw = []
  @all_stocks.each do |current_stock|
    hdiv_raw << [current_stock.symbol, current_stock.dividend_yield]
  end 
  @hdiv = hdiv_raw.sort {|a,b| b[1] <=> a[1]}
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

