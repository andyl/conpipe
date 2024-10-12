defmodule Conpipe.Converter.EarmarkTest do
  use ExUnit.Case

  alias Conpipe.Converter

  describe "basics" do
    test "converter namespace" do
      assert Converter
    end
  end

  describe "#convert" do
    test "with basic markdown text" do
      text = "# hello"
      {output, _} = Converter.Earmark.convert({text, %{}})
      assert output =~ "<h1>"
      assert output =~ "</h1>"
      assert output =~ "hello"
    end
  end
end
