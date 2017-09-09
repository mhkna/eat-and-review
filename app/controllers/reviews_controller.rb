post '/restaurants/:restaurant_id/reviews' do
  authenticate!
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = @restaurant.reviews.new(description: params[:description], rating: params[:rating].to_i, author: current_user)
  redirect '/unauthorized' if @restaurant.authors.include?(current_user) || @restaurant.creator == current_user
  if @review.save
    redirect "/restaurants/#{@restaurant.id}?recent=#{@review.thanks}"
  else
    @errors = @review.errors.full_messages
    erb :'restaurants/show'
  end
end
