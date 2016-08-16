get '/stocks' do
  @hdiv =current_user.high_dividend
  @value =current_user.value_stocks
  @growth =current_user.growth_stocks
  @combination =current_user.combination_stocks
  if request.xhr?
    erb :"stocks/#{params[:sort_type]}", layout: false
  else
    redirect "/users/#{current_user.id}"
  end
end