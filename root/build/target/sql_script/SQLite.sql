-- -----------------------------------------------------
-- Code and Learn SQLite script by Teddy Fontaine (Sheol)
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `exercises`
-- -----------------------------------------------------
CREATE TABLE `exercises` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `account_id` INTEGER NOT NULL,
  `course_id` INTEGER NOT NULL,
  `title` VARCHAR(250) NULL,
  `instruction` TEXT NULL,
  `grade_max` INTEGER NULL);


-- -----------------------------------------------------
-- Table `grades`
-- -----------------------------------------------------
CREATE TABLE `grades` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `user_exercise_id` INTEGER NOT NULL,
  `value` INTEGER NULL,
  `timestamp` TIMESTAMP NULL);


-- -----------------------------------------------------
-- Table `exercises_comments`
-- -----------------------------------------------------
CREATE TABLE `exercises_comments` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `exercise_id` INTEGER NOT NULL,
  `account_id` INTEGER NOT NULL,
  `content` TEXT NULL,
  `create_timestamp` TIMESTAMP NULL,
  `modify_timestamp` TIMESTAMP NULL);


-- -----------------------------------------------------
-- Table `logs`
-- -----------------------------------------------------
CREATE TABLE `logs` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `user_exercise_id` INTEGER NOT NULL,
  `content` TEXT NULL,
  `timestamp` TIMESTAMP NULL);


-- -----------------------------------------------------
-- Table `scripts`
-- -----------------------------------------------------
CREATE TABLE `scripts` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `exercise_id` INTEGER NOT NULL,
  `content` TEXT NULL,
  `create_timestamp` TIMESTAMP NULL,
  `modify_timestamp` TIMESTAMP NULL);


-- -----------------------------------------------------
-- Table `codes`
-- -----------------------------------------------------
CREATE TABLE `codes` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `user_exercise_id` INTEGER NOT NULL,
  `name` VARCHAR(45) NULL,
  `content` TEXT NULL,
  `create_timestamp` TIMESTAMP NULL,
  `modify_timestamp` TIMESTAMP NULL);


-- -----------------------------------------------------
-- Table `user_exercises`
-- -----------------------------------------------------
CREATE TABLE `user_exercises` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `account_id` INTEGER NULL,
  `exercise_id` INTEGER NULL);


-- -----------------------------------------------------
-- Table `exercises_corrections`
-- -----------------------------------------------------
CREATE TABLE `exercises_corrections` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `exercise_id` INTEGER NOT NULL,
  `content` TEXT NULL,
  `timestamp` TIMESTAMP NULL);


-- -----------------------------------------------------
-- Table `accounts`
-- -----------------------------------------------------
CREATE TABLE `accounts` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(255) NULL,
  `email` VARCHAR(100) NULL,
  `group_id` INTEGER NULL,
  `avatar_id` INTEGER NULL,
  `create_timestamp` TIMESTAMP NULL,
  `last_connect_timestamp` TIMESTAMP NULL,
  `nb_courses_done` INTEGER NULL DEFAULT 0,
  `nb_exercises_done` INTEGER NULL DEFAULT 0);


-- -----------------------------------------------------
-- Table `groups`
-- -----------------------------------------------------
CREATE TABLE `groups` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `name` VARCHAR(45) NULL,
  `parent_id` INTEGER NULL);


-- -----------------------------------------------------
-- Table `courses`
-- -----------------------------------------------------
CREATE TABLE `courses` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `account_id` INTEGER NULL,
  `locales_id` INTEGER NULL,
  `language_id` INTEGER NULL,
  `title` VARCHAR(45) NULL,
  `content` TEXT NULL,
  `create_timestamp` TIMESTAMP NULL,
  `modify_timestamp` TIMESTAMP NULL);


-- -----------------------------------------------------
-- Table `languages`
-- -----------------------------------------------------
CREATE TABLE `languages` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `name` VARCHAR(45) NULL);


-- -----------------------------------------------------
-- Table `locales`
-- -----------------------------------------------------
CREATE TABLE `locales` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `name` VARCHAR(45) NULL);


-- -----------------------------------------------------
-- Table `courses_comments`
-- -----------------------------------------------------
CREATE TABLE `courses_comments` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `course_id` INTEGER NULL,
  `account_id` INTEGER NULL,
  `content` TEXT NULL,
  `create_timestamp` TIMESTAMP NULL,
  `modify_timestamp` TIMESTAMP NULL);


-- -----------------------------------------------------
-- Table `blog_posts`
-- -----------------------------------------------------
CREATE TABLE `blog_posts` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `account_id` INTEGER NULL,
  `locales_id` INTEGER NULL,
  `blog_category_id` INTEGER NULL,
  `title` VARCHAR(45) NULL,
  `content` TEXT NULL,
  `create_timestamp` TIMESTAMP NULL,
  `modify_timestamp` TIMESTAMP NULL);


