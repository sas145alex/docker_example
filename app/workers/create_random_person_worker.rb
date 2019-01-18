class CreateRandomPersonWorker
  include Sidekiq::Worker
  sidekiq_options retry: true, backtrace: true

  def perform(*args)
    person = Person.create_random
    person.save!
  end
end
