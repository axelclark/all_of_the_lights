defmodule LightsUI.Relay do
  @moduledoc false

  alias GrovePi.{Digital}

  def on(pin) do
    Digital.write(pin, 1)
  end

  def off(pin) do
    Digital.write(pin, 0)
  end

  def start(pin) do
    Digital.set_pin_mode(pin, :output)
  end
end
