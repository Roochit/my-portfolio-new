-- =============================================
-- Database: `my_portfolio`
-- Generated from JSON data in db/
-- =============================================

CREATE DATABASE IF NOT EXISTS `my_portfolio` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `my_portfolio`;

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

-- =============================================
-- Table structure and data for table `projects`
-- =============================================

DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id` VARCHAR(50) NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `category` VARCHAR(100) NOT NULL,
  `tags` JSON DEFAULT NULL,
  `image` VARCHAR(255) DEFAULT NULL,
  `videoUrl` VARCHAR(500) DEFAULT NULL,
  `docUrl` VARCHAR(500) DEFAULT NULL,
  `downloadUrl` VARCHAR(500) DEFAULT NULL,
  `description` TEXT DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `projects`
INSERT INTO `projects` (`id`, `title`, `category`, `tags`, `image`, `videoUrl`, `docUrl`, `downloadUrl`, `description`) VALUES
  ('1', '(Original 2D Animation) Fund_ETF_DR คืออะไร the Animation | ไม่ใช่คำเเนะนำในการลงทุน |', 'animation', '["2D Animetion","Motion Graphics"]', 'assets/youtube_img/Fund_ETF_DR.png', 'https://youtu.be/h0NN96b9_o8', '', '', 'Video Motion Graphics Animation 2D สื่อการให้ความรู้เรื่องการลงทุนใน_Func_ETF และ DR ว่าต่างกันอย่างไร (ไม่ใช่คำเเนะนำในการลงทุน)'),
  ('2', '(Original 3D Character and Animation) Bahamat Project', 'animation', '["3D Character","3D Animation"]', 'assets/youtube_img/Bahamat.png', 'https://www.youtube.com', '', '', 'โปรเจคอนิเมะชั่นตัวละครปลาวาฬขนาดใหญ่ที่แบบเมืองทั้งเมืองเอาไว้บนหลังของมมันและเดินทางไปยังที่ต่างๆ'),
  ('3', '(Original 3D Character and animation) Aeloria modeling and Turntable Project', 'animation', '["3D modalling","3D Character","3D Animation"]', 'assets/youtube_img/Aeloria_01.png', 'https://youtu.be/1kF8YBbU3UE', '', '', 'สร้างตัวละครมนุษย์ 3D ครั้งแรก ขึ้นโมเดลจาก 0'),
  ('4', '(Original 3D Character and animation) Aeloria Rigging and animating Turntable Project', 'animation', '["3D Rigging","3D Character","3D Animation"]', 'assets/youtube_img/Aeloria_02.png', 'https://youtu.be/QNWsPsHml8Y', '', '', 'หลังจากได้ลองสร้างตัวละคร 3d ครั้งแรก ก็ได้ลองนำตัวละครตัวเดิมมาลองทำ Rigging เพื่อที่จะให้ตัวละครสามารถขยับได้ตามที่เราต้องการ'),
  ('5', '(หัดอนิเมค โซริวเคน) ReEdit ComboAttack 3D Animetion', 'animation', '["3D Animation"]', 'assets/youtube_img/combo.png', 'https://youtu.be/48kWdJLMIXQ', '', '', 'อนิเมชั่นการออกท่าต่อสู้ 2 คน โดยอิงจากเกมต่อสู้ street fighter โดยต้องอนิเมทให้ตัวละครชกและแอคชั่นอย่างมีน้ำหนัก'),
  ('6', '3D Animation Project (MotionActorChallenge) 2026', 'animation', '["3D Animation"]', 'assets/youtube_img/FP_Animation.png', 'https://youtu.be/nMxYpykr4zo', '', '', 'การอนิเมทตัวละครให้เต้นไดเด้นได้เหมือนมนุษย์โดยคำนึงเรื่องน้ำหนักและผสมผสานทุกอย่างที่เรียนมา'),
  ('7', 'Shoerel 3D Animation 2026 | Roochit Khamcharoen', 'animation', '["3D Animation"]', 'assets/youtube_img/Shoerel.png', 'https://youtu.be/xnn--GemGDs', '', '', 'รวมงานอนิเมะชั่นที่ดีที่สุดในปี 2026'),
  ('8', 'Tree Risk App Project 2026', 'webapp', '["App","Application","JAVA"]', 'assets/youtube_img/TreeRisk.png', 'https://youtu.be/UPC6x_kZ2ZE', 'https://github.com/Roochit/TreeRiskApp', '', 'แอปประเมินความเสี่ยงของผู้ใช้ว่าสามารถรับความเสี่ยงจากการลงทุนได้มากเท่าได'),
  ('9', '(Fan-made) เกมเต้น Soda pop | Image Processing Project |', 'game', '["Game","Game 2D","Fan-made Game","Image Processing","python"]', 'assets/youtube_img/sodapop.png', 'https://youtu.be/TbZKue4A-oA', 'https://github.com/Roochit/DancePojrct', '', 'เกมที่ใช้กล้องตตรวจจับการขยับการเต้นของผู้ใช้และนับคะแนนให้กับความ active รางกายของผู้ใช้งาน'),
  ('10', '(Fan-made) เกมตอบคำถาม Kamen Rider | Image Processing Project |', 'game', '["Game","Game 2D","Fan-made Game","Image Processing","python"]', 'assets/youtube_img/kamenrRider01.png', 'https://youtu.be/BO_Dflnf0Kg', 'https://github.com/Roochit/Kamen_Rider_Questions_Game', '', 'เกมตอบคำถามที่ใช้กล้องตรวจจับนิ้วของผู้ใช้ในการเลือกคำตอบ'),
  ('11', '(Fan-made) Kamen Raider Post Game | Image Processing Project |', 'game', '["Game","Game 2D","Fan-made Game","Image Processing","python"]', 'assets/youtube_img/kamenrRider02.png', 'https://youtu.be/WgiJPi5lfZg', 'https://github.com/Roochit/KamenRider_Pose', '', 'เกมทำท่าแปลงร่างของเหล่าไรเดอร์ ผู้เล่นต้องทำท่าให้ถูกต้องเพื่อผ่านด่าน'),
  ('12', '(Original Game) เกม ชบาในแดน 11 | Chaba11 | ตัวเต็ม (full Version)', 'game', '["Game","Game 2D","Original Game","Unity C#"]', 'assets/youtube_img/Chaba11.png', 'https://youtu.be/TUnMNCuuk4U', 'https://github.com/Roochit/Sukati_ProjectV2', 'https://serli-artsuwip.itch.io/chabacellblock11', 'เกมที่พัฒนาต่อจาก DPU Game Jam 2025 นำมาทำต่อจยสมบูรณ์พร้อมปล่อยให้เล่นแล้วครับ'),
  ('13', '(Original Game) เกมพาขวัญกลับบ้าน', 'game', '["Game","Game 3D","Original Game","Unity C#"]', 'assets/youtube_img/backTOhome.png', 'https://youtu.be/5QlR7ZlWucQ', '', 'https://tammastudio.itch.io/kwan-return?fbclid=IwY2xjawT4qkZwZG9mBWV4dG4DYWVtAjEwAGJyaWQRMXpYN01OOWExWU5mQlBTZTlzcnRjBmFwcF9pZBAyMjIwMzkxNzg4MjAwODkyAAEe4joJ2f72GMsmgtmrb4ScIi08_i2JUS0EcQKqogpPjqV0y-HoLEeUkhTrqbI_aem_1yDorDssTHgePlByWsgDfQ', 'เกมที่ผุ้เล่นจะต้องสวมบทของคนที่ต้องกลับบ้านไปลอยอังคารที่โคราชด้วยการเดิินทางด้วยรถไฟในแต่ละสถานีผู้เล่นจะต้องความผิดปกติที่เกิดขึ้ยสถานีนั้นๆ และ เลือกทางที่ถูกต้องเพื่อไปสถานี้ต่อไป หากเลือกผิดจะต้องวนลูปไปตลอดกาลนาน'),
  ('14', '(Original Game) เกม Ghost Mix Mixed เขย่าขวัญลงหม้อ', 'game', '["Game","Game 2D","Original Game","Unity C#"]', 'assets/youtube_img/GhostMixMixed.png', 'https://youtu.be/qUL9qEHZ0eM', '', 'https://roochit.itch.io/ghostmixmixed', 'เกมจับผีลงหม้อและผสมผีให้ตัวใหญ่ขึ้นเรื่อยๆจนได้ตัวใหญ่ที่สุดจบเกมมีรางวัลให้ด้วยน่ะครับ'),
  ('15', 'เว็ป Chit Shop ส่งอบรม Web Development Starter', 'webapp', '["Web","Database","HTML","CSS","PHP","SQL","Laravel"]', 'assets/youtube_img/web01.png', 'https://youtu.be/3D891NdtJKE', 'https://github.com/Roochit/chitshop', '', 'เว็ป Chit Shop ส่งอบรมคอส Web Development Starter เว็ปขายของอออนไลน์มีระบบเดต้าเบสและระบบหน้าบ้านและหลังบ้านที่สวยงาม'),
  ('1788156503984', 'เว็ปเเนะนำร้านอาหาร (CRUD)', 'webapp', '["Web","DatabaseHTML","CSS","PHP","SQL","Laravel"]', 'assets/youtube_img/ChitShop_img.png', 'https://studio.youtube.com/video/T06rEhJxV_M/edit?theme=dark', 'https://github.com/Roochit/CRUD-restaurant', '', 'เว็ปสำหรับเเนะนำร้านอาหารพร้อมระบบ อ่าน เพิ่ม ลบ แก้ไข (CRUD) เขียนด้วยภาษา PHP และ เครื่องมือ Laravel');
