CREATE TABLE `db_version` (
  `id` integer(10) NOT NULL AUTO_INCREMENT,
  `version` integer(10) NOT NULL,
  `run_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `version` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO db_version (version) VALUES (0);
