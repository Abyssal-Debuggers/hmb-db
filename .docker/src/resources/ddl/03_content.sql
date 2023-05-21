   create table hmb.content (
          story_id uuid not null                               ,
          seq_no integer not null                              ,
          raw jsonb not null                                   ,
          unique (story_id, seq_no)                            ,
          foreign key (story_id) references hmb.story (story_id)
          );