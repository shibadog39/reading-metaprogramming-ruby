require 'test_helper'
require 'securerandom'

class TestSimpleBot < MiniTest::Test
  def bot_for_test(&block)
    Class.new(SimpleBot, &block)
  end

  def test_simple_bot_response
    klass = bot_for_test do
      respond 'hello' do
        'Yo'
      end
    end

    assert_equal 'Yo', klass.new.ask('hello')
  end

  def test_simple_bot_global_setting
    code = SecureRandom.hex

    klass = bot_for_test do
      setting :code, code
      respond 'tell me your code' do
        "code is #{settings.code}"
      end
    end

    assert_equal "code is #{code}", klass.new.ask('tell me your code')
  end

  def test_call_first_block
    klass = bot_for_test do
      respond 'hello' do
        'sup bor'
      end

      respond 'hello' do
        'Yo'
      end
    end

    assert_equal 'sup bor', klass.new.ask('hello')
  end

  def test_simple_bot_can_not_to_be_instance
    assert_raises(StandardError) { SimpleBot.new }
  end
end
