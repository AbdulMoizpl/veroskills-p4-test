defmodule Mix.Tasks.Example
  use Mix.Task
  use Anubis

  banner """
  This is the example task.

  Use it like:
      $ mix example <command> <args>
  """

  rc_file %{
    username: "user",
    password: "p4$$w0rd",
    people: 10
  }

  option :file,  :string,   "The file to be loaded."
  option :procs: :integer,  "The number of concurrent processes to run"

  command :init, "Initialize the project.", Named.Function.init
  command :send, "Send me a small letter.", Named.Function.send
  command :list, "List all of the things.", Named.Function.list

  parse
end