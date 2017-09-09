get '/restaurants' do
  @restaurants = Restaurant.all
  erb :'restaurants/index'
end

get '/restaurants/new' do
  authenticate!
  @restaurant = Restaurant.new
  erb :'restaurants/new'
end

post '/restaurants' do
  authenticate!
  @user = current_user
  @restaurant = @user.restaurants.new(params[:restaurant])
  if @restaurant.save
    redirect "/restaurants/#{@restaurant.id}"
  else
    @errors = @restaurant.errors.full_messages
    erb :'restaurants/new'
  end
end

get '/restaurants/:id' do
  @recent = params[:recent]
  @restaurant = Restaurant.find(params[:id])
  erb :'restaurants/show'
end

get '/restaurants/:id/edit' do
  authenticate!
  @restaurant = Restaurant.find(params[:id])
  redirect '/unauthorized' unless @restaurant.creator == current_user
  erb :'restaurants/edit'
end

put '/restaurants/:id' do
  authenticate!
  @user = current_user
  @restaurant = @user.restaurants.find(params[:id])
  redirect '/unauthorized' unless @restaurant.creator == current_user
  if @restaurant.update_attributes(params[:restaurant])
    redirect "/restaurants/#{@restaurant.id}"
  else
    @errors = @restaurant.errors.full_messages
    erb :'restaurants/edit'
  end
end

delete '/restaurants/:id' do
  authenticate!
  @restaurant = current_user.restaurants.find(params[:id])
  redirect '/unauthorized' unless @restaurant.creator == current_user
  @restaurant.destroy
  redirect "/restaurants"
end
