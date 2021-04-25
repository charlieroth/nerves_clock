defmodule Clock.Blinker do
  alias Clock.LEDAdapter

  def open(pin) do
    LEDAdapter.open(pin)
  end
  
  def open(pin, adapter) do
    LEDAdapter.open(pin, adapter)
  end

  def sleep(led, wait) do
    Process.sleep(wait)
    led
  end

  def blink(led, wait) do
    led
    |> LEDAdapter.on()
    |> sleep(wait)
    |> LEDAdapter.off()
    |> sleep(wait)
  end

  def blink_times(led, times, wait) do
    Enum.reduce(1..times, led, fn (_, led) -> blink(led, wait) end)
  end
end
