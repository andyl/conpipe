defmodule Conpipe.Converter.SolidMdex do
  use Conpipe.TableauAdapter

  @moduledoc """
  This converter consumes Markdown text with embedded Liquid tags.

  It uses the `Conpipe.Convert.Solid` to transform the Liquid tags,
  and `Conpipe.Convert.Mdex` to transform Markdown to HTML.
  """

  @behaviour Conpipe.Converter

  @doc "Convert Liquid tags then convert markdown to HTML"
  @impl Conpipe.Converter
  @spec convert({input :: String.t(), assigns :: map()}, options :: keyword()) ::
          {output :: String.t(), assigns :: map()}

  def convert({input, assigns}, _converter_opts \\ []) do
    {input, assigns}
    |> Conpipe.Converter.Solid.convert()
    |> Conpipe.Converter.Mdex.convert()
  end
end
