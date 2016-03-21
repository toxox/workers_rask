class PaymentWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence do
    secondly(4)
  end

  def perform
    Event.create(event_type: "payment")
  end
end

PaymentWorker.perform_async
