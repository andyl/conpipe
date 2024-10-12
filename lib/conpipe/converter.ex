defmodule Conpipe.Converter do

  @moduledoc """
  Behavior for Conpipe Connectors
  """

  @callback convert({String.t(), map()}, keyword()) :: {String.t(), map()}

end
