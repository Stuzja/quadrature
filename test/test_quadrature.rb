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

  def test_integration_of_linear_function
    func = proc { |x| x**2 }
    min_lim = 1.0
    max_lim = 2.0
    delta = 0.001

    expected_result = 7.0/3.0
    result = Quadrature.simpson_integration(func, min_lim, max_lim, delta)
    assert_in_delta(expected_result, result, 0.001)
  end

  # тесты Симпсона
  def test_simpson_one
    func = proc { |x| x**2 }
    min_lim = 0.0
    max_lim = 1.0
    delta = 0.001

    expected_result = 1.0/3.0
    result = Quadrature.simpson_integration(func, min_lim, max_lim, delta)
    assert_in_delta(expected_result, result, 0.001, )
  end

  def test_simpson_two
    func = proc { |x| x**2 }
    min_lim = 0.0
    max_lim = 1.0
    delta = 0.001

    expected_result = 1.0/3.0
    result = Quadrature.simpson_integration(func, min_lim, max_lim, delta)
    assert_in_delta(expected_result, result, 0.001)
  end

  def test_simpson_three
    func = proc { |x| Math.sin(x) }
    min_lim = 0.0
    max_lim = Math::PI
    delta = 0.001

    expected_result = 2.0
    result = Quadrature.simpson_integration(func, min_lim, max_lim, delta)
    assert_in_delta(expected_result, result, 0.001)
  end

end
