DELETE
FROM RESULTS;
DELETE
FROM TRAININGS;
DELETE
FROM SCHEDULE;
DELETE
FROM WORDS;
DELETE
FROM SETTINGS;
DELETE
FROM DICTIONARIES;
DELETE
FROM USERS;

ALTER SEQUENCE WORD_ID_SEQ RESTART WITH 1;
ALTER SEQUENCE DICT_ID_SEQ RESTART WITH 1;
ALTER SEQUENCE TRAIN_ID_SEQ RESTART WITH 1;
ALTER SEQUENCE USER_ID_SEQ RESTART WITH 1;

insert into USERS (ID, NAME, PASSWORD, ROLE)
values (1, 'lenu', 'password', 'ROLE_USER'),
       (2, 'admin', 'admin', 'ROLE_ADMIN'),
       (3, 'user1', 'user1', 'ROLE_USER');

insert into DICTIONARIES (id, NAME, CREATE_DATE, DESCRIPTION, USER_ID)
values (1, 'My Dictionary', '2025-03-09', 'main dictionary', 1),
       (2, 'Animals', '2025-03-09', 'dictionary about animals', 1),
       (3, 'Other user dictionary', '2025-03-09', 'someone^s else dictionary', 3);
;

insert into WORDS (NAME, TRANSLATION, CONTEXT, EXAMPLE, ADD_DATE, DICTIONARY_ID)
values ('tenacious', 'упорный, упрямый', 'merriam-webster',
        'The tenacious king salmon will likely be coming back for many, many autumns to come.',
        '2025-03-09', 1),
       ('treadmill', 'беговая дорожка', 'Dr. House',
        'Put the patient on a treadmill.',
        '2025-03-09', 1);

insert into SCHEDULE (WORD_ID, NEXT_TRAIN_DATE, LAST_TRAIN_DATE, TOTAL_NUMBER, STAGE, STATUS, LEARNT_DATE, DICT_ID)
values (1, '2025-03-09', null, 0, 0, 0, null, 1),
       (2, '2025-03-09', null, 0, 0, 0, null, 1);

insert into SETTINGS (USER_ID, NUMBER_NEW_WORDS, NUMBER_REPEAT_WORDS, EMAIL)
values (1, 10, 10, 'smirnov.fe@gmail.com'),
       (3, 10, 10, NULL);

