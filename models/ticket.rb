require_relative('../db/sql_runner')

class Ticket

  attr_reader :id, :destination, :flight_date, :cost, :ticket_type, :passenger_id

  def initialize(options)
    @id = options['id'].to_i
    @destination = options['destination']
    @flight_date = options['flight_date']
    @cost = options['cost']
    @ticket_type = options['ticket_type']
    @passenger_id = options['passenger_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (destination, flight_date, cost, ticket_type, passenger_id) VALUES ('#{@destination}','#{@flight_date}', '#{@cost}', '#{@ticket_type}', '#{@passenger_id}') RETURNING *"
    ticket = SqlRunner.run(sql).first
    @id = ticket['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM passengers"
    return Passengers.map_items(sql)
  end

end 