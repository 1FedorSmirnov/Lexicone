DROP TABLE IF EXISTS words CASCADE;
DROP TABLE IF EXISTS schedule;
DROP TABLE IF EXISTS results;
DROP TABLE IF EXISTS trainings_words;
DROP TABLE IF EXISTS trainings;
DROP TABLE IF EXISTS dictionaries;
DROP TABLE IF EXISTS users CASCADE ;
DROP TABLE IF EXISTS settings;



DROP SEQUENCE IF EXISTS word_id_seq;
DROP SEQUENCE IF EXISTS dict_id_seq;
DROP SEQUENCE IF EXISTS user_id_seq;
DROP SEQUENCE IF EXISTS train_id_seq;
DROP SEQUENCE IF EXISTS result_id_seq;

CREATE SEQUENCE word_id_seq START WITH 1;
CREATE SEQUENCE dict_id_seq START WITH 1;
CREATE SEQUENCE user_id_seq START WITH 1;
CREATE SEQUENCE train_id_seq START WITH 1;
CREATE SEQUENCE result_id_seq START WITH 1;

CREATE TABLE users
(
    id       BIGSERIAL,
    name     VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role     VARCHAR(255) NOT NULL,
    CONSTRAINT users_pkey PRIMARY KEY (id)
);

CREATE TABLE dictionaries
(
    id          BIGSERIAL       NOT NULL,
    name        VARCHAR(255) NOT NULL,
    create_date DATE         NOT NULL,
    description VARCHAR(2048),
    user_id     BIGINT REFERENCES users,
    CONSTRAINT dictionaries_pkey PRIMARY KEY (id)
);

CREATE TABLE words
(
    id             BIGSERIAL,
    name           VARCHAR(255) NOT NULL,
    translation    VARCHAR(255) NOT NULL,
    context        VARCHAR(255),
    example        VARCHAR(2048),
    add_date       DATE,
    dictionary_id  BIGINT REFERENCES dictionaries,
    CONSTRAINT words_pkey PRIMARY KEY (id)
);

create table trainings
(
    id         BIGSERIAL,
    train_date date,
    user_id    BIGINT REFERENCES users,
    dict_id    BIGINT REFERENCES dictionaries,
    repeat     BOOLEAN,
    CONSTRAINT trainings_pkey PRIMARY KEY (id)
);

create table trainings_words
(
    id          BIGSERIAL,
    word_id     bigint references words (id) on delete cascade,
    training_id bigint references trainings (id),
    CONSTRAINT trainings_words_pkey PRIMARY KEY (id)
);

create table results
(
    id          BIGSERIAL,
    word_id     bigint references words (id) on delete cascade,
    training_id bigint references trainings (id),
    success     boolean,
    CONSTRAINT results_pkey PRIMARY KEY (id),
    CONSTRAINT unique_result_key UNIQUE (word_id, training_id)
);

create table schedule
(
    id          BIGSERIAL,
    word_id     bigint references words (id) on delete cascade,
    next_train_date DATE,
    last_train_date DATE,
    total_number    bigint,
    stage           VARCHAR(255),
    status          int,
    learnt_date     DATE,
    dict_id         bigint references dictionaries (id) on delete cascade,
    CONSTRAINT schedule_pkey PRIMARY KEY (id)
);

create table settings
(
    id          BIGSERIAL,
    user_id     bigint references users (id) on delete cascade,
    number_new_words        bigint,
    number_repeat_words     bigint,
    email                   varchar,
    CONSTRAINT settings_pkey PRIMARY KEY (id)
);



