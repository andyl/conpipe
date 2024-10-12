defmodule Conpipe.Converter.SolidMdex do
  use Conpipe.TableauAdapter

  @moduledoc """
  This converter consumes Markdown text with embedded Liquid tags.

  It uses the `Conpipe.Convert.Solid` to transform the Liquid tags,
  and `Conpipe.Convert.Mdex` to transform Markdown to HTML.
  """

  @behaviour Conpipe.Converter
  @impl Conpipe.Converter
  @spec convert({String.t(), map()}, keyword()) :: {String.t(), map()}
  def convert({input_text, assigns}, _converter_options \\ []) do
    {input_text, assigns}
    |> Conpipe.Converter.Solid.convert()
    |> Conpipe.Converter.Mdex.convert()
  end
end
