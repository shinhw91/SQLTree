create table users(
          userid varchar2(20) primary key,
          userpw varchar2(50),
          grade varchar2(10)
);

insert into users values('user1', '1111', 'user');
insert into users values('admin1', '1111', 'admin');
insert into users values('user2', '1111', 'user');

commit;

insert into customer values ( HIBERNATE_SEQUENCE.nextval, '홍길동', '1111-1111');
insert into customer values ( HIBERNATE_SEQUENCE.nextval, '최기자', '2222-2222');

commit;

select * from customer;
