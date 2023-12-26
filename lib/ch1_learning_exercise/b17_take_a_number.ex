defmodule TakeANumber do
  @moduledoc """
  Exercise Learning goals
  * Processes ( Messages / Receive loop)
  * PIDs
  (https://exercism.org/tracks/elixir/exercises/take-a-number)
  """

  def start() do
    spawn(fn -> loop(0) end)
  end

  defp loop(state) do
    receive do
      {:report_state, sender_id} ->
        send(sender_id, state)
        loop(state)
      {:take_a_number, sender_id} ->
        send(sender_id, state + 1)
        loop(state + 1)
      :stop -> nil
      _ -> loop(state)
    end
  end

  #------------------- 학습용 -------------------
  def start_counting() do
    spawn(fn -> counting_loop(0) end)
  end

  defp counting_loop(num) do
    Process.sleep(500)

    receive do
      :start ->
        IO.inspect(num, label: "start ")
        send(self(), :counting)
        counting_loop(num + 1)
      :counting ->
        if num < 10 do
          IO.inspect(num, label: "counting ")
          send(self(), :counting)
          counting_loop(num + 1)
        else
          IO.inspect(num, label: "finish ")
        end
      _ ->
        IO.inspect("???")
    end
  end
end
