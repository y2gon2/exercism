defmodule SpaceAge do
  @in_earth %{days: 365.25, seconds: 31_557_600}
  @planets_year %{
    mercury:  0.2408467,
    venus: 0.61519726,
    earth: 1.0,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }

  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  (https://exercism.org/tracks/elixir/exercises/space-age)
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(planet, _) when planet not in [:mercury, :venus, :earth, :mars, :jupiter, :saturn, :uranus, :neptune], do: {:error, "not a planet"}
  def age_on(planet, seconds) when planet in [:mercury, :venus, :earth, :mars, :jupiter, :saturn, :uranus, :neptune] do
    year_in_earth = seconds / @in_earth.seconds
    result = year_in_earth / Map.get(@planets_year, planet)

    {:ok, Float.round(result, 2)}
  end
end
