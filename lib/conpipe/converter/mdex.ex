defmodule Conpipe.Converter.Mdex do
  use Conpipe.Extended

  @moduledoc """
  This converter uses the `MDEx` template engine to transform markdown to HTML.

  See the [MDEx](https://github.com/edgurgel/solid) repo for more information.
  """

  @behaviour Conpipe.Converter

  @doc "Convert Markdown to HTML using MDEx"
  @impl Conpipe.Converter
  @spec convert({input :: String.t(), assigns :: map()}, options :: keyword()) ::
          {output :: String.t(), assigns :: map()}

  def convert({input, assigns}, _converter_opts \\ []) do
    opts = [
      extension: [table: true, header_ids: "", tasklist: true, strikethrough: true],
      render: [unsafe_: true],
      features: [syntax_highlight_theme: "kanagawa"]
    ]

    output = MDEx.to_html!(input, opts)

    {output, assigns}
  end
end
