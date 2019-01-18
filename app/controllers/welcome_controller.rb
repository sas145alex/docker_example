class WelcomeController < ApplicationController
  def index
    redis = Redis.new(host: 'redis', port: 6379)
    redis.incr 'page hits'

    @page_hits = redis.get 'page hits'
  end

  def sq
    CreateRandomPersonWorker.perform_async('govno sobaki', 'hvost osla')
  end
end
