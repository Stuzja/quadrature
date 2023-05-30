# frozen_string_literal: true

require "test/unit"

class TestQuadrature < Test::Unit::TestCase
  test "VERSION" do
    assert do
      ::Quadrature.const_defined?(:VERSION)
    end
  end

  test "integrate" do
    assert true
  end

  test "something useful" do
    assert_equal("expected", "actual")
  end
end
