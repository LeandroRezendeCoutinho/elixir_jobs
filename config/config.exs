# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixir_jobs, Oban,
  repo: ElixirJobs.Repo,
  plugins: [Oban.Plugins.Pruner],
  queues: [default: 20, critic: 10, maintenance: 5]

config :elixir_jobs,
  ecto_repos: [ElixirJobs.Repo]

# Configures the endpoint
config :elixir_jobs, ElixirJobsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "THe/4k6J6+dMNPhYUWvKg6JFFb3+iCb+sPs7H7vaLUjFdfV8Jk4HvPEG+GPKFIZy",
  render_errors: [view: ElixirJobsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ElixirJobs.PubSub,
  live_view: [signing_salt: "UVGi+HWP"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
