require 'rails_helper'

RSpec.describe ExchangeRates::Create do
  let(:params) { attributes_for(:exchange_rate) }
  subject { ExchangeRates::Create.new.process(params) }

  it 'creates new rate' do
    expect { subject }.to change(ExchangeRate, :count).by(1)
  end

  it 'returns success' do
    expect(subject.success?).to be_truthy
  end

  describe 'with invalid params' do
    let(:params) { attributes_for(:invalid_rate) }

    it 'does not create new rate' do
      expect { subject }.to change(ExchangeRate, :count).by(0)
    end

    it 'returns error' do
      expect(subject.success?).to be_falsey
    end
  end
end
