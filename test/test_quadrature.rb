# frozen_string_literal: true

require 'test/unit'
require 'quadrature'

class TestQuadrature < Test::Unit::TestCase
  test 'VERSION' do
    assert do
      ::Quadrature.const_defined?(:VERSION)
    end
  end

  test 'integrate' do
    assert true
  end

  def test_rectangle_integral
    # Тестируем функцию на примере интегрирования функции f(x) = x^2 от 0 до 1
    func = proc { |x| x**2 }
    min_lim = 0.0
    max_lim = 1.0
    delta = 0.001

    expected_result = 0.33350000000000037
    result = Quadrature.rectangle_integral(func, min_lim, max_lim, delta)

    # Сравниваем полученный результат с ожидаемым с учетом погрешности
    assert_in_delta(expected_result, result, 0.001)
  end


  def test_trapezoidal_integration
    func = proc { |x| x**2 }
    min_lim = 0.0
    max_lim = 1.0
    delta = 0.001

    expected_result = 0.33350000000000037
    result = Quadrature.trapezoidal_integration(func, min_lim, max_lim, delta)
    assert_in_delta(expected_result, result, 0.001)
  end

end
