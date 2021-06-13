drop table if exists `datagrouptype`;
create table `datagrouptype` (
  `DataGroupTypeId` int not null auto_increment,
  `DataGroupTypeName` varchar(50) default null,
  `Description` varchar(1000) default null,
  primary key (`datagrouptypeid`),
  unique key `datagrouptype_datagrouptypename_unique` (`DataGroupTypeName`)
) engine=InnoDB auto_increment=7 default charset=utf8mb4 collate=utf8mb4_0900_ai_ci;