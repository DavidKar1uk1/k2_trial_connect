RSpec.describe TrialWebhook::Receive_webhook do
  it "has a version number" do
    expect(TrialWebhook::VERSION).not_to be nil
  end

  # For Buygoods Transaction
  it "receive buygoods transaction" do
    expect(TrialWebhook::Consume_webhook.receive_buygoods_transaction)
  end

  # For Buygoods reversal Transaction
   it "receive buygoods reversal transaction" do
     expect(TrialWebhook::Consume_webhook.receive_buygoods_reversal)
   end

  # For settlement completed Transaction
  it "receive settlement completed  transaction" do
    expect(TrialWebhook::Consume_webhook.receive_settlement_completed)
  end

  # For Customer created Transaction
  it "receive Customer created transaction" do
    expect(TrialWebhook::Consume_webhook.receive_customer_created)
  end

end
