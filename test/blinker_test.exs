defmodule BlinkerTest do
  use ExUnit.Case
  alias Clock.Blinker

  test "Tracks blinks" do
    adapter = Blinker.open(26)
    %{led: actual} = Blinker.blink_times(adapter, 2, 1)
    expected = [:open, :on, :off]
    assert Enum.reverse(actual.history) == expected
  end
end
