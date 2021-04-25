# Nerves Clock

LED light display of the second hand, of a clock, represented as a binary number

## Target Used

Raspberry PI 4 Model B

## Circuit Used

![Image of Circuit](/Circuit.png?raw=true)

## Getting Started

  * `export MIX_TARGET=rpi4` or prefix every command with `MIX_TARGET=rpi4`
  * Install dependencies with `mix deps.get`
  * Create firmware with `mix firmware`
  * Burn to an SD card with `mix firmware.burn`


## Connect To Target
  
  * `ssh nerves.local`

## Upgrading Firmware

While connected to `target` via ssh

  * Create a new firmware with `mix firmware`
  * Upload new firmware to available partition with `mix upload`
  * Drink some water, Reconnect to `target`


## Resources

  * Official docs: https://hexdocs.pm/nerves/getting-started.html
  * Official website: https://nerves-project.org/
  * Forum: https://elixirforum.com/c/nerves-forum
  * Discussion Slack elixir-lang #nerves ([Invite](https://elixir-slackin.herokuapp.com/))
  * Source: https://github.com/nerves-project/nerves
