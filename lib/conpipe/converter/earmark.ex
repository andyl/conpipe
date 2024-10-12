defmodule Conpipe.Converter.Earmark do
  # use Conpipe.TableauAdapter

  @moduledoc """
  This converter uses the `Earmark` conversion engine to transform markdown to HTML.

  See the [Earmark Repo](https://hexdocs.pm/earmark/Earmark.html) for more info.
  """

  @behaviour Conpipe.Converter
  @impl Conpipe.Converter
  @spec convert({String.t(), map()}, keyword()) :: {String.t(), map()}
  def convert({input_text, assigns}, _options \\ []) do
    {:ok, output_text, _} = Earmark.as_html(input_text)

    {output_text, assigns}
  end
end
