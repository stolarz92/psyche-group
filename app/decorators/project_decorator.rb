class ProjectDecorator < Draper::Decorator
  delegate_all

  def say_hi
    'Hi'
  end

end
