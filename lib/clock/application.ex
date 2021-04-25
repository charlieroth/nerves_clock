defmodule Clock.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    opts = [strategy: :one_for_one, name: Clock.Supervisor]
    t = target()
    e = env()
    IO.puts("t: #{inspect(t)}")
    IO.puts("e: #{inspect(e)}")
    Supervisor.start_link(children(target(), env()), opts)
  end

  def children(_target, :test) do
    []
  end

  def children(_target, _other) do
    [{Clock.Server, Application.get_all_env(:clock)}]
  end

  def target() do
    Application.get_env(:clock, :target)
  end

  def env() do
    Application.get_env(:clock, :env)
  end
end
