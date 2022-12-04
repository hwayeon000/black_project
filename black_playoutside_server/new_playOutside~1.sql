-- ���̺� ������ ���踦 ����Ͽ� �� ���� �����ص� ������ �߻����� �ʰ� ���ĵǾ����ϴ�.

-- t_themes Table Create SQL
CREATE TABLE t_themes
(
    theme_seq     NUMBER(18, 0)    NOT NULL, 
    theme_name    VARCHAR2(20)     NOT NULL, 
     PRIMARY KEY (theme_seq)
)
/

CREATE SEQUENCE t_themes_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE
NOCYCLE
/

CREATE OR REPLACE TRIGGER t_themes_AI_TRG
BEFORE INSERT ON t_themes 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_themes_SEQ.NEXTVAL
    INTO :NEW.theme_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_themes_AI_TRG; /

--DROP SEQUENCE t_themes_SEQ; /

COMMENT ON TABLE t_themes IS '�׸�'
/

COMMENT ON COLUMN t_themes.theme_seq IS '�׸� ����'
/

COMMENT ON COLUMN t_themes.theme_name IS '�׸� �̸�'
/


-- t_programs Table Create SQL
CREATE TABLE t_programs
(
    prog_seq         NUMBER(18, 0)    NOT NULL, 
    prog_name        VARCHAR2(60)     NOT NULL, 
    prog_photo       VARCHAR2(300)    NOT NULL, 
    prog_addr        VARCHAR2(300)    NOT NULL, 
    prog_l_price     NUMBER(18, 0)    NOT NULL, 
    prog_h_price     NUMBER(18, 0)    NOT NULL, 
    prog_l_age       NUMBER(18, 0)    NOT NULL, 
    prog_h_age       NUMBER(18, 0)    NOT NULL, 
    prog_homepage    VARCHAR2(300)    NOT NULL, 
    prog_tel         VARCHAR2(20)     NOT NULL, 
    theme_seq        NUMBER(18, 0)    NOT NULL, 
     PRIMARY KEY (prog_seq)
)
/

CREATE SEQUENCE t_programs_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_programs_AI_TRG
BEFORE INSERT ON t_programs 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_programs_SEQ.NEXTVAL
    INTO :NEW.prog_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_programs_AI_TRG; /

--DROP SEQUENCE t_programs_SEQ; /

COMMENT ON TABLE t_programs IS 'ü��'
/

COMMENT ON COLUMN t_programs.prog_seq IS 'ü�� ����'
/

COMMENT ON COLUMN t_programs.prog_name IS 'ü�� ��'
/

COMMENT ON COLUMN t_programs.prog_photo IS 'ü�� ��ǥ ����'
/

COMMENT ON COLUMN t_programs.prog_addr IS 'ü�� �ּ�'
/

COMMENT ON COLUMN t_programs.prog_l_price IS 'ü�� ���� �ݾ�'
/

COMMENT ON COLUMN t_programs.prog_h_price IS 'ü�� �ְ� �ݾ�'
/

COMMENT ON COLUMN t_programs.prog_l_age IS 'ü�� ���� ����'
/

COMMENT ON COLUMN t_programs.prog_h_age IS 'ü�� �ְ� ����'
/

COMMENT ON COLUMN t_programs.prog_homepage IS 'Ȩ������ �ּ�'
/

COMMENT ON COLUMN t_programs.prog_tel IS '��ȭ��ȣ'
/

COMMENT ON COLUMN t_programs.theme_seq IS '�׸� ����'
/

ALTER TABLE t_programs
    ADD CONSTRAINT FK_t_programs_theme_seq_t_them FOREIGN KEY (theme_seq)
        REFERENCES t_themes (theme_seq)
/


-- t_users Table Create SQL
CREATE TABLE t_users
(
    user_id          VARCHAR2(20)     NOT NULL, 
    user_pw          VARCHAR2(20)     NOT NULL, 
    user_nick        VARCHAR2(20)     NOT NULL, 
    user_profile     VARCHAR2(300)    NOT NULL, 
    user_joindate    DATE             NOT NULL, 
    user_type        CHAR(1)          NOT NULL, 
     PRIMARY KEY (user_id)
)
/

COMMENT ON TABLE t_users IS '�����'
/

