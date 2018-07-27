require 'rails_helper'

describe CourseMailer, type: :mailer do
  describe '#approved_email' do
    let(:course) { create(:course) }
    let(:mail) { described_class.with(course: course).approved_email }

    it 'renders the headers' do
      expect(mail.subject).to eq('Project-X. Your course was successfully approved')
      expect(mail.to).to eq([course.owner.email])
      expect(mail.from).to eq(['projectxhardhardcode@gmail.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match(/(course)*(was successfully approved)/)
    end

    it 'assigns @course' do
      expect(mail.body.encoded).to match(course.title)
    end

    it 'job is created' do
      ActiveJob::Base.queue_adapter = :test
      expect { mail.deliver_later }.to have_enqueued_job.on_queue('mailers')
    end

    it 'approved_email is sent async' do
      expect do
        perform_enqueued_jobs do
          mail.deliver_later
        end
      end.to change { ActionMailer::Base.deliveries.size }.by(1)
    end

    it 'approved_email is sent to the right user' do
      perform_enqueued_jobs do
        mail.deliver_later
      end

      mail = ActionMailer::Base.deliveries.last
      expect(mail.to).to eq [course.owner.email]
    end
  end
end
