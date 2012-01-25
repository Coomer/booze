require "active_record/log_subscriber"

module Booze
  class QueryLogger < ActiveSupport::LogSubscriber
    def sql(event)
      Booze::QueryStore.add(event.payload[:sql])
    end
  end
end
Booze::QueryLogger.attach_to :active_record
