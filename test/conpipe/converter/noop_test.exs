defmodule Conpipe.Converter.NoopTest do
  use ExUnit.Case

  alias Conpipe.Converter

  describe "basics" do
    test "converter namespace" do
      assert Converter
    end
  end

  describe "#convert" do
    test "with any input" do
      input = {"asdf", %{}}
      output = Converter.Noop.convert(input)
      assert output == input
    end
  end
end
