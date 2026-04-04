-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2026 at 11:08 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social_messenger_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `block_users`
--

CREATE TABLE `block_users` (
  `id` int(11) NOT NULL,
  `blocked_by` int(11) NOT NULL,
  `blocked_user` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `block_users`
--

INSERT INTO `block_users` (`id`, `blocked_by`, `blocked_user`, `created_at`) VALUES
(2, 3, 4, '2026-04-04 09:04:10');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `status` enum('unread','read') DEFAULT 'unread',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `receiver_id`, `content`, `status`, `created_at`) VALUES
(1, 1, 2, 'hiiii', 'read', '2026-04-04 05:15:49'),
(2, 2, 1, 'hiii', 'read', '2026-04-04 05:15:59'),
(3, 4, 1, 'Hiiii', 'unread', '2026-04-04 05:33:23'),
(4, 4, 3, 'Hiii', 'read', '2026-04-04 05:33:46'),
(5, 3, 4, 'no more message', 'read', '2026-04-04 05:34:22'),
(6, 3, 5, 'Hii dr.', 'unread', '2026-04-04 05:36:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_picture` varchar(255) DEFAULT 'default.png',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `username`, `password`, `profile_picture`, `created_at`) VALUES
(1, 'SUBANKAR DEY', 'subankardey1434@gmail.com', 'subho11', '97f6699cab09bcef67e0cb44a65c52cc7d69836f9f67cb98cc09969cbb80e0a1', '6510c7e31c9d8fbb64ee6c8697589408.jpeg', '2026-04-04 08:37:08'),
(2, 'FAYAZ ALI', 'fayaz1@gmial.com', 'fayaz1', '97f6699cab09bcef67e0cb44a65c52cc7d69836f9f67cb98cc09969cbb80e0a1', '09865629a9c58f59e8be13ad55d2e781.png', '2026-04-04 08:43:59'),
(3, 'saniya mirza', 'mirza@gmaiil.com', 'saniya', '97f6699cab09bcef67e0cb44a65c52cc7d69836f9f67cb98cc09969cbb80e0a1', '646d12e57da7832da4d44e6baad41031.jpg', '2026-04-04 08:47:55'),
(4, 'Sundaram Khah', 'sundaram@gmail.com', 'sundaram', '97f6699cab09bcef67e0cb44a65c52cc7d69836f9f67cb98cc09969cbb80e0a1', '9fad79b5fdea221f09176c2bb538cc8a.jpg', '2026-04-04 08:49:09'),
(5, 'Suchitra', 'suchi@gmail.com', 'suchi', '97f6699cab09bcef67e0cb44a65c52cc7d69836f9f67cb98cc09969cbb80e0a1', '4b5a2bd358e557d040315c87250da0b6.jpg', '2026-04-04 09:06:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `block_users`
--
ALTER TABLE `block_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_block` (`blocked_by`,`blocked_user`),
  ADD KEY `blocked_user` (`blocked_user`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receiver_id` (`receiver_id`),
  ADD KEY `idx_chat_history` (`sender_id`,`receiver_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `idx_username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `block_users`
--
ALTER TABLE `block_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `block_users`
--
ALTER TABLE `block_users`
  ADD CONSTRAINT `block_users_ibfk_1` FOREIGN KEY (`blocked_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `block_users_ibfk_2` FOREIGN KEY (`blocked_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
