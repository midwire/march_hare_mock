# require "march_hare_mock/version"

module MarchHareMock

  class MarchHare
    def self.connect(*args)
      Session.connect(*args)
    end
  end

  class Session
    def self.connect(*args)
      self.new
    end

    def start
      nil
    end

    def create_channel
      MarchHareMock::Channel.new
    end

    def close
      nil
    end
  end

  class Channel
    def queue(name, *args)
      MarchHareMock::Queue.new(*args)
    end

    def default_exchange
      MarchHareMock::Exchange.new
    end

    def close
      nil
    end
  end

  class Queue
    attr_accessor :name, :attrs, :messages, :delivery_count

    def initialize(name, attrs = {})
      self.name           = name
      self.attrs          = attrs.dup
      self.messages       = []
      self.delivery_count = 0
    end
  end

  class Exchange
    attr_accessor :name, :attrs, :queues

    def initialize(name = 'default.exchange', attrs = {})
      self.name   = name
      self.attrs  = attrs.dup
      self.queues = []
    end

    def publish(msg, msg_attrs = {})
      queues.each { |q| q.messages << msg }
    end

    def bound_to?(queue_name)
      queues.any?{|q| q.name == queue_name}
    end

    def method_missing(method, *args)
      method_name  = method.to_s
      is_predicate = false
      if method_name =~ /^(.*)\?$/
        key           = $1.to_sym
        is_predicate = true
      else
        key = method.to_sym
      end

      if attrs.has_key? key
        value = attrs[key]
        is_predicate ? !!value : value
      else
        super
      end
    end
  end

end
