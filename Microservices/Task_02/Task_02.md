## Домашнее задание к занятию «Микросервисы: принципы»

#### Вы работаете в крупной компании, которая строит систему на основе микросервисной архитектуры. Вам как DevOps-специалисту необходимо выдвинуть предложение по организации инфраструктуры для разработки и эксплуатации.

### Задача 1: API Gateway

Предложите решение для обеспечения реализации API Gateway. Составьте сравнительную таблицу возможностей различных программных решений. На основе таблицы сделайте выбор решения.

Решение должно соответствовать следующим требованиям:

* маршрутизация запросов к нужному сервису на основе конфигурации,
* возможность проверки аутентификационной информации в запросах,
* обеспечение терминации HTTPS.

Обоснуйте свой выбор.

Для обеспечения реализации API Gateway можно рассмотреть следующие программные решения и их возможности:
* 
 | Решение            | Маршрутизация | Проверка аутентификации  | Терминация HTTPS  |
 |--------------------|---------------|--------------------------|-------------------|
 | NGINX              | Да            | Да                       | Да                |
 | Kong               | Да            | Да                       | Да                |
 | Apigee             | Да            | Да                       | Да                |
 | Tyk                | Да            | Да	                 | Да                |
 | Amazon API Gateway | Да            | Да                       | Да                |
 

На основе таблицы можно сделать выбор в пользу NGINX. NGINX является широко используемым и проверенным временем решением с отличной производительностью. Он обладает всеми необходимыми возможностями для реализации API Gateway, включая маршрутизацию запросов, проверку аутентификации и терминацию HTTPS. Кроме того, NGINX имеет обширную документацию и поддержку сообщества, что облегчает его внедрение и поддержку.

### Задача 2: Брокер сообщений

Составьте таблицу возможностей различных брокеров сообщений. На основе таблицы сделайте обоснованный выбор решения.

Решение должно соответствовать следующим требованиям:

* поддержка кластеризации для обеспечения надёжности,
* хранение сообщений на диске в процессе доставки,
* высокая скорость работы,
* поддержка различных форматов сообщений,
* разделение прав доступа к различным потокам сообщений,
* простота эксплуатации.

Обоснуйте свой выбор.

Для обеспечения работы с брокерами сообщений исходя из требований, можно рассмотреть следующие решения и их возможности:
*
 
 | Решение       | 	Кластеризация | 	Хранение на диске| 	Скорость | 	Поддержка различных форматов | 	Разделение прав доступа | 	Простота эксплуатации |
 |---------------|--------------------|--------------------------|---------------|-----------------------------------|--------------------------|-----------------------------|
 | Apache Kafka  | Да                 | Да                       | Высокая       | Да                                | Да                       | Нет                         |
 | RabbitMQ      | Да	              | Да                       | Высокая       | Да                                | Да                       | Да                          |
 | Apache Pulsar | Да                 | Да                       | Высокая       | Да                                | Да                       | Нет                         |
 | ActiveMQ      | Да	              | Да                       | Средняя       | Да                                | Да                       | Да                          |
 | NATS          | Да	              | Нет                      | Всокая        | Да                                | Да                       | Да                          |



На основе таблицы можно сделать выбор в пользу RabbitMQ. Он обладает всеми необходимыми возможностями для обеспечения работы с брокером сообщений, включая кластеризацию, хранение на диске, высокую скорость работы, поддержку различных форматов сообщений и разделение прав доступа. Кроме того, RabbitMQ имеет простой интерфейс и хорошо документирован, что облегчает его эксплуатацию.
Итоговое решение будет зависеть от того, что для компании является приоритетом и на какие параметры нужно обратить внимание.

## END