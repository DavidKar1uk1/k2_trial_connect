require 'faraday'
require 'json'

API_URL = "http://localhost:3000/api/financial/private/financial_transactions"

module TrialWebhook
  class Consume_webhook
    # The Attributes of the JSON response
    attr_reader :id, :reference, :external_reference, :amount, :state, :origination_time, :till_name

    # make attributes into getters
    def initialize(attributes)
      @id = attributes["id"]
      @reference = attributes["reference"]
      @external_reference = attributes["external_reference"]
      @amount = attributes["amount"]
      @state = attributes["state"]
      @origination_time = attributes["origination_time"]
      @till_name = attributes["till_name"]
    end

    def self.find(id)
      response = Faraday.get("#{ API_URL }/#{ id }")
      attributes = JSON.parse(response.body)
      new(attributes)
      puts(attributes)
    end


    def self.all
      response = Faraday.get(API_URL)
      attributes = JSON.parse(response.body)
      attributes.map { |attributes| new(attributes) }
      puts(attributes)
    end

    # The method to receive K2 buygoods webhook
    def self.receive_buygoods_transaction()
      # response = Faraday.get("#{ API_URL }/#{ id }")
      # attributes = JSON.parse(response.body)
      puts(k2_transaction_params)
    end

    # The method to receive K2 buygoods reversal webhook
    def self.receive_buygoods_reversal
      puts(k2_transaction_params)
    end

    # The method to receive K2 customer created webhook
    def self.receive_customer_created
      puts(k2_transaction_params)
    end

    # The method to receive K2 settlement completed webhook
    def self.receive_settlement_completed
      puts(k2_transaction_params)
    end

    # Divides the Responses params according to specific fields
    def k2_transaction_params
      # whitelist params
      params.permit(:reference, :external_reference, :amount, :state, :origination_time, :till_name)
    end

  end
end