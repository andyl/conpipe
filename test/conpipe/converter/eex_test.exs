defmodule Conpipe.Converter.EexTest do
  use ExUnit.Case

  alias Conpipe.Converter

  describe "basics" do
    test "converter namespace" do
      assert Converter
    end
  end

  describe "#convert" do
    test "with a basic EEx tag" do
      text = "hello"
      input = ~s(<%= myvar %>)
      assigns = %{myvar: text}
      {output, _} = Converter.Eex.convert({input, assigns})
      assert output == text
    end
  end
end
