class CashoutWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence do
    secondly(4)
  end

  def perform
    puts "payment"
  end
end

CashoutWorker.perform_async
