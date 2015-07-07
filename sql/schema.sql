drop table  if exists t_user;
create table t_user(
  id bigint auto_increment primary  key  ,
  name varchar(256),
  email varchar(256),
  phone char(11)
);

drop table if exists t_order;
create table t_order(
  id bigint primary  key,
  createtime bigint ,
  userId bigint ,
  name varchar(256)
);