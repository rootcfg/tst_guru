class FeedbakController < ApplicationController
  def index;end

  def create
    @first_name = params[:first_name]
    @last_name  = params[:last_name]
    @feedback   = params[:feedbak]

    TestsMailer::feedbak(@first_name, @last_name, 'ddd2283@gmail.com', @feedbak)
  end
end
