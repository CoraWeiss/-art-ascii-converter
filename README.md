# -art-ascii-converter
# art-ascii-converter

## Overview
`art-ascii-converter` is a Ruby script that converts public domain images, such as paintings from The Met Museum's open source collection, into ASCII art.

## Features
- Convert any image to ASCII art
- Supports resizing images to fit the terminal window
- Easy-to-use and customizable

## Requirements
- Ruby (version x.x.x or higher)
- `mini_magick` gem
- `chunky_png` gem

## Installation
1. Clone the repository:
    ```sh
    git clone https://github.com/your_username/art-ascii-converter.git
    cd art-ascii-converter
    ```

2. Install the required gems:
    ```sh
    gem install mini_magick chunky_png
    ```

## Usage
1. Download a public domain image from The Met Museum's Open Access collection or any other source.
2. Run the script with the path to your image:
    ```sh
    ruby your_script.rb path_to_image.jpg
    ```

3. The ASCII art will be saved to `output.txt`.

## Example
![ASCII Art Example](path_to_example_image.png)

## Contributing
Feel free to fork this repository and submit pull requests if you have any improvements or additional features you'd like to add.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments
Special thanks to:
- The Met Museum for their Open Access collection
- The authors of `mini_magick` and `chunky_png` gems

