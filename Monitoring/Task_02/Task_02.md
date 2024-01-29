## Домашнее задание к занятию 14 «Средство визуализации Grafana» 
 
#### Задание 1
1. Используя директорию help внутри этого домашнего задания, запустите связку prometheus-grafana.
2. Зайдите в веб-интерфейс grafana, используя авторизационные данные, указанные в манифесте docker-compose.
3. Подключите поднятый вами prometheus, как источник данных.
4. Решение домашнего задания — скриншот веб-интерфейса grafana со списком подключенных Datasource.
* решение
01: ![01](img/01.png)

#### Задание 2
Создайте Dashboard и в ней создайте Panels:

1. утилизация CPU для nodeexporter (в процентах, 100-idle);
2. CPULA 1/5/15;
3. количество свободной оперативной памяти;
4. количество места на файловой системе.
5. Для решения этого задания приведите promql-запросы для выдачи этих метрик, а также скриншот получившейся Dashboard.
* решение
* утилизация CPU для nodeexporter (в процентах, 100-idle)
  * avg without (cpu)(irate(node_cpu_seconds_total{job="nodeexporter",mode="idle"}[1m])) 
* CPULA 1/5/15
  * node_load1{job="nodeexporter"}
  * node_load5{job="nodeexporter"}
  * node_load15{job="nodeexporter"}
* количество свободной оперативной памяти
  * node_memory_MemFree_bytes{job='nodeexporter'}
* количество места на файловой системе
  * node_filesystem_avail_bytes{device="/dev/mapper/ubuntu--vg-ubuntu--lv", fstype="ext4", instance="nodeexporter:9100", job="nodeexporter", mountpoint="/"}

02: ![02](img/02.png)

#### Задание 3
1. Создайте для каждой Dashboard подходящее правило alert — можно обратиться к первой лекции в блоке «Мониторинг».
2. В качестве решения задания приведите скриншот вашей итоговой Dashboard.
* решение

03: ![03](img/03.png)

04: ![04](img/04.png)


#### Задание 4
Сохраните ваш Dashboard.Для этого перейдите в настройки Dashboard, выберите в боковом меню «JSON MODEL». Далее скопируйте отображаемое json-содержимое в отдельный файл и сохраните его.
В качестве решения задания приведите листинг этого файла.




## END