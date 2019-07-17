require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )
require_relative( './models/pizza_order.rb' )
also_reload('./models/*')

#get - take information from db
#post - give information to the db

#INDEX
get '/pizza-orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end




#NEW
get '/pizza-orders/new' do
  erb(:new)
end



#CREATE
post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end



#DELETE
# get '/pizza-orders/delete' do
#   erb(:delete)
# end

#EDIT
get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

post '/pizza-orders/:id/delete' do
  @order = PizzaOrder.delete(params[:id])
  # @order.delete()
  redirect to 'pizza-orders'
end



#SHOW
get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end
