defmodule ElixirJobsWeb.JobsController do
  use ElixirJobsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end