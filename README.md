
Установка и запуск

```bash
git clone git@github.com:sirdemin/personnel.git
cd personnel
bundle install
yarn add @popper/core
cp config/database.yml.example config/database.yml
rails db:migrate
bundle exec rails s
```

[Heroku](https://personnel2021.herokuapp.com/)
