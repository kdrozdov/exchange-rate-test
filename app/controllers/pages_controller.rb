class PagesController < ApplicationController
  expose :latest_rate, -> { ExchangeRate.last }

  def home
  end
end
