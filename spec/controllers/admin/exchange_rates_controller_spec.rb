require 'rails_helper'

RSpec.describe ::Admin::ExchangeRatesController, type: :controller do

  describe 'POST create' do
    context 'with valid params' do
      let(:create_params) do
        { datetime: '2050-12-01 13:43', value: '63.2' }
      end

      it 'creates new rate' do
        expect { do_request }.to change(ExchangeRate, :count).by(1)
      end

      it 'assings right values' do
        do_request
        latest = ExchangeRate.last
        expect(latest.value.to_s).to eq(create_params[:value])
        expect(latest.datetime).to eq(DateTime.parse(create_params[:datetime]))
      end
    end

    context 'with invalid params' do
      let(:create_params) do
        { datetime: 'fsdfsdfds', value: '63.2' }
      end

      it 'does not create new rate' do
        expect { do_request }.to change(ExchangeRate, :count).by(0)
      end

      it 'return 422' do
        do_request
        expect(response.status).to eq(422)
      end
    end

    def do_request
      post :create, { :exchange_rate => create_params }
    end
  end
end
