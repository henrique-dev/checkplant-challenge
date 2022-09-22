# frozen_string_literal: true

class RamenTime

  def initialize(preparation_time:, first_hourglass_time:, second_hourglass_time:)
    @preparation_time = preparation_time
    @first_hourglass_time = first_hourglass_time
    @second_hourglass_time = second_hourglass_time
  end

  def call
    return {time: nil, message: 'The hourglass time must be longer than the ramen preparation time'} if [@first_hourglass_time, @second_hourglass_time].min < @preparation_time

    total_preparation_time = 0
    first_hourglass_time_tmp = @first_hourglass_time
    second_hourglass_time_tmp = @second_hourglass_time

    difference = -1

    while difference != 0
      if first_hourglass_time_tmp > second_hourglass_time_tmp
        difference = first_hourglass_time_tmp - second_hourglass_time_tmp
        total_preparation_time += second_hourglass_time_tmp
        first_hourglass_time_tmp = difference
        second_hourglass_time_tmp = @second_hourglass_time
      else
        difference = second_hourglass_time_tmp - first_hourglass_time_tmp
        total_preparation_time += first_hourglass_time_tmp
        second_hourglass_time_tmp = difference
        first_hourglass_time_tmp = @first_hourglass_time
      end

      if difference == @preparation_time
        total_preparation_time += @preparation_time
        return {time: total_preparation_time, message: 'It is possible to cook in exact time'}
      end
    end

    {time: nil, message: 'Can\'t cook in exact time'}
  end

end
