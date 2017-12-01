require 'dry-validation'
require 'dry-struct'
require 'dry-types'

module ExchangeRates
  class CreateForm < Dry::Struct
    constructor_type(:schema)

    module Types
      include Dry::Types.module
    end

    attribute :value, Types::Form::Decimal
    attribute :datetime, Types::Form::DateTime

    def save!
      errors = schema.call(to_hash).messages(full: true)
      raise FormValidationFailed, errors if errors.present?
      ExchangeRate.create!(to_hash)
    end

    private

    def schema
      @schema ||= Dry::Validation.Schema do
        required(:value).value(:filled?, type?: BigDecimal)
        required(:datetime).value(
          :filled?,
          type?: DateTime,
          gt?: DateTime.current
        )
      end
    end
  end
end
