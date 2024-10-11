defmodule Conpipe.Converter.Mdex do
  @moduledoc """
  This converter uses the `MDEx` template engine to transform markdown to HTML.
  """

  def convert({input_text, assigns}, _converter_options \\ []) do

    opts =     [
      extension: [table: true, header_ids: "", tasklist: true, strikethrough: true],
      render: [unsafe_: true],
      features: [syntax_highlight_theme: "kanagawa"]
    ]

    output_text = MDEx.to_html!(input_text, opts)

    {output_text, assigns}
  end
end
