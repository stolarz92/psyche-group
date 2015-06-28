class TaskDecorator < Draper::Decorator
  delegate_all

  def formatted_date
    deadline.strftime('%d-%m-%Y')
  end

end
