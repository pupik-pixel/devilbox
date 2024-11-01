# Devilbox with config for Bitrix24

В данном репозитории уже содержатся готовые конфигурации php/mysql для bitrix24,
а также скрипты reload.sh и update_db.sh 

По умолчанию включёны `mysql-5.7`, `php-8.1` и `apache-2.4`

В контейнер php включена библиотека php-spx для профилирования кода и нахождения "узких" мест производительности в
запросах.
<br> <br>Также в контейнер php подключен текстовый редактор nano. <br> <br>

Образы контейнеров php были написаны в папке `images/php{нужная версия php}` начиная с 7.0 по 8.2. <br>
Для остальных версий нужно будет дописать свой собственный `dockerfile` по желанию.

### Начало работы с LAMP-стеком

Для корректной работы требуется docker-compose-v2

Сначала проводим сборку контейнеров 

```
docker compose up mysql -d --build
```

Дальнейшие запуски можно проводить через скрипт reload.sh
```
./reload.sh
```
Теперь можно пользоваться по назначению

### Подробнее о библиотеке php-spx <br/>

Чтобы её включить необходимо в `~/devilbox/cfg/php-ini-{нужная версия php}` переименовать конфиг
`profiler.ini-example` --> `profiler.ini` <br/>
Пример конфига такой:

```ini
extension = /usr/lib/php-spx/modules/spx.so // подключаемое расширение
spx.http_enabled = 1 // разрешаем профилировать http-запросы
spx.http_key = "dev" // ключ параметра запроса
spx.http_ip_whitelist = "*" // разрешаем прослушивать все адреса
spx.data_dir = /var/www/html/spx_dumps // папка с файлами дампов в контейнере php
zlib.output_compression = 0 // необходимо для корректной работы панели управления
```

Панель управления находится по адресу http://localhost/?SPX_KEY=dev&SPX_UI_URI=/, чтобы дебажить какие либо запросы, нужно подкинуть два параметра
пример curl-запроса: <br>

```shell
curl --cookie "SPX_ENABLED=1; SPX_KEY=dev" http://localhost/
```
Для дебага запроса через Postman, достаточно дополнить адрес запроса строкой <br>
`/?SPX_ENABLED=1&SPX_KEY=dev`

Пример:
```url
http://your_domain/index.php/?SPX_ENABLED=1&SPX_KEY=dev
```


Далее в панели управления можно посмотреть дамп и просмотреть полный жизненный цикл запроса. <br>
[Более подробное описание библиотеки.](https://habr.com/ru/articles/505192/) <br>
[Ссылочка на GitHub.](https://github.com/NoiseByNorthwest/php-spx)