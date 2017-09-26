defmodule LightsUI.Web.PageController do
  use LightsUI.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
