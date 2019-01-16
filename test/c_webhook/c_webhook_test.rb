require 'test/test_helper'

class TrialWebhookConsumeTest < Minitest::Test
  def test_exists
    assert TrialWebhook::Consume_webhook
  end
end