/*
 Navicat MySQL Dump SQL

 Source Server         : lokal
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : bimbingan

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 13/03/2025 20:06:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dosen_pembimbing
-- ----------------------------
DROP TABLE IF EXISTS `dosen_pembimbing`;
CREATE TABLE `dosen_pembimbing`  (
  `nidn` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `no_telp` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nidn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dosen_pembimbing
-- ----------------------------
INSERT INTO `dosen_pembimbing` VALUES ('1111', 'pak abdau', 'bcshgdqegcj', '1234567890');
INSERT INTO `dosen_pembimbing` VALUES ('2222', 'pak annas', 'hwjdgoqwidh', '0987654321');

-- ----------------------------
-- Table structure for jadwal_bimbingan
-- ----------------------------
DROP TABLE IF EXISTS `jadwal_bimbingan`;
CREATE TABLE `jadwal_bimbingan`  (
  `id_jadwal` int NOT NULL AUTO_INCREMENT,
  `id_ta` int NULL DEFAULT NULL,
  `nidn` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tanggal_bimbingan` datetime NULL DEFAULT NULL,
  `catatan_bimbingan` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id_jadwal`) USING BTREE,
  INDEX `id_ta`(`id_ta` ASC) USING BTREE,
  INDEX `nidn`(`nidn` ASC) USING BTREE,
  CONSTRAINT `jadwal_bimbingan_ibfk_1` FOREIGN KEY (`id_ta`) REFERENCES `tugas_akhir` (`id_ta`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jadwal_bimbingan_ibfk_2` FOREIGN KEY (`nidn`) REFERENCES `dosen_pembimbing` (`nidn`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jadwal_bimbingan
-- ----------------------------
INSERT INTO `jadwal_bimbingan` VALUES (6, 7, '1111', '2025-10-02 00:00:00', 'fhiuewfbxjiw', 1);
INSERT INTO `jadwal_bimbingan` VALUES (7, 8, '2222', '2025-11-07 00:00:00', 'hguksbie', 0);
INSERT INTO `jadwal_bimbingan` VALUES (8, 9, '1111', '2025-09-20 00:00:00', 'agwiifxehh', 1);
INSERT INTO `jadwal_bimbingan` VALUES (9, 10, '1111', '2025-12-16 00:00:00', 'jgaiufwsblw', 0);
INSERT INTO `jadwal_bimbingan` VALUES (10, 11, '2222', '2025-12-25 00:00:00', 'wdgqibmwsbq', 1);

-- ----------------------------
-- Table structure for mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `mahasiswa`;
CREATE TABLE `mahasiswa`  (
  `npm` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `angkatan` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `no_telp` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`npm`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mahasiswa
-- ----------------------------
INSERT INTO `mahasiswa` VALUES ('230102026', 'Amel', '2023', 'ameladellia815@gmail.com', '081229590091');
INSERT INTO `mahasiswa` VALUES ('230102038', 'Meilita A', '2023', 'meilitakhasanah@gmail.com', '085600641938');
INSERT INTO `mahasiswa` VALUES ('230102043', 'Shalsabilla', '2023', 'shalsabiel387@gmail.com', '082240080578');
INSERT INTO `mahasiswa` VALUES ('230102045', 'Tiara D', '2023', 'tiaradinda020@gmail.com', '081390012511');
INSERT INTO `mahasiswa` VALUES ('230202047', 'Yana A', '2023', 'dianaaprilia745@gmail.com', '081949463133');

-- ----------------------------
-- Table structure for tugas_akhir
-- ----------------------------
DROP TABLE IF EXISTS `tugas_akhir`;
CREATE TABLE `tugas_akhir`  (
  `id_ta` int NOT NULL AUTO_INCREMENT,
  `judul` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `file_ta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `npm` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `file_revisi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `tanggal_revisi` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_ta`) USING BTREE,
  INDEX `npm`(`npm` ASC) USING BTREE,
  CONSTRAINT `tugas_akhir_ibfk_1` FOREIGN KEY (`npm`) REFERENCES `mahasiswa` (`npm`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tugas_akhir
-- ----------------------------
INSERT INTO `tugas_akhir` VALUES (7, 'Sistem Manajemen Laundry Berbasis Web', 'uploads/ta1.pdf', 1, '230102045', 'uploads/revisi_ta1.pdf', '2025-03-15');
INSERT INTO `tugas_akhir` VALUES (8, 'Penerapan User-Centered Design dalam Aplikasi E-Commerce', 'uploads/ta2.pdf', 0, '230102043', NULL, NULL);
INSERT INTO `tugas_akhir` VALUES (9, 'Analisis Risiko K3 di Kampus', 'uploads/ta3.pdf', 1, '230102026', 'uploads/revisi_ta3.pdf', '2025-02-28');
INSERT INTO `tugas_akhir` VALUES (10, 'Optimasi Algoritma Sorting untuk Big Data', 'uploads/ta4.pdf', 0, '230102038', NULL, NULL);
INSERT INTO `tugas_akhir` VALUES (11, 'Pengembangan Sistem Bimbingan Tugas Akhir Online', 'uploads/ta5.pdf', 1, '230202047', 'uploads/revisi_ta5.pdf', '2025-01-10');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'Yana A', '2222', 'Mahasiswa');
INSERT INTO `user` VALUES (2, 'Tiara D', '3333', 'Mahasiswa');
INSERT INTO `user` VALUES (3, 'Meilita A', '4444', 'Mahasiswa');
INSERT INTO `user` VALUES (4, 'Amel', '5555', 'Mahasiswa');
INSERT INTO `user` VALUES (5, 'Shalsabilla', '6666', 'Mahasiswa');

-- ----------------------------
-- View structure for v_tugasakhir
-- ----------------------------
DROP VIEW IF EXISTS `v_tugasakhir`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_tugasakhir` AS select `mahasiswa`.`npm` AS `npm`,`mahasiswa`.`nama` AS `nama_mahasiswa`,`dosen_pembimbing`.`nama` AS `nama_dosen`,`tugas_akhir`.`judul` AS `judul`,`jadwal_bimbingan`.`tanggal_bimbingan` AS `tanggal_bimbingan`,`jadwal_bimbingan`.`catatan_bimbingan` AS `catatan_bimbingan` from (((`mahasiswa` join `tugas_akhir` on((`mahasiswa`.`npm` = `tugas_akhir`.`npm`))) join `jadwal_bimbingan` on((`tugas_akhir`.`id_ta` = `jadwal_bimbingan`.`id_ta`))) join `dosen_pembimbing` on((`jadwal_bimbingan`.`nidn` = `dosen_pembimbing`.`nidn`)));

SET FOREIGN_KEY_CHECKS = 1;
