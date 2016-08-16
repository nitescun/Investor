post '/stocks/:investment_type' do
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