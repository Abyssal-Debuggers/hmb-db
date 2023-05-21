   create table hmb.story_tag (
          story_id uuid not null                                ,
          tag varchar(255) not null                             ,
          foreign key (story_id) references hmb.story (story_id),
          foreign key (tag) references hmb.tag (tag)
          );