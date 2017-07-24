require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative('./models/passenger.rb')
require_relative('./models/ticket.rb')
require('pry')

#INDEX
get '/passenger/?' do
  @passengers = Passenger.all
  @tickets = Ticket.all
  erb( :index )
end

get '/passenger/tickets' do
  @tickets = Ticket.all
  erb( :tickets_index )
end

get '/passenger/tickets/add' do
  @tickets = Ticket.all
  erb( :add_ticket )
end

post '/passenger/tickets' do
  new_ticket = Ticket.new(params)
  new_ticket.save
  redirect to '/passenger/tickets'
end 

get '/passenger/new' do
  @passengers = Passenger.all
  erb(:new)
end

post '/passenger' do

  new_passenger = Passenger.new(params)
  new_passenger.save
  redirect to '/passenger'
end 

