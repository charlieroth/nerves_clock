defmodule Clock.LEDAdapter.Dev do
  defstruct [pin: 0, lit: false]

  require Logger
  alias Clock.LEDAdapter

  @behaviour LEDAdapter

  @impl LEDAdapter
  def open(pin) do
    Logger.info("Opening: #{inspect(pin)}")
    %__MODULE__{pin: pin, lit: false}
  end

  @impl LEDAdapter
  def on(led) do
    Logger.info("Turning #{inspect(led)} on")
    %{led | lit: true}
  end
  
  @impl LEDAdapter
  def off(led) do
    Logger.info("Turning #{inspect(led)} off")
    %{led | lit: false}
  end
end
