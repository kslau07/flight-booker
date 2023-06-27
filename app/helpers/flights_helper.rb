module FlightsHelper
  def human_readable(minutes)
    [
      pluralize(minutes.to_i/60, 'hr'),
      ', ',
      pluralize(minutes.to_i % 60, 'min')
    ].join.gsub!(/(?<=\d)\s/, '')             # regex lookbehind assert.
  end

  def sortable(column, title = nil)
    # @query_results contains a Relation
    # We can sort by 
    #<Flight:0x00007efc755c8028
    # id: 98,
    # start: Wed, 09 Aug 2023 00:00:00.000000000 UTC +00:00,
    # flight_duration: "200",
    # departure_airport_id: 2,
    # arrival_airport_id: 6,
    # created_at: Mon, 26 Jun 2023 18:25:55.432648000 UTC +00:00,
    # updated_at: Mon, 26 Jun 2023 18:26:16.519815000 UTC +00:00,
    # seats_avail: 2>,


    title ||= column.titleize
    sort_col = column
    # sort_col = :departure_airport_id

    # css_class

    # direction
    #http://localhost:3000/flights?departure_code=ANY&arrival_code=ANY&num_tickets=1&start=ANY

    # link_to title, { search_params: foo }
    # link_to '/test', {  sort: column }
    
    link_to title, flights_path(departure_code: search_params[:departure_code],
                                  arrival_code: search_params[:arrival_code],
                                  num_tickets: search_params[:num_tickets],
                                  start: search_params[:start],
                                  sort_col: sort_col)
  end
end