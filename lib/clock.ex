defmodule Clock do
  @default_wait 500
  alias Clock.Blinker
  alias Clock.LEDAdapter
  
  def open(gpio) do
    # Returns led
    Blinker.open(gpio)
  end
  
  def on(gpios) when is_list(gpios) do
    # Returns leds
    Enum.map(gpios, fn gpio ->
      gpio
        |> open()
        |> LEDAdapter.on() 
    end)
  end

  def on(gpio) do
    # Returns led
    gpio
      |> open()
      |> LEDAdapter.on() 
  end
  
  def off(leds) when is_list(leds) do
    # Returns leds
    Enum.map(leds, fn led ->
      LEDAdapter.off(led) 
    end)
  end
  
  def off(led) do
    # Returns led
    LEDAdapter.off(led) 
  end

  def blink(gpio, times, wait \\ @default_wait) do
    gpio
    |> open()
    |> Blinker.blink_times(times, wait)

    :ok
  end
  
  def async_blink(gpio, times, wait \\ @default_wait) do
    Task.async(fn ->
      blink(gpio, times, wait)
    end)
  end
end