COMMENT ON COLUMN t_users.user_id IS '����� ���̵�'
/

COMMENT ON COLUMN t_users.user_pw IS '����� ��й�ȣ'
/

COMMENT ON COLUMN t_users.user_nick IS '����� �г���'
/

COMMENT ON COLUMN t_users.user_profile IS '����� �����ʻ���'
/

COMMENT ON COLUMN t_users.user_joindate IS '����� ���� ��¥'
/

COMMENT ON COLUMN t_users.user_type IS '����� ����'
/


-- t_plans Table Create SQL
CREATE TABLE t_plans
(
    plan_seq       NUMBER(18, 0)    NOT NULL, 
    prog_name      NUMBER(18, 0)    NOT NULL, 
    plan_date      DATE             NOT NULL, 
    plan_s_date    DATE             NOT NULL, 
    plan_e_date    DATE             NOT NULL, 
     PRIMARY KEY (plan_seq)
)
/

CREATE SEQUENCE t_plans_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_plans_AI_TRG
BEFORE INSERT ON t_plans 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_plans_SEQ.NEXTVAL
    INTO :NEW.plan_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_plans_AI_TRG; /

--DROP SEQUENCE t_plans_SEQ; /

COMMENT ON TABLE t_plans IS '��ȹ'
/

COMMENT ON COLUMN t_plans.plan_seq IS '��ȹ ����'
/

COMMENT ON COLUMN t_plans.prog_name IS '���� ü�� ����'
/

COMMENT ON COLUMN t_plans.plan_date IS '��ȹ ��¥'
/

COMMENT ON COLUMN t_plans.plan_s_date IS '���� ���� ��¥'
/

COMMENT ON COLUMN t_plans.plan_e_date IS '���� ���� ��¥'
/

ALTER TABLE t_plans
    ADD CONSTRAINT FK_t_plans_prog_name_t_program FOREIGN KEY (prog_name)
        REFERENCES t_programs (prog_seq)  
/


-- t_searchs Table Create SQL
CREATE TABLE t_searchs
(
    search_seq     NUMBER(18, 0)    NOT NULL, 
    user_id        VARCHAR2(20)     NOT NULL, 
    search_word    VARCHAR2(30)     NOT NULL, 
    search_time    DATE             NOT NULL, 
     PRIMARY KEY (search_seq)
)
/

CREATE SEQUENCE t_searchs_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_searchs_AI_TRG
BEFORE INSERT ON t_searchs 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_searchs_SEQ.NEXTVAL
    INTO :NEW.search_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_searchs_AI_TRG; /

--DROP SEQUENCE t_searchs_SEQ; /

COMMENT ON TABLE t_searchs IS '�˻���'
/

COMMENT ON COLUMN t_searchs.search_seq IS '�˻� ����'
/

COMMENT ON COLUMN t_searchs.user_id IS '�˻��� ���̵�'
/

COMMENT ON COLUMN t_searchs.search_word IS '�˻� ����'
/

COMMENT ON COLUMN t_searchs.search_time IS '�˻� �ð�'
/

ALTER TABLE t_searchs
    ADD CONSTRAINT FK_t_searchs_user_id_t_users_u FOREIGN KEY (user_id)
        REFERENCES t_users (user_id)  
/


-- t_favs_plan Table Create SQL
CREATE TABLE t_favs_plan
(
    fav_seq     NUMBER(18, 0)    NOT NULL, 
    user_id     VARCHAR2(20)     NOT NULL, 
    plan_seq    NUMBER(18, 0)    NOT NULL, 
    reg_date    DATE             NOT NULL, 
     PRIMARY KEY (fav_seq)
)
/

CREATE SEQUENCE t_favs_plan_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_favs_plan_AI_TRG
BEFORE INSERT ON t_favs_plan 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_favs_plan_SEQ.NEXTVAL
    INTO :NEW.fav_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_favs_plan_AI_TRG; /

--DROP SEQUENCE t_favs_plan_SEQ; /

COMMENT ON TABLE t_favs_plan IS '��ȹ ����'
/

COMMENT ON COLUMN t_favs_plan.fav_seq IS '���� ����'
/

COMMENT ON COLUMN t_favs_plan.user_id IS '���� �� ���̵�'
/

