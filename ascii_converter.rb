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
  png = ChunkyPNG::Image.from_io(image.to_blob)

  ascii_art = ""

  (0...png.height).each do |y|
    (0...png.width).each do |x|
      pixel = png[x, y]
      r = ChunkyPNG::Color.r(pixel)
      g = ChunkyPNG::Color.g(pixel)
      b = ChunkyPNG::Color.b(pixel)
      grayscale = pixel_to_grayscale(r, g, b)
      ascii_art += ASCII_CHARS[(grayscale * (ASCII_CHARS.length - 1) / 255)]
    end
    ascii_art += "\n"
  end

  File.write(output_path, ascii_art)
end

# Example usage
convert_to_ascii('path_to_image.jpg', 'output.txt')
