defmodule Conpipe.Converter.Solid do
  use Conpipe.TableauAdapter

  @moduledoc """
  This converter uses the `Solid` template engine to transform Liquid tags.

  See the [Solid](https://github.com/leandrocp/mdex) repo for more information.

  See the [EEx Hexdocs](https://hexdocs.pm/eex/1.17/EEx.html) for more info.
  """

  def convert({input_text, assigns}, _converter_options \\ []) do
    str_assigns = assigns |> Conpipe.Util.stringify_keys()

    {:ok, template} = Solid.parse(input_text)
    output_text = Solid.render!(template, str_assigns) |> to_string

    {output_text, assigns}
  end
end