COMMENT ON COLUMN t_favs_plan.plan_seq IS '���� ���� ��ȹ ����'
/

COMMENT ON COLUMN t_favs_plan.reg_date IS '���� ��� �ð�'
/

ALTER TABLE t_favs_plan
    ADD CONSTRAINT FK_t_favs_plan_plan_seq_t_plan FOREIGN KEY (plan_seq)
        REFERENCES t_plans (plan_seq)  
/

ALTER TABLE t_favs_plan
    ADD CONSTRAINT FK_t_favs_plan_user_id_t_users FOREIGN KEY (user_id)
        REFERENCES t_users (user_id)  
/


-- t_books_plan Table Create SQL
CREATE TABLE t_books_plan
(
    book_seq     NUMBER(18, 0)    NOT NULL, 
    user_id      VARCHAR2(20)     NOT NULL, 
    plan_seq     NUMBER(18, 0)    NOT NULL, 
    book_date    DATE             NOT NULL, 
     PRIMARY KEY (book_seq)
)
/

CREATE SEQUENCE t_books_plan_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_books_plan_AI_TRG
BEFORE INSERT ON t_books_plan 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_books_plan_SEQ.NEXTVAL
    INTO :NEW.book_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_books_plan_AI_TRG; /

--DROP SEQUENCE t_books_plan_SEQ; /

COMMENT ON TABLE t_books_plan IS '����'
/

COMMENT ON COLUMN t_books_plan.book_seq IS '���� ����'
/

COMMENT ON COLUMN t_books_plan.user_id IS '������ ���̵�'
/

COMMENT ON COLUMN t_books_plan.plan_seq IS '������ ��ȹ ����'
/

COMMENT ON COLUMN t_books_plan.book_date IS '���� ��¥'
/

ALTER TABLE t_books_plan
    ADD CONSTRAINT FK_t_books_plan_user_id_t_user FOREIGN KEY (user_id)
        REFERENCES t_users (user_id)  
/

ALTER TABLE t_books_plan
    ADD CONSTRAINT FK_t_books_plan_plan_seq_t_pla FOREIGN KEY (plan_seq)
        REFERENCES t_plans (plan_seq)  
/


-- t_reviews_program Table Create SQL
CREATE TABLE t_reviews_program
(
    review_seq        NUMBER(18, 0)    NOT NULL, 
    user_id           VARCHAR2(20)     NOT NULL, 
    prog_seq          NUMBER(18, 0)    NOT NULL, 
    plan_seq          NUMBER(18, 0)    NOT NULL, 
    review_content    VARCHAR2(300)    NOT NULL, 
    review_date       DATE             NOT NULL, 
     PRIMARY KEY (review_seq)
)
/

CREATE SEQUENCE t_reviews_program_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_reviews_program_AI_TRG
BEFORE INSERT ON t_reviews_program 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_reviews_program_SEQ.NEXTVAL
    INTO :NEW.review_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_reviews_program_AI_TRG; /

--DROP SEQUENCE t_reviews_program_SEQ; /

COMMENT ON TABLE t_reviews_program IS 'ü�� �ı�'
/

COMMENT ON COLUMN t_reviews_program.review_seq IS '�ı� ����'
/

COMMENT ON COLUMN t_reviews_program.user_id IS '�ı� �� ���̵�'
/

COMMENT ON COLUMN t_reviews_program.prog_seq IS '������ ü�� ����'
/

COMMENT ON COLUMN t_reviews_program.plan_seq IS '������ ��ȹ ����'
/

COMMENT ON COLUMN t_reviews_program.review_content IS '�ı� ����'
/

COMMENT ON COLUMN t_reviews_program.review_date IS '�ı� �ۼ� ��¥'
/

ALTER TABLE t_reviews_program
    ADD CONSTRAINT FK_t_reviews_program_user_id_t FOREIGN KEY (user_id)
        REFERENCES t_users (user_id)  
/

ALTER TABLE t_reviews_program
    ADD CONSTRAINT FK_t_reviews_program_prog_seq_ FOREIGN KEY (prog_seq)
        REFERENCES t_programs (prog_seq)  
/

ALTER TABLE t_reviews_program
    ADD CONSTRAINT FK_t_reviews_program_plan_seq_ FOREIGN KEY (plan_seq)
        REFERENCES t_plans (plan_seq)  
