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

    test "with assigns" do
      input = ~S(x{{zing}}x)
      {output, _} = Converter.Solid.convert({input, %{zing: "-"}})
      assert output == "x-x"
    end

    test "with a missing variable" do
      input = ~S(x{{zing}}x)
      {output, _} = Converter.Solid.convert({input, %{}})
      assert output == "xx"
    end

    test "with a malformed tag" do
      input = ~S(y{{zing}y)
      {output_str, _assigns} = Converter.Solid.convert({input, %{}})
      assert output_str =~ "zing"
      assert output_str =~ "ERROR"
    end
  end
end
