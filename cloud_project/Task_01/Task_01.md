## Домашнее задание к занятию «Организация сети» 


### Задание 1. Yandex Cloud 
#### Что нужно сделать

1. Создать пустую VPC. Выбрать зону.
2. Публичная подсеть.

* Создать в VPC subnet с названием public, сетью 192.168.10.0/24.
* решение:
* 01: ![01](img/01.png)
* 02: ![02](img/02.png)
* Создать в этой подсети NAT-инстанс, присвоив ему адрес 192.168.10.254. В качестве image_id использовать fd80mrhj8fl2oe87o4e1.
* решение:
* 03: ![03](img/03.png)
* 04: ![04](img/04.png)
* Создать в этой публичной подсети виртуалку с публичным IP, подключиться к ней и убедиться, что есть доступ к интернету.
* решение:
* 05: ![05](img/05.png)
* 06: ![06](img/06.png)
* 07: ![07](img/07.png)

3. Приватная подсеть.

* Создать в VPC subnet с названием private, сетью 192.168.20.0/24.
* решение:
* 08: ![08](img/08.png)
* 09: ![09](img/09.png)
* Создать route table. Добавить статический маршрут, направляющий весь исходящий трафик private сети в NAT-инстанс.
* решение:
* 10: ![10](img/10.png)
* 11: ![11](img/11.png)
* Создать в этой приватной подсети виртуалку с внутренним IP, подключиться к ней через виртуалку, созданную ранее, и убедиться, что есть доступ к интернету.
* решение:
* 12: ![12](img/12.png)
* 13: ![13](img/13.png)

* ссылка на maim.tf - https://github.com/staratel74/devops-netology/blob/main/cloud_project/Task_01/src/main.tf
* ссылка на variables.tf - https://github.com/staratel74/devops-netology/blob/main/cloud_project/Task_01/src/variables.tf
## END