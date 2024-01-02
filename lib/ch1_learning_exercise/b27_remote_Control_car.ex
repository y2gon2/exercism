defmodule RemoteControlCar do
  @moduledoc """
  Exercise Learning goals
  * Structs
  (https://exercism.org/tracks/elixir/exercises/remote-control-car)
  """

  # new 함수를 사용하여 새로운 구조체를 생성할 때, nickname 값이 제공되어야 함.
  # 만약 nickname 키가 누락되면, Elixir는 오류를 발생시킴
  @enforce_keys [:nickname]
  defstruct [:battery_percentage, :distance_driven_in_meters, :nickname]

  def new(nickname \\ "none") do
    %__MODULE__{
      battery_percentage: 100,
      distance_driven_in_meters: 0,
      nickname: nickname
    }
  end

  def display_distance(
    %__MODULE__{
      battery_percentage: _,
      distance_driven_in_meters: distance,
      nickname: _
    }
  ) do
    "#{distance} meters"
  end

  def display_battery(
    %__MODULE__{
      battery_percentage: battery,
      distance_driven_in_meters: _,
      nickname: _
    }
  ) do
    if battery == 0 do
      "Battery empty"
    else
      "Battery at #{battery}%"
    end
  end

  def drive(
    %__MODULE__{
      battery_percentage: 0,
      distance_driven_in_meters: _,
      nickname: _
    } = remote_car
  ) do
    remote_car
  end

  def drive(
    %__MODULE__{
      battery_percentage: battery,
      distance_driven_in_meters: _,
      nickname: nickname
    }
  ) do
    %__MODULE__{
      battery_percentage: battery - 1,
      distance_driven_in_meters: 20,
      nickname: nickname
    }
  end
end
