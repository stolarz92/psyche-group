class UsersController < ApplicationController
  expose(:user)
  expose(:users)
  expose(:projects, ancestor: :user)

  def show
  end

  def index
  end
end
