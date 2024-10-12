defmodule Conpipe.Converter.Noop do
  use Conpipe.TableauAdapter

  @moduledoc """
  This converter passes `{input, assigns}` thru unchanged.

  Used for testing.
  """

  @behaviour Conpipe.Converter

  @doc "No-op module used for testing"
  @impl Conpipe.Converter
  @spec convert({input :: String.t(), assigns :: map()}, options :: keyword()) ::
          {output :: String.t(), assigns :: map()}

  def convert({text, assigns}, _converter_opts \\ []) do
    {text, assigns}
  end
end
