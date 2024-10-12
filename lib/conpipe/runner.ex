defmodule Conpipe.Runner do
  @moduledoc """
  Functions to run a pipeline
  """

  @doc """
  Reduce over a pipeline

  Returns `{output, assigns}`
  """
  def reduce(pipeline, input, assigns) when is_list(pipeline) do
    Enum.reduce(pipeline, {input, assigns}, fn
      {converter, opts}, acc ->
        converter.convert(acc, opts)

      converter, acc ->
        converter.convert(acc)
    end)
  end

  def reduce(converter, input, assigns) do
    reduce([converter], input, assigns)
  end

  @doc """
  Exec a pipeline

  Returns `output`
  """
  def exec(pipeline, input, assigns) do
    reduce(pipeline, input, assigns)
    |> elem(0)
  end
end
