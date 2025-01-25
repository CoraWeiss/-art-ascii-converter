require 'mini_magick'
require 'chunky_png'

# Function to convert pixel to grayscale value
def pixel_to_grayscale(r, g, b)
  (0.3 * r + 0.59 * g + 0.11 * b).to_i
end

# ASCII characters from dark to light
ASCII_CHARS = %w[@ # 8 & o : * .].freeze

def convert_to_ascii(image_path, output_path)
  image = MiniMagick::Image.open(image_path)
  image.resize "100x100"
  png = ChunkyPNG::Image.from_blob(image.to_blob)

  ascii_art = png.height.times.map do |y|
    png.width.times.map do |x|
      pixel = png[x, y]
      r, g, b = ChunkyPNG::Color.r(pixel), ChunkyPNG::Color.g(pixel), ChunkyPNG::Color.b(pixel)
      grayscale = pixel_to_grayscale(r, g, b)
      ASCII_CHARS[(grayscale * (ASCII_CHARS.length - 1) / 255)]
    end.join
  end.join("\n")

  File.write(output_path, ascii_art)
end

# Example usage
convert_to_ascii('path_to_image.jpg', 'output.txt')
