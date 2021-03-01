defmodule ElixirJobs.Workers.FibonacciWorker do
  use Oban.Worker, queue: :default
  alias ElixirJobs.Fibonacci

  @impl Oban.Worker
  def perform(job) do
    IO.inspect(job.args)
    IO.puts(Fibonacci.fib(10))
    :ok
  end
end
