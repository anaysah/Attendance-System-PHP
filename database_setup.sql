-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2023 at 01:30 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendancewebapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `absentees`
--

CREATE TABLE `absentees` (
  `absentee_id` int(11) NOT NULL,
  `attendance_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `class_id`, `date`, `time`, `teacher_id`) VALUES
(25, 14, '0000-00-00', '00:00:00', 14);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `class_code` varchar(6) NOT NULL,
  `section` varchar(255) DEFAULT NULL,
  `start_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`class_id`, `class_name`, `class_code`, `section`, `start_date`) VALUES
(14, 'BCA', '7THHPA', 'B', '2023-03-28'),
(16, 'POL SC.', '25NV38', 'A', '2023-03-28'),
(17, 'BCA', 'XKY1G0', 'A', '2023-03-28'),
(18, 'BCA', 'FTJQY7', 'C', '2023-03-28'),
(19, 'POL SCI', 'DZ2ZCH', 'A', '2023-03-31'),
(20, 'POL SCI', '45X0BX', 'A', '2023-03-31'),
(21, 'POL SCI', '6FF497', 'A', '2023-03-31'),
(22, 'BSC', 'GY214P', 'A', '2023-03-31'),
(23, 'BSC', 'SRCD22', 'A', '2023-03-31'),
(24, 'NEW', '0O89EC', 'B', '2023-03-31'),
(25, 'Science', 'BLCLIU', 'D', '2023-03-31'),
(26, 'BTECH', 'Y6MXAJ', 'A', '2023-04-05'),
(27, 'BCA', '73RYDQ', 'b', '2023-04-22');

-- --------------------------------------------------------

--
-- Table structure for table `class_student_member`
--

