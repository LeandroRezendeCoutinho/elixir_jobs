defmodule ElixirJobs.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ElixirJobs.Repo,
      # Start the Telemetry supervisor
      ElixirJobsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ElixirJobs.PubSub},
      # Start the Endpoint (http/https)
      ElixirJobsWeb.Endpoint,
      # Start a worker by calling: ElixirJobs.Worker.start_link(arg)
      # {ElixirJobs.Worker, arg}
      {Oban, oban_config()}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirJobs.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ElixirJobsWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  # Conditionally disable queues or plugins here.
  defp oban_config do
    Application.get_env(:elixir_jobs, Oban)
  end
end
