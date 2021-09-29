class TestsMailer < ApplicationMailer

  def completed_test(test_passage)
    @user = test_passage.user
    @test = test_passage.test

    mail to: @user.email, subject: "You Just Complete TestGuru test!"
  end

  def feedbak(first_name, last_name, email, feedbak)
    mail to: email, subject: "We recieved new feedbak!"
  end
end
