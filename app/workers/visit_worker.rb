class VisitWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence do
    secondly(2)
  end

  def perform
    Event.create(event_type: "visit")
  end
end

VisitWorker.perform_async
