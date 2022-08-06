-- 建t_user表
CREATE TABLE `t_user`(
  `user_id` int COMMENT '用户id', 
  `sex` string COMMENT '性别', 
  `age` int COMMENT '年龄', 
  `occupation` string COMMENT '职业', 
  `zip_code` bigint COMMENT '邮编')
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.contrib.serde2.MultiDelimitSerDe' 
WITH SERDEPROPERTIES ( 
  'field.delim'='::') 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  '/home/student1/zhangjiali/hive/users/users.dat'  -- hdfs文件路径
TBLPROPERTIES (
  'bucketing_version'='2', 
  'transient_lastDdlTime'='1659782017');


-- 建t_movie表
CREATE TABLE `t_movie`(
  `movie_id` int COMMENT '电影id', 
  `movie_name` string COMMENT '电影名字', 
  `movie_type` string COMMENT '电影类型')
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.contrib.serde2.MultiDelimitSerDe' 
WITH SERDEPROPERTIES ( 
  'field.delim'='::') -- 按::进行分隔，如果数据本身是别的分隔符，按具体情况选择，例如：\t
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  '/home/student1/zhangjiali/hive/movies/movies.dat' -- hdfs文件路径
TBLPROPERTIES (
  'bucketing_version'='2', 
  'transient_lastDdlTime'='1659782017');


-- 建t_rating表
CREATE TABLE `t_rating`(
  `user_id` int COMMENT '用户id', 
  `movie_id` bigint COMMENT '电影id', 
  `rate` int COMMENT '评分', 
  `times` string COMMENT '评分时间')
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.contrib.serde2.MultiDelimitSerDe' 
WITH SERDEPROPERTIES ( 
  'field.delim'='::') 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  '/home/student1/zhangjiali/hive/ratings/' -- hdfs文件路径
TBLPROPERTIES (
  'bucketing_version'='2', 
  'transient_lastDdlTime'='1659782017');

