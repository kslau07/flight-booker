class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  def self.search_by_fields(query)
    return if query.empty?

    query = sanitize_sql(query)

    # debugger                # delete me

    dep_airport_id = Airport.find_by(code: query[:departure_code]).id unless query[:departure_code].nil?
    arr_airport_id = Airport.find_by(code: query[:arrival_code]).id unless query[:arrival_code].nil?

    # sql = fields.map {|field| "#{field} LIKE ?"}.join(' OR ')
    sql = []
    sql << 'departure_airport_id = ?' unless query[:departure_code].nil?
    sql << 'arrival_airport_id = ?' unless query[:arrival_code].nil?
    sql = sql.join(' AND ')

    parameters = [dep_airport_id, arr_airport_id].compact
    Flight.where(sql, *parameters)
  end
end

<<~DELETE
  delete me
  irb(main):020:0> Airport.where('code = ?', 'MIA').pluck(:id).first
  irb(main):031:0> Airport.find_by(code: 'MIA').id

DELETE
