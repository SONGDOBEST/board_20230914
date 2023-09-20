##table

```sql
Create table member_tb
(
    id                    bigint primary key auto_increment,
    memberEmail           varchar(100),
    memberPassword        varchar(100),
    memberName            varchar(50),
    memberMobile          varchar(50),
    memberProfileAttached int default 0
);

create table member_file_tb
(
    id               bigint primary key auto_increment,
    originalFileName varchar(200),
    storeFileName    varchar(200),
    memberId         bigint,
    constraint foreign key (memberId) references member_tb (id) on delete cascade
);

create table board_tb
(
    id            bigint primary key auto_increment,
    boardTitle    varchar(100),
    boardWriter   varchar(100),
    boardPass     varchar(50),
    boardContents varchar(500),
    boardHits     int      default 0,
    createdAt     datetime default now(),
    fileAttached  int      default 0
);

create table board_file_tb
(
    id               bigint primary key auto_increment,
    originalFileName varchar(100),
    storeFileName    varchar(100),
    boardId          bigint,
    constraint foreign key (boardId) references board_tb (id) on delete cascade
);

```