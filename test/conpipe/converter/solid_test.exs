defmodule Conpipe.Converter.SolidTest do
  use ExUnit.Case

  alias Conpipe.Converter

  describe "basics" do
    test "converter namespace" do
      assert Converter
    end
  end

  describe "#convert" do
    test "with a basic liquid tag" do
      text = "hello"
      input = ~s({{ "#{text}" }})
      {output, _} = Converter.Solid.convert({input, %{}})
      assert output == text
    end

    test "with a liquid assignment" do
      input = ~S({% assign zing = "444" %}{{zing}})
      {output, _} = Converter.Solid.convert({input, %{}})
      assert output
    end
  end
end
