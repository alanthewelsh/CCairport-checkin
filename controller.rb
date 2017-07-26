require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative('./models/passenger.rb')
require_relative('./models/ticket.rb')
require('pry')

#INDEX
get '/passengers/?' do
  @passengers = Passenger.all
  @tickets = Ticket.all
  erb( :index )
end

get '/passengers/tickets' do
  @tickets = Ticket.all
  erb( :tickets_index )
end
#below is adding the passengers to the tickets
get '/passengers/tickets/add' do
  @tickets = Ticket.all
  @passengers = Passenger.all
  erb( :add_ticket )
end

post '/passengers/:passenger_id/tickets' do
  new_ticket = Ticket.new(params)
  new_ticket.save
  redirect to '/passengers'
end 

get '/passengers/new' do
  current_page = 'passengers'
  @passengers = Passenger.all
  erb(:new)
end

post '/passengers' do
  new_passenger = Passenger.new(params)
  new_passenger.save
  redirect to '/passengers'
end 

get '/passengers/:id/edit' do
  @passenger = Passenger.find(params['id'])
  erb(:edit)
end

post '/passengers/:id' do
  passenger_update = Passenger.new(params)
  passenger_update.update
  redirect to '/passengers'
end 


