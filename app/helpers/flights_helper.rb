module FlightsHelper
  def human_readable(minutes)
    [
      pluralize(minutes.to_i/60, 'hr'),
      ', ',
      pluralize(minutes.to_i % 60, 'min')
    ].join.gsub!(/(?<=\d)\s/, '')             # regex lookbehind assert.
  end
end