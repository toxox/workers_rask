class VisitWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence do
    secondly(2)
  end

  def perform
    puts "visit"
  end
end

VisitWorker.perform_async