-- -----------------------------------------------------
-- Table `blog_posts_comments`
-- -----------------------------------------------------
CREATE TABLE `blog_posts_comments` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `account_id` INTEGER NULL,
  `blog_post_id` INTEGER NULL,
  `content` TEXT NULL,
  `create_timestamp` TIMESTAMP NULL,
  `modify_timestamp` TIMESTAMP NULL);


-- -----------------------------------------------------
-- Table `blog_posts_category`
-- -----------------------------------------------------
CREATE TABLE `blog_posts_category` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `name` VARCHAR(45) NULL);


-- -----------------------------------------------------
-- Table `forum_subjects`
-- -----------------------------------------------------
CREATE TABLE `forum_subjects` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `forums_forum_id` INTEGER NULL,
  `locales_id` INTEGER NULL,
  `account_id` INTEGER NULL,
  `timestamp` TIMESTAMP NULL,
  `replies` INTEGER NULL,
  `views` INTEGER NULL,
  `subject` VARCHAR(140) NULL);


-- -----------------------------------------------------
-- Table `forum_category`
-- -----------------------------------------------------
CREATE TABLE `forum_category` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `name` VARCHAR(45) NULL);


-- -----------------------------------------------------
-- Table `forum_forums`
-- -----------------------------------------------------
CREATE TABLE `forum_forums` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `forums_category_id` INTEGER NULL,
  `name` VARCHAR(45) NULL,
  `description` TEXT NULL);


-- -----------------------------------------------------
-- Table `forum_posts`
-- -----------------------------------------------------
CREATE TABLE `forum_posts` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `forums_subject_id` INTEGER NULL,
  `account_id` INTEGER NULL,
  `create_timestamp` TIMESTAMP NULL,
  `modify_timestamp` TIMESTAMP NULL,
  `content` TEXT NULL,
  `likes` INTEGER NULL);


-- -----------------------------------------------------
-- Table `avatars`
-- -----------------------------------------------------
CREATE TABLE `avatars` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `path` VARCHAR(255) NOT NULL);


-- -----------------------------------------------------
-- Table `users_badges`
-- -----------------------------------------------------
CREATE TABLE `users_badges` (
  `account_id` INTEGER NOT NULL,
  `badge_id` INTEGER NULL,
  `timestamp` TIMESTAMP NULL,
  PRIMARY KEY (`account_id`));


-- -----------------------------------------------------
-- Table `badges`
-- -----------------------------------------------------
CREATE TABLE `badges` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `name` VARCHAR(45) NULL,
  `path_img` VARCHAR(255) NULL,
  `nb_courses_done` INTEGER NULL,
  `nb_exercises_done` INTEGER NULL);


-- -----------------------------------------------------
-- Table `exercises_moderation`
-- -----------------------------------------------------
CREATE TABLE `exercises_moderation` (
  `exercise_id` INTEGER NOT NULL,
  `validate` INTEGER NULL,
  `commentary` TEXT NULL,
  PRIMARY KEY (`exercise_id`));


-- -----------------------------------------------------
-- Table `course_moderation`
-- -----------------------------------------------------
CREATE TABLE `course_moderation` (
  `course_id` INTEGER NOT NULL,
  `validate` INTEGER NULL,
  `commentary` TEXT NULL,
  PRIMARY KEY (`course_id`));


-- -----------------------------------------------------
-- Table `code_templates`
-- -----------------------------------------------------
CREATE TABLE `code_templates` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `exercise_id` INTEGER NOT NULL,
  `file_name` VARCHAR(45) NOT NULL,
  `content` TEXT NOT NULL);


-- -----------------------------------------------------
-- Set base record
-- -----------------------------------------------------
INSERT INTO avatars (path)
VALUES ("http%3A%2F%2Fwww.freakingnews.com%2Fpictures%2F97500%2FKorean-Elephant-Rocket--97543.jpg");
INSERT INTO groups (name, parent_id) VALUES ("member", 10);
INSERT INTO groups (name, parent_id) VALUES ("moderator", 30);
INSERT INTO groups (name, parent_id) VALUES ("administrator", 50);
INSERT INTO locales (name) VALUES ("FR");
INSERT INTO locales (name) VALUES ("EN");


-- -----------------------------------------------------
-- Set default values
-- -----------------------------------------------------
INSERT INTO accounts (username, password, email, group_id, avatar_id, create_timestamp, last_connect_timestamp, nb_courses_done, nb_exercises_done)
VALUES
  ("Admin", "5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8", "admin%40codeandlear.com", 3, 1, 1464262190085, 1464262190085, 0, 0);
INSERT INTO blog_posts_category (name) VALUES ("Default");
INSERT INTO languages (name) VALUES ("C%23");
INSERT INTO languages (name) VALUES ("JAVA");
INSERT INTO languages (name) VALUES ("C");
