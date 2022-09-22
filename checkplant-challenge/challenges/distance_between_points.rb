# frozen_string_literal: true

class DistanceBetweenPoints

  def initialize(points:)
    @points = points
  end

  def call
    distances = []
    @points.each_with_index do |point_a, index_a|
      @points.each_with_index do |point_b, index_b|
        next if (index_a == index_b)

        distance = Math.sqrt((point_b[:x] - point_a[:x])**2 +  (point_b[:y] - point_a[:y])**2)

        distances << {
          x1: point_a[:x],
          y1: point_a[:y],
          x2: point_b[:x],
          y2: point_b[:y],
          distance: sprintf('%.5f', distance).to_f
        }
      end
    end
    distances
  end

end
