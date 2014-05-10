class TaskMailer < ActionMailer::Base
  default from: "kcanuj@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.task_mailer.Task_Mail.subject
  #
  def Task_Mail(user)
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
