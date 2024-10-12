defmodule Conpipe.Converter.Noop do
  use Conpipe.TableauAdapter

  @moduledoc """
  This converter passes `{input_text, assigns}` thru unchanged.

  Used for testing.
  """

  @behaviour Conpipe.Converter
  @impl Conpipe.Converter
  @spec convert({String.t(), map()}, keyword()) :: {String.t(), map()}
  def convert({text, assigns}, _converter_options \\ []) do
    {text, assigns}
  end
end
