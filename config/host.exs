import Config
alias Clock.LEDAdapter

# Add configuration that is only needed when running on the host here.
config :clock,
  led_adapter: if Mix.env() == :test, do: LEDAdapter.Test, else: LEDAdapter.Dev
