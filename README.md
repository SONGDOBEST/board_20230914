##table
```sql
Create table  member_tb(
    id bigint primary key auto_increment,
    memberEmail varchar(100),
    memberPassword varchar(100),
    memberName varchar(50),
    memberMobile varchar(50),
    memberProfileAttached int default 0
);

create table member_file_tb(
    id bigint primary key auto_increment,
    originalFileName varchar(200),
    storeFileName varchar(200),
    memberId bigint,
    constraint foreign key (memberId)references member_tb (id) on delete cascade
);
```