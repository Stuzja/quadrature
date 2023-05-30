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
end
