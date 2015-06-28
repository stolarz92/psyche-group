class ProjectDecorator < Draper::Decorator
  delegate_all

  def start_date
    formatted_date(starts_at)
  end

  def end_date
    formatted_date(ends_at)
  end

  private
  def formatted_date(date)
    date.strftime('%d-%m-%Y')
  end

end
