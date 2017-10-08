defmodule LightsUI.Web.SwitchChannel do
  use Phoenix.Channel

  alias LightsUI.Relay

  @relay_pin 3

  def join("switch:bedroom", _message, socket) do
    {:ok, socket}
  end

  def join("switch:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("on", %{"body" => body}, socket) do
    IO.puts body
    Relay.on(@relay_pin)
    {:noreply, socket}
  end

  def handle_in("off", %{"body" => body}, socket) do
    IO.puts body
    Relay.off(@relay_pin)
    {:noreply, socket}
  end
end
