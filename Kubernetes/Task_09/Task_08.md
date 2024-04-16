## Домашнее задание к занятию «Управление доступом» 

### Цель задания  
#### В тестовой среде Kubernetes нужно предоставить ограниченный доступ пользователю.

#### Задание 1. Создайте конфигурацию для подключения пользователя

1. Создайте и подпишите SSL-сертификат для подключения к кластеру.
* решение:
* 01: ![01](img/01.png)
2. Настройте конфигурационный файл kubectl для подключения.
3. Создайте роли и все необходимые настройки для пользователя.
4. Предусмотрите права пользователя. Пользователь может просматривать логи подов и их конфигурацию (kubectl logs pod <pod_id>, kubectl describe pod <pod_id>).
* решение:
* 02: ![02](img/02.png)



* 03: ![03](img/03.png)
5. Предоставьте манифесты и скриншоты и/или вывод необходимых команд.
* ссылка на role.yaml - https://github.com/staratel74/devops-netology/blob/main/Kubernetes/Task_09/role.yaml 
* ссылка на role-binding.yaml - https://github.com/staratel74/devops-netology/blob/main/Kubernetes/Task_09/role-binding.yaml
* ссылка на config - https://github.com/staratel74/devops-netology/blob/main/Kubernetes/Task_09/config

## END