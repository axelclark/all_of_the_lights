defmodule LightsUI.Web.PageController do
  use LightsUI.Web, :controller

  alias GrovePi.{Digital}
  @relay_pin 3

  def index(conn, _params) do
    toggle_relay(@relay_pin)

    render conn, "index.html"
  end

  def toggle_relay(relay_pin) do
    Digital.set_pin_mode(relay_pin, :output)
    Digital.write(relay_pin, 1)
    Process.sleep(2000)
    Digital.write(relay_pin, 0)
    Process.sleep(2000)
    Digital.write(relay_pin, 1)
    Process.sleep(2000)
    Digital.write(relay_pin, 0)
  end
end
