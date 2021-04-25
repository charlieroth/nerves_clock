defmodule Clock.LED do
  alias Circuits.GPIO

  def open(pin) do
    message("Opening pin #{pin}")
    {:ok, led} = GPIO.open(pin, :output)
    led
  end
  
  def on(led) do
    message("Turning led #{inspect(led)} on")
    GPIO.write(led, 1)
    led
  end
  
  def off(led) do
    message("Turning led #{inspect(led)} off")
    GPIO.write(led, 0)
    led
  end

  def set(led, true), do: on(led)
  def set(led, false), do: off(led)

  defp message(message) do
    IO.puts(message)
  end
end
