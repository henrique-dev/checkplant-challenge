# frozen_string_literal: true

require 'challenges_helper'

RSpec.describe RamenTime do

  let(:preparation_time) { 5 }
  let(:first_hourglass_time) { 5 }
  let(:second_hourglass_time) { 5 }

  let(:params) { {preparation_time: preparation_time, first_hourglass_time: first_hourglass_time, second_hourglass_time: second_hourglass_time} }

  context 'with the ramen preparation time in 3 minutes, the first hourglass of 2 minutes and the second hourglass of 7 minutes' do

    let(:preparation_time) { 3 }
    let(:first_hourglass_time) { 2 }
    let(:second_hourglass_time) { 7 }
    let!(:service_response) { RamenTime.new(**params).call }

    it 'it will not be possible to process because the time of the first hourglass is less than the time of preparation of the ramen' do
      expect(service_response[:time]).to be_nil
      expect(service_response[:message]).to eq('The hourglass time must be longer than the ramen preparation time')
    end
  end

  context 'with the ramen preparation time in 3 minutes, the first hourglass of 5 minutes and the second hourglass of 7 minutes' do

    let(:preparation_time) { 3 }
    let(:first_hourglass_time) { 5 }
    let(:second_hourglass_time) { 7 }
    let!(:service_response) { RamenTime.new(**params).call }

    it 'the time for the ramen to be ready will be 10 minutes' do
      expect(service_response[:time]).to eq(10)
      expect(service_response[:message]).to eq('It is possible to cook in exact time')
    end
  end

  context 'with the ramen preparation time in 4 minutes, the first hourglass of 8 minutes and the second hourglass of 9 minutes' do

    let(:preparation_time) { 4 }
    let(:first_hourglass_time) { 8 }
    let(:second_hourglass_time) { 9 }
    let!(:service_response) { RamenTime.new(**params).call }

    it 'the time for the ramen to be ready will be 36 minutes' do
      expect(service_response[:time]).to eq(36)
      expect(service_response[:message]).to eq('It is possible to cook in exact time')
    end
  end

  context 'with the ramen preparation time in 11 minutes, the first hourglass of 13 minutes and the second hourglass of 25 minutes' do

    let(:preparation_time) { 11 }
    let(:first_hourglass_time) { 13 }
    let(:second_hourglass_time) { 25 }
    let!(:service_response) { RamenTime.new(**params).call }

    it 'the time for the ramen to be ready will be 50 minutes' do
      expect(service_response[:time]).to eq(50)
      expect(service_response[:message]).to eq('It is possible to cook in exact time')
    end
  end

  context 'with the noodle preparation time of 11 minutes, the first hourglass of 14 minutes and the second hourglass of 21 minutes' do

    let(:preparation_time) { 11 }
    let(:first_hourglass_time) { 14 }
    let(:second_hourglass_time) { 21 }
    let!(:service_response) { RamenTime.new(**params).call }

    it 'will not have time to prepare the ramen' do
      expect(service_response[:time]).to eq(nil)
      expect(service_response[:message]).to eq('Can\'t cook in exact time')
    end
  end

end
