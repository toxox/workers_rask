class CashoutWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence do
    secondly(4)
  end

  def perform
    Event.create(event_type: "cashout")
  end
end

CashoutWorker.perform_async
