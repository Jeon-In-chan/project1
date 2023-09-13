create table admin(
a_id varchar2(20) not null,
a_pw varchar2(100) not null,
a_name varchar2(20) not null,
a_p_number varchar2(20) not null,
a_mail varchar2(50) not null,
a_authority varchar2(20) not null,
a_regdate date default SYSDATE,
a_moddate date default SYSDATE
);
