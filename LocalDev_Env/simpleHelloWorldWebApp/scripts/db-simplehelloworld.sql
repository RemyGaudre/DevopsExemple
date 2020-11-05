SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema SimpleHelloWorlddb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `simpleHelloWorlddb` ;

-- -----------------------------------------------------
-- Schema SimpleHelloWorlddb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `simpleHelloWorlddb` DEFAULT CHARACTER SET utf8 ;
USE `simpleHelloWorlddb` ;

-- -----------------------------------------------------
-- Table `SimpleHelloWorlddb`.`TEST`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `simpleHelloWorlddb`.`TEST` ;

CREATE TABLE `TEST` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` char(10) DEFAULT NULL,
  `VAL` char(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
