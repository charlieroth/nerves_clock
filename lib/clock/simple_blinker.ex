defmodule Clock.SimpleBlinker do
  alias Clock.LED

  def blink(led, wait) do
    LED.on(led)
    Process.sleep(wait)
    LED.off(led)
    Process.sleep(wait)
    led
  end

  def blink_times(led, wait, times) do
    Enum.reduce(1..times, led, fn (_, led) -> blink(led, wait) end)
  end
end
