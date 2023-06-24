class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  def self.search_by_fields(query)
    return if query.empty?

    query = sanitize_sql(query)

    dep_aiport_id = Airport.find_by(code: query[:departure_code]).id
    arr_airport_id = Airport.find_by(code: query[:arrival_code]).id

    # debugger                # delete me
    
    Flight.where('departure_airport_id = ?
                  AND arrival_airport_id = ?', dep_aiport_id, arr_airport_id)

    # Flight.where('departure_airport_id = ?
    #   AND arrival_airport_id = ?
    #   AND departure_airport_id = ?
    #   AND departure_airport_id = ?', x, y, x, y)
  
    # Lets test if departs from DEN can be returned

    # debugger if !query.empty?

    # sql = fields.map {|field| "#{field} LIKE ?"}.join(' OR ')
    # parameters = fields.map {"%#{q}%"}
    # where(sql, *parameters)
  end
end

<<~DELETE
  delete me
  irb(main):020:0> Airport.where('code = ?', 'MIA').pluck(:id).first
  irb(main):031:0> Airport.find_by(code: 'MIA').id

DELETE
