   create table account.user (
          user_id uuid primary key default uuid_generate_v7 (),
          username varchar(255) not null                      ,
          email varchar(255) not null
          );