require_relative('../db/sql_runner')
require('pry')

class Ticket

  attr_accessor :id, :destination, :flight_date, :cost, :ticket_type, :passenger_id

  def initialize(options)
    @id = options['id'].to_i
    @destination = options['destination']
    @flight_date = options['flight_date']
    @ticket_type = options['ticket_type']
    @passenger_id = options['passenger_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (destination, flight_date, ticket_type, passenger_id) VALUES ('#{@destination}','#{@flight_date}', '#{@ticket_type}', #{@passenger_id}) RETURNING *"
  
    ticket = SqlRunner.run(sql).first
    @id = ticket['id'].to_i
  end

  def update()
    sql = "UPDATE passengers SET
      first_name = '#{ @first_name }',
      last_name = '#{ @last_name }',
      nationality = '#{ @nationality }',
      date_of_purchase = '#{ @date_of_purchase }',
      arrived = '#{@arrived}'
      WHERE id = '#{ @id }';

      UPDATE passengers 
      SET
      customer_id = '#{ @customer_id }
      WHERE id = '#{ @id } AND #{@customer_id} != 0';"
    SqlRunner.run( sql )
  end

  def destination
    return "#{@destination}"
  end

  def class
    return "#{@ticket_type}"
  end

  def flight_date
    return "#{@flight_date}"
  end

  def delete()
    sql = "DELETE FROM tickets 
    WHERE id = #{@id}"
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    ticket = SqlRunner.run(sql)
    result = ticket.map { |ticket| Ticket.new(ticket) }
    return result
  end

end 