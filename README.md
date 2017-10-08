# All Of The Lights
A Nerves poncho project to control lights on a GrovePi relay switch using 
Phoenix channels.

## Getting Started

On the GrovePi+ or GrovePi Zero, connect a relay switch to port D3.  The relay
switch should be connected to the light power cord.

To start this Nerves app:
  * `cd lights_firmware`  Build firmware from this directory.
  * `export MIX_TARGET=my_target` or prefix every command with
    `MIX_TARGET=my_target`. For example, `MIX_TARGET=rpi3`
  * `export NERVES_NETWORK_SSID=my_wifi` WiFi Network
  * `export NERVES_NETWORK_PSK=secret` WiFi Password
  * `export NERVES_HOST="192.168.0.000"` Host needed for channels handshake.
  * Install dependencies with `mix deps.get`
  * Create firmware with `mix firmware`
  * Burn to an SD card with `mix firmware.burn`

## Learn more

  * Official docs: https://hexdocs.pm/nerves/getting-started.html
  * Official website: http://www.nerves-project.org/
  * Discussion Slack elixir-lang #nerves ([Invite](https://elixir-slackin.herokuapp.com/))
  * Source: https://github.com/nerves-project/nerves