/


-- t_photos Table Create SQL
CREATE TABLE t_photos
(
    photo_seq    NUMBER(18, 0)    NOT NULL, 
    user_id      VARCHAR2(20)     NOT NULL, 
    prog_seq     NUMBER(18, 0)    NOT NULL, 
    photo1       VARCHAR2(300)    NULL, 
    photo2       VARCHAR2(300)    NULL, 
    photo3       VARCHAR2(300)    NULL, 
    photo4       VARCHAR2(300)    NULL, 
    photo5       VARCHAR2(300)    NULL, 
    photo6       VARCHAR2(300)    NULL, 
    photo7       VARCHAR2(300)    NULL, 
    photo8       VARCHAR2(300)    NULL, 
    photo9       VARCHAR2(300)    NULL, 
    photo10      VARCHAR2(300)    NULL, 
     PRIMARY KEY (photo_seq)
)
/

CREATE SEQUENCE t_photos_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_photos_AI_TRG
BEFORE INSERT ON t_photos 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_photos_SEQ.NEXTVAL
    INTO :NEW.photo_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_photos_AI_TRG; /

--DROP SEQUENCE t_photos_SEQ; /

COMMENT ON TABLE t_photos IS '�ı� ÷�λ���'
/

COMMENT ON COLUMN t_photos.photo_seq IS '���� ����'
/

COMMENT ON COLUMN t_photos.user_id IS '���� �ø� ���̵�'
/

COMMENT ON COLUMN t_photos.prog_seq IS '���� �� ü�� ����'
/

COMMENT ON COLUMN t_photos.photo1 IS '���� ����1'
/

COMMENT ON COLUMN t_photos.photo2 IS '���� ����2'
/

COMMENT ON COLUMN t_photos.photo3 IS '���� ����3'
/

COMMENT ON COLUMN t_photos.photo4 IS '���� ����4'
/

COMMENT ON COLUMN t_photos.photo5 IS '���� ����5'
/

COMMENT ON COLUMN t_photos.photo6 IS '���� ����6'
/

COMMENT ON COLUMN t_photos.photo7 IS '���� ����7'
/

COMMENT ON COLUMN t_photos.photo8 IS '���� ����8'
/

COMMENT ON COLUMN t_photos.photo9 IS '���� ����9'
/

COMMENT ON COLUMN t_photos.photo10 IS '���� ����10'
/

ALTER TABLE t_photos
    ADD CONSTRAINT FK_t_photos_user_id_t_users_us FOREIGN KEY (user_id)
        REFERENCES t_users (user_id)  
/

ALTER TABLE t_photos
    ADD CONSTRAINT FK_t_photos_prog_seq_t_program FOREIGN KEY (prog_seq)
        REFERENCES t_programs (prog_seq)  
/


-- t_likes_program Table Create SQL
CREATE TABLE t_likes_program
(
    likes_seq    NUMBER(18, 0)    NOT NULL, 
    user_id      VARCHAR2(20)     NOT NULL, 
    prog_seq     NUMBER(18, 0)    NOT NULL, 
     PRIMARY KEY (likes_seq)
)
/

CREATE SEQUENCE t_likes_program_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_likes_program_AI_TRG
BEFORE INSERT ON t_likes_program 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_likes_program_SEQ.NEXTVAL
    INTO :NEW.likes_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_likes_program_AI_TRG; /

--DROP SEQUENCE t_likes_program_SEQ; /

COMMENT ON TABLE t_likes_program IS 'ü�� ���ƿ�'
/

COMMENT ON COLUMN t_likes_program.likes_seq IS '���ƿ� ����'
/

COMMENT ON COLUMN t_likes_program.user_id IS '���ƿ� ���� ���̵�'
/

COMMENT ON COLUMN t_likes_program.prog_seq IS '���ƿ� ���� ü�� ����'
/

ALTER TABLE t_likes_program
    ADD CONSTRAINT FK_t_likes_program_user_id_t_u FOREIGN KEY (user_id)
        REFERENCES t_users (user_id)  
/

ALTER TABLE t_likes_program
    ADD CONSTRAINT FK_t_likes_program_prog_seq_t_ FOREIGN KEY (prog_seq)
        REFERENCES t_programs (prog_seq)  
/


