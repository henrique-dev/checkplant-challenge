# frozen_string_literal: true

require 'challenges_helper'

RSpec.describe DistanceBetweenPoints do

  context 'with some points inserted' do

    let(:params) { {points: [
      {x: 0, y: 0},
      {x: 0, y: 5},
      {x: 3, y: 5},
      {x: 4, y: -3}
    ]} }
    let!(:service_response) { DistanceBetweenPoints.new(**params).call }

    it 'calculates the distance between all points' do
      expect(service_response).to eq(
        [
          {x1: 0, y1: 0, x2: 0, y2: 5, distance: 5.0},
          {x1: 0, y1: 0, x2: 3, y2: 5, distance: 5.83095},
          {x1: 0, y1: 0, x2: 4, y2: -3, distance: 5.0},

          {x1: 0, y1: 5, x2: 0, y2: 0, distance: 5.0},
          {x1: 0, y1: 5, x2: 3, y2: 5, distance: 3.0},
          {x1: 0, y1: 5, x2: 4, y2: -3, distance: 8.94427},

          {x1: 3, y1: 5, x2: 0, y2: 0, distance: 5.83095},
          {x1: 3, y1: 5, x2: 0, y2: 5, distance: 3.0},
          {x1: 3, y1: 5, x2: 4, y2: -3, distance: 8.06226},

          {x1: 4, y1: -3, x2: 0, y2: 0, distance: 5.0},
          {x1: 4, y1: -3, x2: 0, y2: 5, distance: 8.94427},
          {x1: 4, y1: -3, x2: 3, y2: 5, distance: 8.06226}
        ]
      )
    end
  end
end
