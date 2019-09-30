[![Build Status](https://travis-ci.org/mikeoleynik/fun-box.svg?branch=master)](https://travis-ci.org/mikeoleynik/fun-box)

Тестовое задание для [FunBox](https://funbox.ru/).

### Требования:

-   Ruby 2.6.3
-   Rails 5.2.3

### Установка:

Клонируйте репозиторий:

```
git@github.com:mikeoleynik/fun-box.git
```

Для установки зависимостей, в папке с проектом выполните:

```
bundle install
```

Далее создайте БД и выполните миграции:

```
rails db:create
rails db:migrate
```

Обновите планировщик задач:

```
 whenever -i
```

Для запуска приложения и sidekiq:

```
foreman start
```