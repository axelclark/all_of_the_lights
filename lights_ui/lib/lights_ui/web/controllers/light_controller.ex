defmodule LightsUI.Web.LightController do
  use LightsUI.Web, :controller

  alias LightsUI.Relay

  @relay_pin 3

  def create(conn, %{"command" => command}) do
    case command do
      "on" -> Relay.on(@relay_pin)
      "off" -> Relay.off(@relay_pin)
    end

    redirect(conn, to: page_path(conn, :index))
  end
end
