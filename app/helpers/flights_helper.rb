# frozen_string_literal: true

module FlightsHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    sort_col = column
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    css_class = column == sort_column ? "current #{sort_direction}" : nil

    link_to title, flights_path(departure_code: search_params[:departure_code],
                                arrival_code: search_params[:arrival_code],
                                num_tickets: search_params[:num_tickets],
                                start: search_params[:start],
                                sort_col:,
                                direction:), { class: css_class }
  end

  def to_hrs_mins(minutes)
    [
      pluralize(minutes.to_i / 60, 'hr'),
      ', ',
      pluralize(minutes.to_i % 60, 'min')
    ].join.gsub!(/(?<=\d)\s/, '')             # regex lookbehind assert.
  end
end
