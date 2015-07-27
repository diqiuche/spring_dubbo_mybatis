drop table  if exists t_user;
create table t_user(
  id bigint auto_increment primary  key  ,
  name varchar(256),
  email varchar(256),
  phone char(11),
  username varchar(256),
  password varchar(256)
);

drop table if exists t_order;
create table t_order(
  id bigint auto_increment primary  key,
  createtime bigint ,
  userId bigint ,
  name varchar(256)
);

drop table if exists t_blog;
create table t_blog(
  id bigint auto_increment primary key,
  name varchar(256),
  userid bigint
);

drop table if exists t_comment;
create table t_comment(
  id bigint auto_increment primary key,
  name varchar(256),
  blogid bigint
);

drop table if exists t_country;
create table t_country(
  id bigint auto_increment primary key,
  countryname varchar(256),
  userid bigint
);