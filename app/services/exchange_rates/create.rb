module ExchangeRates
  class Create
    def process(params)
      form = ExchangeRates::CreateForm.new(params)
      exchange_rate = form.save!

      serialized_rate = ExchangeRateSerializer.new(exchange_rate).to_json
      BroadcastJob.send(:perform_now, 'exchange_rate', serialized_rate)

      ServiceUtils::Success.new(serialized_rate)
    rescue FormValidationFailed => e
      ServiceUtils::Error.new(e.messages)
    rescue ActiveRecord::RecordInvalid => e
      ServiceUtils::Error.new(e.record.errors)
    end
  end
end
