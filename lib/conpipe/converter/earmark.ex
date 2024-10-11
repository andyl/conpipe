defmodule Conpipe.Converter.Earmark do
  @moduledoc """
  This converter uses the `Earmark` conversion engine to transform markdown to HTML.
  """

  def convert({input_text, assigns}, _converter_options) do
    {:ok, output_text, _} = Earmark.as_html(input_text)

    {output_text, assigns}
  end
end
