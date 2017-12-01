module Admin
  class ExchangeRatesController < BaseController
    expose :latest_rate, -> { ExchangeRate.last }

    def edit
    end

    def create
      result = ::ExchangeRates::Create.new.process(exchange_rate_params.to_h)

      if result.success?
        render json: result.data
      else
        render json: { errors: result.errors }, status: 422
      end
    end

    private

    def exchange_rate_params
      permitted_attributes = %i(value datetime)
      params.require(:exchange_rate).permit(permitted_attributes)
    end
  end
end
