require( 'pry-byebug' )
require_relative( '../models/passenger' )
require_relative( '../models/ticket' )

Ticket.delete_all()
Passenger.delete_all()


passenger1 = Passenger.new({'first_name' => 'Planey', 'last_name' => 'McPlaneFace', 'nationality' => 'Irish', "date_of_purchase" => '01/04/2017', 'arrived' => false })
passenger1.save
passenger2 = Passenger.new({'first_name' => 'Steve', 'last_name' => 'McQueen', 'nationality' => 'American', "date_of_purchase" => '02/04/2017','arrived' => false })
passenger2.save
passenger3 = Passenger.new({'first_name' => 'Warren', 'last_name' => 'Gatland', 'nationality' => 'New Zealand - but now Welsh', "date_of_purchase" => '04/04/2017', 'arrived' => false })
passenger3.save
passenger4 = Passenger.new({'first_name' => 'Ming', 'last_name' => 'The Merceyless', 'nationality' => 'French', "date_of_purchase" => '03/04/2017', 'arrived' => false })
passenger4.save




ticket1 = Ticket.new({'destination' => 'New York', 'flight_date' => '01/05/2017', 'cost' => 123.54, 'ticket_type' => 'business', 'passenger_id' => passenger1.id })
ticket1.save
ticket2 = Ticket.new({'destination' => 'Paris', 'flight_date' => '04/05/2017', 'cost' => 94.75, 'passenger_id' => passenger2.id, 'ticket_type' => 'standard'})
ticket2.save
ticket3 = Ticket.new({'destination' => 'Paris', 'flight_date' => '04/05/2017', 'cost' => 94.75, 'passenger_id' => passenger3.id, 'ticket_type' => 'standard'})
ticket3.save
ticket4 = Ticket.new({'destination' => 'Peckham', 'flight_date' => '04/05/2017', 'cost' => 3.75, 'ticket_type' => 'standard', 'passenger_id' => passenger4.id  })
ticket4.save

binding.pry
nil

