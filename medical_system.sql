-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2025 at 10:56 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medical_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `Id` int(11) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `Password` varchar(250) NOT NULL,
  `FullName` varchar(250) NOT NULL,
  `Dob` date NOT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `Photo` varchar(255) DEFAULT NULL,
  `RoleId` int(11) NOT NULL,
  `FacultyId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`Id`, `Email`, `Password`, `FullName`, `Dob`, `Phone`, `Address`, `Description`, `Photo`, `RoleId`, `FacultyId`) VALUES
(1, 'admin@gmail.com', '$2a$10$Bwy6ucbgCPWTARflfBq/Lu9AQcpI4B32xqamwGFoWPrs3qsgMaz0m', 'Bao Admin', '2003-09-10', '0346006090', 'Ho Chi Minh City, Vietnam', '																																																																																																																																					\"We are dedicated to improving your health and well-being through compassionate care, advanced medical innovations, and a steadfast commitment to excellence. Our mission is to empower individuals and communities by providing personalized healthcare solutions tailored to meet your unique needs.\"					', 'd1da0a6b1dde4eb0a4757604d5917603.jpg', 1, NULL),
(2, 'tnbao1009@gmail.com', '$2a$10$aYJTFiFWLm3iKzpoiapmPedHot10oGNIflnicBXb/4mkGSM4.kDMu', 'Mr. Bao', '2002-06-27', '0923923945', 'Da Nang City, Vietnam', '\"Every patient is a unique story, every diagnosis a new challenge, and every recovery a testament to the relentless dedication and skill of a doctor who refuses to give up, no matter how tough the journey may seem.\"', 'bb8771365d4d4a7081d4e77df48276ae.jpg', 2, 3),
(3, 'kientv10@gmail.com', '$2a$10$dW5GFfFCmqFqFg8WFqZR8.JGJ8.2w4OQkoqsQmkTaQ0DsWc4AZpTm', 'Phạm Thế Kiên', '2001-01-19', '09829382932', 'Binh Duong, Vietnam', '\"Committed to Your Health and Well-being, Delivering Compassionate, High-Quality Care with Innovation and Excellence at Every Step.\"', 'b92e0230fb3d4e7894a444c8e22ff0e2.jpg', 2, 2),
(4, 'toanvn22@gmail.com', '$2a$10$5lhxSDicp0eruyFKzGPPzO3otYhyfoQjZmxE53xwbXIGWfTqaJyPy', 'Nguyễn Văn Toàn', '2025-01-11', '0923829302', 'Ho Chi Minh City, Vietnam', '\"In every decision we make and every action we take, we strive to honor the trust of our patients, blending the precision of science with the warmth of humanity, because every life we touch deserves nothing less than the very best we have to give.\"', 'bb69d26cbb6c49b7ab3f58f888fdd645.jpg', 2, 2),
(6, 'tuyentb@gmail.com', '$2a$10$c307gC5pjvD9xuCyY9CFUuLik37q2.xf3/tCOt1/FA.KhqN2Npvr6', 'Trần Bích Tuyền', '2002-02-14', '0346006090', 'Vung Tau City, Vietnam', NULL, '15b6257f2d65486d9ab0e25f1fcfebfc.png', 3, NULL),
(7, 'truongbao102003@gmail.com', '$2a$10$jGs8fH.6rlPr1lot/bPsNuVBxMzHdcTPU26BHcw/yeXFuyMyw7GEq', 'Trương Như Bảo', '2003-09-10', '0346006090', 'Nha Trang City, Vietnam', 'Together, we’ll make tomorrow brighter.', '6b6ed13edddb42f99706e3a8189d424d.png', 3, NULL),
(8, 'minhnv10@gmail.com', '$2a$10$K/JJ.gi2LGxD6wYSNwLqF.HNcE5ZGrFMStRhQXQyB/q4onUFQ/34q', 'Nguyễn Văn Minh', '1998-03-19', '0346006090', 'Nha Trang City, Vietnam', NULL, 'e4d28970ff3c459fab7d6bde51702534.png', 3, NULL),
(9, 'thongnh@gmail.com', '$2a$10$g86n7QQNLgCIYEuqm6Snp.tuytg7HLO4rw1rZnwmeNX0XfX.P4p3O', 'Ngô Hoàng Thông', '2002-02-14', '0989283923', 'Da Lat City, Vietnam', NULL, '7899aab3ca624ce18b76604b9dca6024.jpg', 3, NULL),
(10, 'vannh@gmail.com', '$2a$10$vD5Rk88k9gGdhCSN41sa4e3FS0vfXjaO3OFtwUU4l/6Fvhv78WjKK', 'Nguyễn Hồng Vân', '2006-06-29', '0989283728', 'Da Lat City, VietNam', NULL, '631446b746754365ab26312fd63fc36a.png', 3, NULL),
(11, 'thong@gmail.com', '$2a$10$g86n7QQNLgCIYEuqm6Snp.tuytg7HLO4rw1rZnwmeNX0XfX.P4p3O', 'Ngô Hoàng Thông', '2018-01-18', '0923823239', 'Da Nang City, Vietnam', NULL, 'a2e1203ad0d24cdd8be5ef6c15a91879.jpg', 2, 17),
(12, 'kiet@gmail.com', '$2a$10$VYT8UIxzJgn7lY44XKcW9OG9pUXApTUi9S37O5XO5/67bkixuqTPi', 'Trần Anh Kiệt', '2023-06-06', '0982489504', 'Ho Chi Minh City, VietNam', '\"Doctors are not just healers of the body; they are guardians of hope, bearers of strength, and champions of resilience, dedicated to helping patients overcome their darkest moments and find light, one small step at a time.\"', 'f441dbd527d34259aa8fb9ed4fbd8f7d.jpg', 2, 17),
(14, 'bao@gmail.com', '$2a$10$vA3SYmLYFk/RL.1OMVwnY.MJ5nxhiAKJ7.ueTOk5o670qnM94e94i', 'Phạm Quốc Bảo', '2025-01-16', '0923029322', 'Ha Noi City, VietNam', '\"Behind every stethoscope lies a commitment to excellence, a promise to never stop learning, and a mission to bring comfort and healing to every patient who entrusts us with their lives, no matter how complex their needs may be.\"', 'ff37ac6509b1468ca1dc098f5ea09bca.jpg', 2, 17),
(15, 'vinh@gmail.com', '$2a$10$5tSyOkeBn8aflOYWUHa2B.Ra/j29e6jCjMaIOlLGkrV1xur8KCRjK', 'Lê Tấn Vinh', '2025-01-24', '0346006090', 'Đường số 16, chung cư Linh Trung', NULL, '088a3428708d43f2bde2f60a8fbf79bf.jpg', 2, 17),
(16, 'nhat@gmail.com', '$2a$10$GZtXsaPxRhMJ9wG016lOUezimHXQCsJOpXTVkLiAyIkB1Nm11q8ge', 'Lâm Xuân Minh Nhật', '1994-06-07', '0988923232', 'Bien Hoa City, Vietnam', NULL, '78e6b0f31cab45999a8c0aa081351d7e.jpg', 2, 17),
(17, 'thao@gmail.com', '$2a$10$iWMARQp3R1eyIL7FSw95veLqO46JLLzrn5isGOfsAD3n2jiZ.K9WW', 'Trần Huỳnh Minh Thảo', '2001-10-23', '0346006090', 'Đường số 16, chung cư Linh Trung', NULL, '3025ba8655404b2088c221140cd18a18.jpg', 2, 17),
(18, 'binh@gmail.com', '$2a$10$uRd3IOq/a1rN3eNitdBukOFUwo4TkQiEkW8n6JD0brHm/ehJy7Zt.', 'Nguyễn Thanh Bình', '2000-03-01', '09829382392', 'Hue City, Vietnam', '\"Doctors are not just healers of the body; they are guardians of hope, bearers of strength, and champions of resilience, dedicated to helping patients overcome their darkest moments and find light, one small step at a time.\"', '36bf9641ab9c4ff6b7838e05535e9b96.jpg', 2, 17),
(19, 'lehung@gmail.com', '$2a$10$Zx9OLNR9CshNIKcDEjC.SeLhxoZB6boI5svZ5hN/xA6YtwvA/sDOm', 'Lê Quang Hùng', '2004-06-06', '0346006090', 'Đường số 16, chung cư Linh Trung', NULL, '2627aa295e1946f2aa3728ddce439ef4.png', 2, 17),
(20, 'huy@gmail.com', '$2a$10$xbbAFhYGb6Julv9RKkfXKulCciGd9bHPGPU61s3IaJwwW5jnaM8ua', 'Phan Tấn Huy', '1998-06-25', '0346006090', 'Đường số 16, chung cư Linh Trung', NULL, 'e0426eafea9848a9ba9dc36d2c889f7d.png', 2, 17),
(22, 'doitp@gmail.com', '$2a$10$n9vZwQQdZOR/rYzetICUF.GZX7udkomA6YRhm6DkH9E2VwYoWHjOO', 'Phạm Tấn Đời', '2006-01-09', '0989232423', 'Da Nang City, Vietnam', NULL, '9007a97f85a44465b57ceb2cd3833009.png', 3, NULL),
(23, 'thientd@gmail.com', '$2a$10$ysb5zk402fHmm5r5SD7PO.cCTryT800dAVuFG5JCDYfzWG7YlIh42', 'Trần Đức Thiện', '2001-07-18', '0920323239', 'Ha Noi City, Vietnam', NULL, '23de1fd9fc6e4f82b25cd37b4a5f9097.png', 3, NULL),
(24, 'nguyetmn@gmail.com', '$2a$10$jsPQkKhuYp4.Dfe0e3bo3O5fZ9QRgJ.pul//UqrebDFscmEYqmBtK', 'Minh Nhật Nguyệt', '2004-10-20', '0923606090', 'Hue City, Vietnam', NULL, NULL, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `Id` int(11) NOT NULL,
  `PatientId` int(11) NOT NULL,
  `DoctorId` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` datetime NOT NULL,
  `Content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`Id`, `PatientId`, `DoctorId`, `Date`, `Time`, `Content`) VALUES
(1, 7, 11, '2025-01-17', '1970-01-01 19:29:00', 'Kính chào bác sĩ, em muốn đặt lịch hẹn tư vấn sửa mũi, cụ thể là để khắc phục tình trạng mũi lệch và nâng cao sống mũi sao cho phù hợp với khuôn mặt, rất mong bác sĩ có thể hỗ trợ em sắp xếp thời gian'),
(2, 7, 3, '2025-01-16', '1970-01-01 22:29:00', 'Kính chào bác sĩ, em muốn đặt lịch khám nội tiết vì gần đây em gặp tình trạng rối loạn kinh nguyệt, da nổi mụn nhiều, rụng tóc và thường xuyên mệt mỏi, rất mong bác sĩ hỗ trợ tư vấn và kiểm tra để tìm hiểu nguyên nhân và điều trị phù hợp.'),
(3, 7, 2, '2025-01-18', '1970-01-01 19:30:00', 'Kính chào bác sĩ, em muốn đặt lịch khám liên quan đến hệ miễn dịch vì gần đây em thường xuyên bị cảm, dễ ốm và có dấu hiệu dị ứng không rõ nguyên nhân, rất mong được bác sĩ tư vấn và kiểm tra để hiểu rõ tình trạng sức khỏe của mình.'),
(4, 7, 14, '2025-01-09', '1970-01-01 22:21:00', 'Kính chào bác sĩ, em muốn đặt lịch tư vấn thẩm mỹ về lông mi vì lông mi của em khá thưa, ngắn và không cong, làm đôi mắt thiếu điểm nhấn. Mong được bác sĩ kiểm tra và tư vấn các phương pháp phù hợp để cải thiện.'),
(5, 10, 11, '2025-01-25', '1970-01-01 18:58:00', 'Kính chào bác sĩ, em muốn đặt lịch tư vấn thẩm mỹ vùng miệng vì em cảm thấy môi không cân đối và khóe miệng bị chùng xuống, ảnh hưởng đến thẩm mỹ khuôn mặt. Mong được bác sĩ hỗ trợ kiểm tra và đưa ra giải pháp phù hợp.'),
(6, 8, 18, '2025-01-25', '1970-01-01 17:00:00', 'Kính chào bác sĩ, em muốn đặt lịch tư vấn thẩm mỹ vùng mắt vì em gặp tình trạng bọng mắt lớn, mí mắt không đều và nếp nhăn quanh mắt làm khuôn mặt trông mệt mỏi. Mong bác sĩ hỗ trợ kiểm tra và đưa ra phương án cải thiện phù hợp.'),
(7, 6, 16, '2025-01-22', '1970-01-01 17:30:00', 'Kính chào bác sĩ, em muốn đặt lịch tư vấn thẩm mỹ khuôn mặt vì em cảm thấy gương mặt chưa cân đối, phần cằm hơi thô và góc hàm không được mềm mại. Mong được bác sĩ kiểm tra và đưa ra giải pháp phù hợp để cải thiện diện mạo tổng thể.'),
(8, 8, 2, '2025-01-31', '1970-01-01 18:48:00', 'Chào bác sĩ, em muốn đặt lịch khám dị ứng vì gần đây em thường bị ngứa, nổi mẩn đỏ và chảy nước mũi khi tiếp xúc với một số yếu tố. Mong được bác sĩ tư vấn ạ.'),
(9, 10, 2, '2025-01-15', '1970-01-01 18:44:00', 'Chào bác sĩ, em muốn đặt lịch khám miễn dịch vì gần đây em thường xuyên ốm vặt và có dấu hiệu dị ứng không rõ nguyên nhân. Mong bác sĩ tư vấn giúp ạ.'),
(10, 10, 2, '2025-01-16', '1970-01-01 20:45:00', 'Dạ em chào bác sĩ, em muốn đặt lịch khám miễn dịch ạ. Dạo gần đây em hay bị ốm vặt với có mấy dấu hiệu dị ứng không rõ nguyên nhân, mong bác sĩ tư vấn giúp em ạ.'),
(11, 22, 2, '2025-01-30', '1970-01-01 19:20:00', 'Dạ em chào bác sĩ, em muốn đặt lịch tư vấn về sửa trán ạ. Em cảm thấy trán mình hơi thấp và chưa cân đối với khuôn mặt, mong được bác sĩ kiểm tra và tư vấn phương pháp phù hợp giúp em ạ.'),
(12, 24, 2, '2025-01-24', '1970-01-01 17:30:00', 'Dạ em chào bác sĩ, em muốn đặt lịch khám vì gần đây em có dấu hiệu viêm như đau, sưng và đỏ ở lưng. Mong bác sĩ kiểm tra và tư vấn giúp em ạ.'),
(13, 24, 2, '2025-01-31', '1970-01-01 21:30:00', 'Dạ em chào bác sĩ, em muốn đặt lịch khám miễn dịch vì dạo gần đây em hay bị ốm vặt và cảm thấy sức đề kháng yếu. Mong bác sĩ kiểm tra và tư vấn giúp em ạ.'),
(14, 23, 2, '2025-01-23', '1970-01-01 19:30:00', 'Dạ em chào bác sĩ, em muốn đặt lịch khám vì tay em gần đây hay bị ngứa, nổi mẩn đỏ và bong tróc da, nghi ngờ do dị ứng. Mong bác sĩ kiểm tra và tư vấn giúp em ạ.');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `Id` int(11) NOT NULL,
  `Name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`Id`, `Name`) VALUES
