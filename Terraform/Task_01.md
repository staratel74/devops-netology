## Домашнее задание к занятию «Введение в Terraform»

### Чек-лист готовности к домашнему заданию

#### Скачайте и установите актуальную версию Terraform >=1.4.X . Приложите скриншот вывода команды terraform --version.

* terraform_v: ![terraform_v](img/terraform_v.png)

#### Скачайте на свой ПК этот git-репозиторий. Исходный код для выполнения задания расположен в директории 01/src.
#### Убедитесь, что в вашей ОС установлен docker.
* docker_v: ![docker_v](img/docker_v.png)
#### Зарегистрируйте аккаунт на сайте https://hub.docker.com/, выполните команду docker login и введите логин, пароль.

## Задание 1
### Перейдите в каталог src. Скачайте все необходимые зависимости, использованные в проекте.

### Изучите файл .gitignore. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?

* рекшение:
* personal.auto.tfvars

### Выполните код проекта. Найдите в state-файле секретное содержимое созданного ресурса random_password, пришлите в качестве ответа конкретный ключ и его значение.
* random_password.png: ![random_password.png](img/random_password.png)

### Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла main.tf. Выполните команду terraform validate. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.
*   решение:
*    в блоке resource "docker_image тсутствует имя ресурса
*    в блоке resource "docker_container"  ошибка в имени ресурса - "1nginx"
*    в блоке resource "docker_container" ссылка на незадекларированный ресурс - random_string_FAKE 
*    в блоке resource "docker_container" неподдерживаемый атрибут - resulT

### Выполните код. В качестве ответа приложите: исправленный фрагмент кода и вывод команды docker ps.
* main.tf_01.png: ![main.tf_01.png](img/main.tf_01.png)


* docker_ps_01.png: ![docker_ps_01.png](img/docker_ps_01.png)

### Замените имя docker-контейнера в блоке кода на hello_world. Не перепутайте имя контейнера и имя образа. Мы всё ещё продолжаем использовать name = "nginx:latest". Выполните команду terraform apply -auto-approve. Объясните своими словами, в чём может быть опасность применения ключа -auto-approve. В качестве ответа дополнительно приложите вывод команды docker ps.
* решение:
* при использовании ключа -auto-approve, terraform начинает формировать инфраструктуру сразу, повышается вероятность ошибки


* docker_ps_02.png: ![docker_ps_02.png](img/docker_ps_02.png)

### Уничтожьте созданные ресурсы с помощью terraform. Убедитесь, что все ресурсы удалены. Приложите содержимое файла terraform.tfstate.
* tfstate_01.png: ![tfstate_01.png](img/tfstate_01.png)

### Объясните, почему при этом не был удалён docker-образ nginx:latest. Ответ обязательно подкрепите строчкой из документации terraform провайдера docker. (ищите в классификаторе resource docker_image )
* решение:
* docker-образ nginx:latest не удалился потомучто в коде блока resource "docker_image" "nginx" использовали keep_locally = true
* Строка из документации terraform:
* keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.


## END