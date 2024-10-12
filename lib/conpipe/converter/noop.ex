defmodule Conpipe.Converter.Noop do
  use Conpipe.TableauAdapter

  @moduledoc """
  This converter passes `{input_text, assigns}` thru unchanged.

  Used for testing.
  """

  def convert({text, assigns}, _converter_options \\ []) do
    {text, assigns}
  end
end
