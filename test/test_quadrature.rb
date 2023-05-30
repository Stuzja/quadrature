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

  #Тесты на метод прямоугольников
  def test_rectangle_integral_one
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

  def test_rectangle_integral_two
    # Определяем функцию для интегрирования
    func = ->(x) { x ** 2 }

    # Устанавливаем границы интегрирования и шаг
    min_lim = 0
    max_lim = 1
    delta = 0.1

    # Вычисляем ожидаемое значение интеграла
    expected_result = 0.32835

    # Вызываем функцию для вычисления интеграла
    result = Quadrature.rectangle_integral(func, min_lim, max_lim, delta)

    # Проверяем, что результат близок к ожидаемому значению
    assert_in_delta expected_result, result, 0.1
  end

  def test_rectangle_integral_three
    # Определяем функцию для интегрирования
    func = ->(x) { Math.sin(x) }

    # Устанавливаем границы интегрирования и шаг
    min_lim = 0
    max_lim = Math::PI
    delta = 0.01

    # Вычисляем ожидаемое значение интеграла
    expected_result = 1.99999833

    # Вызываем функцию для вычисления интеграла
    result = Quadrature.rectangle_integral(func, min_lim, max_lim, delta)

    # Проверяем, что результат близок к ожидаемому значению
    assert_in_delta expected_result, result, 0.00001
  end

  def test_rectangle_integral_four
    # Определяем функцию для интегрирования
    func = ->(x) { Math.exp(x) }

    # Устанавливаем границы интегрирования и шаг
    min_lim = 0
    max_lim = 2
    delta = 0.001

    # Вычисляем ожидаемое значение интеграла
    expected_result = 6.3890561

    # Вызываем функцию для вычисления интеграла
    result = Quadrature.rectangle_integral(func, min_lim, max_lim, delta)

    # Проверяем, что результат близок к ожидаемому значению
    assert_in_delta expected_result, result, 0.01
  end

  #Тесты метод трапеций
  def test_trapezoidal_integration_one
    func = proc { |x| x**2 }
    min_lim = 0.0
    max_lim = 1.0
    delta = 0.001

    expected_result = 0.33350000000000037
    result = Quadrature.trapezoidal_integration(func, min_lim, max_lim, delta)
    assert_in_delta(expected_result, result, 0.001)
  end

  def test_trapezoidal_integration_two
    func = proc { |x| Math.sin(x) }
    min_lim = 0.0
    max_lim = Math::PI
    delta = 0.001

    expected_result = 2.0

    result = Quadrature.trapezoidal_integration(func, min_lim, max_lim, delta)
    assert_in_delta(expected_result, result, delta)
  end

  def test_trapezoidal_integration_three
    func = proc { |x| x**3 }
    min_lim = 0.0
    max_lim = 2.0
    delta = 0.001

    expected_result = 4.0

    result = Quadrature.trapezoidal_integration(func, min_lim, max_lim, delta)
    assert_in_delta(expected_result, result, delta)
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
