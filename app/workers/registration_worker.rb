class RegistrationWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence do
    secondly(2)
  end

  def perform
    Event.create(event_type: "registration")
  end
end

RegistrationWorker.perform_async
