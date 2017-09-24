defmodule LightsFirmware.Application do
  use Application

  @relay_pin 3

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(LightsFirmware, [@relay_pin]),
    ]

    opts = [strategy: :one_for_one, name: LightsFirmware.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
