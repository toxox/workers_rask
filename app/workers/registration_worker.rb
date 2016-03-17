class RegistrationWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence do
    secondly(2)
  end

  def perform
    puts "registration"
  end
end

RegistrationWorker.perform_async
