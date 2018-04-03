-- -----------------------------------------------------
-- Code and Learn PostgreSQL script by Teddy Fontaine (Sheol)
-- -----------------------------------------------------


-- -----------------------------------------------------
-- Table `exercises`
-- -----------------------------------------------------
DROP TABLE IF EXISTS exercises ;

CREATE SEQUENCE exercises_seq;

CREATE TABLE IF NOT EXISTS exercises (
  id INT NOT NULL DEFAULT NEXTVAL ('exercises_seq'),
  account_id INT NOT NULL,
  course_id INT NOT NULL,
  title VARCHAR(250) NULL,
  instruction TEXT NULL,
  grade_max INT NULL,
  PRIMARY KEY (id))
;


-- -----------------------------------------------------
-- Table `grades`
-- -----------------------------------------------------
DROP TABLE IF EXISTS grades ;

CREATE SEQUENCE grades_seq;

CREATE TABLE IF NOT EXISTS grades (
  id INT NOT NULL DEFAULT NEXTVAL ('grades_seq'),
  user_exercise_id INT NOT NULL,
  value INT NULL,
  timestamp BIGINT NULL,
  PRIMARY KEY (id))
;


-- -----------------------------------------------------
-- Table `exercises_comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS exercises_comments ;

CREATE SEQUENCE exercises_comments_seq;

CREATE TABLE IF NOT EXISTS exercises_comments (
  id INT NOT NULL DEFAULT NEXTVAL ('exercises_comments_seq'),
  exercise_id INT NOT NULL,
  account_id INT NOT NULL,
  content TEXT NULL,
  create_timestamp BIGINT NULL,
  modify_timestamp BIGINT NULL,
  PRIMARY KEY (id))
;


-- -----------------------------------------------------
-- Table `logs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS logs ;

CREATE SEQUENCE logs_seq;

CREATE TABLE IF NOT EXISTS logs (
  id INT NOT NULL DEFAULT NEXTVAL ('logs_seq'),
  user_exercise_id INT NOT NULL,
  content TEXT NULL,
  timestamp BIGINT NULL,
  PRIMARY KEY (id))
;


-- -----------------------------------------------------
-- Table `scripts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS scripts ;

CREATE SEQUENCE scripts_seq;

CREATE TABLE IF NOT EXISTS scripts (
  id INT NOT NULL DEFAULT NEXTVAL ('scripts_seq'),
  exercise_id INT NOT NULL,
  content TEXT NULL,
  create_timestamp BIGINT NULL,
  modify_timestamp BIGINT NULL,
  PRIMARY KEY (id))
;


-- -----------------------------------------------------
-- Table `codes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS codes ;

CREATE SEQUENCE codes_seq;

CREATE TABLE IF NOT EXISTS codes (
  id INT NOT NULL DEFAULT NEXTVAL ('codes_seq'),
  user_exercise_id INT NOT NULL,
  name VARCHAR(250) NULL,
  content TEXT NULL,
  create_timestamp BIGINT NULL,
  modify_timestamp BIGINT NULL,
  PRIMARY KEY (id))
;


-- -----------------------------------------------------
-- Table `user_exercises`
-- -----------------------------------------------------
DROP TABLE IF EXISTS user_exercises ;

CREATE SEQUENCE user_exercises_seq;

CREATE TABLE IF NOT EXISTS user_exercises (
  id INT NOT NULL DEFAULT NEXTVAL ('user_exercises_seq'),
  account_id INT NULL,
  exercise_id INT NULL,
  PRIMARY KEY (id))
;


-- -----------------------------------------------------
-- Table `exercises_corrections`
-- -----------------------------------------------------
DROP TABLE IF EXISTS exercises_corrections ;

CREATE SEQUENCE exercises_corrections_seq;

CREATE TABLE IF NOT EXISTS exercises_corrections (
  id INT NOT NULL DEFAULT NEXTVAL ('exercises_corrections_seq'),
  exercise_id INT NOT NULL,
  content TEXT NULL,
  timestamp BIGINT NULL,
  PRIMARY KEY (id))
;


-- -----------------------------------------------------
-- Table `accounts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS accounts ;

CREATE SEQUENCE accounts_seq;

CREATE TABLE IF NOT EXISTS accounts (
  id INT NOT NULL DEFAULT NEXTVAL ('accounts_seq'),
  username VARCHAR(45) NULL,
  password VARCHAR(255) NULL,
  email VARCHAR(100) NULL,
  group_id INT NULL,
  avatar_id INT NULL,
  create_timestamp BIGINT NULL,
  last_connect_timestamp BIGINT NULL,
  nb_courses_done INT NULL DEFAULT 0,
  nb_exercises_done INT NULL DEFAULT 0,
  PRIMARY KEY (id))
;


-- -----------------------------------------------------
-- Table `groups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS groups ;

