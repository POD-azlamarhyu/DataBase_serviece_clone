create table user_account_info (
    user_id uuid not null,
    email text not null,
    password bytea null,
    CONSTRAINT user_account_info_pkey PRIMARY KEY (user_id)
);

CREATE TABLE profile_info (
    profile_id bigserial not null PRIMARY KEY,
    user_id uuid not null,
    user_name varchar not null,
    birtyday date,
    created_at timestamp not null default CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_account_info (user_id) ON DELETE CASCADE
);

create table channel_info (
    channel_id bigserial not null PRIMARY KEY,
    user_id uuid not null,
    channel_name varchar not null,
    account_id varchar not null,
    FOREIGN KEY (user_id) REFERENCES user_account_info (user_id) ON DELETE CASCADE
);

create table video_info (
    video_id bigserial not null PRIMARY KEY,
    user_id uuid not null,
    video_tile varchar not null,
    video_type text,
    video_file text,
    video_caption text,
    uploaded_at TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_account_info (user_id) ON DELETE CASCADE
) ;

create table like_info (
    like_id bigserial not null PRIMARY KEY,
    user_id uuid not null,
    video_id bigserial not null,
    FOREIGN KEY (user_id) REFERENCES user_account_info (user_id) ON DELETE CASCADE,
    FOREIGN KEY (video_id) REFERENCES video_info (video_id) ON DELETE CASCADE
) ;

create table dislike_info (
    dislike_id bigserial not null PRIMARY KEY,
    user_id uuid not null,
    video_id bigserial not null,
    FOREIGN KEY (user_id) REFERENCES user_account_info (user_id) ON DELETE CASCADE,
    FOREIGN KEY (video_id) REFERENCES video_info (video_id) ON DELETE CASCADE
) ;

create table comment_info (
    comment_id bigserial not null PRIMARY KEY,
    user_id uuid not null,
    comment text not null,
    created_at TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_account_info (user_id) ON DELETE CASCADE
) ;

create table watch_history_info (
    history_id bigserial not null PRIMARY KEY,
    user_id uuid not null,
    video_id bigserial not null,
    watched_at TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id)REFERENCES user_account_info (user_id) ON DELETE CASCADE,
    FOREIGN KEY (video_id) REFERENCES video_info (video_id) ON DELETE CASCADE
) ;

create table notification_info (
    notification_id bigserial not null PRIMARY KEY,
    user_id uuid not null,
    video_id bigserial not null,
    notificated_at TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_account_info (user_id) ON DELETE CASCADE,
    FOREIGN KEY (video_id) REFERENCES video_info (video_id) ON DELETE CASCADE
);

