defmodule Conpipe.UtilTest do
  use ExUnit.Case

  alias Conpipe.Util

  describe "#stringify_keys" do
    test "with a simple map" do
      subject = %{a: 1}
      result = Util.stringify_keys(subject)
      assert result == %{"a" => 1}
      refute result == subject
    end

    test "with a nested map" do
      subject = %{a: 1, b: %{c: 2}}
      result = Util.stringify_keys(subject)
      assert result == %{"a" => 1, "b" => %{"c" => 2}}
      refute result == subject
    end

    test "with an empty map" do
      subject = %{}
      result = Util.stringify_keys(subject)
      assert result == %{}
    end
  end
end
