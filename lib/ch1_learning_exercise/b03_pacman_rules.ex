defmodule Rules do
  def eat_ghost?(power_pellet_active?, touching_ghost?) do
    power_pellet_active? and touching_ghost?
  end

  def score?(touching_power_pellet?, touching_dot?) do
    touching_power_pellet? or touching_dot?
  end

  def lose?(touching_power_pellet?, touching_dot?) do
    (not touching_power_pellet?) and touching_dot?
  end

  def win?(eaten_all?, power_pellet_active?, touching_ghost?) do
    (not lose?(power_pellet_active?, touching_ghost?)) and eaten_all?
  end
end
