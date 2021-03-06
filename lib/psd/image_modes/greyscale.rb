class PSD::Image::Mode
  module Greyscale
    private

    def combine_greyscale8_channel
      if channels == 2
        # We have an alpha channel
        @num_pixels.times do |i|
          alpha = @channel_data[i]
          grey = @channel_data[@channel_length + i]

          @pixel_data.push grey, grey, grey, alpha
        end
      else
        @num_pixels.times do |i|
          @pixel_data.push *([@channel_data[i]] * 3), 255
        end
      end
    end

    def combine_greyscale_channel
      if channels == 2
        (0...@num_pixels).step(pixel_step) do |i|
          alpha = @channel_data[i]
          grey = @channel_data[@channel_length + i]

          @pixel_data.push grey, grey, grey, alpha
        end
      else
        (0...@num_pixels).step(pixel_step) do |i|
          @pixel_data.push *([@channel_data[i]] * 3), 255
        end
      end
    end
  end
end