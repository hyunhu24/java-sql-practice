CREATE TABLE `users` (
  `user_id` bigint PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(255) not null unique,
  `email` varchar(255) not null unique,
  `password` varchar(255) not null,
  `created_at` datetime not null DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE `boards` (
  `board_id` bigint PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) not null unique,
  `description` text default null
);
CREATE TABLE `posts` (
  `post_id` bigint PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(255) not null unique,
  `content` text not null,
  `user_id` bigint,
  foreign key (`user_id`) references `users` (`user_id`),
  `board_id` bigint,
  foreign key (`board_id`) references `boards` (`board_id`),
  `created_at` datetime not NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE `comments` (
  `comment_id` bigint PRIMARY KEY AUTO_INCREMENT,
  `content` text,
  `user_id` bigint,
  foreign key (`user_id`) references `users` (`user_id`),
  `post_id` bigint,
  foreign key (`post_id`) references `posts` (`post_id`),
  `created_at` datetime not NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE `tags` (
  `tag_id` bigint PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) not null unique
);
CREATE TABLE `post_tags` (
  `post_id` bigint,
  foreign key (`post_id`) references `posts` (`post_id`),
  `tag_id` bigint,
  foreign key (`tag_id`) references `tags` (`tag_id`)
);