CREATE SEQUENCE groups_seq;

CREATE TABLE IF NOT EXISTS groups (
  id INT NOT NULL DEFAULT NEXTVAL ('groups_seq'),
  name VARCHAR(45) NULL,
  parent_id INT NULL,
  PRIMARY KEY (id))
;


-- -----------------------------------------------------
-- Table `courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS courses ;

CREATE SEQUENCE courses_seq;

CREATE TABLE IF NOT EXISTS courses (
  id INT NOT NULL DEFAULT NEXTVAL ('courses_seq'),
  account_id INT NULL,
  locales_id INT NULL,
  language_id INT NULL,
  title VARCHAR(45) NULL,
  content TEXT NULL,
  create_timestamp BIGINT NULL,
  modify_timestamp BIGINT NULL,
  PRIMARY KEY (id))
;


-- -----------------------------------------------------
-- Table `languages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS languages ;

CREATE SEQUENCE languages_seq;

CREATE TABLE IF NOT EXISTS languages (
  id INT NOT NULL DEFAULT NEXTVAL ('languages_seq'),
  name VARCHAR(45) NULL,
  PRIMARY KEY (id))
;


-- -----------------------------------------------------
-- Table `locales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS locales ;

CREATE SEQUENCE locales_seq;

CREATE TABLE IF NOT EXISTS locales (
  id INT NOT NULL DEFAULT NEXTVAL ('locales_seq'),
  name VARCHAR(45) NULL,
  PRIMARY KEY (id))
;


-- -----------------------------------------------------
-- Table `courses_comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS courses_comments ;

CREATE SEQUENCE courses_comments_seq;

CREATE TABLE IF NOT EXISTS courses_comments (
  id INT NOT NULL DEFAULT NEXTVAL ('courses_comments_seq'),
  course_id INT NULL,
  account_id INT NULL,
  content TEXT NULL,
  create_timestamp BIGINT NULL,
  modify_timestamp BIGINT NULL,
  PRIMARY KEY (id))
;


-- -----------------------------------------------------
-- Table `blog_posts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS blog_posts ;

CREATE SEQUENCE blog_posts_seq;

CREATE TABLE IF NOT EXISTS blog_posts (
  id INT NOT NULL DEFAULT NEXTVAL ('blog_posts_seq'),
  account_id INT NULL,
  locales_id INT NULL,
  blog_category_id INT NULL,
  title VARCHAR(45) NULL,
  content TEXT NULL,
  create_timestamp BIGINT NULL,
  modify_timestamp BIGINT NULL,
  PRIMARY KEY (id))
;


-- -----------------------------------------------------
-- Table `blog_posts_comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS blog_posts_comments ;

CREATE SEQUENCE blog_posts_comments_seq;

CREATE TABLE IF NOT EXISTS blog_posts_comments (
  id INT NOT NULL DEFAULT NEXTVAL ('blog_posts_comments_seq'),
  account_id INT NULL,
  blog_post_id INT NULL,
  content TEXT NULL,
  create_timestamp BIGINT NULL,
  modify_timestamp BIGINT NULL,
  PRIMARY KEY (id))
;


-- -----------------------------------------------------
-- Table `blog_posts_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS blog_posts_category ;

CREATE SEQUENCE blog_posts_category_seq;

CREATE TABLE IF NOT EXISTS blog_posts_category (
  id INT NOT NULL DEFAULT NEXTVAL ('blog_posts_category_seq'),
  name VARCHAR(45) NULL,
  PRIMARY KEY (id))
;


-- -----------------------------------------------------
-- Table `forum_subjects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS forum_subjects ;

CREATE SEQUENCE forum_subjects_seq;

CREATE TABLE IF NOT EXISTS forum_subjects (
  id INT NOT NULL DEFAULT NEXTVAL ('forum_subjects_seq'),
  forums_forum_id INT NULL,
  locales_id INT NULL,
  account_id INT NULL,
  timestamp BIGINT NULL,
  replies INT NULL,
  views INT NULL,
  subject VARCHAR(140) NULL,
  PRIMARY KEY (id))
;


