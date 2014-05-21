SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema SJLS
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `SJLS` ;
CREATE SCHEMA IF NOT EXISTS `SJLS` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `SJLS` ;

-- -----------------------------------------------------
-- Table `SJLS`.`Addresses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SJLS`.`Addresses` ;

CREATE TABLE IF NOT EXISTS `SJLS`.`Addresses` (
  `AddressID` INT NOT NULL AUTO_INCREMENT,
  `AddressStreet1` VARCHAR(45) NULL,
  `AddressStreet2` VARCHAR(45) NULL,
  `AddressCity` VARCHAR(45) NULL,
  `AddressState` VARCHAR(45) NULL,
  `AddressZIP` VARCHAR(45) NULL,
  `AddressCountry` VARCHAR(45) NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SJLS`.`Teachers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SJLS`.`Teachers` ;

CREATE TABLE IF NOT EXISTS `SJLS`.`Teachers` (
  `TeacherID` INT(11) NOT NULL AUTO_INCREMENT,
  `TeacherFirstName` VARCHAR(225) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `TeacherLastName` VARCHAR(225) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `TeacherEmail` VARCHAR(225) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `TeacherPhone` VARCHAR(45) NULL,
  `Address_AddressID` INT NOT NULL,
  PRIMARY KEY (`TeacherID`),
  INDEX `fk_Teachers_Address1_idx` (`Address_AddressID` ASC),
  CONSTRAINT `fk_Teachers_Address1`
    FOREIGN KEY (`Address_AddressID`)
    REFERENCES `SJLS`.`Addresses` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `SJLS`.`Rooms`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SJLS`.`Rooms` ;

CREATE TABLE IF NOT EXISTS `SJLS`.`Rooms` (
  `RoomID` INT(11) NOT NULL AUTO_INCREMENT,
  `RoomNumber` VARCHAR(45) NOT NULL DEFAULT '',
  `Building` VARCHAR(225) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `Capacity` VARCHAR(225) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `Equipment` VARCHAR(225) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  PRIMARY KEY (`RoomID`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `SJLS`.`AcademicCalendars`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SJLS`.`AcademicCalendars` ;

CREATE TABLE IF NOT EXISTS `SJLS`.`AcademicCalendars` (
  `AcademiCcalendarID` INT NOT NULL,
  `AcademicYear` VARCHAR(45) NULL,
  `AcademicQuarter` VARCHAR(45) NULL,
  PRIMARY KEY (`AcademiCcalendarID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SJLS`.`Curriculums`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SJLS`.`Curriculums` ;

CREATE TABLE IF NOT EXISTS `SJLS`.`Curriculums` (
  `CurriculumID` INT NOT NULL,
  `curriculumdescription` TEXT NULL,
  `Curriculumlevel` VARCHAR(45) NULL,
  `updatedate` VARCHAR(45) NULL,
  PRIMARY KEY (`CurriculumID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SJLS`.`Schedules`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SJLS`.`Schedules` ;

CREATE TABLE IF NOT EXISTS `SJLS`.`Schedules` (
  `ScheduleID` INT(11) NOT NULL AUTO_INCREMENT,
  `DayOfTheWeek` VARCHAR(225) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `StartTime` TIME NOT NULL,
  `EndTime` TIME NOT NULL,
  PRIMARY KEY (`ScheduleID`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `SJLS`.`Courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SJLS`.`Courses` ;

CREATE TABLE IF NOT EXISTS `SJLS`.`Courses` (
  `CourseID` INT(11) NOT NULL,
  `CourseTitle` VARCHAR(225) CHARACTER SET 'latin1' NOT NULL,
  `Teachers_TeacherID` INT(11) NOT NULL,
  `Rooms_RoomID` INT(11) NOT NULL,
  `AcademicCalendars_AcademicCalendarID` INT NOT NULL,
  `Curriculums_CurriculumID` INT NOT NULL,
  `Schedules_ScheduleID` INT(11) NOT NULL,
  PRIMARY KEY (`CourseID`),
  INDEX `fk_Courses_Teachers1_idx` (`Teachers_TeacherID` ASC),
  INDEX `fk_Courses_Rooms1_idx` (`Rooms_RoomID` ASC),
  INDEX `fk_Courses_academiccalendar1_idx` (`AcademicCalendars_AcademicCalendarID` ASC),
  INDEX `fk_Courses_Curriculum1_idx` (`Curriculums_CurriculumID` ASC),
  INDEX `fk_Courses_Schedule1_idx` (`Schedules_ScheduleID` ASC),
  CONSTRAINT `fk_Courses_Teachers1`
    FOREIGN KEY (`Teachers_TeacherID`)
    REFERENCES `SJLS`.`Teachers` (`TeacherID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Courses_Rooms1`
    FOREIGN KEY (`Rooms_RoomID`)
    REFERENCES `SJLS`.`Rooms` (`RoomID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Courses_academiccalendar1`
    FOREIGN KEY (`AcademicCalendars_AcademicCalendarID`)
    REFERENCES `SJLS`.`AcademicCalendars` (`AcademiCcalendarID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Courses_Curriculum1`
    FOREIGN KEY (`Curriculums_CurriculumID`)
    REFERENCES `SJLS`.`Curriculums` (`CurriculumID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Courses_Schedule1`
    FOREIGN KEY (`Schedules_ScheduleID`)
    REFERENCES `SJLS`.`Schedules` (`ScheduleID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `SJLS`.`EmergencyContacts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SJLS`.`EmergencyContacts` ;

CREATE TABLE IF NOT EXISTS `SJLS`.`EmergencyContacts` (
  `EmergencyID` INT NOT NULL,
  `EmergencyFirstName` VARCHAR(45) NULL,
  `EmergencyLastName` VARCHAR(45) NULL,
  `EmergencyEmail` VARCHAR(45) NULL,
  `EmergencyPhone` VARCHAR(45) NULL,
  `EmergencyRelationship` VARCHAR(45) NULL,
  PRIMARY KEY (`EmergencyID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SJLS`.`Students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SJLS`.`Students` ;

CREATE TABLE IF NOT EXISTS `SJLS`.`Students` (
  `StudentID` INT(11) NOT NULL AUTO_INCREMENT,
  `StudentFirstName` VARCHAR(225) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `StudentLastName` VARCHAR(225) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `StudentBirthdate` DATE NOT NULL,
  `StudentEmail` VARCHAR(225) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `StudentPhone` VARCHAR(225) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `Address_AddressID` INT NOT NULL,
  `EmergencyContact_EmergencyID` INT NOT NULL,
  PRIMARY KEY (`StudentID`),
  INDEX `fk_Students_Address1_idx` (`Address_AddressID` ASC),
  INDEX `fk_Students_EmergencyContact1_idx` (`EmergencyContact_EmergencyID` ASC),
  CONSTRAINT `fk_Students_Address1`
    FOREIGN KEY (`Address_AddressID`)
    REFERENCES `SJLS`.`Addresses` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Students_EmergencyContact1`
    FOREIGN KEY (`EmergencyContact_EmergencyID`)
    REFERENCES `SJLS`.`EmergencyContacts` (`EmergencyID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `SJLS`.`Assignments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SJLS`.`Assignments` ;

CREATE TABLE IF NOT EXISTS `SJLS`.`Assignments` (
  `AssignmentID` INT NOT NULL,
  `AssignmentCategory` VARCHAR(45) NULL COMMENT 'Assignment Categories include: Listening comprehension, ' /* comment truncated */ /*Oral Presentation,
Reading,
Writing,
Attendance,
Total Score*/,
  `AssignmentSubCategory` VARCHAR(45) NULL,
  PRIMARY KEY (`AssignmentID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SJLS`.`Scores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SJLS`.`Scores` ;

CREATE TABLE IF NOT EXISTS `SJLS`.`Scores` (
  `ScoreID` INT NOT NULL,
  `ScoreValue` VARCHAR(45) NULL,
  `Assignments_AssignmentID` INT NOT NULL,
  PRIMARY KEY (`ScoreID`),
  INDEX `fk_Scores_assignments1_idx` (`Assignments_AssignmentID` ASC),
  CONSTRAINT `fk_Scores_assignments1`
    FOREIGN KEY (`Assignments_AssignmentID`)
    REFERENCES `SJLS`.`Assignments` (`AssignmentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SJLS`.`Enrollments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SJLS`.`Enrollments` ;

CREATE TABLE IF NOT EXISTS `SJLS`.`Enrollments` (
  `Courses_CourseID` INT(11) NOT NULL,
  `Students_StudentID` INT(11) NOT NULL,
  `Scores_ScoreID` INT NULL,
  `FinalGrade` VARCHAR(45) NULL,
  INDEX `fk_Enrollment_Courses1_idx` (`Courses_CourseID` ASC),
  INDEX `fk_Enrollment_Students1_idx` (`Students_StudentID` ASC),
  INDEX `fk_Enrollment_Scores1_idx` (`Scores_ScoreID` ASC),
  PRIMARY KEY (`Courses_CourseID`, `Students_StudentID`),
  CONSTRAINT `fk_Enrollment_Courses1`
    FOREIGN KEY (`Courses_CourseID`)
    REFERENCES `SJLS`.`Courses` (`CourseID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Enrollment_Students1`
    FOREIGN KEY (`Students_StudentID`)
    REFERENCES `SJLS`.`Students` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Enrollment_Scores1`
    FOREIGN KEY (`Scores_ScoreID`)
    REFERENCES `SJLS`.`Scores` (`ScoreID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `SJLS`.`Parents`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SJLS`.`Parents` ;

CREATE TABLE IF NOT EXISTS `SJLS`.`Parents` (
  `ParentID` INT NOT NULL,
  `ParentFirstName` VARCHAR(45) NULL,
  `ParentLastName` VARCHAR(45) NULL,
  `ParentRelationship` VARCHAR(45) NULL,
  `ParentEmail` VARCHAR(45) NULL,
  `ParentPhone` VARCHAR(45) NULL,
  `Address_AddressID` INT NOT NULL,
  PRIMARY KEY (`ParentID`),
  INDEX `fk_Parent_Address1_idx` (`Address_AddressID` ASC),
  CONSTRAINT `fk_Parent_Address1`
    FOREIGN KEY (`Address_AddressID`)
    REFERENCES `SJLS`.`Addresses` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SJLS`.`Families`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SJLS`.`Families` ;

CREATE TABLE IF NOT EXISTS `SJLS`.`Families` (
  `Students_StudentID` INT(11) NOT NULL,
  `Parents_ParentID` INT NOT NULL,
  INDEX `fk_Family_Students1_idx` (`Students_StudentID` ASC),
  INDEX `fk_Family_Parent1_idx` (`Parents_ParentID` ASC),
  PRIMARY KEY (`Students_StudentID`, `Parents_ParentID`),
  CONSTRAINT `fk_Family_Students1`
    FOREIGN KEY (`Students_StudentID`)
    REFERENCES `SJLS`.`Students` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Family_Parent1`
    FOREIGN KEY (`Parents_ParentID`)
    REFERENCES `SJLS`.`Parents` (`ParentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SJLS`.`Administrators`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SJLS`.`Administrators` ;

CREATE TABLE IF NOT EXISTS `SJLS`.`Administrators` (
  `idAdministrators` INT NOT NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`idAdministrators`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
