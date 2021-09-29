class FeedbakController < ApplicationController
  def index;end

  def create
    TestsMailer.feedbak(params).deliver_now
  end
end
