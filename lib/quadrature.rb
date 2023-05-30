# frozen_string_literal: true

require_relative 'quadrature/version'

module Quadrature
  class Error < StandardError; end

  # @param [Block] func
  # @param [Float] min_lim
  # @param [Float] max_lim
  # @param [Float] delta
  def self.rectangle_integral(func, min_lim, max_lim, delta)
    # Вычисляем количество шагов
    n = ((max_lim - min_lim) / delta).ceil

    # Инициализируем переменную для хранения суммы
    sum = 0.0

    # Проходим по каждому прямоугольнику
    n.times do |i|
      x = min_lim + i * delta
      sum += func.call(x) * delta
    end

    # Возвращаем значение интеграла
    sum
  end

  # @param [Block] func
  # @param [Float] min_lim
  # @param [Float] max_lim
  # @param [Float] delta
  def self.trapezoidal_integration(func, min_lim, max_lim, delta)
    n = ((max_lim - min_lim) / delta).ceil
    sum = 0.0

    (1..n - 1).each do |i|
      x = min_lim + i * delta
      sum += func.call(x)
    end

    sum += (func.call(min_lim) + func.call(max_lim)) / 2.0
    sum *= delta

    sum
  end

  # @param [Block] func
  # @param [Float] min_lim
  # @param [Float] max_lim
  # @param [Float] delta
  def self.simpson_integration(func, min_lim, max_lim, delta)
    n = ((max_lim - min_lim) / delta).to_i
    delta_x = (max_lim - min_lim) / n.to_f

    sum = func.call(min_lim) + func.call(max_lim)
    factor = 4

    (1..(n - 1)).each do |i|
      x = min_lim + i * delta_x
      sum += factor * func.call(x)
      factor = 6 - factor
    end

    (delta_x / 3) * sum
  end


  # @param [Block] func
  # @param [Float] a
  # @param [Float] b
  # @param [Int] n
  def self.chebyshev_integration(func, a, b, n)
    # Шаг интегрирования
    h = (b - a) / n.to_f

    # Вычисление узлов Чебышева
    nodes = []
    (0..n).each do |k|
      x_k = Math.cos((2 * k + 1) * Math::PI / (2 * (n + 1)))
      nodes << (a + (b - a) * (1 + x_k) / 2)
    end

    # Вычисление значения интеграла
    integral = 0
    (0..n).each do |k|
      integral += func.call(nodes[k])
    end
    integral *= (b - a) / (n + 1).to_f

    integral
  end
end
