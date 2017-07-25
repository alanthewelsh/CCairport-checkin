require_relative('../db/sql_runner')
require_relative('./ticket')
require('pry')

class Passenger

  attr_reader :id, :first_name, :last_name, :nationality, :date_of_purchase, :arrived

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @nationality = options['nationality']
    @date_of_purchase = options['date_of_purchase']
    @arrived = options['arrived'] 
    end

  def save()
    sql = "INSERT INTO passengers (first_name, last_name, nationality, date_of_purchase, arrived) VALUES ('#{@first_name}','#{@last_name}', '#{@nationality}', '#{@date_of_purchase}', '#{@arrived}') RETURNING *"
    passenger = SqlRunner.run(sql).first
    @id = passenger['id'].to_i
  end

  def passenger_name
    return "#{@first_name} #{@last_name}"
  end

  def nationality 
    return "#{@nationality}"
  end 

  def purchase_date
    return "#{@date_of_purchase}"
  end 

  def arrival_status
    return "#{@arrived}"
  end 

  def update()
    sql = "UPDATE pizzas SET
      first_name = '#{ @first_name }',
      last_name = '#{ @last_name }',
      nationality = '#{ @nationality }',
      date_of_purchase = '#{ @date_of_purchase }',
      arrived = '#{@arrived}'
      WHERE id = '#{ @id }';"
    SqlRunner.run( sql )
  end

  def format_name
    return "#{@first_name.capitalize} #{@last_name.capitalize}"
  end

  def self.find( id )
    sql = "SELECT * FROM passengers WHERE id=#{id};"
    passenger = SqlRunner.run( sql )
    result = Passenger.new( passenger.first )

    return result
  end

  def self.delete_all()
    sql = "DELETE FROM passengers"
    SqlRunner.run(sql)
  end

  def tickets
    sql = "SELECT * FROM tickets WHERE passenger_id = #{@id};"
    ticket = SqlRunner.run(sql)
    result = ticket.map { |ticket| Ticket.new(ticket) }
    return result
  end 
  
  def self.all()
    sql = "SELECT * FROM passengers"
    passenger = SqlRunner.run(sql)
    result = passenger.map { |passenger| Passenger.new(passenger) }
    return result
  end
end 