-- -----------------------------------------------------
-- Table `forum_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS forum_category ;

CREATE SEQUENCE forum_category_seq;

CREATE TABLE IF NOT EXISTS forum_category (
  id INT NOT NULL DEFAULT NEXTVAL ('forum_category_seq'),
  name VARCHAR(45) NULL,
  PRIMARY KEY (id))
;


-- -----------------------------------------------------
-- Table `forum_forums`
-- -----------------------------------------------------
DROP TABLE IF EXISTS forum_forums ;

CREATE SEQUENCE forum_forums_seq;

CREATE TABLE IF NOT EXISTS forum_forums (
  id INT NOT NULL DEFAULT NEXTVAL ('forum_forums_seq'),
  forums_category_id INT NULL,
  name VARCHAR(45) NULL,
  description TEXT NULL,
  PRIMARY KEY (id))
;


-- -----------------------------------------------------
-- Table `forum_posts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS forum_posts ;

CREATE SEQUENCE forum_posts_seq;

CREATE TABLE IF NOT EXISTS forum_posts (
  id INT NOT NULL DEFAULT NEXTVAL ('forum_posts_seq'),
  forums_subject_id INT NULL,
  account_id INT NULL,
  create_timestamp BIGINT NULL,
  modify_timestamp BIGINT NULL,
  content TEXT NULL,
  likes INT NULL,
  PRIMARY KEY (id))
;


-- -----------------------------------------------------
-- Table `avatars`
-- -----------------------------------------------------
DROP TABLE IF EXISTS avatars ;

CREATE SEQUENCE avatars_seq;

CREATE TABLE IF NOT EXISTS avatars (
  id INT NOT NULL DEFAULT NEXTVAL ('avatars_seq'),
  path VARCHAR(255) NOT NULL,
  PRIMARY KEY (id))
;


-- -----------------------------------------------------
-- Table `users_badges`
-- -----------------------------------------------------
DROP TABLE IF EXISTS users_badges ;

CREATE TABLE IF NOT EXISTS users_badges (
  account_id INT NOT NULL,
  badge_id INT NULL,
  timestamp BIGINT NULL,
  PRIMARY KEY (account_id))
;


-- -----------------------------------------------------
-- Table `badges`
-- -----------------------------------------------------
DROP TABLE IF EXISTS badges ;

CREATE SEQUENCE badges_seq;

CREATE TABLE IF NOT EXISTS badges (
  id INT NOT NULL DEFAULT NEXTVAL ('badges_seq'),
  name VARCHAR(45) NULL,
  path_img VARCHAR(255) NULL,
  nb_courses_done INT NULL,
  nb_exercises_done INT NULL,
  PRIMARY KEY (id))
;


-- -----------------------------------------------------
-- Table `exercises_moderation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS exercises_moderation ;

CREATE TABLE IF NOT EXISTS exercises_moderation (
  exercise_id INT NOT NULL,
  validate INT NULL,
  commentary TEXT NULL,
  PRIMARY KEY (exercise_id))
;


-- -----------------------------------------------------
-- Table `course_moderation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS course_moderation ;

CREATE TABLE IF NOT EXISTS course_moderation (
  course_id INT NOT NULL,
  validate INT NULL,
  commentary TEXT NULL,
  PRIMARY KEY (course_id))
;


-- -----------------------------------------------------
-- Table `code_templates`
-- -----------------------------------------------------
DROP TABLE IF EXISTS code_templates ;

CREATE SEQUENCE code_templates_seq;

CREATE TABLE IF NOT EXISTS code_templates (
  id INT NOT NULL DEFAULT NEXTVAL ('code_templates_seq'),
  exercise_id INT NOT NULL,
  file_name VARCHAR(45) NOT NULL,
  content TEXT NOT NULL,
  PRIMARY KEY (id))
;


-- -----------------------------------------------------
-- Set base record
-- -----------------------------------------------------
INSERT INTO avatars (path)
VALUES ('http%3A%2F%2Fwww.freakingnews.com%2Fpictures%2F97500%2FKorean-Elephant-Rocket--97543.jpg');
INSERT INTO groups (name, parent_id) VALUES ('member', 10);
INSERT INTO groups (name, parent_id) VALUES ('moderator', 30);
INSERT INTO groups (name, parent_id) VALUES ('administrator', 50);
INSERT INTO locales (name) VALUES ('FR');
INSERT INTO locales (name) VALUES ('EN');


-- -----------------------------------------------------
-- Set default values
-- -----------------------------------------------------
INSERT INTO accounts (username, password, email, group_id, avatar_id, create_timestamp, last_connect_timestamp, nb_courses_done, nb_exercises_done)
VALUES
  ('Admin', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'admin%40codeandlear.com', 3, 1, 1464262190085, 1464262190085, 0, 0);
INSERT INTO blog_posts_category (name) VALUES ('Default');
INSERT INTO languages (name) VALUES ('C%23');
INSERT INTO languages (name) VALUES ('JAVA');
INSERT INTO languages (name) VALUES ('C');
