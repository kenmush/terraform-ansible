/*
SQLyog Ultimate
MySQL - 10.4.11-MariaDB : Database - laravel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `clustercommittees` */

CREATE TABLE `clustercommittees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `clustercommittees` */

/*Table structure for table `collaterals` */

CREATE TABLE `collaterals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `loan_id` int(10) unsigned NOT NULL,
  `collateral` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mktval` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `serialnumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `collaterals` */

/*Table structure for table `documents` */

CREATE TABLE `documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `loan_id` int(10) unsigned NOT NULL,
  `storagepath` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `documents` */

/*Table structure for table `guarantors` */

CREATE TABLE `guarantors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `loan_id` int(10) unsigned NOT NULL,
  `guarantorname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guarantorphone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guarantoridnumber` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `guarantors` */

/*Table structure for table `investors` */

CREATE TABLE `investors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `investors` */

/*Table structure for table `loanpayments` */

CREATE TABLE `loanpayments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `loan_id` int(10) unsigned NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `loanpayments` */

/*Table structure for table `loanrates` */

CREATE TABLE `loanrates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(8,2) NOT NULL,
  `defaultrate` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `loanrates` */

insert  into `loanrates`(`id`,`rate`,`defaultrate`,`created_at`,`updated_at`) values 
(1,1.00,1,NULL,NULL);

/*Table structure for table `loans` */

CREATE TABLE `loans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `loanid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `amountBorrowed` int(11) NOT NULL,
  `dateLoanGiven` date NOT NULL,
  `loanDueDate` date NOT NULL,
  `paidOff` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rate_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `loans` */

/*Table structure for table `members` */

CREATE TABLE `members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `memberName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `idnumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phoneNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ward_id` int(10) unsigned NOT NULL DEFAULT 2462,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `members` */

/*Table structure for table `migrations` */

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2018_03_06_200914_create_loans_table',1),
(4,'2018_03_07_010029_create_documents_table',1),
(5,'2018_04_20_083100_create_members_table',1),
(6,'2018_04_21_125328_create_loanpayments_table',1),
(7,'2018_04_23_185759_create_wallets_table',1),
(8,'2018_04_30_074656_create_collaterals_table',1),
(9,'2018_07_29_204337_create_settings_table',1),
(10,'2018_08_06_184721_create_permission_tables',1),
(11,'2018_08_10_194004_create_guarantors_table',1),
(12,'2018_08_18_083557_create_wards_table',1),
(13,'2018_08_18_095001_membersupdate',1),
(14,'2018_08_21_174337_add_user_id_to_loanpayments',1),
(15,'2018_08_21_174811_create_loanrates_table',1),
(16,'2018_08_22_130352_addratetoloanstable',1),
(17,'2018_08_24_130546_create_clustercommittees_table',1),
(18,'2018_10_10_100745_create_shares_table',1),
(19,'2018_10_12_135024_create_products_table',1),
(20,'2018_10_12_135055_create_productloans_table',1),
(21,'2019_07_06_154953_create_mpesas_table',1),
(22,'2019_07_06_171001_create_investors_table',1),
(23,'2019_07_08_062305_create_onlinetransactions_table',1),
(24,'2019_07_11_030713_alter_table_settings',1);

/*Table structure for table `model_has_permissions` */

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_permissions` */

/*Table structure for table `model_has_roles` */

CREATE TABLE `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_roles` */

/*Table structure for table `mpesas` */

CREATE TABLE `mpesas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TransID` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TransTime` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TransAmount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BusinessShortCode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BillRefNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `InvoiceNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OrgAccountBalance` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ThirdPartyTransID` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MSISDN` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FirstName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MiddleName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LastName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mpesas` */

/*Table structure for table `onlinetransactions` */

CREATE TABLE `onlinetransactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MerchantRequestID` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CheckoutRequestID` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ResultCode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ResultDesc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MpesaReceiptNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TransactionDate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PhoneNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `onlinetransactions` */

/*Table structure for table `password_resets` */

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `permissions` */

CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

/*Table structure for table `productloans` */

CREATE TABLE `productloans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `loanid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `amountBorrowed` int(11) NOT NULL,
  `dateLoanGiven` date NOT NULL,
  `loanDueDate` date NOT NULL,
  `paidOff` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `productloans` */

/*Table structure for table `products` */

CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

/*Table structure for table `role_has_permissions` */

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `role_has_permissions` */

/*Table structure for table `roles` */

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

/*Table structure for table `settings` */

CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `businessname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contactnumber` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pobox` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `misson` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `vission` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `loanrate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `town` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `building` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roomnumber` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `signature` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loanmanager` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initials` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `membershipfee` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `settings` */

insert  into `settings`(`id`,`businessname`,`contactnumber`,`pobox`,`misson`,`vission`,`loanrate`,`email`,`town`,`building`,`roomnumber`,`created_at`,`updated_at`,`signature`,`loanmanager`,`logo`,`initials`,`membershipfee`) values 
(1,'Mutinda','0713642175','80','mission\r\n','vission\r\n','10','kenmsh@gmail.com','Makindu','KENJOB','1','2020-07-15 23:26:40','2020-07-15 23:26:44','','Kennedy','','K.M','0');

/*Table structure for table `shares` */

CREATE TABLE `shares` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `amount` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `shares` */

/*Table structure for table `users` */

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(1,'Kennedy Mutisya','Ken.msh@gmail.com','$2y$10$jxGtHf9/ROEH4Ij9d4V/lOrsRN8zc8g7fg.0zXLEVruHLtuLR3FrK',NULL,'2020-07-15 20:19:45','2020-07-15 20:19:45');

/*Table structure for table `wallets` */

CREATE TABLE `wallets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `wallets` */

/*Table structure for table `wards` */

CREATE TABLE `wards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ward` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `wards` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
