# frozen_string_literal: true

# Helper functions for flight
module FlightsHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    sort_col = column
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    css_class = column == sort_column ? "current #{sort_direction}" : nil

    link_to title, flights_path(departure_code: search_params[:departure_code],
                                arrival_code: search_params[:arrival_code],
                                num_tickets: search_params[:num_tickets],
                                start_date: search_params[:start_date],
                                sort_col:,
                                direction:), { class: css_class }
  end

  def convert_total_mins_to_hours_and_mins(minutes)
    [
      (pluralize(minutes.to_i / 60, 'hr') + ', ' if (minutes.to_i / 60).positive?), # show hours if exist
      pluralize(minutes.to_i % 60, 'min')
    ].join.gsub!(/(?<=\d)\s/, '') # regex lookbehind assert.
  end
end
