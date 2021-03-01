defmodule ElixirJobsWeb.JobsController do
  use ElixirJobsWeb, :controller

  def index(conn, _params) do
    Enum.each(1..10_000, fn x -> ElixirJobs.Workers.FibonacciWorker.new(%{args: x}) end)
    render(conn, "index.html")
  end
end
