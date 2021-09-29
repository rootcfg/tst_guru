class TestsMailer < ApplicationMailer

  def completed_test(test_passage)
    @user = test_passage.user
    @test = test_passage.test

    mail to: @user.email, subject: "You Just Complete TestGuru test!"
  end

  def feedbak(params)
    @first_name = params[:first_name]
    @last_name  = params[:last_name]
    @feedback   = params[:feedbak]
    mail to: 'ddd2283@gmail.com', subject: "We recieved new feedbak!"
  end
end
