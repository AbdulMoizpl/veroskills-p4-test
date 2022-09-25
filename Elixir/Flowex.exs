defmodule FunPipeline do
  use Flowex.Pipeline

  pipe :add_one
  pipe :mult_by_two
  pipe :minus_three

  defstruct number: nil, a: nil, b: nil, c: nil

  def add_one(%{number: number}, %{a: a}) do
    %{number: number + 1, a: a}
  end

  # mult_by_two and minus_three definitions skipped
end