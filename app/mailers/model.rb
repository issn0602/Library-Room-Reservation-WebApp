class Model < ActionMailer::Base
  default from: "library@ncsu.edu"
  layout 'mailer'
end

class NotifierMailer < ApplicationMailer
  default from: 'library@ncsu.edu',
          return_path: 'system@example.com'

  def welcome(@user)
    mail(to: @user.email)
  end
end
