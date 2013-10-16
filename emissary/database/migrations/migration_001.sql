CREATE TABLE `event_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ident` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

CREATE TABLE `event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `event_type_id` int(10) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `time` int(10) NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
INSERT INTO db_version (version) VALUES (1);
