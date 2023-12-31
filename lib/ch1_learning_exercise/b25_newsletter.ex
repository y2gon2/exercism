defmodule Newsletter do
  @moduledoc """
  Exercise Learning goals
  * Functions for working with files are provided by the File module.
  (https://exercism.org/tracks/elixir/exercises/newsletter)
  """

  def read_emails(path) do
    File.read!(path)
    |> String.split("\n")
    |> Enum.filter(fn email -> email != "" end)
  end

  def open_log(path) do
    File.open!(path, [:write])
  end

  def log_sent_email(pid, email) do
    # IO.write(pid, email <> "\n")
    IO.puts(pid, email)
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_newsletter(emails_path, log_path, send_fn) do
    emails = read_emails(emails_path)
    pid = open_log(log_path)

    Enum.each(emails, fn email ->
      case send_fn.(email) do
        :ok -> log_sent_email(pid, email)
        :error -> nil
      end
    end)
    close_log(pid)
  end
end
