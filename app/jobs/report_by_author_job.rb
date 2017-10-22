class ReportByAuthorJob < ApplicationJob
  queue_as :default

  def perform(email, start_date_s, finish_date_s=DateTime.current.to_s)
    # Do something later
    start_date = start_date_s.to_datetime
    finish_date = finish_date_s.to_datetime
    if start_date > finish_date
      raise ExceptionHandler::JobError, 'Wrong date'
    end
    users = User.sorted_by_author(start_date, finish_date)
    ReportByAuthorMailer.report_by_author(users, email, start_date, finish_date).deliver_now
  end
end
