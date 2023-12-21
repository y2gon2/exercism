defmodule Secrets do
  @moduledoc """
  Exercise Learning goals
  * Anonymous Functions
  * Bit Manipulation
  (https://exercism.org/tracks/elixir/exercises/secrets)
  """
  def secret_add(secret) do
    # Please implement the secret_add/1 function
    fn param -> param + secret end
  end

  def secret_subtract(secret) do
    # Please implement the secret_subtract/1 function
    fn param -> param - secret end
  end

  def secret_multiply(secret) do
    # Please implement the secret_multiply/1 function
    fn param -> param * secret end
  end

  def secret_divide(secret) do
    # Please implement the secret_divide/1 function
    fn param -> param / secret |> trunc() end
  end

  def secret_and(secret) do
    # Please implement the secret_and/1 function
    fn param -> param |> Bitwise.band(secret) end
  end

  def secret_xor(secret) do
    # Please implement the secret_xor/1 function
    fn param -> param |> Bitwise.bxor(secret) end
  end

  def secret_combine(secret_function1, secret_function2) do
    # Please implement the secret_combine/2 function
    fn param -> param
    |> secret_function1.()
    |> secret_function2.()
    end
  end

end
