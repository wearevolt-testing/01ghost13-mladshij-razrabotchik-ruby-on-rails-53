require 'rails_helper'
include ActiveJob::TestHelper

RSpec.describe ReportByAuthorJob, type: :job do
  describe 'sending mail' do
    before {ActiveJob::Base.queue_adapter = :test}
    after do
      clear_enqueued_jobs
    end
    describe '...with valid request' do
      it 'runs job' do
        ReportByAuthorJob.perform_later('foo@mail.com', 10.hours.ago.to_s)
        expect(ReportByAuthorJob).to have_been_enqueued
      end
    end
    describe '...with invalid request' do
      it 'raises error' do
          expect {ReportByAuthorJob.perform_now('foo@mail.com', DateTime.tomorrow.to_s)}.
              to raise_error(ExceptionHandler::JobError, 'Wrong date')
      end
    end
  end
end
