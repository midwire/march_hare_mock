require 'spec_helper'

RSpec.describe MarchHareMock do

  TEST_STRING = 'bogus'

  context 'MarchHare' do
    context '#connect' do
      it 'returns a Session' do
        sess = MarchHareMock::MarchHare.connect
        expect(sess).to be_a(MarchHareMock::Session)
      end
    end
  end

  context 'Session' do
    let(:session) { MarchHareMock::Session.connect }

    context '#connect' do
      it 'returns a Session instance' do
        expect(session).to be_a(MarchHareMock::Session)
      end
    end

    context '.create_channel' do
      it 'returns a Channel instance' do
        expect(session.create_channel).to be_a(MarchHareMock::Channel)
      end
    end

    context 'empty methods' do
      %w(start close).each do |method|
        context ".#{method}" do
          it 'returns nil' do
            expect(session.send(method)).to eq(nil)
          end
        end
      end
    end
  end

  context 'Channel' do
    let(:channel) { MarchHareMock::Channel.new }

    context '.queue' do
      it 'returns a Queue instance' do
        expect(channel.queue(TEST_STRING)).to be_a(MarchHareMock::Queue)
      end

      it 'returns a Queue instance with the given name' do
        q = channel.queue(TEST_STRING)
        expect(q.name).to eq(TEST_STRING)
      end
    end

    context '.default_exchange' do
      it 'returns an Exchange instance' do
        expect(channel.default_exchange).to be_a(MarchHareMock::Exchange)
      end
    end

    context 'empty methods' do
      %w(close).each do |method|
        context ".#{method}" do
          it 'returns nil' do
            expect(channel.send(method)).to eq(nil)
          end
        end
      end
    end
  end

  context 'Queue' do
    let(:queue) { MarchHareMock::Queue.new(TEST_STRING) }

    context '.new' do
      it 'returns a Queue instance' do
        expect(queue).to be_a(MarchHareMock::Queue)
      end

      it 'returns a Queue with the given name' do
        expect(queue.name).to eq(TEST_STRING)
      end

      it 'returns a Queue with the given attributes' do
        attrs = { asdf: 'asdf' }
        q = MarchHareMock::Queue.new(TEST_STRING, attrs)
        expect(q.attrs).to eq(attrs)
      end

      it 'initializes messages' do
        expect(queue.messages).to eq([])
      end

      it 'initializes delivery_count' do
        expect(queue.delivery_count).to eq(0)
      end
    end

    context '.bind' do
      it 'returns a collection of exchange queues including self' do
        exchange = MarchHareMock::Exchange.new
        queues = queue.bind(exchange)
        expect(queues).to be_a(Array)
        expect(queues).to include(queue)
      end
    end
  end

end
