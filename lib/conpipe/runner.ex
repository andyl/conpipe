defmodule Conpipe.Runner do

  @moduledoc """
  Functions to
  """
  def reduce(pipeline, input_text, assigns) when is_list(pipeline) do
    Enum.reduce(pipeline, {input_text, assigns}, fn
      {converter, opts}, acc ->
        converter.convert(acc, opts)
      converter, acc ->
        converter.convert(acc)
    end)
  end

  def exec(pipeline, input_text, assigns) do
    reduce(pipeline, input_text, assigns)
    |> elem(0)
  end
end