(1, 'Ngoại tổng quát (General Surgery)'),
(2, 'Nội tiết (Endocrinology)'),
(3, 'Miễn dịch - Dị ứng (Immunology & Allergy)'),
(4, 'Ngoại tổng quát (General Surgery)'),
(16, 'Nội tiết sinh sản (Reproductive Endocrinology)'),
(17, 'Phẫu thuật Thẩm mỹ (Plastic Surgery)'),
(18, 'Vật lý trị liệu và phục hồi chức năng (Physiotherapy and Rehabilitation)'),
(19, 'Nội tim mạch (Cardiology)'),
(20, 'Hô hấp (Pulmonology/Respiratory Medicine)'),
(21, 'Thần kinh học (Neurology)'),
(26, 'Sức khỏe sinh sản (Reproductive Health)'),
(27, 'Nhi thần kinh (Pediatric Neurology)');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `Id` int(11) NOT NULL,
  `Name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`Id`, `Name`) VALUES
(1, 'Admin'),
(2, 'Doctor'),
(3, 'Patient');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FacultyId` (`FacultyId`),
  ADD KEY `RoleId` (`RoleId`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `DoctorId` (`DoctorId`),
  ADD KEY `PatientId` (`PatientId`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`FacultyId`) REFERENCES `faculty` (`Id`),
  ADD CONSTRAINT `account_ibfk_2` FOREIGN KEY (`RoleId`) REFERENCES `role` (`Id`);

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`DoctorId`) REFERENCES `account` (`Id`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`PatientId`) REFERENCES `account` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
