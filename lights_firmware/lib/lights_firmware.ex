defmodule LightsFirmware do
  @moduledoc false
  use GenServer

  alias GrovePi.{Digital}

  def start_link(relay_pin) do
    GenServer.start_link(__MODULE__, relay_pin)
  end

  def init(relay_pin) do
    state = %{relay_pin: relay_pin}
    Digital.set_pin_mode(relay_pin, :output)

    toggle_relay(relay_pin)
    {:ok, state}
  end

  def toggle_relay(relay_pin) do
    Digital.write(relay_pin, 1)
    Process.sleep(2000)
    Digital.write(relay_pin, 0)
    Process.sleep(2000)
    Digital.write(relay_pin, 1)
  end
end
