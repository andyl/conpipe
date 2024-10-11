defmodule Conpipe.Converter.Solid do
  @moduledoc """
  This converter uses the `Solid` template engine to transform Liquid tags.
  """

  def convert({input_text, assigns}, _converter_options \\ []) do
    str_assigns = assigns |> Conpipe.Util.stringify_keys()

    {:ok, template} = Solid.parse(input_text)
    output_text = Solid.render!(template, str_assigns) |> to_string

    {output_text, assigns}
  end
end
