# Quadrature

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


## Installation

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

    $ bundle add UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/quadrature. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/quadrature/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Quadrature project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/quadrature/blob/master/CODE_OF_CONDUCT.md).