CREATE TABLE `class_student_member` (
  `member_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class_student_member`
--

INSERT INTO `class_student_member` (`member_id`, `class_id`, `student_id`) VALUES
(1, 18, 1),
(8, 14, 1),
(9, 14, 13),
(10, 14, 14),
(11, 14, 15),
(12, 14, 16),
(13, 14, 17),
(14, 14, 18),
(15, 14, 19),
(16, 14, 20),
(17, 14, 21),
(18, 14, 22),
(19, 14, 23),
(20, 14, 24),
(21, 14, 25),
(22, 14, 26),
(23, 14, 27),
(24, 14, 28),
(25, 14, 29),
(26, 14, 30),
(27, 14, 31),
(28, 14, 32);

-- --------------------------------------------------------

--
-- Table structure for table `class_teacher_member`
--

CREATE TABLE `class_teacher_member` (
  `member_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class_teacher_member`
--

INSERT INTO `class_teacher_member` (`member_id`, `class_id`, `teacher_id`) VALUES
(2, 14, 14),
(4, 16, 14),
(6, 18, 16),
(11, 23, 14),
(12, 24, 14),
(13, 25, 14),
(14, 14, 16),
(15, 26, 14);

-- --------------------------------------------------------

--
-- Table structure for table `on_leave`
--

CREATE TABLE `on_leave` (
  `leave_id` int(11) NOT NULL,
  `attendance_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `reason` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('active','inactive') DEFAULT 'inactive',
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `name`, `email`, `password`, `status`, `token`) VALUES
(1, 'ajay', 'nonoteh949@kaudat.com', '$2y$10$lypZ4R3nyvyDri7ioXkUgeX5ws/VU3FEjCRvSUw39kCnUUK4PaBOm', 'active', 'N4rJvVHzLM1iiI5R9O9gV81aFucXRkSD'),
(12, 'Alice', 'alice901@hotmail.com', '$2y$10$qBFUgA/gLYVcanykJJByfuJCGGL3CvBFRrqQ53pGZ1LBN6UVCIwo.', 'active', '5ecafc98fe79f4567bea1517d6dabd01'),
(13, 'David', 'david812@gmail.com', '$2y$10$hsWkyCS4r5nL96lodTL4bucSSkdrQDZBTnZnfJUcoLGCkAjWbppSe', 'active', 'f665318c16850b7c37562d6d31ec3f88'),
(14, 'Eva', 'eva778@aol.com', '$2y$10$tS.v6NDgCYnBAFg4ZpTo/O3pxGWFiFIV1h.yh7HgpuPmZCWwKffA2', 'active', '274cc9e4c0fc03fc7c7f2fe4c5043aac'),
(15, 'Ivy', 'ivy942@hotmail.com', '$2y$10$6GPjZk6vzM9iJTP4LyT1hOyQSfRz/noyCvHCij2kJNvvuKUtrojHa', 'active', 'f89482ff90c7876736eb2b0d65b5f25a'),
(16, 'Grace', 'grace259@aol.com', '$2y$10$on.CtZ.1osbdWtdTy/FYsuDYNQFA8LJRgFIJPUVdKk8v8j9lP5Y5G', 'active', '4f91f9ec2710e29384009c55b63829ca'),
(17, 'Grace', 'grace710@aol.com', '$2y$10$jfV0y813QtDOxYi7X7Bd4OA0OMB/N.90GAouxBwuCezyw8C4f7GBe', 'active', '03252278226cb390ca00ca3d89487d86'),
(18, 'Bob', 'bob776@hotmail.com', '$2y$10$xIxwuHfCfoyDbJM7.B.hWOeGDJkf6vdpJdOGJzWobwCvWlBtI6a7.', 'active', '1358c5f929f3d72b3bd6b7965eef9c9b'),
(19, 'Grace', 'grace252@yahoo.com', '$2y$10$x0V0bUhABOmIFHiv1bf80eE/Oz8zZPK4Um0n30.1M3xFnwCfk7HaC', 'active', '2bbebdf15c18735aff518df10c64a433'),
(20, 'Alice', 'alice419@outlook.com', '$2y$10$QDc16aH0r3D6Ycyg1RdyK.8Mpuz7CPYPG7R5wy6y8nJSk68urZ2Cm', 'active', '2692b83abbd4868642207dc0c5f468e5'),
(21, 'Ivy', 'ivy977@gmail.com', '$2y$10$9IBU8AtnaCRNV6FeB67KnussvuBstp5TNyCI03uLvWdYNEBGscyhq', 'active', '4d3fe0d7758babfd4952b1ba94732d16'),
(22, 'David', 'david589@outlook.com', '$2y$10$CcfaZUk7/q4D0yvHtIx27umfJt69XjBPKzWLidbds51Y0KZivy/YG', 'active', 'bf12ca11ef553e9e9c47fd7fbef1ff83'),
(23, 'Mia', 'mia615@yahoo.com', '$2y$10$1hSM0yiI6lkHZ7TGoslNBe68LH1QX9xFzDLDIyJqJ31r2ecOH26lC', 'active', '4d19caf898de7ce9e25adcfb69787a17'),
(24, 'Quinn', 'quinn718@outlook.com', '$2y$10$Cdam2LdcvzIiJRkppW/UduTTzbBV0sprWNqVdqqMTA.CLSHW36gFW', 'active', '0d507b6e48ed87c026c7a151b7e4f93d'),
(25, 'David', 'david775@mail.com', '$2y$10$M9kOXYYK6NNz8KgutoMJ.O.naqvyin06YArnAkBVKTbgLtAXMkd66', 'active', '7d7dac8d876db48e209f7570d8e0e8af'),
(26, 'Quinn', 'quinn493@protonmail.com', '$2y$10$Hzu1r08weGaARablxFWD9uFv1H1kKt36bNiVpjKpuWyQNcuhEc242', 'active', 'fb60229f77dd5c8a85e3af17a9e9b30f'),
(27, 'Mia', 'mia510@protonmail.com', '$2y$10$WHD4klils/M4iWzMBsfNMeKh0wEBSfNWTxupueY55jzkXnVKhzOlC', 'active', '31fb35ae12a141f9cbb82fd059c0ee59'),
(28, 'Quinn', 'quinn413@protonmail.com', '$2y$10$PPQfZ9jwIQ1m7xlbpdemWOYFwVKvI..c/FdboF9xt0dBXbhPiK06W', 'active', '6384b6c90e637ecef7e9808906aeeecf'),
(29, 'Alice', 'alice218@gmail.com', '$2y$10$0fbDVcbT0GTcguX5KoUsTexde.tKEIbfSdWCoWAZXrdfR0A/FIgtG', 'active', '40f16878bc531fb023f081356866013a'),
(30, 'Alice', 'alice987@icloud.com', '$2y$10$SwWjw1MkqEt/Hm1X/Qhx9eMNkxEYjoaucDa9sWw/o6dIM1QZfnBYm', 'active', '7cbbca68c4efe642c2160c5509cdbf35'),
(31, 'Samantha', 'samantha589@outlook.com', '$2y$10$4N5s3sJSgD7DwtohMIiK9eingLvQ22eZvRNPpI5tIi8kxJY8NZZG.', 'active', 'e6fa0ea60b9e0798fd12e5da2c329a14'),
(32, 'Ryan', 'ryan970@outlook.com', '$2y$10$Q.1erzNlDS3YstD.6J7nfeesnQWcVS/V2OQ6q2BIUpPeVrd3owL7q', 'active', 'b33cfe3fcd4b1715fba285afeeb74af1');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `teacher_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('active','inactive') DEFAULT 'inactive',
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacher_id`, `name`, `email`, `password`, `status`, `token`) VALUES
(14, 'ajaysahu', 'nonoteh949@kaudat.com', '$2y$10$WZb.mLFpuCvrCfoKTZwm5.SeAT4rCGy6PdYfksRf0vy2cSNZxK1fW', 'active', 'iv5KYDYHrJkQQMZDquqwrxpiJQIptvuE'),
(16, 'ajay sahu', 'tavika5862@marikuza.com', '$2y$10$/QtU1S.N0I0OR6dtBo7Xb.0PqKBnLpyWI7PzqH0c0UtjXgwJAAl/u', 'active', 'J6GpvxUdohDMaPNtOSBZAfVhms7wzlLV'),
(19, 'ddd', 'yedeva1647@ippals.com', '$2y$10$adwYX137BXa1/hfL.TRdFeu1bVPdu1DNYEkHCG1bBLIDHwL2g4BQK', 'active', 'rmWJ3PG61ahA8gF6sP1lo1WExrVJeHnm');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absentees`
--
ALTER TABLE `absentees`
  ADD PRIMARY KEY (`absentee_id`),
  ADD KEY `absentees_ibfk_1` (`attendance_id`),
  ADD KEY `absentees_ibfk_2` (`student_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `class_student_member`
--
ALTER TABLE `class_student_member`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `class_teacher_member`
--
ALTER TABLE `class_teacher_member`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `class_teacher_member_ibfk_1` (`class_id`);

--
-- Indexes for table `on_leave`
--
ALTER TABLE `on_leave`
  ADD PRIMARY KEY (`leave_id`),
  ADD KEY `on_leave_ibfk_1` (`attendance_id`),
  ADD KEY `on_leave_ibfk_2` (`student_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacher_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absentees`
--
ALTER TABLE `absentees`
  MODIFY `absentee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `class_student_member`
--
ALTER TABLE `class_student_member`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `class_teacher_member`
--
ALTER TABLE `class_teacher_member`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `on_leave`
--
ALTER TABLE `on_leave`
  MODIFY `leave_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absentees`
--
ALTER TABLE `absentees`
  ADD CONSTRAINT `absentees_ibfk_1` FOREIGN KEY (`attendance_id`) REFERENCES `attendance` (`attendance_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `absentees_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_absentees_attendance` FOREIGN KEY (`attendance_id`) REFERENCES `attendance` (`attendance_id`) ON DELETE CASCADE;

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`);

--
-- Constraints for table `class_student_member`
--
ALTER TABLE `class_student_member`
  ADD CONSTRAINT `class_student_member_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  ADD CONSTRAINT `class_student_member_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `class_teacher_member`
--
ALTER TABLE `class_teacher_member`
  ADD CONSTRAINT `class_teacher_member_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_teacher_member_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE CASCADE;

--
-- Constraints for table `on_leave`
--
ALTER TABLE `on_leave`
  ADD CONSTRAINT `on_leave_ibfk_1` FOREIGN KEY (`attendance_id`) REFERENCES `attendance` (`attendance_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `on_leave_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
