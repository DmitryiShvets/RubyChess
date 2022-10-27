# Chess

RubyChess - это гем для игры в шахматы, написанный на чистом ruby. Игра расчитана на 2-х игроков, которые по очереди делают свои ходы.

## Установка

Установите гем и добавьте его в Gemfile приложения, выполнив:

```sh
bundle add chess
```
    
>Если bundler не используется для управления зависимостями, установите гем, выполнив:

```sh
gem install chess
```

## Как играть?

Для начала игры впишите команду

```sh
Chess.start
```
После этого запустится программа и Вы увидите меню, в котором можно будет выбрать выбрать один из пунктов.

 `new - начать новую игру`
 `exit - выход в меню`
 `surrender - сдаться текущему игроку`
 `stop - остановка программы`
 
 
 Напишем ```new``` для запуска игры <br>
 Во время игры нужно по очереди делать ход, указывая сначала начальную позицию, нажать Enter, а после указать конечную позицию. <br>
 Так, первой позицией, Вы выберите фигуру, которая отобразится в консоле пользователя, а второй, передвините её на указаную клетку. <br>
 Позицию клетки можно указать множеством способов. 
 Например: <b>a1</b>,<b>1a</b>,<b>A1</b>,<b>1A</b><br>
 Точно так же вы можете использовать любую раскладку клавиатуры, при выборе букв, которые одинаково пишутся в англ. и рус. раскладке.<br>
 Например: <b>а</b>,<b>с</b>,<b>е</b>
 Также Вы можете использовать систему координат, которая традиционна x - горизонталь, y - вертикаль. Отсчёт начинается с 0 с левого нижнего угла<br>
 Например: 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Разработчики

![](https://img.shields.io/badge/3.10-%D0%A8%D0%B2%D0%B5%D1%86%20%D0%94%D0%BC%D0%B8%D1%82%D1%80%D0%B8%D0%B9-critical)<br>
![](https://img.shields.io/badge/3.10-%D0%A8%D0%B0%D1%88%D1%83%D1%80%D0%B8%D0%BD%20%D0%95%D0%B3%D0%BE%D1%80-critical)<br>
![](https://img.shields.io/badge/3.10-%D0%9C%D0%B0%D1%80%D1%87%D0%B5%D0%BD%D0%BA%D0%BE%20%D0%9A%D0%BE%D0%BD%D1%81%D1%82%D0%B0%D0%BD%D1%82%D0%B8%D0%BD-critical)<br>

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Chess project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/chess/blob/master/CODE_OF_CONDUCT.md).
