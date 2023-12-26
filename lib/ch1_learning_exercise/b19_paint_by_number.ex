defmodule PaintByNumber do
  @moduledoc """
  Exercise Learning goals
  * Bitstrings
  (https://exercism.org/tracks/elixir/exercises/paint-by-number)
  """

  def palette_bit_size(color_count) do
     bit_size(1, color_count)
  end

  defp bit_size(num, color_count) do
    if Integer.pow(2, num) >= color_count do
      num
    else
      bit_size(num + 1, color_count)
    end
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    bit_size = palette_bit_size(color_count)
    <<pixel_color_index::size(bit_size), picture::bitstring>>
  end

  def get_first_pixel(<<>>, _), do: nil
  def get_first_pixel(picture, color_count) do
    bits = palette_bit_size(color_count)
    <<first::size(bits), _rest::bitstring>> = picture
    first
  end

  def drop_first_pixel(<<>>, _), do: <<>>
  def drop_first_pixel(picture, color_count) do
    bits = palette_bit_size(color_count)
    <<_first::size(bits), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
