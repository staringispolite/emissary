CREATE TABLE `user` (
      `id` bigint(20) NOT NULL AUTO_INCREMENT,
      `email` varchar(255) DEFAULT NULL,
      `password` char(88) DEFAULT NULL,
      PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8
