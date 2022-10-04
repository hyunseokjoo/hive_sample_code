# hive_sample_code
### To start an HDFS/Spark Workbench
```bash 
docker-compose up -d
```
### Starting workbench with Hive support
```bash
docker-compose -f docker-compose-hive.yml up -d namenode hive-metastore-postgresql
docker-compose -f docker-compose-hive.yml up -d datanode hive-metastore
docker-compose -f docker-compose-hive.yml up -d hive-server
docker-compose -f docker-compose-hive.yml up -d spark-master spark-worker spark-notebook hue
```




---
[참고 문헌](https://github.com/big-data-europe/docker-hadoop-spark-workbench)