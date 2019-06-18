module ApplicationHelper
  def flight_dates
    Flight.all.map { |f| [f.format_date, f.date] }.uniq
  end
end
