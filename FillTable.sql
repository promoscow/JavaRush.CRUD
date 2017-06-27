Use test;

DROP TABLE IF EXISTS test;

CREATE TABLE `test`.`test` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(16) NOT NULL,
  `age` INT NULL,
  `isAdmin` BIT(1) NOT NULL,
  `createdDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`))
  COLLATE='utf8_general_ci';

INSERT INTO `test` (`name`,`age`,`isAdmin`,`createdDate`)
    VALUES ("Кот Василий", 5, 0, "2017-01-01 12:00:12"),
      ("John Carpenter", 45, 1, "2001-10-10, 01:00:34"),
      ("К. Міцкевіч", 67, 1, "2008-11-03, 15:45:59"),
      ("Тарас Бульба", 45, 0, "2015-10-07, 07:09:10"),
      ("Luke Skywalker", 23, 0, "1979-02-23, 04:53:12"),
      ("Джигурда", 50, 0, "1990-09-04, 19:05:39"),
      ("Sasha Grey", 23, 0, "2017-03-15, 23:59:59"),
      ("Кот Базилио", 5, 1, "2014-01-02, 12:14:15"),
      ("Astroboy", 12, 1, "2008-04-29, 08:15:11"),
      ("Ванильный педик", 34, 0, "2017-01-20, 22:15:19"),
      ("Фантоцци", 47, 0, "2012-03-27, 09:34:26");
