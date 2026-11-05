-- =============================================
-- Table structure and data for table `admins`
-- =============================================

DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` VARCHAR(50) NOT NULL,
  `username` VARCHAR(100) NOT NULL UNIQUE,
  `password` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `admins`
INSERT INTO `admins` (`id`, `username`, `password`) VALUES
  ('01', 'Roochit', '$2b$10$9ZoE9.twud81WkWZUGvSp.YQWblYvxoE4F73jpWYvfx8rCgH0qxLS');
