defmodule Conpipe.Converter.Solid do
  use Conpipe.Extended

  @moduledoc """
  This converter uses the `Solid` template engine to transform Liquid tags.

  See the [Solid](https://github.com/leandrocp/mdex) repo for more information.
  """

  @behaviour Conpipe.Converter

  @doc """
  Resolve liquid tags using Solid

  If there are syntax errors in the Liquid tags, the input text will returned as-is,
  with an error message pre-pended in the first line.
  """
  @impl Conpipe.Converter
  @spec convert({input :: String.t(), assigns :: map()}, converter_opts :: keyword()) ::
          {output :: String.t(), assigns :: map()}

  def convert({input, assigns}, _converter_opts \\ []) do
    str_assigns = assigns |> Conpipe.Util.stringify_keys()

    output = render(input, str_assigns)

    {output, assigns}
  end

  defp render(input, assigns) do
    errtext = "**LIQUID RENDER ERROR!**\n\n" <> input
    render_opts = [strict_variables: false, strict_filters: false]

    try do
      input
      |> Solid.parse!()
      |> Solid.render(assigns, render_opts)
      |> elem(1)
      |> to_string()
    rescue
      _error -> errtext
    end
  end
end
