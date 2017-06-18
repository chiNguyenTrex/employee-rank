SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `depart` (
  `DepartId` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `depart` (`DepartId`, `Name`) VALUES('KINHDOANH', 'Phòng IT');
INSERT INTO `depart` (`DepartId`, `Name`) VALUES('KYTHUAT', 'Phòng kỹ thuật');
INSERT INTO `depart` (`DepartId`, `Name`) VALUES('NHANSU', 'Phòng nhân sự');

CREATE TABLE `record` (
  `RecordId` int(10) UNSIGNED ZEROFILL NOT NULL,
  `Type` bit(1) NOT NULL,
  `Reason` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Date` datetime NOT NULL,
  `StaffId` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `record` (`RecordId`, `Type`, `Reason`, `Date`, `StaffId`) VALUES(0000000002, b'0', 'Đi muộn 15 phút', '2017-03-12 00:00:00', 'NV0002');
INSERT INTO `record` (`RecordId`, `Type`, `Reason`, `Date`, `StaffId`) VALUES(0000000003, b'1', 'Giúp đỡ mọi người', '2017-03-03 00:00:00', 'NV0003');
INSERT INTO `record` (`RecordId`, `Type`, `Reason`, `Date`, `StaffId`) VALUES(0000000005, b'0', 'Chỉ trích đồng nghiệp', '2017-04-05 00:00:00', 'NV0006');
INSERT INTO `record` (`RecordId`, `Type`, `Reason`, `Date`, `StaffId`) VALUES(0000000006, b'1', 'Sáng kiến mới trong công việc', '2017-04-03 00:00:00', 'NV0006');
INSERT INTO `record` (`RecordId`, `Type`, `Reason`, `Date`, `StaffId`) VALUES(0000000007, b'1', 'Hoàn thành dự án tốt', '2017-02-02 00:00:00', 'NV0007');
INSERT INTO `record` (`RecordId`, `Type`, `Reason`, `Date`, `StaffId`) VALUES(0000000008, b'1', 'Giúp đỡ nhân viên mới', '2017-03-02 00:00:00', 'NV0005');

CREATE TABLE `staff` (
  `StaffId` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Gender` bit(1) NOT NULL,
  `Birthday` datetime NOT NULL,
  `Photo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Salary` double NOT NULL,
  `Note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DepartId` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `staff` (`StaffId`, `Name`, `Gender`, `Birthday`, `Photo`, `Email`, `Phone`, `Salary`, `Note`, `DepartId`) VALUES('NV0002', 'Dương Quá', b'1', '1993-04-15 00:00:00', '2.jpg', 'b@gmail.com', '01687777736', 1000, NULL, 'KYTHUAT');
INSERT INTO `staff` (`StaffId`, `Name`, `Gender`, `Birthday`, `Photo`, `Email`, `Phone`, `Salary`, `Note`, `DepartId`) VALUES('NV0003', 'Quách Tĩnh', b'1', '1997-06-18 00:00:00', '3.jpg', 'c@gmail.com', '01687777736', 1000, NULL, 'KINHDOANH');
INSERT INTO `staff` (`StaffId`, `Name`, `Gender`, `Birthday`, `Photo`, `Email`, `Phone`, `Salary`, `Note`, `DepartId`) VALUES('NV0004', 'Hoàng Dung', b'0', '1993-05-18 00:00:00', '4.jpg', 'd@gmail.com', '01687777736', 1000, NULL, 'KYTHUAT');
INSERT INTO `staff` (`StaffId`, `Name`, `Gender`, `Birthday`, `Photo`, `Email`, `Phone`, `Salary`, `Note`, `DepartId`) VALUES('NV0005', 'Triệu Mẫn', b'0', '1992-06-18 00:00:00', '5.jpg', 'e@gmail.com', '01687777736', 1000, NULL, 'KINHDOANH');
INSERT INTO `staff` (`StaffId`, `Name`, `Gender`, `Birthday`, `Photo`, `Email`, `Phone`, `Salary`, `Note`, `DepartId`) VALUES('NV0006', 'Quách Tương', b'0', '1995-06-18 00:00:00', '6.jpg', 'f@gmail.com', '01687777736', 1000, NULL, 'NHANSU');
INSERT INTO `staff` (`StaffId`, `Name`, `Gender`, `Birthday`, `Photo`, `Email`, `Phone`, `Salary`, `Note`, `DepartId`) VALUES('NV0007', 'Trương Vô Kị', b'1', '1996-03-05 00:00:00', '7.jpg', 'k@gmail.com', '01788776688', 900, NULL, 'NHANSU');
INSERT INTO `staff` (`StaffId`, `Name`, `Gender`, `Birthday`, `Photo`, `Email`, `Phone`, `Salary`, `Note`, `DepartId`) VALUES('NV0008', 'Tiểu Chiêu', b'0', '1998-09-09 00:00:00', '8.jpg', 't@gmail.com', '01788776688', 900, NULL, 'KYTHUAT');

CREATE TABLE `user` (
  `Username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Fullname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Role` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `user` (`Username`, `Password`, `Fullname`, `Role`) VALUES('HoangPhuSi', '123456', 'Hoàng Phú Sĩ', b'0');
INSERT INTO `user` (`Username`, `Password`, `Fullname`, `Role`) VALUES('LaoNgoanDong', '123456', 'Chu Bá Thông', b'0');
INSERT INTO `user` (`Username`, `Password`, `Fullname`, `Role`) VALUES('LeChiNguyen', '123456', 'Lê Chí Nguyên', b'1');
INSERT INTO `user` (`Username`, `Password`, `Fullname`, `Role`) VALUES('LeHoangHa', '123456', 'Lê Hoàng Hà', b'0');
INSERT INTO `user` (`Username`, `Password`, `Fullname`, `Role`) VALUES('LenhHoXung', '123456', 'Lệnh Hồ Xung', b'0');
INSERT INTO `user` (`Username`, `Password`, `Fullname`, `Role`) VALUES('NhatDaiTongSu', '123456', 'Trương Tam Phong', b'1');
INSERT INTO `user` (`Username`, `Password`, `Fullname`, `Role`) VALUES('TranBaoMinh', 'abcdef', 'Trần Bảo Minh', b'0');


ALTER TABLE `depart`
  ADD PRIMARY KEY (`DepartId`);

ALTER TABLE `record`
  ADD PRIMARY KEY (`RecordId`),
  ADD KEY `record_staff_fk_idx` (`StaffId`);

ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffId`),
  ADD KEY `staff_depart_fk_idx` (`DepartId`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`Username`);


ALTER TABLE `record`
  MODIFY `RecordId` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `record`
  ADD CONSTRAINT `FK4ymp3rolu3lgyk3e0uv52a6ku` FOREIGN KEY (`StaffId`) REFERENCES `staff` (`StaffId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `record_staff_fk` FOREIGN KEY (`StaffId`) REFERENCES `staff` (`StaffId`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `staff`
  ADD CONSTRAINT `FKexb7r1y7k4h39x27thrteqre8` FOREIGN KEY (`DepartId`) REFERENCES `depart` (`DepartId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_depart_fk` FOREIGN KEY (`DepartId`) REFERENCES `depart` (`DepartId`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
