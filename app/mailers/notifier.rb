class Notifier < ActionMailer::Base
  default from: "kcanuj@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.login_notifier.subject
  #
  def login_notifier(task)
    @tasks = task
    mail to: "anujchandran@hotmail.com"
  end
end
