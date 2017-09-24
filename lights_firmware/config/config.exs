# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Customize the firmware. Uncomment all or parts of the following
# to add files to the root filesystem or modify the firmware
# archive.

# config :nerves, :firmware,
#   rootfs_overlay: "rootfs_overlay",
#   fwup_conf: "config/fwup.conf"

# Use bootloader to start the main application. See the bootloader
# docs for separating out critical OTP applications such as those
# involved with firmware updates.
config :bootloader,
  init: [:nerves_runtime, :nerves_network],
  app: :lights_firmware

config :nerves_network,
  regulatory_domain: "US"

key_mgmt = System.get_env("NERVES_NETWORK_KEY_MGMT") || "WPA-PSK"

config :nerves_network, :default,
  wlan0: [
    ssid: System.get_env("NERVES_NETWORK_SSID"),
    psk: System.get_env("NERVES_NETWORK_PSK"),
    key_mgmt: String.to_atom(key_mgmt)
  ]

# Configures the endpoint
config :lights_ui, LightsUI.Web.Endpoint,
  http: [port: 80],
  url: [host: "localhost", port: 80],
  secret_key_base: "iqLZYuNamd4WuTzyFeZnowKbMKSBILxRT7W5mXDqhLkMArn5YqJVGsrd5IN4TOU1",
  root: Path.dirname(__DIR__),
  server: true,
  render_errors: [view: LightsUI.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LightsUI.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Import target specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
# Uncomment to use target specific configurations

# import_config "#{Mix.Project.config[:target]}.exs"
