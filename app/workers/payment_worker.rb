class PaymentWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence do
    secondly(4)
  end

  def perform
    puts "payment"
  end
end

PaymentWorker.perform_async
