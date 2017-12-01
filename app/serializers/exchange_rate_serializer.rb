class ExchangeRateSerializer < ActiveModel::Serializer
  attributes :id, :value, :datetime, :nominal, :f_datetime, :is_forced

  def f_datetime
    object.datetime.strftime("%Y-%m-%d %H:%M")
  end

  def nominal
    object.nominal.to_i
  end

  def is_forced
    true
  end
end
