defmodule PollerDal do
  use Application

  def start(_types, _args) do
    children = [
      {PollerDal.Repo, []}
    ]

    opts = [strategy: :one_for_one, name: PollorDal.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
