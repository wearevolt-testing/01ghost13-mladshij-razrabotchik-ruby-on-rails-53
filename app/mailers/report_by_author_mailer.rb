class ReportByAuthorMailer < ApplicationMailer
  default from: 'test@mail.com'
  def report_by_author(users, email, start_date, finish_date)
    @users = users
    mail(to: email, subject: "Report by author from: #{start_date.to_s} to #{finish_date.to_s}")
  end
end
