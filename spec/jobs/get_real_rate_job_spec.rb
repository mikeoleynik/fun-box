require 'rails_helper'

RSpec.describe GetRealRateJob, type: :job do
  describe "#perform_later" do
    let(:rate) { create(:rate) }
    it "job was enqueued" do
      ActiveJob::Base.queue_adapter = :test

      expect { GetRealRateJob.perform_later }.to have_enqueued_job
    end

    it "job is delayed until the date of the forced rate" do
      ActiveJob::Base.queue_adapter = :test
      expect {
        GetRealRateJob.set(wait_until: rate.end_date).perform_later
      }.to have_enqueued_job.at(rate.end_date)
    end
  end
end
