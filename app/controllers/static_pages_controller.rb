class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'static_pages'

  def index
  end
end
