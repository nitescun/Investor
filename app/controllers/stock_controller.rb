get '/stocks' do
  tempstock = Stock.new
  @hdiv =tempstock.high_dividend
  @value =tempstock.value_stocks
  @growth =tempstock.growth_stocks
  @combination =tempstock.combination_stocks
  if request.xhr?
    erb :"stocks/#{params[:sort_type]}", layout: false
  else
    redirect "/users/#{current_user.id}"
  end
end
