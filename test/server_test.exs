defmodule Clock.ServerTest do
  use ExUnit.Case, async: false
  alias Clock.Server

  defp start do
    start_link_args = [
      %{
        led_adapter: Clock.LEDAdapter.Test,
        send_ticks_fn: fn -> :do_nothing end,
        pins: Clock.Server.default_pins(),
        time: 0
      }
    ]

    child_spec = %{
      id: Clock.Server,
      start: {Server, :start_link, start_link_args}
    }

    start_supervised!(child_spec)
  end

  defp time do
    :sys.get_state(Clock.Server).time
  end

  test "proper startup" do
    refute Process.whereis(Clock.Server)
    start()
    assert Clock.Server |> Process.whereis |> Process.alive?
  end

  test "track ticks", _ do
    assert time() == 0
    
    Clock.Server.tick()
    assert time() == 1
    
    Clock.Server.tick()
    assert time() == 2
  end
end
