module TasksHelper
  def format_due_date(due_date)
    if due_date.nil?
      return 'No due date'
    end
    today = Date.today
    tomorrow = today + 1
    due = due_date

    if due == today
      'Due today'
    elsif due == tomorrow
      'Due tomorrow'
    elsif due > tomorrow && due <= getNextWeek(today)
      "Due on #{due.strftime('%A')}"
    elsif due.month == today.month && due.year == today.year
      "Due on #{due.strftime('%B %e')}"
    else
      "Due on #{due.strftime('%B %e, %Y')}"
    end
  end

  def getNextWeek(date)
    next_week = date + 7
    next_week
  end
end
