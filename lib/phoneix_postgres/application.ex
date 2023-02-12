defmodule PhoneixPostgres.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PhoneixPostgres.Repo,
      # Start the Telemetry supervisor
      PhoneixPostgresWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhoneixPostgres.PubSub},
      # Start the Endpoint (http/https)
      PhoneixPostgresWeb.Endpoint
      # Start a worker by calling: PhoneixPostgres.Worker.start_link(arg)
      # {PhoneixPostgres.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoneixPostgres.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoneixPostgresWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
