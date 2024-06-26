## Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 2»

### Цель задания 
#### В тестовой среде Kubernetes необходимо обеспечить доступ к двум приложениям снаружи кластера по разным путям.

#### Задание 1. Создать Deployment приложений backend и frontend 
1. Создать Deployment приложения frontend из образа nginx с количеством реплик 3 шт.
* решение:
* 01: ![01](img/01.png)
* ссылка на манифест frontend.yaml - https://github.com/staratel74/devops-netology/blob/main/Kubernetes/Task_05/frontend.yaml
2. Создать Deployment приложения backend из образа multitool.
* решение:
* 02: ![02](img/02.png)
* ссылка на манифест backend.yaml - https://github.com/staratel74/devops-netology/blob/main/Kubernetes/Task_05/backend.yaml
3. Добавить Service, которые обеспечат доступ к обоим приложениям внутри кластера.
* решение:
* 03: ![03](img/03.png)
* ссылка на манифест svc-front.yaml - https://github.com/staratel74/devops-netology/blob/main/Kubernetes/Task_05/svc-front.yaml
* ссылка на манифест svc-back.yaml - https://github.com/staratel74/devops-netology/blob/main/Kubernetes/Task_05/svc-back.yaml
4. Продемонстрировать, что приложения видят друг друга с помощью Service.
* решение:
* 04: ![04](img/04.png)

* 05: ![05](img/05.png)

5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.

#### Задание 2. Создать Ingress и обеспечить доступ к приложениям снаружи кластера 
1. Включить Ingress-controller в MicroK8S.
* 06: ![06](img/06.png)
2. Создать Ingress, обеспечивающий доступ снаружи по IP-адресу кластера MicroK8S так, чтобы при запросе только по адресу открывался frontend а при добавлении /api - backend.
3. Продемонстрировать доступ с помощью браузера или curl с локального компьютера.
* решение:
* 07: ![07](img/07.png)
* ссылка на манифест ingress.yaml - https://github.com/staratel74/devops-netology/blob/main/Kubernetes/Task_05/ingress.yaml
4. Предоставить манифесты и скриншоты или вывод команды п.2.

## END