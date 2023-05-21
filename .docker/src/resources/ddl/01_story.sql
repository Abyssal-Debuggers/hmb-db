   create table hmb.story (
          story_id uuid primary key default uuid_generate_v7 (),
          title varchar(255) not null                          ,
          post_at timestamptz not null
          );