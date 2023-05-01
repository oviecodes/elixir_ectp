defmodule Catalog.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      CatalogWeb.Telemetry,
      # Start the Ecto repository
      Catalog.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Catalog.PubSub},
      # Start Finch
      {Finch, name: Catalog.Finch},
      # Start the Endpoint (http/https)
      CatalogWeb.Endpoint
      # Start a worker by calling: Catalog.Worker.start_link(arg)
      # {Catalog.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Catalog.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CatalogWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
