# quadrature
Команде _“Quadrature”_ было поручено разработать библиотеку на языке _Ruby_, ответственную за **интегрирование функций**. В качестве **методов**, нами были выбраны следующие способы:

1) **Метод трапеции** — метод численного интегрирования функции одной переменной, заключающийся в замене на каждом элементарном отрезке подынтегральной функции на многочлен первой степени, то есть _линейную функцию_. Площадь под графиком функции аппроксимируется прямоугольными трапециями.
  # @param [Block] func
  # @param [Float] min_lim
  # @param [Float] max_lim
  # @param [Float] delta
  def self.trapezoidal_integration(func, min_lim, max_lim, delta)

2) **Метод Симпсона** — метод, заключающийся в приближении подыинтегральной функции на отрезке [a, b] интерполяционным многочленом второй степени p2(x), то есть _приближение_ графика функции на отрезке параболой. 
  # @param [Block] func
  # @param [Float] min_lim
  # @param [Float] max_lim
  # @param [Float] delta
  def self.simpson_integration(func, min_lim, max_lim, delta)

3) **Метод прямоугольников** — метод численного интегрирования функции одной переменной, заключающийся в замене подынтегральной функции на _многочлен нулевой степени_, то есть константу, на каждом элементарном отрезке. (приближённое вычисление площади под графиком суммированием площадей конечного числа прямоугольников, ширина которых будет определяться расстоянием между соответствующими соседними узлами интегрирования, а высота — значением подынтегральной функции в этих узлах)
  # @param [Block] func
  # @param [Float] min_lim
  # @param [Float] max_lim
  # @param [Float] delta
  def self.rectangle_integral(func, min_lim, max_lim, delta)

4) **Метод Чебышёва** является одним из представителей методов наивысшей алгебраической точности Гаусса. Его отличительной особенностью является наличие у подынтегральной функции _множителя_ 1/sqrt(1-x^2).
