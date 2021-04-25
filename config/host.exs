import Config
alias Clock.LEDAdapter

mix_env = Mix.env()

led_adapter =
  if mix_env == :test do
    LEDAdapter.Test
  else
    LEDAdapter.Dev
  end

env = 
  if mix_env == :test do
    :test
  else
    nil
  end
# Add configuration that is only needed when running on the host here.
config :clock,
  pins: %{0 => 0, 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5},
  led_adapter: led_adapter
  
config :clock, env: env

