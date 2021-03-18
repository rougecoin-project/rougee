-- Created at 5.3.2021 20:20 using David Grudl MySQL Dump Utility
-- Host: 104.0.175.125
-- MySQL Server: 5.5.5-10.4.13-MariaDB
-- Database: bougee

SET NAMES utf8;
SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
SET FOREIGN_KEY_CHECKS=0;
-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_activities`;

CREATE TABLE `pxp_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `post_id` int(11) NOT NULL DEFAULT 0,
  `following_id` int(11) NOT NULL DEFAULT 0,
  `type` varchar(100) NOT NULL DEFAULT '',
  `time` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

INSERT INTO `pxp_activities` (`id`, `user_id`, `post_id`, `following_id`, `type`, `time`) VALUES
(1,	3,	0,	2,	'followed_user',	'1614720826'),
(2,	2,	0,	3,	'followed_user',	'1614720921'),
(4,	1,	0,	3,	'followed_user',	'1614723563'),
(5,	1,	0,	2,	'followed_user',	'1614723564'),
(6,	2,	2,	0,	'liked__post',	'1614724071'),
(8,	4,	0,	3,	'followed_user',	'1614724260'),
(9,	4,	0,	2,	'followed_user',	'1614724260'),
(10,	1,	3,	0,	'liked__post',	'1614724291'),
(12,	1,	0,	4,	'followed_user',	'1614729453'),
(13,	1,	2,	0,	'liked__post',	'1614730280'),
(14,	1,	3,	0,	'commented_on_post',	'1614730313'),
(15,	3,	3,	0,	'liked__post',	'1614732062'),
(16,	3,	2,	0,	'liked__post',	'1614732066'),
(17,	3,	0,	4,	'followed_user',	'1614732088'),
(18,	1,	5,	0,	'liked__post',	'1614734180'),
(19,	4,	6,	0,	'liked__post',	'1614738479'),
(20,	4,	3,	0,	'liked__post',	'1614738495'),
(21,	4,	5,	0,	'liked__post',	'1614738500'),
(22,	4,	2,	0,	'liked__post',	'1614738505'),
(23,	1,	6,	0,	'liked__post',	'1614738510'),
(24,	4,	3,	0,	'commented_on_post',	'1614738581'),
(25,	3,	6,	0,	'liked__post',	'1614738675'),
(26,	5,	0,	4,	'followed_user',	'1614741198'),
(27,	5,	0,	3,	'followed_user',	'1614741198'),
(28,	5,	0,	2,	'followed_user',	'1614741198'),
(29,	5,	3,	0,	'liked__post',	'1614741207'),
(30,	5,	6,	0,	'liked__post',	'1614741209'),
(31,	5,	2,	0,	'liked__post',	'1614741213'),
(32,	5,	6,	0,	'commented_on_post',	'1614741235'),
(33,	5,	3,	0,	'commented_on_post',	'1614741251'),
(34,	5,	2,	0,	'commented_on_post',	'1614741262'),
(35,	3,	0,	5,	'followed_user',	'1614742364'),
(36,	6,	0,	3,	'followed_user',	'1614742843'),
(37,	3,	0,	6,	'followed_user',	'1614743319'),
(38,	1,	0,	6,	'followed_user',	'1614743451'),
(39,	3,	6,	0,	'commented_on_post',	'1614743897'),
(40,	7,	0,	6,	'followed_user',	'1614744347'),
(41,	7,	0,	5,	'followed_user',	'1614744347'),
(42,	7,	0,	4,	'followed_user',	'1614744347'),
(43,	7,	0,	3,	'followed_user',	'1614744347'),
(44,	7,	0,	2,	'followed_user',	'1614744347'),
(45,	7,	6,	0,	'liked__post',	'1614744732'),
(46,	7,	3,	0,	'liked__post',	'1614744734'),
(47,	7,	2,	0,	'liked__post',	'1614744736'),
(48,	3,	0,	7,	'followed_user',	'1614745477'),
(49,	3,	7,	0,	'liked__post',	'1614745484'),
(50,	3,	7,	0,	'commented_on_post',	'1614745494'),
(51,	3,	5,	0,	'liked__post',	'1614745513'),
(52,	8,	0,	7,	'followed_user',	'1614745925'),
(53,	8,	0,	6,	'followed_user',	'1614745925'),
(54,	8,	0,	5,	'followed_user',	'1614745925'),
(55,	8,	0,	4,	'followed_user',	'1614745925'),
(56,	8,	0,	3,	'followed_user',	'1614745925'),
(57,	8,	0,	2,	'followed_user',	'1614745925'),
(58,	9,	0,	2,	'followed_user',	'1614746225'),
(59,	9,	3,	0,	'liked__post',	'1614746256'),
(60,	9,	0,	3,	'followed_user',	'1614746285'),
(61,	9,	0,	5,	'followed_user',	'1614746296'),
(62,	3,	0,	9,	'followed_user',	'1614746741'),
(63,	3,	8,	0,	'liked__post',	'1614746745'),
(66,	11,	3,	0,	'liked__post',	'1614758301'),
(67,	11,	3,	0,	'commented_on_post',	'1614758354'),
(68,	11,	0,	2,	'followed_user',	'1614758370'),
(69,	11,	0,	3,	'followed_user',	'1614758582'),
(70,	11,	0,	5,	'followed_user',	'1614758624'),
(71,	11,	0,	4,	'followed_user',	'1614758982'),
(72,	10,	0,	9,	'followed_user',	'1614759209'),
(73,	10,	0,	8,	'followed_user',	'1614759210'),
(74,	10,	0,	7,	'followed_user',	'1614759211'),
(75,	10,	0,	6,	'followed_user',	'1614759213'),
(76,	10,	0,	5,	'followed_user',	'1614759213'),
(77,	10,	0,	3,	'followed_user',	'1614759214'),
(78,	10,	0,	4,	'followed_user',	'1614759216'),
(79,	10,	0,	2,	'followed_user',	'1614759218'),
(80,	10,	2,	0,	'liked__post',	'1614759558'),
(81,	10,	2,	0,	'commented_on_post',	'1614761607'),
(82,	3,	0,	11,	'followed_user',	'1614775643'),
(83,	3,	0,	10,	'followed_user',	'1614775666'),
(84,	3,	0,	8,	'followed_user',	'1614775919'),
(85,	5,	0,	9,	'followed_user',	'1614818888'),
(86,	5,	0,	11,	'followed_user',	'1614818900'),
(87,	5,	0,	8,	'followed_user',	'1614818910'),
(88,	5,	0,	7,	'followed_user',	'1614818929'),
(89,	5,	8,	0,	'liked__post',	'1614818952'),
(90,	5,	8,	0,	'commented_on_post',	'1614818960'),
(91,	1,	0,	7,	'followed_user',	'1614819038'),
(92,	5,	0,	10,	'followed_user',	'1614819112'),
(93,	1,	7,	0,	'liked__post',	'1614819188'),
(94,	1,	0,	11,	'followed_user',	'1614819210'),
(95,	1,	0,	10,	'followed_user',	'1614819211'),
(96,	1,	9,	0,	'liked__post',	'1614819216'),
(97,	1,	9,	0,	'commented_on_post',	'1614819226'),
(98,	1,	0,	5,	'followed_user',	'1614819236'),
(99,	1,	0,	9,	'followed_user',	'1614819281'),
(100,	1,	0,	8,	'followed_user',	'1614819281'),
(101,	3,	9,	0,	'liked__post',	'1614873279');


-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_bank_receipts`;

CREATE TABLE `pxp_bank_receipts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT 0,
  `funding_id` int(11) NOT NULL DEFAULT 0,
  `description` tinytext DEFAULT NULL,
  `price` varchar(50) NOT NULL DEFAULT '0',
  `mode` varchar(50) NOT NULL DEFAULT '',
  `approved` int(11) unsigned NOT NULL DEFAULT 0,
  `receipt_file` varchar(250) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `approved_at` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_blacklist`;

CREATE TABLE `pxp_blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(50) NOT NULL DEFAULT '',
  `time` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_blocks`;

CREATE TABLE `pxp_blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(15) NOT NULL DEFAULT 0,
  `profile_id` int(15) NOT NULL DEFAULT 0,
  `time` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `profile_id` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_blog`;

CREATE TABLE `pxp_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT 0,
  `title` varchar(120) NOT NULL DEFAULT '',
  `content` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `posted` varchar(300) DEFAULT '0',
  `category` int(255) DEFAULT 0,
  `thumbnail` varchar(255) DEFAULT 'media/upload/photos/d-blog.jpg',
  `view` int(11) DEFAULT 0,
  `shared` int(11) DEFAULT 0,
  `tags` varchar(300) DEFAULT '',
  `created_at` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_blog_comments`;

CREATE TABLE `pxp_blog_comments` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `post_id` int(20) NOT NULL DEFAULT 0,
  `user_id` int(20) NOT NULL DEFAULT 0,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `pxp_blog_comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `pxp_blog` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_blog_likes`;

CREATE TABLE `pxp_blog_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(30) NOT NULL DEFAULT 0,
  `user_id` int(30) NOT NULL DEFAULT 0,
  `type` varchar(20) NOT NULL DEFAULT 'up',
  `time` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `type` (`type`),
  CONSTRAINT `pxp_blog_likes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `pxp_blog` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `pxp_blog_likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `pxp_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_business_requests`;

CREATE TABLE `pxp_business_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(50) NOT NULL DEFAULT '',
  `site` varchar(200) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `passport` text DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `time` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_chats`;

CREATE TABLE `pxp_chats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(15) NOT NULL DEFAULT 0,
  `to_id` int(15) NOT NULL DEFAULT 0,
  `time` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `from_id` (`from_id`),
  KEY `to_id` (`to_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `pxp_chats` (`id`, `from_id`, `to_id`, `time`) VALUES
(1,	3,	2,	'1614730673'),
(2,	2,	3,	'1614730673');


-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_comments_likes`;

CREATE TABLE `pxp_comments_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `comment_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `comment_id` (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

INSERT INTO `pxp_comments_likes` (`id`, `user_id`, `comment_id`) VALUES
(1,	1,	1),
(2,	3,	3),
(3,	3,	4),
(4,	3,	2),
(5,	3,	1),
(6,	3,	5),
(7,	9,	9),
(8,	7,	7),
(9,	11,	1),
(10,	10,	5),
(11,	3,	11);


-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_comments_reply`;

CREATE TABLE `pxp_comments_reply` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `comment_id` int(20) NOT NULL DEFAULT 0,
  `user_id` int(20) NOT NULL DEFAULT 0,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `comment_id` (`comment_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `pxp_comments_reply` (`id`, `comment_id`, `user_id`, `text`, `time`) VALUES
(1,	5,	3,	'thanks ?',	'1614745556'),
(2,	7,	7,	'vibin&#039; ya know, on that new wave ?',	'1614749149');


-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_comments_reply_likes`;

CREATE TABLE `pxp_comments_reply_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `reply_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `reply_id` (`reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_config`;

CREATE TABLE `pxp_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;

INSERT INTO `pxp_config` (`id`, `name`, `value`) VALUES
(1,	'site_url',	'http://104.0.175.125'),
(2,	'site_name',	'The BouGee Network'),
(3,	'theme',	'default'),
(4,	'validation',	'off'),
(5,	'ffmpeg_sys',	'off'),
(6,	'ffmpeg_binary',	'/usr/bin/ffmpeg'),
(7,	'max_video_duration',	'50'),
(8,	'yt_api',	'AIzaSyB3Lc0LpuqDCcv3F5qEMRVwYmfK37Tc9p0'),
(9,	'giphy_api',	'EEoFiCosGuyEIWlXnRuw4McTLxfjCrl1'),
(10,	'upload_images',	'on'),
(11,	'upload_videos',	'on'),
(12,	'import_videos',	'on'),
(13,	'import_images',	'on'),
(14,	'story_system',	'on'),
(15,	'signup_system',	'on'),
(16,	'delete_account',	'on'),
(17,	'recaptcha',	'on'),
(18,	'recaptcha_key',	''),
(19,	'site_desc',	'Bougee is a PHP decentralized crypto social network. Earn RougeCoin by posting engaging content for your followers!'),
(20,	'site_email',	'support@bougee.xyz'),
(21,	'meta_keywords',	'social, bougee, social site'),
(22,	'obscene',	''),
(23,	'max_upload',	'1000000000'),
(24,	'caption_len',	'500'),
(25,	'comment_len',	'500'),
(27,	'language',	'english'),
(28,	'smtp_or_mail',	'mail'),
(29,	'smtp_host',	''),
(30,	'smtp_username',	''),
(31,	'smtp_password',	''),
(32,	'smtp_port',	'587'),
(33,	'smtp_encryption',	'tls'),
(34,	'fb_login',	'off'),
(35,	'tw_login',	'off'),
(36,	'gl_login',	'off'),
(37,	'facebook_app_id',	''),
(38,	'facebook_app_key',	''),
(39,	'twitter_app_id',	''),
(40,	'twitter_app_key',	''),
(41,	'google_app_id',	''),
(42,	'google_app_key',	''),
(43,	'site_docs',	''),
(44,	'last_created_sitemap',	'0000-00-00'),
(45,	'last_backup',	'2018-03-07 06:13:18'),
(46,	'story_duration',	'10'),
(47,	'last_clean_db',	'1614972240'),
(48,	'email_validation',	'off'),
(49,	'amazone_s3',	'0'),
(50,	'bucket_name',	''),
(51,	'amazone_s3_key',	''),
(52,	'amazone_s3_s_key',	''),
(53,	'region',	''),
(54,	'ad1',	''),
(55,	'ad2',	''),
(56,	'ad3',	''),
(57,	'google_analytics',	''),
(58,	'ftp_upload',	'0'),
(59,	'ftp_host',	''),
(60,	'ftp_username',	''),
(61,	'ftp_password',	''),
(62,	'ftp_port',	''),
(63,	'ftp_endpoint',	''),
(64,	'app_api_id',	'5edeadeeeb254535f683d30a87ed39a6'),
(65,	'app_api_key',	'fe73cb551c9274683578a2d6b74016ae'),
(66,	'wowonder_app_ID',	''),
(67,	'wowonder_app_key',	''),
(68,	'wowonder_domain_uri',	''),
(69,	'wowonder_login',	'off'),
(70,	'last_run',	'2021-03-05'),
(71,	'config_run',	'~'),
(72,	'wowonder_domain_icon',	''),
(73,	'server_key',	'1539874186'),
(74,	'playtube_url',	'https://playtubescript.com'),
(75,	'recaptcha_site_key',	''),
(76,	'recaptcha_secret_key',	''),
(77,	'watermark',	'off'),
(78,	'watermark_link',	'media/img/icon.png'),
(79,	'mp4_links',	'on'),
(80,	'playtube_links',	'off'),
(81,	'face_filter',	'on'),
(82,	'push',	'1'),
(83,	'push_id',	''),
(84,	'push_key',	''),
(85,	'affiliate_system',	'1'),
(86,	'affiliate_type',	'1'),
(87,	'amount_ref',	'0.10'),
(88,	'amount_percent_ref',	'0'),
(89,	'currency',	'USD'),
(90,	'credit_card',	'off'),
(91,	'stripe_secret',	''),
(92,	'stripe_id',	''),
(93,	'paypal_mode',	'live'),
(94,	'paypal_id',	''),
(95,	'paypal_secret',	''),
(96,	'pro_price',	'4'),
(97,	'bank_payment',	'on'),
(98,	'bank_transfer_note',	'In order to confirm the bank transfer, you will need to upload a receipt or take a screenshot of your transfer within 1 day from your payment date. If a bank transfer is made but no receipt is uploaded within this period, your order will be cancelled. We will verify and confirm your receipt within 3 working days from the date you upload it.'),
(99,	'pro_system',	'off'),
(100,	'boosted_posts',	'4'),
(101,	'ad_c_price',	'0.05'),
(102,	'ad_v_price',	'0.01'),
(103,	'google_map',	'off'),
(104,	'google_map_api',	''),
(105,	'user_ads',	'on'),
(106,	'business_account',	'on'),
(107,	'withdraw_system',	'on'),
(108,	'raise_money',	'on'),
(109,	'raise_money_type',	'1'),
(110,	'version',	'1.4.1'),
(111,	'bank_description',	'<div class=\"bank_info\">\n                       <div class=\"dt_settings_header bg_gradient\">\n                           <div class=\"dt_settings_circle-1\"></div>\n                           <div class=\"dt_settings_circle-2\"></div>\n                           <div class=\"bank_info_innr\">\n                               <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path fill=\"currentColor\" d=\"M11.5,1L2,6V8H21V6M16,10V17H19V10M2,22H21V19H2M10,10V17H13V10M4,10V17H7V10H4Z\"></path></svg>\n                               <h4 class=\"bank_name\">Garanti Bank</h4>\n                               <div class=\"row\">\n                                   <div class=\"col col-md-12\">\n                                       <div class=\"bank_account\">\n                                           <p>4796824372433055</p>\n                                           <span class=\"help-block\">Account number / IBAN</span>\n                                       </div>\n                                   </div>\n                                   <div class=\"col col-md-12\">\n                                       <div class=\"bank_account_holder\">\n                                           <p>Antoian Kordiyal</p>\n                                           <span class=\"help-block\">Account name</span>\n                                       </div>\n                                   </div>\n                                   <div class=\"col col-md-6\">\n                                       <div class=\"bank_account_code\">\n                                           <p>TGBATRISXXX</p>\n                                           <span class=\"help-block\">Routing code</span>\n                                       </div>\n                                   </div>\n                                   <div class=\"col col-md-6\">\n                                       <div class=\"bank_account_country\">\n                                           <p>United States</p>\n                                           <span class=\"help-block\">Country</span>\n                                       </div>\n                                   </div>\n                               </div>\n                           </div>\n                       </div>\n                   </div>                            '),
(112,	'donate_percentage',	'1'),
(113,	'logo_extension',	'png'),
(114,	'favicon_extension',	'png'),
(115,	'clickable_url',	'on'),
(116,	'blog_system',	'on'),
(117,	'image_sell_system',	'on'),
(118,	'min_image_height',	'768'),
(119,	'min_image_width',	'1024'),
(120,	'watermark_anchor',	'top center'),
(121,	'watermark_opacity',	'0.5'),
(122,	'site_display_mode',	'night'),
(123,	'specific_email_signup',	''),
(124,	'subscription_on_signup',	'off'),
(125,	'free_user_storage_limit',	'0'),
(126,	'allow_user_create_blog',	'off'),
(127,	'digital_ocean',	'0'),
(128,	'digital_ocean_key',	''),
(129,	'digital_ocean_s_key',	''),
(130,	'digital_ocean_region',	'nyc3'),
(131,	'digital_ocean_space_name',	''),
(132,	'google_cloud_storage',	'0'),
(133,	'google_cloud_storage_service_account',	''),
(134,	'google_cloud_storage_bucket_name',	''),
(135,	'paysera',	'off'),
(136,	'paysera_project_id',	''),
(137,	'paysera_password',	''),
(138,	'paysera_test_mode',	''),
(139,	'paystack',	'off'),
(140,	'paystack_secret_key',	''),
(141,	'paystack_public_key',	''),
(142,	'razorpay',	'off'),
(143,	'razorpay_key',	''),
(144,	'razorpay_secret',	''),
(145,	'video_chat',	'1'),
(146,	'audio_chat',	'1'),
(147,	'video_accountSid',	''),
(148,	'video_apiKeySid',	''),
(149,	'video_apiKeySecret',	''),
(150,	'share_system',	'on');


-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_connectivities`;

CREATE TABLE `pxp_connectivities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `follower_id` int(25) NOT NULL DEFAULT 0,
  `following_id` int(25) NOT NULL DEFAULT 0,
  `active` int(5) NOT NULL DEFAULT 1,
  `type` int(11) NOT NULL DEFAULT 1,
  `time` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `follower_id` (`follower_id`),
  KEY `following_id` (`following_id`),
  KEY `active` (`active`),
  CONSTRAINT `pxp_connectivities_ibfk_1` FOREIGN KEY (`follower_id`) REFERENCES `pxp_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `pxp_connectivities_ibfk_2` FOREIGN KEY (`following_id`) REFERENCES `pxp_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

INSERT INTO `pxp_connectivities` (`id`, `follower_id`, `following_id`, `active`, `type`, `time`) VALUES
(1,	3,	2,	1,	1,	'1614720826'),
(2,	3,	1,	1,	1,	'1614720826'),
(3,	2,	3,	1,	1,	'1614720921'),
(4,	2,	1,	1,	1,	'1614720921'),
(5,	1,	3,	1,	1,	'1614723563'),
(6,	1,	2,	1,	1,	'1614723564'),
(7,	4,	3,	1,	1,	'1614724260'),
(8,	4,	2,	1,	1,	'1614724260'),
(9,	4,	1,	1,	1,	'1614724260'),
(10,	1,	4,	1,	1,	'1614729453'),
(11,	3,	4,	1,	1,	'1614732088'),
(12,	5,	4,	1,	1,	'1614741198'),
(13,	5,	3,	1,	1,	'1614741198'),
(14,	5,	2,	1,	1,	'1614741198'),
(15,	5,	1,	1,	1,	'1614741198'),
(16,	3,	5,	1,	1,	'1614742364'),
(17,	6,	3,	1,	1,	'1614742843'),
(18,	3,	6,	1,	1,	'1614743319'),
(19,	1,	6,	1,	1,	'1614743451'),
(20,	7,	6,	1,	1,	'1614744347'),
(21,	7,	5,	1,	1,	'1614744347'),
(22,	7,	4,	1,	1,	'1614744347'),
(23,	7,	3,	1,	1,	'1614744347'),
(24,	7,	2,	1,	1,	'1614744347'),
(25,	7,	1,	1,	1,	'1614744347'),
(26,	3,	7,	1,	1,	'1614745477'),
(27,	8,	7,	1,	1,	'1614745925'),
(28,	8,	6,	1,	1,	'1614745925'),
(29,	8,	5,	1,	1,	'1614745925'),
(30,	8,	4,	1,	1,	'1614745925'),
(31,	8,	3,	1,	1,	'1614745925'),
(32,	8,	2,	1,	1,	'1614745925'),
(33,	8,	1,	1,	1,	'1614745925'),
(34,	9,	2,	1,	1,	'1614746225'),
(35,	9,	3,	1,	1,	'1614746285'),
(36,	9,	1,	1,	1,	'1614746286'),
(37,	9,	5,	1,	1,	'1614746296'),
(38,	3,	9,	1,	1,	'1614746741'),
(39,	11,	2,	1,	1,	'1614758370'),
(40,	11,	1,	1,	1,	'1614758376'),
(41,	11,	3,	1,	1,	'1614758582'),
(42,	11,	5,	1,	1,	'1614758624'),
(43,	11,	4,	1,	1,	'1614758982'),
(44,	10,	9,	1,	1,	'1614759209'),
(45,	10,	8,	1,	1,	'1614759210'),
(46,	10,	7,	1,	1,	'1614759211'),
(47,	10,	6,	1,	1,	'1614759213'),
(48,	10,	5,	1,	1,	'1614759213'),
(49,	10,	3,	1,	1,	'1614759214'),
(50,	10,	4,	1,	1,	'1614759216'),
(51,	10,	2,	1,	1,	'1614759218'),
(52,	10,	1,	1,	1,	'1614759221'),
(53,	3,	11,	1,	1,	'1614775643'),
(54,	3,	10,	1,	1,	'1614775666'),
(55,	3,	8,	1,	1,	'1614775919'),
(56,	5,	9,	1,	1,	'1614818888'),
(57,	5,	11,	1,	1,	'1614818900'),
(58,	5,	8,	1,	1,	'1614818910'),
(59,	5,	7,	1,	1,	'1614818929'),
(60,	1,	7,	1,	1,	'1614819038'),
(61,	5,	10,	1,	1,	'1614819112'),
(62,	1,	11,	1,	1,	'1614819210'),
(63,	1,	10,	1,	1,	'1614819211'),
(64,	1,	5,	1,	1,	'1614819236'),
(65,	1,	9,	1,	1,	'1614819281'),
(66,	1,	8,	1,	1,	'1614819281');


-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_fund_reports`;

CREATE TABLE `pxp_fund_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fund_id` int(30) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `text` varchar(1000) NOT NULL DEFAULT '',
  `time` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `post_id` (`fund_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `pxp_fund_reports_ibfk_1` FOREIGN KEY (`fund_id`) REFERENCES `pxp_funding` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `pxp_fund_reports_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `pxp_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_funding`;

CREATE TABLE `pxp_funding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hashed_id` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(600) NOT NULL DEFAULT '',
  `amount` varchar(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `image` varchar(200) NOT NULL DEFAULT '',
  `time` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `hashed_id` (`hashed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_funding_raise`;

CREATE TABLE `pxp_funding_raise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funding_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `amount` varchar(11) NOT NULL DEFAULT '0',
  `time` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `funding_id` (`funding_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_hashtags`;

CREATE TABLE `pxp_hashtags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(35) NOT NULL DEFAULT '',
  `tag` varchar(200) NOT NULL DEFAULT '',
  `last_trend_time` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`),
  KEY `tag` (`tag`),
  KEY `last_trend_time` (`last_trend_time`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `pxp_hashtags` (`id`, `hash`, `tag`, `last_trend_time`) VALUES
(1,	'1d757fed22a1e8e32b7e5f38ac00b40c',	'039;s',	'1614722740'),
(2,	'55950ce9d52beeb9bf97215fb41390f0',	'bougee',	'1614746420'),
(3,	'f15a63320437e86ee5e4315657b0bee0',	'039;',	'1614749149');


-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_langs`;

CREATE TABLE `pxp_langs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(200) CHARACTER SET utf8mb4 DEFAULT '',
  `lang_key` varchar(160) DEFAULT NULL,
  `english` text DEFAULT NULL,
  `arabic` text DEFAULT NULL,
  `dutch` text DEFAULT NULL,
  `french` text DEFAULT NULL,
  `german` text DEFAULT NULL,
  `russian` text DEFAULT NULL,
  `spanish` text DEFAULT NULL,
  `turkish` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=572 DEFAULT CHARSET=utf8;

INSERT INTO `pxp_langs` (`id`, `ref`, `lang_key`, `english`, `arabic`, `dutch`, `french`, `german`, `russian`, `spanish`, `turkish`) VALUES
(1,	'',	'uname_or_email',	'Username or E-mail',	'اسم المستخدم أو البريد الالكتروني',	'Gebruikersnaam of email',	'Nom dutilisateur ou email',	'Benutzername oder E-Mail-Adresse',	'Имя пользователя или адрес электронной почты',	'Nombre de usuario o correo electrónico',	'Kullanıcı adı ya da email'),
(2,	'',	'ur_password',	'Your Password',	'كلمة السر خاصتك',	'Je wachtwoord',	'Votre mot de passe',	'Ihr Passwort',	'Ваш пароль',	'Tu contraseña',	'Şifreniz'),
(3,	'',	'forgot_ur_passwd',	'Forgot your password?',	'نسيت رقمك السري؟',	'Je wachtwoord vergeten?',	'Mot de passe oublié?',	'Haben Sie Ihr Passwort vergessen?',	'Забыли пароль?',	'¿Olvidaste tu contraseña?',	'Parolanızı mı unuttunuz?'),
(4,	'',	'login',	'Login',	'تسجيل الدخول',	'Log in',	'Sidentifier',	'Anmeldung',	'Авторизоваться',	'Iniciar sesión',	'Oturum aç'),
(5,	'',	'new_here',	'New here?',	'جديد هنا؟',	'Nieuw hier?',	'Nouveau ici?',	'Neu hier?',	'Новенький тут?',	'¿Nuevo aquí?',	'Burada yeni?'),
(6,	'',	'signup_now',	'Sign up now!',	'أفتح حساب الأن!',	'Meld je nu aan!',	'Sinscrire maintenant!',	'Jetzt registrieren!',	'Зарегистрироваться сейчас!',	'¡Regístrate ahora!',	'Şimdi kayıt ol!'),
(7,	'',	'enter_ur_n_and_p',	'Please enter your username and password!',	'الرجاء إدخال اسم المستخدم وكلمة المرور الخاصة بك!',	'Voer je gebruikersnaam en wachtwoord in!',	'Veuillez sil vous plaît entrer votre nom dutilisateur et votre mot de passe!',	'Bitte gib deinen Benutzernamen und dein Passwort ein!',	'Пожалуйста введите свой логин и пароль!',	'¡Porfavor introduzca su nombre de usuario y contraseña!',	'Lütfen kullanıcı adınızı ve şifrenizi giriniz!'),
(8,	'',	'invalid_un_or_passwd',	'Invalid username or password!',	'خطأ في اسم المستخدم أو كلمة مرور!',	'Ongeldige gebruikersnaam of wachtwoord!',	'Nom dutilisateur ou mot de passe invalide!',	'Ungültiger Benutzername oder Passwort!',	'Неправильное имя пользователя или пароль!',	'¡Usuario o contraseña invalido!',	'Geçersiz kullanıcı adı veya şifre!'),
(9,	'',	'email_addr',	'E-mail address',	'عنوان البريد الإلكتروني',	'E-mailadres',	'Adresse e-mail',	'E-Mail-Addresse',	'Адрес электронной почты',	'Dirección de correo electrónico',	'E'),
(10,	'',	'username',	'Username',	'اسم المستخدم',	'Gebruikersnaam',	'Nom dutilisateur',	'Nutzername',	'имя пользователя',	'Nombre de usuario',	'Kullanıcı adı'),
(11,	'',	'password',	'Password',	'كلمه السر',	'Wachtwoord',	'Mot de passe',	'Passwort',	'пароль',	'Contraseña',	'Parola'),
(12,	'',	'confirm_passwd',	'Confirm Password',	'تأكيد كلمة المرور',	'bevestig wachtwoord',	'Confirmez le mot de passe',	'Bestätige das Passwort',	'Подтвердите Пароль',	'Confirmar contraseña',	'Şifreyi Onayla'),
(13,	'',	'male',	'Male',	'الذكر',	'Mannetje',	'Mâle',	'Männlich',	'мужчина',	'Masculino',	'Erkek'),
(14,	'',	'female',	'Female',	'إناثا',	'Vrouw',	'Femelle',	'Weiblich',	'женский',	'Hembra',	'Kadın'),
(15,	'',	'signup',	'Sign up',	'سجل',	'Aanmelden',	'Sinscrire',	'Anmelden',	'зарегистрироваться',	'Regístrate',	'Kaydol'),
(16,	'',	'please_fill_fields',	'Please fill in all required fields',	'يرجى ملء جميع الحقول المطلوبة',	'Vul alle verplichte velden in',	'Veuillez remplir tous les champs requis',	'Bitte füllen Sie alle geforderten Felder aus',	'Пожалуйста, заполните все обязательные поля',	'Por favor, rellene todos los campos obligatorios',	'Lütfen tüm zorunlu alanları doldurun'),
(17,	'',	'username_is_taken',	'That username is already taken',	'هذا الاسم مستخدم من قبل',	'Die gebruikersnaam is al in gebruik',	'Ce nom dutilisateur est déjà pris',	'Dieser Benutzername ist bereits vergeben',	'Имя пользователя уже используется',	'Ese nombre de usuario ya se encuentra en uso',	'Bu kullanıcı adı önceden alınmış'),
(18,	'',	'email_exists',	'That email already exists',	'هذا البريد الإلكتروني موجود بالفعل',	'Die e-mail bestaat al',	'Cet email existe déjà',	'Diese E-Mail ist bereits vorhanden',	'Это письмо уже существует',	'Ese correo electrónico ya existe',	'Bu e-posta zaten mevcut'),
(19,	'',	'username_characters_length',	'Username must be between 4 and 16 characters',	'يجب أن يكون اسم المستخدم بين 4 و 16 حرفًا',	'Gebruikersnaam moet tussen 4 en 16 tekens lang zijn',	'Le nom dutilisateur doit comporter entre 4 et 16 caractères',	'Der Benutzername muss zwischen 4 und 16 Zeichen lang sein',	'Имя пользователя должно быть от 4 до 16 символов.',	'El nombre de usuario debe tener entre 4 y 16 caracteres',	'Kullanıcı adı 4 ile 16 karakter arasında olmalıdır'),
(20,	'',	'username_invalid_characters',	'Username contains invalid characters',	'اسم المستخدم فيه أحرف غير صالحة',	'Gebruikersnaam bevat ongeldige tekens',	'Nom dutilisateur contient des caractères non valides',	'Benutzername beinhaltet ungültige Zeichen',	'Имя пользователя содержит недопустимые символы',	'Nombre de usuario contiene caracteres inválidos',	'Kullanıcı adı geçersiz karakterler içeriyor'),
(21,	'',	'email_invalid_characters',	'E-mail contains invalid characters',	'يحتوي البريد الإلكتروني على أحرف غير صالحة',	'E-mail bevat ongeldige tekens',	'E-mail contient des caractères non valides',	'E-Mail enthält ungültige Zeichen',	'E-mail содержит недопустимые символы',	'El correo electrónico contiene caracteres no válidos',	'E-posta geçersiz karakterler içeriyor'),
(22,	'',	'password_not_match',	'Password does not match',	'كلمة السر غير متطابقة',	'Wachtwoord komt niet overeen',	'Le mot de passe ne correspond pas',	'Passwort stimmt nicht überein',	'Пароль не подходит',	'Las contraseñas no coinciden',	'Parola eşleşmiyor'),
(23,	'',	'password_is_short',	'Password is too short',	'كلمة المرور قصيرة جدا',	'Wachtwoord is te kort',	'Le mot de passe est trop court',	'Das Passwort ist zu kurz',	'Пароль слишком короткий',	'La contraseña es demasiado corta',	'Şifre çok kısa'),
(24,	'',	'successfully_joined_desc',	'You have successfully joined. Please wait..',	'لقد انضممت بنجاح. أرجو الإنتظار..',	'Je bent succesvol toegetreden. Even geduld aub..',	'Vous avez rejoint avec succès. Sil vous plaît, attendez..',	'Sie sind erfolgreich beigetreten. Warten Sie mal..',	'Вы успешно присоединились. Пожалуйста, подождите..',	'Te has unido exitosamente Por favor espera..',	'Başarıyla katıldı. Lütfen bekle..'),
(25,	'',	'notifications',	'Notifications',	'إخطارات',	'meldingen',	'Notifications',	'Benachrichtigungen',	'Уведомления',	'Notificaciones',	'Bildirimler'),
(26,	'',	'search',	'Search',	'بحث',	'Zoeken',	'Chercher',	'Suche',	'Поиск',	'Buscar',	'Arama'),
(27,	'',	'u_dont_have_notif',	'You do not have any notifications',	'ليس لديك أي إخطارات',	'Je hebt geen meldingen',	'Vous navez aucune notification',	'Sie haben keine Benachrichtigungen',	'У вас нет уведомлений',	'Usted no tiene ninguna notificación',	'Bildiriminiz yok'),
(28,	'',	'featured_posts',	'Featured posts',	'المشاركات مميزة',	'Aanbevolen berichten',	'Postes en vedette',	'Beliebte Beiträge',	'Популярные сообщения',	'Publicaciones destacadas',	'Öne çıkan gönderiler'),
(29,	'',	'stories',	'Stories',	'قصص',	'verhalen',	'Histoires',	'Geschichten',	'Истории',	'Cuentos',	'Hikayeler'),
(30,	'',	'stories_from_people',	'Here are stories from people you follow.',	'سوف تكون هناك قصص من أشخاص تتابعهم.',	'Hier zullen verhalen zijn van mensen die je volgt.',	'Voici des histoires de personnes que vous suivez.',	'Hier werden Geschichten von Leuten sein, denen du folgst.',	'Здесь будут рассказы от людей, которых вы придерживаетесь.',	'Aquí habrá historias de personas a las que sigues.',	'İzlediğiniz kişilerin hikayeleri burada olacak.'),
(31,	'',	'terms',	'Terms',	'شروط',	'Voorwaarden',	'termes',	'Begriffe',	'сроки',	'Condiciones',	'şartlar'),
(32,	'',	'privacy_and_policy',	'Privacy & Policy',	'الخصوصية & amp؛ سياسات',	'Privacy & amp; Het beleid',	'Confidentialité et ampère Politique',	'Datenschutz & amp; Politik',	'Конфиденциальность и amp; политика',	'Privacidad y amp; Política',	'Gizlilik ve amp; Politika'),
(33,	'',	'language',	'Language',	'لغة',	'Taal',	'La langue',	'Sprache',	'язык',	'Idioma',	'Dil'),
(34,	'',	'about',	'About',	'حول',	'Over',	'Sur',	'Über',	'Около',	'Acerca de',	'hakkında'),
(35,	'',	'select_file',	'Select File',	'حدد ملف',	'Selecteer bestand',	'Choisir le dossier',	'Datei aussuchen',	'Выберите файл',	'Seleccione Archivo',	'Dosya Seç'),
(36,	'',	'choose_up210img',	'Choose up to 10 images',	'اختر حتى 10 صور',	'Kies maximaal 10 afbeeldingen',	'Choisissez jusquà 10 images',	'Wählen Sie bis zu 10 Bilder',	'Выберите до 10 изображений',	'Elige hasta 10 imágenes',	'En fazla 10 görüntü seçin'),
(37,	'',	'add_post_caption',	'Add post caption, #hashtag, or @mention?',	'إضافة تعليق آخر ، #hashtag ..mention؟',	'Ondertiteling toevoegen, #hashtag .. @mention?',	'Ajouter une légende de message, #hashtag .. @mention?',	'Fügen Sie die Untertitel, #hashtag .. @mention hinzu?',	'Добавить подпись, #hashtag .. @mention?',	'Agregar título de publicación, #hashtag .. @mention?',	'Gönderi ekle, #hashtag .. @mention?'),
(38,	'',	'publish',	'Publish',	'نشر',	'Publiceren',	'Publier',	'Veröffentlichen',	'Публиковать',	'Publicar',	'Yayınla'),
(39,	'',	'close',	'Close',	'قريب',	'Dichtbij',	'Fermer',	'Schließen',	'Закрыть',	'Cerca',	'Kapat'),
(40,	'',	'do_not_attach',	'Do not attach',	'لا ترفق',	'Niet bevestigen',	'Nattachez pas',	'Nicht anhängen',	'Не прикреплять',	'No adjuntar',	'Ekleme'),
(41,	'',	'unknown_error',	'An unknown error occurred. Please try again later!',	'حدث خطأ غير معروف. الرجاء معاودة المحاولة في وقت لاحق!',	'Een onbekende fout is opgetreden. Probeer het later opnieuw!',	'Une erreur inconnue est survenue. Veuillez réessayer plus tard!',	'Ein unbekannter Fehler ist aufgetreten. Bitte versuchen Sie es später erneut!',	'Произошла неизвестная ошибка. Пожалуйста, повторите попытку позже!',	'Un error desconocido ocurrió. ¡Por favor, inténtelo de nuevo más tarde!',	'Bilinmeyen bir hata oluştu. Lütfen daha sonra tekrar deneyiniz!'),
(42,	'',	'max_upload_limit',	'Your post exceeds the maximum upload size for this site. Maximum upload size: {{size}}',	'تتجاوز مشاركتك الحد الأقصى لحجم التحميل لهذا الموقع. الحد الأقصى لحجم التحميل: {{size}}',	'Je bericht overschrijdt de maximale uploadgrootte voor deze site. Maximale uploadgrootte: {{size}}',	'Votre message dépasse la taille de téléchargement maximale pour ce site. Taille de téléchargement maximale: {{size}}',	'Dein Beitrag überschreitet die maximale Uploadgröße für diese Website. Maximale Uploadgröße: {{size}}',	'Ваше сообщение превышает максимальный размер загрузки для этого сайта. Максимальный размер загружаемого файла: {{size}}',	'Su publicación excede el tamaño máximo de carga para este sitio. Tamaño máximo de carga: {{size}}',	'Yayınınız bu sitenin maksimum yükleme boyutunu aşıyor. Maksimum yükleme boyutu: {{size}}'),
(43,	'',	'post_published',	'Your post has been published successfully',	'تم نشر مشاركتك بنجاح',	'Uw bericht is met succes gepubliceerd',	'Votre message a été publié avec succès',	'Dein Beitrag wurde erfolgreich veröffentlicht',	'Ваше сообщение успешно опубликовано',	'Tu publicación ha sido publicada con éxito',	'Yayınınız başarıyla yayınlandı'),
(44,	'',	'no_file_choosen',	'No file choosen',	'لم يتم اختيار ملف',	'Geen bestand gekozen',	'Aucun fichier choisi',	'Keine Datei ausgewählt',	'Файл не выбран',	'Sin archivo elegido',	'Hiçbir dosya seçilmedi'),
(45,	'',	'search_gifs',	'Search for gifs..',	'ابحث عن صور ..',	'Zoeken naar gifs ..',	'Rechercher des gifs ..',	'Nach Gifs suchen ..',	'Поиск gifs ..',	'Buscar gifs ...',	'Gifleri Arayın ..'),
(46,	'',	'delete_post',	'Delete post',	'حذف آخر',	'Verwijder gepost bericht',	'Supprimer le message',	'Beitrag entfernen',	'Удалить сообщение',	'Eliminar mensaje',	'Gönderiyi sil'),
(47,	'',	'edit_post',	'Edit post',	'تعديل المنشور',	'Bericht bewerken',	'Modifier le post',	'Beitrag bearbeiten',	'Редактировать сообщение',	'Editar post',	'Gönderiyi düzenle'),
(48,	'',	'report_post',	'Report this post',	'أبلغ عن هذا المنصب',	'Meld deze post',	'Signaler ce message',	'Diesen Post melden',	'Сообщить об этом сообщении',	'Reportar esta publicación',	'Bu gönderiyi şikayet et'),
(49,	'',	'cancel_report',	'Cancel report',	'إلغاء التقرير',	'Annuleer rapport',	'Annuler le rapport',	'Bericht abbrechen',	'Отменить отчет',	'Cancelar informe',	'Raporu iptal et'),
(50,	'',	'go2post',	'Go to post',	'الذهاب إلى آخر',	'Ga naar bericht',	'Aller à la publication',	'Gehe zum Post',	'Перейти к сообщению',	'Ir a la publicación',	'Gönderiye git'),
(51,	'',	'likes',	'Likes',	'الإعجابات',	'sympathieën',	'Aime',	'Likes',	'Нравится',	'Gustos',	'Seviyor'),
(52,	'',	'comments',	'Comments',	'تعليقات',	'Comments',	'commentaires',	'Bemerkungen',	'Комментарии',	'Comentarios',	'Yorumlar'),
(53,	'',	'write_comment',	'Write a comment',	'أكتب تعليقا',	'Schrijf een reactie',	'Écrire un commentaire',	'Schreibe einen Kommentar',	'Написать комментарий',	'Escribir un comentario',	'Bir yorum Yaz'),
(54,	'',	'follow_suggestions',	'Suggestions For You',	'اقتراحات لك',	'Suggesties voor jou',	'Des suggestions pour vous',	'Vorschläge für dich',	'Предложения для вас',	'Sugerencias para ti',	'Sizin için öneriler'),
(55,	'',	'see_all',	'See all',	'اظهار الكل',	'Alles zien',	'Voir tout',	'Alles sehen',	'Увидеть все',	'Ver todo',	'Hepsini gör'),
(56,	'',	'follow',	'Follow',	'إتبع',	'Volgen',	'Suivre',	'Folgen',	'следить',	'Seguir',	'Takip et'),
(57,	'',	'following',	'Following',	'التالية',	'Als vervolg op',	'Suivant',	'Folgend',	'Следующий',	'Siguiendo',	'Takip etme'),
(58,	'',	'suggested_people',	'Suggested people to follow',	'اقترح على الناس لمتابعة',	'Voorgestelde mensen om te volgen',	'Suggestions de personnes à suivre',	'Vorschläge für weitere Personen',	'Рекомендуемые люди',	'Gente sugerida a seguir',	'Önerilen kişiler takip edecek'),
(59,	'',	'last_seen',	'Last seen',	'اخر ظهور',	'Laatst gezien',	'Dernière vue',	'Zuletzt gesehen',	'Последние просмотренные',	'Ultima vez visto',	'Son görülen'),
(60,	'',	'followers',	'Followers',	'متابعون',	'Volgers',	'Suiveurs',	'Anhänger',	'Читают',	'Seguidores',	'İzleyiciler'),
(61,	'',	'posts',	'Posts',	'المشاركات',	'berichten',	'Des postes',	'Beiträge',	'Сообщений',	'Publicaciones',	'Mesajlar'),
(62,	'',	'save_post',	'Save posts',	'حفظ المشاركات',	'Bewaar berichten',	'Enregistrer les messages',	'Beiträge speichern',	'Сохранить записи',	'Guardar publicaciones',	'Gönderiyi kaydet'),
(63,	'',	'unsave_post',	'Unsave posts',	'جارٍ حفظ المشاركات',	'Posten herstellen',	'Posts Unsave',	'Beiträge werden nicht gespeichert',	'Небезопасные сообщения',	'Publicaciones no guardadas',	'Gönderimsiz yayınlar'),
(64,	'',	'confirm_del_post',	'Are you sure you want to delete this post? This action can not be undone.',	'هل أنت متأكد أنك تريد حذف هذه المشاركة؟ هذا الإجراء لا يمكن التراجع',	'Weet je zeker dat je dit bericht wilt verwijderen? deze actie kan niet ongedaan worden gemaakt',	'Es-tu sur de vouloir supprimer cette annonce? cette action ne peut pas être annulée',	'Möchten Sie diesen Beitrag wirklich löschen? Diese Aktion kann nicht rückgängig gemacht werden',	'Вы уверены, что хотите удалить эту запись? это действие не может быть отменено',	'¿Seguro que quieres eliminar esta publicación? esta acción no puede deshacerse',	'Bu gönderiyi silmek istediğinizden emin misiniz? bu işlem geri alınamaz'),
(65,	'',	'cancel',	'Cancel',	'إلغاء',	'Annuleer',	'Annuler',	'Stornieren',	'Отмена',	'Cancelar',	'İptal etmek'),
(66,	'',	'ok',	'Okey',	'حسنا',	'in orde',	'Bien',	'Okey',	'исправный',	'Bueno',	'tamam mı'),
(67,	'',	'delete_comment',	'Delete comment',	'حذف تعليق',	'Reactie verwijderen',	'Supprimer le commentaire',	'Kommentar löschen',	'Удалить комментарий',	'Eliminar comentario',	'Yorumu sil'),
(68,	'',	'confirm_del_comment',	'Are you sure you want to delete this comment?',	'هل أنت متأكد أنك تريد حذف هذا التعليق؟',	'Weet je zeker dat je deze reactie wilt verwijderen?',	'êtes-vous sûr de vouloir supprimer ce commentaire?',	'Möchtest du diesen Kommentar wirklich löschen?',	'Вы уверенны, что хотите удалить этот комментарий?',	'¿Seguro que quieres eliminar este comentario?',	'Bu yorumu silmek istediğinizden emin misiniz?'),
(69,	'',	'post_added2fav',	'Post added to your favourites list',	'إضافة إلى قائمة المفضلة لديك',	'Post toegevoegd aan uw favorietenlijst',	'Message ajouté à votre liste de favoris',	'Beitrag wurde zu Ihrer Favoritenliste hinzugefügt',	'Сообщение добавлено в ваш список избранных',	'Mensaje agregado a tu lista de favoritos',	'Gönderi favori listenize eklendi'),
(70,	'',	'post_rem_from_fav',	'Post removed from your favourites list',	'تمت إزالة المشاركة من قائمة المفضلة لديك',	'Post verwijderd van uw favorietenlijst',	'Message retiré de votre liste de favoris',	'Beitrag wurde aus Ihrer Favoritenliste entfernt',	'Сообщение удалено из списка избранных',	'Mensaje eliminado de tu lista de favoritos',	'Gönderi favori listenizden kaldırıldı'),
(71,	'',	'report_sent',	'Your report has been sent!',	'تم إرسال تقريرك',	'Uw rapport is verzonden!',	'Votre rapport a été envoyé!',	'Ihr Bericht wurde gesendet!',	'Ваш отчет отправлен!',	'¡Tu reporte ha sido enviado!',	'Raporunuz gönderildi!'),
(72,	'',	'report_canceled',	'Your report has been canceled!',	'لقد تم إلغاء تقريرك!',	'Uw rapport is geannuleerd!',	'Votre rapport a été annulé!',	'Ihr Bericht wurde storniert!',	'Ваш отчет отменен!',	'¡Su informe ha sido cancelado!',	'Raporunuz iptal edildi!'),
(73,	'',	'changes_saved',	'Your changes has been successfully saved!',	'تم حفظ تغييراتك بنجاح!',	'Uw wijzigingen zijn succesvol opgeslagen!',	'Vos modifications ont été enregistrées avec succès!',	'Ihre Änderungen wurden erfolgreich gespeichert!',	'Ваши изменения были успешно сохранены!',	'¡Tus cambios se han guardado con éxito!',	'Değişiklikleriniz başarıyla kaydedildi!'),
(74,	'',	'explore_posts',	'Explore posts',	'استكشاف المشاركات',	'Verken berichten',	'Explorez les posts',	'Erkunden Sie Beiträge',	'Исследуйте сообщения',	'Explorar publicaciones',	'Mesajları keşfedin'),
(75,	'',	'explore_posts_desc',	'Explore {{site_name}} photos and videos',	'استكشف {{site_name}} الصور ومقاطع الفيديو',	'Verken {{site_name}} fotos en videos',	'Explorer les {{site_name}} photos et vidéos',	'Erkunden Sie {{site_name}} Fotos und Videos',	'Исследуйте {{site_name}} фотографии и видеоролики',	'Explore {{site_name}} fotos y videos',	'Fotoğrafları ve videoları {{site_name}} keşfedin'),
(76,	'',	'messages',	'Messages',	'رسائل',	'berichten',	'messages',	'Mitteilungen',	'Сообщения',	'Mensajes',	'Mesajlar'),
(77,	'',	'type_message',	'Type a message and hit Enter',	'اكتب رسالة واضغط على Enter',	'Typ een bericht en druk op Enter',	'Tapez un message et appuyez sur Entrée',	'Geben Sie eine Nachricht ein und drücken Sie die Eingabetaste',	'Введите сообщение и нажмите Enter.',	'Escriba un mensaje y presione Enter',	'Bir mesaj yazıp Enter tuşuna basın'),
(78,	'',	'select_chat',	'Please select a chat to start messaging',	'يرجى تحديد دردشة لبدء المراسلة',	'Selecteer een chat om berichten te verzenden',	'Veuillez sélectionner une conversation pour démarrer la messagerie',	'Bitte wähle einen Chat um die Nachrichten zu starten',	'Выберите чат, чтобы начать обмен сообщениями',	'Seleccione un chat para comenzar a enviar mensajes',	'Lütfen mesajlaşmaya başlamak için bir sohbet seçin'),
(79,	'',	'clear_messages',	'Clear messages',	'مسح الرسائل',	'Duidelijke berichten',	'Effacer les messages',	'Nachrichten löschen',	'Очистить сообщения',	'Borrar mensajes',	'Mesajları temizle'),
(80,	'',	'confirm_clear_messages',	'Are you sure you want to delete this conversation?',	'هل أنت متأكد من أنك تريد حذف هذه المحادثة؟',	'Weet je zeker dat je dit gesprek wilt verwijderen?',	'Êtes-vous sûr de vouloir supprimer cette conversation?',	'Möchten Sie diese Unterhaltung wirklich löschen?',	'Вы действительно хотите удалить этот разговор?',	'¿Seguro que quieres eliminar esta conversación?',	'Bu sohbeti silmek istediğinizden emin misiniz?'),
(81,	'',	'conversation_deleted',	'Conversation has been deleted succesfully!',	'تم حذف المحادثة بنجاح!',	'Gesprek is succesvol verwijderd!',	'La conversation a été supprimée avec succès!',	'Konversation wurde erfolgreich gelöscht!',	'Разговор удалён успешно!',	'¡La conversación ha sido eliminada exitosamente!',	'Konuşma başarıyla silindi!'),
(82,	'',	'delete_chat',	'Delete chat',	'حذف الدردشة',	'Verwijder chat',	'Supprimer le chat',	'Chat löschen',	'Удалить чат',	'Eliminar chat',	'Sohbeti sil'),
(83,	'',	'privacy_settings',	'Privacy settings',	'إعدادات الخصوصية',	'Privacy instellingen',	'Paramètres de confidentialité',	'Datenschutzeinstellungen',	'Настройки конфиденциальности',	'La configuración de privacidad',	'Gizlilik ayarları'),
(84,	'',	'confirm_del_chat',	'Are you sure you want to delete this chat? All conversation will be deleted.',	'هل أنت متأكد من أنك تريد حذف هذه الدردشة؟ سيتم حذف كل محادثتك',	'Weet je zeker dat je deze chat wilt verwijderen? al je gesprekken worden verwijderd',	'Êtes-vous sûr de vouloir supprimer ce chat? toute votre conversation sera supprimée',	'Möchtest du diesen Chat wirklich löschen? Alle Ihre Konversationen werden gelöscht',	'Вы действительно хотите удалить этот чат? весь ваш разговор будет удален',	'¿Seguro que quieres eliminar este chat? toda tu conversación será eliminada',	'Bu sohbeti silmek istediğinizden emin misiniz? tüm konuşmalarınız silinecek'),
(85,	'',	'delete_messages',	'Delete messages',	'حذف الرسائل',	'Verwijder berichten',	'Supprimer les messages',	'Nachrichten löschen',	'Удалить сообщения',	'Eliminar mensajes',	'Mesajları sil'),
(86,	'',	'delete_selected',	'Delete selected',	'احذف المختار',	'Verwijder geselecteerde',	'Supprimer sélectionnée',	'Ausgewählte löschen',	'Удалить выбранное',	'Eliminar seleccionado',	'Silme seçildi'),
(87,	'',	'confirm_del_messages',	'Are you sure you want to delete this messages? confirm to continue',	'هل أنت متأكد أنك تريد حذف هذه الرسائل؟ تأكيد للمتابعة',	'Weet je zeker dat je deze berichten wilt verwijderen? bevestigen om door te gaan',	'Êtes-vous sûr de vouloir supprimer ce message? confirmer pour continuer',	'Möchten Sie diese Nachrichten wirklich löschen? Bestätigen Sie, um fortzufahren',	'Вы действительно хотите удалить это сообщение? подтвердить, чтобы продолжить',	'¿Seguro que quieres borrar estos mensajes? confirmar para continuar',	'Bu mesajları silmek istediğinizden emin misiniz? devam etmek için onaylayın'),
(88,	'',	'profile_settings',	'Profile settings',	'إعدادات الملف الشخصي',	'Profielinstellingen',	'Paramètres de profil',	'Profileinstellungen',	'Настройки профиля',	'Configuración de perfil',	'Profil ayarları'),
(89,	'',	'unblock',	'Unblock',	'رفع الحظر',	'deblokkeren',	'Débloquer',	'Entsperren',	'открыть',	'Desatascar',	'engeli kaldırmak'),
(90,	'',	'favourites',	'Favourites',	'المفضلة',	'favorieten',	'Favoris',	'Favoriten',	'Избранные',	'Favoritos',	'Favoriler'),
(91,	'',	'message',	'Message',	'رسالة',	'Bericht',	'Message',	'Botschaft',	'Сообщение',	'Mensaje',	'Mesaj'),
(92,	'',	'u_blocked_zis_usr',	'You have blocked this user',	'لقد حظرت هذا المستخدم',	'Je hebt deze gebruiker geblokkeerd',	'Vous avez bloqué cet utilisateur',	'Sie haben diesen Benutzer blockiert',	'Вы заблокировали этого пользователя',	'Has bloqueado a este usuario',	'Bu kullanıcıyı engellediniz'),
(93,	'',	'unblock2see_profile',	'Unblock to see their photos and videos.',	'يمكنك إلغاء الحظر لمشاهدة الصور ومقاطع الفيديو.',	'Deblokkeer de blokkering van hun fotos en videos.',	'Débloquer pour voir leurs photos et vidéos',	'Entsperren, um ihre Fotos und Videos zu sehen.',	'Разблокируйте, чтобы увидеть их фотографии и видео.',	'Desbloquear para ver sus fotos y videos.',	'Fotoğraflarını ve videolarını görmek için engellemeyi kaldır.'),
(94,	'',	'profile_is_private',	'This profile is private',	'هذا الملف الشخصي خاص',	'Dit profiel is privé',	'Ce profil est privé',	'Dieses Profil ist privat',	'Этот профиль закрыт',	'Este perfil es privado',	'Bu profil gizli'),
(95,	'',	'follow2see_profile',	'Follow to see their photos and videos.',	'اتبع لرؤية صورهم & amp؛ أشرطة الفيديو! ه',	'Volgen om hun fotos &  videos! e',	'Suivez pour voir leurs photos & amp; vidéos! e',	'Folgen Sie, um ihre Fotos zu sehen & amp; Videos! e',	'Следуйте за их фотографиями и amp; видео! е',	'Siga para ver sus fotos y amp; videos! e',	'Fotoğraflarını görmek için izleyin & amp; videolar! e'),
(96,	'',	'profile_privacy',	'Profile privacy',	'الملف الخصوصية',	'Profiel privacy',	'Confidentialité du profil',	'Profil Datenschutz',	'Конфиденциальность профиля',	'Privacidad del perfil',	'Profil gizliliği'),
(97,	'',	'logout',	'Logout',	'الخروج',	'Uitloggen',	'Connectez - Out',	'Ausloggen',	'Выйти',	'Cerrar sesión',	'Çıkış Yap'),
(98,	'',	'admin_panel',	'Admin panel',	'لوحة الادارة',	'Administratie Paneel',	'Panneau dadministration',	'Administrationsmenü',	'Панель администратора',	'Panel de administrador',	'Admin Paneli'),
(99,	'',	'report_user',	'Report this user',	'الإبلاغ عن هذا المستخدم',	'Rapporteer deze gebruiker',	'Signaler cet utilisateur',	'Diesen Nutzer melden',	'Сообщить об этом пользователе',	'Reportar a este usuario',	'Bu kullanıcıyı rapor et'),
(100,	'',	'block_user',	'Block this user',	'منع هذا المستخدم',	'Blokkeer deze gebruiker',	'Bloquer cet utilisateur',	'Diesen Benutzer sperren',	'Заблокировать этого пользователя',	'Bloquee este usuario',	'Bu kullanıcıyı engelle'),
(101,	'',	'unblock_user',	'Unblock this user',	'إلغاء حظر هذا المستخدم',	'Deblokkeer deze gebruiker',	'Débloquer cet utilisateur',	'Entsperren Sie diesen Benutzer',	'Разблокировать этого пользователя',	'Desbloquear a este usuario',	'Bu kullanıcının engellemesini kaldır'),
(102,	'',	'confirm_block_user',	'Are you sure you want to block this user? They will not be able to see your profile, posts or story',	'هل أنت متأكد أنك تريد حظر هذا المستخدم؟ لن يتمكنوا من رؤية ملفك الشخصي أو مشاركاتك أو قصتك',	'Weet je zeker dat je deze gebruiker wilt blokkeren? Ze kunnen je profiel, berichten of verhaal niet zien',	'Êtes vous sûr de vouloir bloquer cet utilisateur? Ils ne pourront pas voir votre profil, vos publications ou votre histoire',	'Sind Sie sicher, dass Sie diesen Benutzer blockieren möchten? Sie können Ihr Profil, Ihre Beiträge oder Ihre Geschichte nicht sehen',	'Вы действительно хотите заблокировать этого пользователя? Они не смогут видеть ваш профиль, сообщения или историю',	'¿Estás seguro de que quieres bloquear a este usuario? No podrán ver tu perfil, publicaciones o historia',	'Bu kullanıcıyı engellemek istediğinizden emin misiniz? Profilinizi, yayınlarınızı veya hikayenizi göremezler.'),
(103,	'',	'user_blocked',	'This profile has been blocked, You can unblock them anytime from their profile.',	'تم حظر هذا الملف الشخصي ، ويمكنك إلغاء حظره في أي وقت من ملفه الشخصي.',	'Dit profiel is geblokkeerd. Je kunt ze op elk gewenst moment uit hun profiel deblokkeren.',	'Ce profil a été bloqué. Vous pouvez les débloquer à tout moment depuis leur profil.',	'Dieses Profil wurde gesperrt. Sie können sie jederzeit in ihrem Profil entsperren.',	'Этот профиль заблокирован, вы можете разблокировать их в любое время из своего профиля.',	'Este perfil ha sido bloqueado, puedes desbloquearlo en cualquier momento desde su perfil.',	'Bu profil engellendi, Profillerinden istedikleri zaman engelini kaldırabilirsiniz.'),
(104,	'',	'user_unblocked',	'This profile has been unblocked, You can block them anytime from their profile.',	'تم إلغاء حظر هذا الملف الشخصي ، ويمكنك حظره في أي وقت من ملفه الشخصي.',	'Dit profiel is gedeblokkeerd, je kunt ze op elk moment uit hun profiel blokkeren.',	'Ce profil a été débloqué, vous pouvez les bloquer à tout moment depuis leur profil.',	'Dieses Profil wurde entsperrt. Sie können sie jederzeit von ihrem Profil aus blockieren.',	'Этот профиль разблокирован, вы можете заблокировать их в любое время из своего профиля.',	'Este perfil ha sido desbloqueado, puedes bloquearlos en cualquier momento desde su perfil.',	'Bu profil engellemeyi kaldırdı, dilediğiniz zaman profillerinden engelleyebilirsiniz.'),
(105,	'',	'confirm_unblock_user',	'Are you sure you want to unblock this user? They will now be able to follow you or see your posts',	'هل أنت متأكد من أنك تريد إلغاء حظر هذا المستخدم؟ سيتمكنون الآن من متابعتك أو مشاهدة مشاركاتك',	'Weet je zeker dat je deze gebruiker wilt deblokkeren? Ze kunnen je nu volgen of je berichten bekijken',	'Êtes-vous sûr de vouloir débloquer cet utilisateur? Ils seront désormais en mesure de vous suivre ou de voir vos messages',	'Möchten Sie diesen Benutzer wirklich entsperren? Sie können Ihnen jetzt folgen oder Ihre Posts sehen',	'Вы действительно хотите разблокировать этого пользователя? Теперь они смогут следить за вами или видеть ваши сообщения',	'¿Seguro que quieres desbloquear a este usuario? Ahora podrán seguirte o ver tus publicaciones',	'Bu kullanıcının engellemesini kaldırmak istediğinizden emin misiniz? Artık sizi takip edebilir veya gönderilerinizi görebilirler.'),
(106,	'',	'report_t1',	'Account hacking',	'اختراق الحساب',	'Account hacken',	'Piratage de compte',	'Konto hacken',	'Взлом учетной записи',	'Piratería de cuenta',	'Hesap kesmek'),
(107,	'',	'report_t2',	'Impersonation Accounts',	'حسابات انتحال الهوية',	'Imitatie-accounts',	'Comptes dusurpation didentité',	'Identitätswechselkonten',	'Аккаунты олицетворения',	'Cuentas de suplantación',	'Kimliğe bürünme hesapları'),
(108,	'',	'report_t3',	'Violent threats',	'تهديدات عنيفة',	'Gewelddadige bedreigingen',	'Menaces violentes',	'Gewalttätige Bedrohungen',	'Насильственные угрозы',	'Amenazas violentas',	'Şiddetli tehditler'),
(109,	'',	'report_t4',	'Sexual content',	'محتوى جنسي',	'Seksuele inhoud',	'Contenu sexuel',	'Sexueller Inhalt',	'Сексуальный контент',	'Contenido sexual',	'Cinsel içerik'),
(110,	'',	'report_t5',	'Children who have not reached the required age',	'الأطفال الذين لم يبلغوا السن المطلوبة',	'Kinderen die de vereiste leeftijd niet hebben bereikt',	'Enfants qui nont pas atteint lâge requis',	'Kinder, die das erforderliche Alter nicht erreicht haben',	'Дети, не достигшие требуемого возраста',	'Niños que no han alcanzado la edad requerida',	'Gerekli yaşta ulaşmamış çocuklar'),
(111,	'',	'report_t6',	'Accounts expressing hatred',	'حسابات تعبر عن الكراهية',	'Accounts die haat uitdrukt',	'Comptes exprimant la haine',	'Konten zum Ausdruck bringen Hass',	'Счета, выражающие ненависть',	'Cuentas que expresan odio',	'Nefreti ifade eden hesaplar'),
(112,	'',	'report_t7',	'Spam or Advertizing',	'البريد المزعج أو الإعلان',	'Spam of adverteren',	'Spam ou publicité',	'Spam oder Werbung',	'Спам или реклама',	'Spam o publicidad',	'Spam veya Reklamcılık'),
(113,	'',	'report_t8',	'Copyrighted material',	'مواد محفوظة الحقوق',	'Auteursrechtelijk beschermd materiaal',	'Matériel protégé par le droit dauteur',	'Urheberrechtlich geschütztes Material',	'Защищенный авторскими правами',	'Material con copyright',	'Telif hakkıyla korunan materyal'),
(114,	'',	'no_posted_yet',	'There are no posts yet.',	'لا توجد مشاركات حتى الآن.',	'Er zijn nog geen berichten.',	'Il ny a pas encore de publications.',	'Es gibt noch keine Beiträge.',	'Нет сообщений.',	'No hay publicaciones todavía',	'Henüz hiç ileti yok.'),
(115,	'',	'home_page',	'Home page',	'الصفحة الرئيسية',	'Startpagina',	'Page daccueil',	'Startseite',	'Главная страница',	'Página de inicio',	'Ana sayfa'),
(116,	'',	'explore_people',	'Explore people',	'استكشاف الناس',	'Verken mensen',	'Explorer les gens',	'Erkunden Sie Menschen',	'Исследуйте людей',	'Explora personas',	'İnsanları keşfedin'),
(117,	'',	'explore_tags',	'Explore tags',	'استكشاف العلامات',	'Verken tags',	'Explorer les tags',	'Tags durchsuchen',	'Исследуйте теги',	'Explore las etiquetas',	'Etiketleri keşfedin'),
(118,	'',	'general',	'General',	'جنرال لواء',	'Algemeen',	'Général',	'Allgemeines',	'Генеральная',	'General',	'Genel'),
(119,	'',	'privacy',	'Privacy',	'الإجمالية',	'Privacy',	'Intimité',	'Privatsphäre',	'Конфиденциальность',	'Intimidad',	'Gizlilik'),
(120,	'',	'blocked_users',	'Blocked users',	'مستخدمين محجوبين',	'Geblokkeerde gebruikers',	'Utilisateurs bloqués',	'Blockierte Benutzer',	'Заблокированные пользователи',	'Usuarios bloqueados',	'Engellenmiş kullanıcılar'),
(121,	'',	'delete_account',	'Delete account',	'حذف الحساب',	'Account verwijderen',	'Supprimer le compte',	'Konto löschen',	'Удалить аккаунт',	'Borrar cuenta',	'Hesabı sil'),
(122,	'',	'change_avatar',	'Change Profile Avatar',	'تغيير الملف الشخصي الصورة الرمزية',	'Profielprofiel wijzigen',	'Changer le profil Avatar',	'Profil-Avatar ändern',	'Изменить профиль Аватар',	'Cambiar perfil Avatar',	'Profili değiştir Avatar'),
(123,	'',	'fname',	'First name',	'الاسم الاول',	'Voornaam',	'Prénom',	'Vorname',	'Имя',	'Nombre de pila',	'İsim'),
(124,	'',	'lname',	'Last name',	'الكنية',	'Achternaam',	'Nom de famille',	'Familienname, Nachname',	'Фамилия',	'Apellido',	'Soyadı'),
(125,	'',	'email',	'E-mail',	'البريد الإلكتروني',	'E-mail',	'Email',	'Email',	'Эл. почта',	'Email',	'E-mail'),
(126,	'',	'gender',	'Gender',	'جنس',	'Geslacht',	'Le genre',	'Geschlecht',	'Пол',	'Género',	'Cinsiyet'),
(127,	'',	'country',	'Country',	'بلد',	'land',	'Pays',	'Land',	'Страна',	'País',	'ülke'),
(128,	'',	'user_not_exist',	'User does not exist!',	'المستخدم غير موجود!',	'Gebruiker bestaat niet!',	'Lutilisateur nexiste pas!',	'Benutzer existiert nicht!',	'Пользователь не существует!',	'¡El usuario no existe!',	'Kullanıcı yok!'),
(129,	'',	'please_check_details',	'Please check your details!',	'الرجاء مراجعة التفاصيل الخاصة بك!',	'Check alsjeblieft je gegevens!',	'Sil vous plaît vérifier vos informations!',	'Bitte überprüfe deine Details!',	'Пожалуйста, проверьте свои данные!',	'¡Por favor comprueba tus detalles!',	'Lütfen detaylarınızı kontrol edin!'),
(130,	'',	'ur_fname',	'Your first name',	'اسمك الأول',	'Jouw voornaam',	'Ton prénom',	'Ihr Vorname',	'Твое имя',	'Su nombre',	'Senin adın'),
(131,	'',	'ur_lname',	'Your last name',	'اسمك الاخير',	'Je achternaam',	'Votre nom de famille',	'Ihr Nachname',	'Ваша фамилия',	'Tu apellido',	'Soy adınız'),
(132,	'',	'ur_email',	'Your email address',	'عنوان بريدك  الإلكتروني',	'jouw e-mailadres',	'Votre adresse email',	'deine Emailadresse',	'Ваш адрес электронной почты',	'Tu correo electrónico',	'e'),
(133,	'',	'change_passwd',	'Change my password',	'تغيير كلمة المرور الخاصة بي',	'Verander mijn wachtwoord',	'Changer mon mot de passe',	'Ändere mein Passwort',	'Изменить пароль',	'Cambiar mi contraseña',	'Şifremi Değiştir'),
(134,	'',	'old_passwd',	'Old password',	'كلمة المرور القديمة',	'Oud Wachtwoord',	'Ancien mot de passe',	'Altes Passwort',	'Старый пароль',	'Contraseña anterior',	'Eski şifre'),
(135,	'',	'ur_curr_passwd',	'Your current password',	'كلمة السر الحالية الخاصة بك',	'je huidige wachtwoord',	'Votre mot de passe actuel',	'dein aktuelles Passwort',	'ваш текущий пароль',	'tu contraseña actual',	'mevcut şifreniz'),
(136,	'',	'new_passwd',	'New password',	'كلمة السر الجديدة',	'Nieuw paswoord',	'Nouveau mot de passe',	'Neues Kennwort',	'Новый пароль',	'Nueva contraseña',	'Yeni Şifre'),
(137,	'',	'ur_new_passwd',	'Your new password',	'كلمة سرك الجديدة',	'uw nieuwe wachtwoord',	'Votre nouveau mot de passe',	'Dein neues Passwort',	'ваш новый пароль',	'Tu nueva contraseña',	'Yeni parolanız'),
(138,	'',	'conf_new_passwd',	'Confirm new password',	'تأكيد كلمة المرور الجديدة',	'Bevestig nieuw wachtwoord',	'Confirmer le nouveau mot de passe',	'Bestätige neues Passwort',	'Подтвердите новый пароль',	'Confirmar nueva contraseña',	'Yeni şifreyi onayla'),
(139,	'',	'conf_ur_new_passwd',	'Confirm your new password',	'قم بتأكيد كلمة المرور الجديدة',	'Bevestig uw nieuwe wachtwoord',	'Confirmez votre nouveau mot de passe',	'Bestätigen Sie Ihr neues Passwort',	'Подтвердите свой новый пароль',	'Confirma tu nueva contraseña',	'Yeni şifrenizi onaylayın'),
(140,	'',	'save_changes',	'Save changes',	'حفظ التغييرات',	'Wijzigingen opslaan',	'Sauvegarder les modifications',	'Änderungen speichern',	'Сохранить изменения',	'Guardar cambios',	'Değişiklikleri Kaydet'),
(141,	'',	'acc_privacy_settings',	'Account privacy settings',	'إعدادات خصوصية الحساب',	'Account privacy-instellingen',	'Paramètres de confidentialité du compte',	'Konto Datenschutzeinstellungen',	'Настройки конфиденциальности учетной записи',	'Configuración de privacidad de la cuenta',	'Hesap gizliliği ayarları'),
(142,	'',	'p_privacy',	'Who can view your profile',	'من يمكنه مشاهدة ملفك الشخصي',	'Wie kan jouw profiel bekijken',	'Qui peut voir votre profil',	'Wer kann dein Profil sehen?',	'Кто может просматривать ваш профиль',	'Quién puede ver tu perfil',	'Kimler profilinizi görüntüleyebilir?'),
(143,	'',	'c_privacy',	'Who can direct message you',	'من يستطيع توجيه رسالة لك',	'Wie kan je een bericht sturen?',	'Qui peut vous adresser un message',	'Wer kann dir eine Nachricht schicken?',	'Кто может направить вам сообщение',	'Quién puede enviarte un mensaje directo',	'Mesajı kim yönlendirebilir?'),
(144,	'',	'everyone',	'Everyone',	'كل واحد',	'Iedereen',	'Toutes les personnes',	'Jeder',	'Все',	'Todo el mundo',	'Herkes'),
(145,	'',	'nobody',	'Nobody',	'لا أحد',	'Niemand',	'Personne',	'Niemand',	'Никто',	'Nadie',	'Kimse'),
(146,	'',	'people_i_follow',	'People I follow',	'الناس أتابع',	'Mensen die ik volg',	'Les gens que je suis',	'Leute, denen ich folge',	'Люди, которых я следую',	'Gente que sigo',	'Takip ettiğim kişiler'),
(147,	'',	'notif_settings',	'Notification settings',	'إعدادات الإشعار',	'Notificatie instellingen',	'Paramètres de notification',	'Benachrichtigungseinstellungen',	'Настройки уведомлений',	'Configuración de las notificaciones',	'Bildirim ayarları'),
(148,	'',	'receive_notif_when',	'Receive notifications when some one',	'تلقي الإخطارات عندما واحد',	'Ontvang meldingen wanneer iemand',	'Recevoir des notifications quand quelquun',	'Erhalten Sie Benachrichtigungen wenn jemand',	'Получать уведомления, когда кто-то',	'Recibir notificaciones cuando alguien',	'Bazılarında bildirim al'),
(149,	'',	'liked_my_post',	'Liked my post',	'اعجبتني',	'Vond mijn bericht leuk',	'Jai aimé mon message',	'Mir hat mein Post gefallen',	'Понравился мой пост',	'Me gustó mi publicación',	'Gönderiyi beğendi'),
(150,	'',	'commented_my_post',	'Commented on my post',	'وعلق على منصبي',	'Gereageerd op mijn bericht',	'Jai commenté mon message',	'Hat meinen Beitrag kommentiert',	'Прокомментировал мой пост',	'Comentó en mi publicación',	'Gönderi hakkında yorum yaptı'),
(151,	'',	'followed_me',	'Followed me',	'تابعني',	'Volgde mij',	'Ma suivi',	'Folgte mir',	'Следовал за мной',	'Sigueme',	'Beni takip etti'),
(152,	'',	'mentioned_me',	'Mentioned me',	'ذكرني',	'Noemde me',	'Ma mentionné',	'Erwähnte mich',	'Упоминал меня',	'Me mencionó',	'Bana bahsetti'),
(153,	'',	'followed_u',	'is now following you',	'هو الآن يتبعك',	'volgt je nu',	'est maintenant en train de te suivre',	'folgt dir jetzt',	'теперь следует вам',	'ahora te está siguiendo',	'seni takip ediyor'),
(154,	'',	'liked_ur_post',	'liked your post',	'أعجبني مشاركتك',	'vond je bericht leuk',	'aimé votre message',	'hat deinen Beitrag gefallen',	'понравилось ваше сообщение',	'me gustó tu publicación',	'yayınınızı beğendi'),
(155,	'',	'commented_ur_post',	'commented on your post',	'كلف على رسالتك',	'verbonden op uw post',	'commneted sur votre message',	'kommentared auf Ihrem Post',	'Записан',	'commneted en su publicación',	'yayınınızda toplandı'),
(156,	'',	'mentioned_u_in_comment',	'mentioned you in a comment',	'ذكرك في تعليق',	'vermeldde U in een opmerking',	'vous a mentionné dans un commentaire',	'dich in einem Kommentar erwähnt',	'упомянул вас в комментарии',	'Te mencioné en un comentario',	'Bir yorumda sizden bahsetti'),
(157,	'',	'mentioned_u_in_post',	'mentioned you in a post',	'ذكرت لك في وظيفة',	'heeft je in een bericht genoemd',	'vous a mentionné dans un message',	'Sie in einem Beitrag erwähnt',	'упомянул вас в сообщении',	'te mencionó en una publicación',	'senden bir mesajda bahsetti'),
(158,	'',	'manage_blocked_users',	'Manage users that you have blocked',	'إدارة المستخدمين الذين قمت بحظرهم',	'Beheer gebruikers die u hebt geblokkeerd',	'Gérer les utilisateurs que vous avez bloqués',	'Verwalten Sie Benutzer, die Sie blockiert haben',	'Управление заблокированными пользователями',	'Administrar usuarios que has bloqueado',	'Engellediğiniz kullanıcıları yönetin'),
(159,	'',	'no_blocked_users',	'No blocked users found',	'لم يتم العثور على مستخدمين محظورين',	'Geen geblokkeerde gebruikers gevonden',	'Aucun utilisateur bloqué trouvé',	'Keine blockierten Benutzer gefunden',	'Не обнаружены заблокированные пользователи',	'No se encontraron usuarios bloqueados',	'Engellenen kullanıcı bulunamadı'),
(160,	'',	'confirm_del_account',	'Are you sure you want to delete your account? All content will be permanently removed!',	'هل انت متأكد انك تريد حذف حسابك؟ جميع المحتويات بما في ذلك المنشورات المنشورة ، سيتم إزالتها نهائيا!',	'Weet je zeker dat je je account wilt verwijderen? Alle inhoud inclusief gepubliceerde berichten, zal permanent worden verwijderd!',	'Êtes-vous sûr de vouloir supprimer votre compte? Tout le contenu, y compris les articles publiés, sera définitivement supprimé!',	'Möchtest du dein Konto wirklich löschen? Alle Inhalte einschließlich veröffentlichter Posts werden dauerhaft entfernt!',	'Вы действительно хотите удалить свою учетную запись? Весь контент, включая опубликованные сообщения, будет удален!',	'¿Seguro que quieres eliminar tu cuenta? ¡Todo el contenido, incluidas las publicaciones publicadas, se eliminará de forma permanente!',	'Hesabınızı silmek istediğinizden emin misiniz? Yayınlanmış gönderiler dahil tüm içerikler kalıcı olarak kaldırılacak!'),
(161,	'',	'enter_ur_passwd',	'Enter your password',	'ادخل رقمك السري',	'Voer uw wachtwoord in',	'Tapez votre mot de passe',	'Gib dein Passwort ein',	'Введите ваш пароль',	'Ingresa tu contraseña',	'Şifrenizi girin'),
(162,	'',	'continue',	'Continue',	'استمر',	'Doorgaan met',	'Continuer',	'Fortsetzen',	'Продолжать',	'Continuar',	'Devam et'),
(163,	'',	'ur_account_deleted',	'Your account successfully deleted. Please wait..',	'تم حذف حسابك بنجاح. أرجو الإنتظار..',	'Uw account is succesvol verwijderd. Even geduld aub..',	'Votre compte a bien été supprimé. Sil vous plaît, attendez..',	'Ihr Konto wurde erfolgreich gelöscht. Warten Sie mal..',	'Ваша учетная запись успешно удалена. Пожалуйста, подождите..',	'Su cuenta fue eliminada exitosamente. Por favor espera..',	'Hesabınız başarıyla silindi. Lütfen bekle..'),
(164,	'',	'ur_avatar_changed',	'Your profile avatar has been successfully changed',	'تم تغيير الصورة الشخصية لملفك الشخصي بنجاح',	'Je profielavatar is succesvol gewijzigd',	'Votre avatar de profil a été modifié avec succès',	'Dein Profilavatar wurde erfolgreich geändert',	'Ваш аватар профиля успешно изменен',	'Tu avatar de perfil ha sido cambiado con éxito',	'Profil avatarınız başarıyla değiştirildi'),
(165,	'',	'terms_of_use',	'Terms of use',	'تعليمات الاستخدام',	'Gebruiksvoorwaarden',	'Conditions dutilisation',	'Nutzungsbedingungen',	'Условия эксплуатации',	'Términos de Uso',	'Kullanım Şartları'),
(166,	'',	'login_to_lc_post',	'To like or comment.',	'أحب أو تعليق.',	'Leuk vinden of commentaar geven.',	'Aimer ou commenter',	'Zu mögen oder zu kommentieren.',	'Любить или комментировать.',	'Me gusta o comenta',	'Beğenmek veya yorum yapmak.'),
(167,	'',	'page_not_found',	'Sorry, this page is not available.',	'عذرا، هذه الصفحة غير متوفرة.',	'Sorry, deze pagina is niet beschikbaar.',	'Désolé, cette page nest pas disponible.',	'Leider ist diese Seite nicht verfügbar.',	'Извините, эта страница недоступна.',	'Lo sentimos, esta página no está disponible.',	'Maalesef, bu sayfa mevcut değil.'),
(168,	'',	'page_link_is_invalid',	'You may have used an invalid link or the page was deleted',	'ربما تكون قد استخدمت رابطًا غير صالح أو تم حذف الصفحة',	'Mogelijk hebt u een ongeldige link gebruikt of is de pagina verwijderd',	'Vous avez peut-être utilisé un lien incorrect ou la page a été supprimée',	'Möglicherweise haben Sie einen ungültigen Link verwendet oder die Seite wurde gelöscht',	'Возможно, вы использовали неверную ссылку или страница была удалена',	'Es posible que haya utilizado un enlace no válido o que la página haya sido eliminada',	'Geçersiz bir bağlantı kullanmış olabilirsiniz veya sayfa silinmiş'),
(169,	'',	'story_system_limit',	'You reached the daily limit for your story. Maximum limit is 20.',	'لقد وصلت إلى الحد اليومي للتحديث لقصتك. الحد الأقصى هو 20',	'U heeft de dagelijkse updatelimiet voor uw verhaal bereikt. maximale limiet is 20',	'Vous avez atteint la limite de mise à jour quotidienne pour votre histoire. la limite maximale est de 20',	'Du hast das tägliche Aktualisierungslimit für deine Geschichte erreicht. Höchstgrenze ist 20',	'Вы достигли ежедневного предела обновления для своей истории. максимальный предел равен 20',	'Has alcanzado el límite de actualización diaria de tu historia. el límite máximo es 20',	'Hikayeniz için günlük güncelleme limitine ulaştınız. maksimum sınır 20'),
(170,	'',	'delete_story',	'Delete story',	'احذف القصة',	'Verhaal verwijderen',	'Supprimer lhistoire',	'Geschichte löschen',	'Удалить историю',	'Eliminar historia',	'Hikayeyi sil'),
(171,	'',	'confirm_del_story',	'Are you sure you want to delete this status? Note all of your followers can not see it after removal',	'هل أنت متأكد من أنك تريد حذف هذه الحالة؟ لاحظ أن جميع المتابعين لا يمكنهم رؤيته بعد الإزالة',	'Weet je zeker dat je deze status wilt verwijderen? Let op al uw volgers kunnen het niet zien na verwijdering',	'Êtes-vous sûr de vouloir supprimer ce statut? Notez que tous vos abonnés ne peuvent pas le voir après la suppression',	'Möchten Sie diesen Status wirklich löschen? Beachten Sie, dass alle Ihre Follower es nach dem Entfernen nicht sehen können',	'Вы действительно хотите удалить этот статус? Обратите внимание, что все ваши сторонники не видят его после удаления',	'¿Estás seguro de que deseas eliminar este estado? Tenga en cuenta que todos sus seguidores no pueden verlo después de la eliminación',	'Bu durumu silmek istediğinizden emin misiniz? Tüm takipçileriniz kaldırıldıktan sonra göremediğini unutmayın'),
(172,	'',	'people_who_liked',	'People who liked this post',	'الناس الذين أحب هذا المنصب',	'Mensen die dit bericht leuk vonden',	'Personnes qui ont aimé ce post',	'Leute, die diesen Beitrag mochten',	'Люди, которым понравился этот пост',	'Gente a la que le gustó esta publicación',	'Bu yayını beğenenler'),
(173,	'',	'show_more',	'Show more',	'أظهر المزيد',	'Laat meer zien',	'Montre plus',	'Zeig mehr',	'Показать больше',	'Mostrar más',	'Daha fazla göster'),
(174,	'',	'no_more_comments',	'No more comments',	'لا المزيد من التعليقات',	'Geen commentaar meer',	'Pas dautres commentaires',	'Keine weiteren Kommentare',	'Больше комментариев нет',	'No mas comentarios',	'Daha fazla yorum yok'),
(175,	'',	'add_story',	'Add story',	'أضف قصة',	'Voeg een verhaal toe',	'Ajouter une histoire',	'Geschichte hinzufügen',	'Добавить историю',	'Añadir historia',	'Hikaye ekle'),
(176,	'',	'imp_gif',	'Embed gif',	'تضمين ملف gif',	'Embed gif',	'Intégrer gif',	'Gif einbetten',	'Вставить gif',	'Insertar gif',	'Embed gif'),
(177,	'',	'imp_vid',	'Embed video',	'تضمين الفيديو',	'Video insluiten',	'Intégrer la vidéo',	'Video einbetten',	'Встроенное видео',	'Video incrustado',	'Gömülü video'),
(178,	'',	'add_vid',	'Upload video',	'رفع فيديو',	'Upload video',	'Télécharger une video',	'Video hochladen',	'Загрузить видео',	'Subir video',	'Video yükle'),
(179,	'',	'add_img',	'Upload image',	'تحميل الصور',	'Afbeelding uploaden',	'Importer une image',	'Bild hochladen',	'Загрузить изображение',	'Cargar imagen',	'Fotoğraf yükleniyor'),
(180,	'',	'website',	'Website',	'موقع الكتروني',	'Website',	'Site Internet',	'Webseite',	'Веб-сайт',	'Sitio web',	'Web sitesi'),
(181,	'',	'facebook',	'Facebook',	'فيس بوك',	'Facebook',	'Facebook',	'Facebook',	'facebook',	'Facebook',	'Facebook'),
(182,	'',	'google',	'Google',	'جوجل',	'Google',	'Google',	'Google',	'Google',	'Google',	'Google'),
(183,	'',	'twitter',	'Twitter',	'تغريد',	'tjilpen',	'Gazouillement',	'Twitter',	'щебет',	'Gorjeo',	'heyecan'),
(184,	'',	'ur_website',	'Your website url',	'عنوان موقعك',	'Jouw website URL',	'Ladresse URL de votre site',	'Deine Website URL',	'URL вашего сайта',	'URL de tu sitio web',	'Web sitenizin URLsi'),
(185,	'',	'ur_facebook',	'Your facebook profile url',	'الفيسبوك الخاص بك',	'Je facebook profiel url',	'Votre URL de profil facebook',	'Ihre Facebook Profil URL',	'Ваш профиль профиля facebook',	'Tu URL de perfil de Facebook',	'Facebook profil URL’niz'),
(186,	'',	'ur_google',	'Your google-plus profile url',	'Your google-plus profile url',	'Uw Google-plus profiel-URL',	'Votre URL de profil google-plus',	'Ihre Google-Plus-Profil-URL',	'Ваш URL-адрес профиля google-plus',	'Tu URL de perfil de google-plus',	'Google artı profil URL’niz'),
(187,	'',	'ur_twitter',	'Your twitter profile url',	'رابط تويتر الخاص بك',	'Je twitterprofiel-URL',	'Votre URL de profil twitter',	'Deine Twitter-Profil-URL',	'Ваш URL профиля твиттера',	'Tu url del perfil de twitter',	'Twitter profiliniz'),
(188,	'',	'about_u',	'About you',	'حولك',	'Over jou',	'Au propos de vous',	'Über dich',	'О тебе',	'Acerca de ti',	'Senin hakkında'),
(189,	'',	'fname_is_long',	'First name is too long Please enter a valid first name',	'الاسم الأول طويل جدًا الرجاء إدخال اسم أول صالح',	'Voornaam is te lang Voer een geldige voornaam in',	'Le prénom est trop long Veuillez entrer un prénom valide',	'Vorname ist zu lang Bitte geben Sie einen gültigen Vornamen ein',	'Имя слишком длинное Пожалуйста, введите действительное имя',	'El nombre es demasiado largo Por favor ingrese un nombre válido',	'İsim çok uzun. Lütfen geçerli bir ilk isim giriniz'),
(190,	'',	'lname_is_long',	'Last name is too long Please enter a valid last name',	'الاسم الأخير طويل جدًا الرجاء إدخال اسم العائلة الصحيح',	'Achternaam is te lang Voer een geldige achternaam in',	'Le nom est trop long Veuillez entrer un nom de famille valide',	'Nachname ist zu lang Bitte geben Sie einen gültigen Nachnamen ein',	'Фамилия слишком длинная Пожалуйста, введите действительную фамилию',	'El apellido es demasiado largo. Ingrese un apellido válido',	'Soyadı çok uzun! Lütfen geçerli bir soyad girin'),
(191,	'',	'about_is_long',	'Your text about you is too long The maximum number of text characters is 150.',	'نصك عنك طويل جدًا الحد الأقصى لعدد أحرف النص هو 150.',	'Uw tekst over u is te lang. Het maximale aantal teksttekens is 150.',	'Votre texte à votre sujet est trop long Le nombre maximum de caractères est de 150.',	'Ihr Text über Sie ist zu lang Die maximale Anzahl an Textzeichen beträgt 150.',	'Ваш текст о вас слишком длинный. Максимальное количество текстовых символов - 150.',	'Su texto sobre usted es demasiado largo. La cantidad máxima de caracteres de texto es 150.',	'Sizinle ilgili metniniz çok uzun. Maksimum metin karakter sayısı 150dir.'),
(192,	'',	'invalid_webiste_url',	'Your website url is invalid Please enter a valid url',	'عنوان URL لموقعك غير صالح يرجى إدخال عنوان url صالح',	'De url van uw website is ongeldig Voer een geldige URL in',	'LURL de votre site Web est invalide Veuillez entrer une URL valide',	'Ihre Website-URL ist ungültig Bitte geben Sie eine gültige URL ein',	'Недопустимый URL-адрес вашего веб-сайта. Введите действительный URL-адрес',	'La URL de su sitio web no es válida. Ingrese una URL válida.',	'Web sitenizin URLsi geçersiz Lütfen geçerli bir URL girin'),
(193,	'',	'invalid_facebook_url',	'Your facebook profile url is invalid Please enter a valid url',	'عنوان URL الخاص بك على فيسبوك غير صالح يرجى إدخال عنوان url صالح',	'De URL van je Facebook-profiel is ongeldig Voer een geldige URL in',	'Votre URL de profil facebook est invalide Veuillez entrer une URL valide',	'Ihre Facebook-Profil-URL ist ungültig. Bitte geben Sie eine gültige URL ein',	'Ваш URL-адрес профиля facebook недействителен. Введите действительный URL-адрес',	'Tu URL de perfil de Facebook no es válida. Ingresa una URL válida.',	'Facebook profile url geçersiz Lütfen geçerli bir url girin'),
(194,	'',	'invalid_google_url',	'Your google profile url is invalid Please enter a valid url',	'Your google profile url is invalid الرجاء إدخال عنوان url صالح',	'De URL van uw Google-profiel is ongeldig Voer een geldige URL in',	'Votre URL de profil Google nest pas valide Veuillez entrer une URL valide',	'Ihre Google Profil-URL ist ungültig Bitte geben Sie eine gültige URL ein',	'Ваш URL-адрес профиля google недействителен Пожалуйста, введите действительный URL-адрес',	'Tu URL de perfil de google no es válida. Ingresa una URL válida.',	'Google profil URL’niz geçersiz. Lütfen geçerli bir URL girin'),
(195,	'',	'invalid_twitter_url',	'Your twitter profile url is invalid Please enter a valid url',	'عنوان url الخاص بموقع twitter الخاص بك غير صالح يرجى إدخال عنوان url صالح',	'De URL van je twitterprofiel is ongeldig Voer een geldige URL in',	'Votre URL de profil twitter est invalide Veuillez entrer une URL valide',	'Deine Twitter-Profil-URL ist ungültig Bitte gib eine gültige URL ein',	'Неверный URL-адрес профиля Twitter. Введите действительный URL-адрес',	'Tu URL de perfil de twitter no es válida. Ingresa una URL válida.',	'Twitter profiliniz geçersiz. Lütfen geçerli bir URL girin'),
(196,	'',	'time_ago',	'ago',	'منذ',	'geleden',	'depuis',	'vor',	'тому назад',	'hace',	'önce'),
(197,	'',	'time_from_now',	'from now',	'من الان',	'vanaf nu',	'à partir de maintenant',	'in',	'отныне',	'desde ahora',	'şu andan itibaren'),
(198,	'',	'time_any_moment_now',	'any moment now',	'في اي لحظة الان',	'elk moment nu',	'à tout moment maintenant',	'jeden Moment jetzt',	'в любой момент сейчас',	'en cualquier momento ahora',	'şimdi her an'),
(199,	'',	'time_just_now',	'Just now',	'الآن فقط',	'Net nu',	'Juste maintenant',	'Gerade jetzt',	'Прямо сейчас',	'Justo ahora',	'Şu anda'),
(200,	'',	'time_about_a_minute_ago',	'about a minute ago',	'منذ دقيقة واحدة',	'ongeveer een minuut geleden',	'Il y a environ une minute',	'Vor ca. einer Minute',	'около минуты назад',	'hace alrededor de un minuto',	'yaklaşık bir dakika önce'),
(201,	'',	'time_minute_ago',	'%d minutes ago',	'قبل٪ d دقيقة',	'% d minuten geleden',	'Il y a% d minutes',	'% d Minuten vor',	'% d минут назад',	'Hace% d minutos',	'% d dakika önce'),
(202,	'',	'time_about_an_hour_ago',	'about an hour ago',	'منذ ساعة تقريبا',	'ongeveer een uur geleden',	'il y a à peu près une heure',	'vor ungefähr einer Stunde',	'около часа назад',	'Hace aproximadamente una hora',	'yaklaşık bir saat önce'),
(203,	'',	'time_hours_ago',	'%d hours ago',	'قبل٪ d ساعة',	'% d uur geleden',	'Il y a% d heures',	'% d Stunden vor',	'% часов назад',	'Hace% d horas',	'% d saat önce'),
(204,	'',	'time_a_day_ago',	'a day ago',	'قبل يوم',	'een dag geleden',	'il y a un jour',	'vor einem Tag',	'день назад',	'Hace un día',	'bir gün önce'),
(205,	'',	'time_a_days_ago',	'%d days ago',	'قبل٪ d يومًا',	'% d dagen geleden',	'il y a% d jours',	'% d Tage vor',	'% дней назад',	'hace% d días',	'% d gün önce'),
(206,	'',	'time_about_a_month_ago',	'about a month ago',	'قبل شهر مضى',	'ongeveer een maand geleden',	'il y a environ un mois',	'vor ungefähr einem Monat',	'Около месяца назад',	'Hace más o menos un mes',	'yaklaşık bir ay önce'),
(207,	'',	'time_months_ago',	'%d months ago',	'قبل شهر واحد',	'% d maanden geleden',	'Il y a% d mois',	'% d Monate zuvor',	'% d месяцев назад',	'Hace% d meses',	'% d ay önce'),
(208,	'',	'time_about_a_year_ago',	'about a year ago',	'قبل نحو سنة',	'ongeveer een jaar geleden',	'Il ya environ un an',	'vor ungefähr einem Jahr',	'около года назад',	'Hace un año',	'yaklaşık bir yıl önce'),
(209,	'',	'time_years_ago',	'%d years ago',	'قبل٪ d سنة',	'% d jaar geleden',	'Il y a% d années',	'% d Jahren',	'% d лет назад',	'% d años atrás',	'% d yıl önce'),
(210,	'',	'year',	'year',	'عام',	'jaar',	'an',	'Jahr',	'год',	'año',	'yıl'),
(211,	'',	'month',	'month',	'شهر',	'maand',	'mois',	'Monat',	'месяц',	'mes',	'ay'),
(212,	'',	'day',	'day',	'يوم',	'dag',	'journée',	'Tag',	'день',	'día',	'gün'),
(213,	'',	'hour',	'hour',	'ساعة',	'uur',	'heure',	'Stunde',	'час',	'hora',	'saat'),
(214,	'',	'minute',	'minute',	'اللحظة',	'minuut',	'minute',	'Minute',	'минут',	'minuto',	'dakika'),
(215,	'',	'second',	'second',	'ثانيا',	'tweede',	'seconde',	'zweite',	'второй',	'segundo',	'ikinci'),
(216,	'',	'years',	'years',	'سنوات',	'jaar',	'années',	'Jahre',	'лет',	'años',	'yıl'),
(217,	'',	'months',	'months',	'الشهور',	'maanden',	'mois',	'Monate',	'месяцы',	'meses',	'ay'),
(218,	'',	'days',	'days',	'أيام',	'dagen',	'journées',	'Tage',	'дней',	'dias',	'günler'),
(219,	'',	'hours',	'hours',	'ساعات',	'uur',	'heures',	'Std.',	'часов',	'horas',	'saatler'),
(220,	'',	'minutes',	'minutes',	'الدقائق',	'notulen',	'minutes',	'Protokoll',	'минут',	'minutos',	'dakika'),
(221,	'',	'seconds',	'seconds',	'ثواني',	'seconden',	'secondes',	'Sekunden',	'секунд',	'segundos',	'saniye'),
(222,	'',	'home',	'Home',	'الصفحة الرئيسية',	'Huis',	'Accueil',	'Zuhause',	'Главная',	'Casa',	'Ev'),
(223,	'',	'no_users_yet',	'There are no users yet',	'لا يوجد مستخدم بعد',	'Er zijn nog geen gebruikers',	'Il n\'y a pas encore d\'utilisateurs',	'Es gibt noch keine Benutzer',	'Пока нет пользователей',	'Todavía no hay usuarios',	'Henüz hiç kullanıcı yok'),
(224,	'',	'image',	'Image',	'صورة',	'Beeld',	'Image',	'Bild',	'Образ',	'Imagen',	'görüntü'),
(225,	'',	'video',	'Video',	'فيديو',	'Video',	'Vidéo',	'Video',	'видео',	'Vídeo',	'Video'),
(226,	'',	'embed_video',	'Embed Video',	'تضمين الفيديو',	'Video insluiten',	'Intégrer la vidéo',	'Video einbetten',	'Встроенное видео',	'Video incrustado',	'Gömülü Video'),
(227,	'',	'story',	'Story',	'قصة',	'Verhaal',	'Récit',	'Geschichte',	'История',	'Historia',	'Öykü'),
(228,	'',	'delete',	'Delete',	'حذف',	'Verwijder',	'Effacer',	'Löschen',	'Удалить',	'Borrar',	'silmek'),
(229,	'',	'block',	'Block',	'منع',	'Blok',	'Bloc',	'Block',	'блок',	'Bloquear',	'Blok'),
(230,	'',	'explore',	'Explore',	'يكتشف',	'onderzoeken',	'Explorer',	'Erkunden',	'Исследовать',	'Explorar',	'keşfetmek'),
(231,	'',	'copy_link',	'Copy Link',	'انسخ الرابط',	'Kopieer link',	'Copier le lien',	'Link kopieren',	'Копировать ссылку',	'Copiar link',	'Bağlantıyı kopyala'),
(232,	'',	'about_us',	'About Us',	'معلومات عنا',	'Over ons',	'À propos de nous',	'Über uns',	'О нас',	'Sobre nosotros',	'Hakkımızda'),
(233,	'',	'sign_in',	'Sign In',	'تسجيل الدخول',	'Aanmelden',	'Se connecter',	'Anmelden',	'Войти в систему',	'Registrarse',	'Oturum aç'),
(234,	'',	'welcome_to',	'Welcome to',	'مرحبا بك في',	'Welkom bij',	'Bienvenue à',	'Willkommen zu',	'Добро пожаловать в',	'Bienvenido a',	'Hoşgeldiniz'),
(235,	'',	'welcome_feature_1',	'Just Like the photos which you found interesting, unique and best.',	'تماما مثل الصور التي وجدت للاهتمام ، وفريدة من نوعها وأفضل.',	'Net als de foto\'s die u interessant, uniek en best vond.',	'Juste comme les photos que vous avez trouvées intéressantes, uniques et meilleures.',	'Genau wie die Fotos, die Sie interessant, einzigartig und am besten fanden.',	'Просто как фотографии, которые вы нашли интересными, уникальными и лучшими.',	'Al igual que las fotos que le parecieron interesantes, únicas y mejores.',	'Sadece ilginç, benzersiz ve en iyi bulduğunuz fotoğraflar gibi.'),
(236,	'',	'welcome_feature_2',	'Become a follower of Famous people, celebrities and many more in your area.',	'أصبح تابعا من المشاهير والمشاهير وغيرها الكثير في منطقتك.',	'Word een volgeling van beroemde mensen, beroemdheden en nog veel meer in jouw omgeving.',	'Devenir un adepte des personnes célèbres, des célébrités et bien d\'autres dans votre région.',	'Werden Sie ein Anhänger von Berühmtheiten, Prominenten und vielen mehr in Ihrer Nähe.',	'Станьте последователем Знаменитых людей, знаменитостей и многих других в своей области.',	'Conviértete en seguidor de personajes famosos, celebridades y muchos más en tu área.',	'Ünlülerin, ünlülerin ve bölgenizdeki daha birçok kişinin takipçisi ol.'),
(237,	'',	'welcome_feature_3',	'Immediately Save Images or videos to check them later anytime.',	'احفظ الصور أو مقاطع الفيديو فورًا للتحقق منها لاحقًا في أي وقت.',	'Sla onmiddellijk afbeeldingen of video\'s op om ze later op elk gewenst moment te bekijken.',	'Immédiatement enregistrer des images ou des vidéos pour les vérifier plus tard à tout moment.',	'Speichern Sie sofort Bilder oder Videos, um sie später jederzeit zu überprüfen.',	'Немедленно сохраните изображения или видео, чтобы проверить их позже в любое время.',	'Guarde de inmediato imágenes o videos para verlos más tarde en cualquier momento.',	'Hemen görüntüleri veya videoları istediğiniz zaman kontrol etmek için kaydedin.'),
(238,	'',	'let_set_up',	'Let&#039;s get you set up',	'دعنا ننصحك',	'Laten we je instellen',	'Laissez-vous mettre en place',	'Lass uns dich einrichten',	'Дадим вам настроить',	'Vamos a prepararte',	'Ayarlayalım'),
(239,	'',	'create_acc_proceed',	'Create your Account to continue to',	'قم بإنشاء حسابك للاستمرار',	'Maak uw account aan om door te gaan',	'Créez votre compte pour continuer à',	'Erstellen Sie Ihr Konto, um fortzufahren',	'Создайте свою учетную запись, чтобы продолжить',	'Crea tu cuenta para continuar',	'Devam etmek için Hesabınızı oluşturun'),
(240,	'',	'min_to_get_start',	'It will take only a couple of minutes to get started.',	'سوف يستغرق الأمر بضع دقائق فقط للبدء.',	'Het duurt maar een paar minuten om aan de slag te gaan.',	'Cela ne prendra que quelques minutes pour commencer.',	'Es dauert nur ein paar Minuten, um loszulegen.',	'Чтобы начать работу, потребуется всего несколько минут.',	'Solo tomará unos minutos para comenzar.',	'Başlamak için sadece birkaç dakika alacak.'),
(241,	'',	'reset_password',	'Reset your Password',	'اعد ضبط كلمه السر',	'Stel je wachtwoord opnieuw in',	'Réinitialisez votre mot de passe',	'Setze dein Passwort zurück',	'Сбросить пароль',	'Restablecer su contraseña',	'Şifrenizi Sıfırla'),
(242,	'',	'reset',	'Reset',	'إعادة تعيين',	'Reset',	'Réinitialiser',	'Zurücksetzen',	'Сброс',	'Reiniciar',	'Reset'),
(243,	'',	'like',	'Like',	'مثل',	'Graag willen',	'Comme',	'Mögen',	'подобно',	'Me gusta',	'Sevmek'),
(244,	'',	'save',	'Save',	'حفظ',	'Opslaan',	'sauvegarder',	'sparen',	'Сохранить',	'Salvar',	'Kayıt etmek'),
(245,	'',	'select',	'Select',	'تحديد',	'kiezen',	'Sélectionner',	'Wählen',	'Выбрать',	'Seleccionar',	'seçmek'),
(246,	'',	'email_not_exists',	'Email not found',	'البريد الإلكتروني غير موجود',	'e-mail niet gevonden',	'Email non trouvé',	'Email wurde nicht gefunden',	'Электронная почта не найдена',	'El correo electrónico no encontrado',	'Email bulunamadı'),
(247,	'',	'sent_email',	'We have sent you an email, please check your inbox or spam folder.',	'لقد أرسلنا إليك بريدًا إلكترونيًا ، يرجى التحقق من مجلد البريد الوارد أو مجلد الرسائل غير المرغوب فيها.',	'We hebben je een e-mail gestuurd, kijk in je inbox of spam-map.',	'Nous vous avons envoyé un e-mail, vérifiez votre boîte de réception ou votre dossier de spam.',	'Wir haben Ihnen eine E-Mail geschickt, überprüfen Sie bitte Ihren Posteingang oder Spam-Ordner.',	'Мы отправили вам электронное письмо, пожалуйста, проверьте папку «Входящие» или «Спам».',	'Le hemos enviado un correo electrónico, consulte su bandeja de entrada o carpeta de correo no deseado.',	'Size bir e-posta gönderdik, lütfen gelen kutunuzu veya spam klasörünüzü kontrol edin.'),
(248,	'',	'account_not_activated',	'Your account is not activated.',	'حسابك غير مفعل.',	'Je account is niet geactiveerd.',	'Votre compte n\'est pas activé.',	'Dein Konto ist nicht aktiviert.',	'Ваша учетная запись не активирована.',	'Su cuenta no está activada.',	'Hesabınız aktif değil.'),
(249,	'',	'click_on_activation_link',	'Please click on activation link that was sent to your email.',	'الرجاء النقر فوق رابط التنشيط الذي تم إرساله إلى بريدك الإلكتروني.',	'Klik op de activeringslink die naar uw e-mail is verzonden.',	'Veuillez cliquer sur le lien d\'activation envoyé à votre adresse e-mail.',	'Bitte klicken Sie auf den Aktivierungslink, der an Ihre E-Mail gesendet wurde.',	'Нажмите ссылку активации, которая была отправлена ​​на ваш адрес электронной почты.',	'Haga clic en el enlace de activación que se envió a su correo electrónico.',	'Lütfen e-postanıza gönderilen aktivasyon linkine tıklayın.'),
(250,	'',	'activate_user',	'Activate User',	'تفعيل المستخدم',	'Activeer Gebruiker',	'Activer l\'utilisateur',	'Benutzer aktivieren',	'Активировать пользователя',	'Activar usuario',	'Kullanıcıyı Etkinleştir'),
(251,	'',	'successfully_loged_in',	'Successfully logged in, please wait...',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(252,	'',	'v2_reset_password',	'Reset Password',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(253,	'',	'v2_reset_password_msg',	'To reset your password, please click the link below:',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(254,	'',	'successfully_joined_created',	'Your account was successfully created. Please check your inbox or spam folder for the activation link.',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(255,	'',	'v2_email_confirmed',	'Email Confirmed',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(256,	'',	'website_use_cookies',	'This website uses cookies to ensure you get the best experience on our website.',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(257,	'',	'got_it',	'Got it!',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(258,	'',	'learn_more1',	'Learn more',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(259,	'',	'views',	'Views',	'الآراء',	'Keer bekeken',	'Des vues',	'Ansichten',	'Просмотры',	'Puntos de vista',	'Görünümler'),
(260,	'',	'verification',	'Verification',	'التحقق',	'Verificatie',	'Vérification',	'Nachprüfung',	'верификация',	'Verificación',	'Doğrulama'),
(261,	'',	'verify_p',	'Verification of the profile!',	'التحقق من الملف الشخصي!',	'Verificatie van het profiel!',	'Vérification du profil!',	'Überprüfung des Profils!',	'Проверка профиля!',	'Verificación del perfil!',	'Profilin doğrulanması!'),
(262,	'',	'name',	'Name',	'اسم',	'Naam',	'prénom',	'Name',	'название',	'Nombre',	'isim'),
(263,	'',	'upload_docs',	'Upload documents',	'تحميل المستندات',	'Upload documenten',	'Télécharger des documents',	'Dokumente hochladen',	'Загрузить документы',	'Subir documentos',	'Belgeleri Yükle'),
(264,	'',	'select_verif_images',	'Please upload a photo with your passport / ID &amp; your distinct photo',	'يرجى تحميل صورة مع جواز سفرك / هويتك وصورتك المميزة',	'Upload een foto met uw paspoort / ID en uw afzonderlijke foto',	'S&#039;il vous plaît télécharger une photo avec votre passeport / ID et votre photo distincte',	'Bitte lade ein Foto mit deinem Pass / Ausweis und deinem eigenen Foto hoch',	'Загрузите фотографию с вашим паспортом / удостоверением личности и вашей отдельной фотографией',	'Por favor, cargue una foto con su pasaporte / identificación y su foto distintiva',	'Lütfen pasaportunuz / kimliğiniz ve farklı fotoğrafınız ile fotoğraf yükleyin'),
(265,	'',	'your_photo',	'Your Photo',	'صورتك',	'Je foto',	'Ta photo',	'Dein Foto',	'Твое фото',	'Tu foto',	'Senin resmin'),
(266,	'',	'your_ip',	'Passport / id card',	'جواز السفر / بطاقة الهوية',	'Paspoort / identiteitskaart',	'Passeport / carte d&#039;identité',	'Reisepass / ID-Karte',	'Паспорт / удостоверение личности',	'Pasaporte / tarjeta de identificación',	'Pasaport / kimlik kartı'),
(267,	'',	'send',	'Send',	'إرسال',	'Sturen',	'Envoyer',	'Senden',	'послать',	'Enviar',	'göndermek'),
(268,	'',	'your_photo_invalid',	'Your Photo is invalid please select another photo',	'صورتك غير صالحة ، يرجى تحديد صورة أخرى',	'Uw foto is ongeldig. Selecteer een andere foto',	'Votre photo n&#039;est pas valide, veuillez sélectionner une autre photo.',	'Ihr Foto ist ungültig. Bitte wählen Sie ein anderes Foto aus',	'Ваша фотография недействительна, выберите другую фотографию',	'Tu foto no es válida, selecciona otra foto',	'Fotoğrafınız geçersiz. Lütfen başka bir fotoğraf seç'),
(269,	'',	'your_ip_invalid',	'Your ip file is invalid please select another one',	'ملف IP الخاص بك غير صالح ، يرجى تحديد ملف آخر',	'Uw IP-bestand is ongeldig. Selecteer een ander bestand',	'Votre fichier ip n&#039;est pas valide, veuillez en choisir un autre',	'Ihre IP-Datei ist ungültig. Bitte wählen Sie eine andere aus',	'Ваш ip-файл недействителен, выберите другой',	'Su archivo ip no es válido por favor seleccione otro',	'IP dosyanız geçersiz, lütfen bir tane daha seçin'),
(270,	'',	'request_done',	'Your verification request soon will be considered!',	'سيُنظر في طلب التحقق قريبًا!',	'Uw verificatieverzoek wordt snel overwogen!',	'Votre demande de vérification sera bientôt prise en compte!',	'Ihre Bestätigungsanfrage wird bald berücksichtigt!',	'Ваш запрос на подтверждение скоро будет рассмотрен!',	'Su solicitud de verificación pronto será considerada!',	'Doğrulama isteğiniz yakında dikkate alınacaktır!'),
(271,	'',	'contact_us',	'Contact Us',	'اتصل بنا',	'Neem contact met ons op',	'Contactez nous',	'Kontaktiere uns',	'Связаться с нами',	'Contáctenos',	'Bizimle iletişime geçin'),
(272,	'',	'email_sent',	'Your email has been sent',	'تم إرسال البريد الإلكتروني الخاص بك',	'Je e-mail is verzonden',	'Votre e mail a été envoyé',	'Ihre E-Mail wurde gesendet',	'Ваше сообщение было отправлено',	'Tu correo ha sido enviado',	'Emailiniz gönderildi'),
(273,	'',	'embed',	'Embed',	'تضمين',	'insluiten',	'Intégrer',	'Einbetten',	'встраивать',	'Empotrar',	'Göm'),
(274,	'',	'post_m_report',	'Warning: This post might contain harmful or offensive images or adult (18+) content.',	'تحذير: قد تحتوي هذه المشاركة على صور ضارة أو مسيئة أو محتوى للبالغين (18 عامًا).',	'Waarschuwing: dit bericht kan schadelijke of aanstootgevende afbeeldingen of inhoud voor volwassenen (18+) bevatten.',	'Avertissement: Ce message peut contenir des images nuisibles ou offensantes ou du contenu réservé aux adultes (18 ans et plus).',	'Warnung: Dieser Beitrag enthält möglicherweise schädliche oder beleidigende Bilder oder Inhalte für Erwachsene (18+).',	'Предупреждение. Это сообщение может содержать вредные или оскорбительные изображения или контент для взрослых (18+).',	'Advertencia: esta publicación puede contener imágenes dañinas u ofensivas o contenido para adultos (mayores de 18 años).',	'Uyarı: Bu yayın zararlı veya rahatsız edici resimler veya yetişkinlere yönelik (18+) içerik barındırıyor olabilir.'),
(275,	'',	'skip_step',	'Or Skip this step for now',	'أو تخطي هذه الخطوة في الوقت الحالي',	'Of sla deze stap nu over',	'Ou sauter cette étape pour l&#039;instant',	'Oder Überspringe diesen Schritt für jetzt',	'Или пропустите этот шаг',	'O Salta este paso por ahora',	'Veya Şimdilik bu adımı atla'),
(276,	'',	'save_c',	'Save &amp; Continue',	'حفظ ومتابعة',	'Opslaan doorgaan',	'Enregistrer continuer',	'Speichern fortsetzen',	'Сохранить и продолжить',	'Guardar Continuar',	'Kaydet ilerle'),
(277,	'',	'add_photo_s',	'Add a photo.',	'إضافة صورة.',	'Voeg een foto toe.',	'Ajouter une photo.',	'Füge ein Foto hinzu.',	'Добавить фото.',	'Agregar una foto.',	'Fotoğraf ekle.'),
(278,	'',	'tell_us',	'Tell us about you.',	'أخبرنا عن نفسك.',	'Vertel ons over jezelf.',	'Parlez nous de vous.',	'Erzähl uns von dir.',	'Расскажи нам о себе.',	'Cuéntanos acerca de ti.',	'Bize hakkında bilgi verin.'),
(279,	'',	'follow_famous',	'Follow our famous users.',	'اتبع المستخدمين المشهورين لدينا.',	'Volg onze beroemde gebruikers.',	'Suivez nos utilisateurs célèbres.',	'Folge unseren berühmten Nutzern.',	'Следуйте за нашими знаменитыми пользователями.',	'Sigue a nuestros famosos usuarios.',	'Ünlü kullanıcılarımızı takip edin.'),
(280,	'',	'follow_c',	'Follow &amp; Continue',	'متابعة ومتابعة',	'Volgen en doorgaan',	'Suivre et continuer',	'Folgen Sie und fahren Sie fort',	'Продолжить и продолжить',	'Seguir, continuar',	'Takip et ve devam et'),
(281,	'',	'manage_sessions',	'Manage Sessions',	'إدارة الجلسات',	'Sessies beheren',	'Gérer les sessions',	'Sitzungen verwalten',	'Управление сеансами',	'Gestionar sesiones',	'Oturumları Yönet'),
(282,	'',	'profile_search',	'Show your profile in search engines',	'اعرض ملفك الشخصي في محركات البحث',	'Toon uw profiel in zoekmachines',	'Affichez votre profil dans les moteurs de recherche',	'Zeigen Sie Ihr Profil in Suchmaschinen',	'Показывать свой профиль в поисковых системах',	'Muestra tu perfil en los buscadores.',	'Profilinizi arama motorlarında göster'),
(283,	'',	'reCaptcha_error',	'Please check the re-captcha',	'يرجى التحقق من إعادة captcha',	'Controleer de re-captcha',	'S&#039;il vous plaît vérifier le re-captcha',	'Bitte überprüfe das Re-Captcha',	'Пожалуйста, проверьте переквалификацию',	'Por favor, compruebe el re-captcha',	'Lütfen yeniden captcha’yı kontrol edin'),
(284,	'',	'username_in_blacklist',	'The username is blacklisted and not allowed, please choose another username',	'اسم المستخدم مدرج في القائمة السوداء وغير مسموح به ، يرجى اختيار اسم مستخدم آخر',	'De gebruikersnaam staat op de zwarte lijst en is niet toegestaan, kies een andere gebruikersnaam',	'Le nom d&#039;utilisateur est sur la liste noire et n&#039;est pas autorisé, veuillez choisir un autre nom d&#039;utilisateur.',	'Der Benutzername ist auf der Blacklist und nicht erlaubt, bitte wähle einen anderen Benutzernamen',	'Имя пользователя занесено в черный список и не разрешено, выберите другое имя пользователя',	'El nombre de usuario está en la lista negra y no está permitido, elija otro nombre de usuario',	'Kullanıcı adı kara listede ve izin verilmiyor, lütfen başka bir kullanıcı adı seçin'),
(285,	'',	'email_in_blacklist',	'The email is blacklisted and not allowed, please choose another email',	'البريد الإلكتروني مدرج في القائمة السوداء وغير مسموح به ، يرجى اختيار بريد إلكتروني آخر',	'De e-mail staat op de zwarte lijst en is niet toegestaan, kies een andere e-mail',	'L&#039;email est sur la liste noire et n&#039;est pas autorisé, veuillez choisir un autre email.',	'Die E-Mail ist auf der schwarzen Liste und nicht erlaubt. Bitte wählen Sie eine andere E-Mail',	'Электронная почта в черный список и не разрешена, выберите другое электронное письмо',	'El correo electrónico está en la lista negra y no está permitido, elija otro correo electrónico',	'E-posta kara listeye alındı ​​ve izin verilmedi, lütfen başka bir e-posta adresi seçin'),
(286,	'',	'email_username_in_blacklist',	'The email or username is blacklisted and not allowed, please choose another email or username',	'البريد الإلكتروني أو اسم المستخدم مدرج في القائمة السوداء وغير مسموح به ، يرجى اختيار بريد إلكتروني آخر أو اسم مستخدم آخر',	'De e-mail of gebruikersnaam staat op de zwarte lijst en is niet toegestaan, kies een andere e-mail of gebruikersnaam',	'L&#039;email ou le nom d&#039;utilisateur est sur la liste noire et n&#039;est pas autorisé. Veuillez choisir un autre email ou nom d&#039;utilisateur.',	'Die E-Mail oder der Benutzername ist auf der schwarzen Liste und nicht erlaubt. Bitte wählen Sie eine andere E-Mail oder einen anderen Nutzernamen',	'Электронная почта или имя пользователя занесены в черный список и не разрешены, выберите другое электронное письмо или имя пользователя',	'El correo electrónico o nombre de usuario está en la lista negra y no está permitido, elija otro correo electrónico o nombre de usuario',	'E-posta veya kullanıcı adı kara listede ve izin verilmiyor, lütfen başka bir e-posta adresi veya kullanıcı adı seçin'),
(287,	'',	'ip_in_blacklist',	'The IP is blacklisted and not allowed',	'عنوان IP مدرج في القائمة السوداء وغير مسموح به',	'De IP staat op de zwarte lijst en is niet toegestaan',	'L&#039;IP est sur la liste noire et non autorisé',	'Die IP ist auf der schwarzen Liste und nicht erlaubt',	'IP заблокирован и не разрешен',	'La IP está en la lista negra y no está permitida',	'IP kara listede ve izin verilmiyor'),
(288,	'',	'click_to_visit',	'Click to visit',	'انقر لزيارة',	'Klik om te bezoeken',	'Cliquez pour visiter',	'Klicken Sie, um zu besuchen',	'Нажмите, чтобы посетить',	'Haga clic para visitar',	'Ziyaret etmek için tıklayın'),
(289,	'',	'browser',	'Browser',	'المتصفح',	'browser',	'Navigateur',	'Browser',	'браузер',	'Navegador',	'Tarayıcı'),
(290,	'',	'ip_address',	'IP Address',	'عنوان IP',	'IP adres',	'Adresse IP',	'IP Adresse',	'Айпи адрес',	'Dirección IP',	'IP adresi'),
(291,	'',	'verify_user',	'Verify User',	'تحقق من المستخدم',	'Verifieer gebruiker',	'Vérifier l&#039;utilisateur',	'Benutzer bestätigen',	'Проверить пользователя',	'Verificar usuario',	'Kullanıcıyı Doğrula'),
(292,	'',	'no_more_activities',	'No more activities',	'لا مزيد من الأنشطة',	'Geen activiteiten meer',	'Pas plus d&#039;activités',	'Keine Aktivitäten mehr',	'Больше никаких действий',	'No mas actividades',	'Daha fazla aktivite yok'),
(293,	'',	'activities',	'Activities',	'أنشطة',	'Activiteiten',	'Activités',	'Aktivitäten',	'мероприятия',	'Ocupaciones',	'faaliyetler'),
(294,	'',	'commented_on_post',	'commented on {user} {post}',	'علّق على {user} {post}',	'hebben gereageerd op {user} {post}',	'a commenté sur {user} {post}',	'kommentiert auf {user} {post}',	'прокомментировал {user} {post}',	'comentó en {user} {post}',	'{user} {post} sitesinde yorum yaptı'),
(295,	'',	'post',	'post',	'بريد',	'post',	'poster',	'Post',	'сообщение',	'enviar',	'posta'),
(296,	'',	'followed_user',	'started following {user}',	'بدأت باتباع {user}',	'start met {user}',	'commencé à suivre {user}',	'gestartet nach {user}',	'начал {user}',	'comenzó a seguir a {user}',	'{user} takip etmeye başladı'),
(297,	'',	'liked__post',	'liked {user} {post}',	'أعجبه {user} {post}',	'vond {user} {post} leuk',	'aimé {user} {post}',	'gemocht {user} {post}',	'понравилось {user} {post}',	'me gustó {user} {post}',	'beğendi {user} {post}'),
(298,	'',	'from_camera',	'Take a picture using webcam',	'التقط صورة باستخدام كاميرا الويب',	'Maak een foto met de webcam',	'Prendre une photo en utilisant webcam',	'Mach ein Foto mit der Webcam',	'Сделайте снимок с помощью веб-камеры',	'Toma una foto con la webcam',	'Web kamerasını kullanarak fotoğraf çek'),
(299,	'',	'active',	'Active',	'نشيط',	'Actief',	'actif',	'Aktiv',	'активный',	'Activo',	'Aktif'),
(300,	'',	'no_camera',	'No camera device found, please make sure the camera is plugged in and the browser has the persmission to use it.',	'لم يتم العثور على أي كاميرا ، يرجى التأكد من توصيل الكاميرا والمتصفح يحتفظ باستخدامه.',	'Geen camera-apparaat gevonden, zorg ervoor dat de camera is aangesloten en dat de browser de toestemming heeft om het te gebruiken.',	'Aucun appareil photo n&#039;a été trouvé, assurez-vous que l&#039;appareil photo est branché et que le navigateur a la permission de l&#039;utiliser.',	'Kein Kamera-Gerät gefunden, bitte stellen Sie sicher, dass die Kamera angeschlossen ist und der Browser die Erlaubnis hat, sie zu benutzen.',	'Не найдено ни одного устройства камеры, убедитесь, что камера подключена, и браузер имеет возможность использовать его.',	'No se ha encontrado ningún dispositivo de cámara, asegúrese de que la cámara esté enchufada y que el navegador tenga la capacidad de usarla.',	'Hiçbir kamera cihazı bulunamadı, lütfen kameranın takılı olduğundan ve tarayıcının onu kullanmak için gerekli olduğuna emin olun.'),
(301,	'',	'you',	'You',	'أنت',	'U',	'Vous',	'Sie',	'Вы',	'Tú',	'Sen'),
(302,	'',	'your',	'your',	'ك',	'jouw',	'votre',	'Ihre',	'ваш',	'tu',	'sizin'),
(303,	'',	'his',	'his',	'له',	'zijn',	'le sien',	'seine',	'его',	'su',	'onun'),
(304,	'',	'my_affiliates',	'My Affiliates',	'الشركات التابعة لي',	'Mijn gelieerde partners',	'Mes affiliés',	'Meine Partner',	'Мои филиалы',	'Mis afiliados',	'Ortaklarım'),
(305,	'',	'earn_users',	'Earn up to ${amount} for each user your refer to us !',	'اربح حتى $ {كمية} لكل مستخدم تحيله إلينا!',	'Verdien tot ${amount} voor elke gebruiker die u naar ons verwijst!',	'Gagnez jusqu&#039;à ${amount} pour chaque utilisateur que vous nous référez!',	'Verdienen Sie bis zu ${amount} für jeden Nutzer, den Sie uns empfehlen!',	'Зарабатывайте до ${amount} за каждого пользователя, которого вы обращаетесь к нам!',	'¡Gane hasta ${amount} por cada usuario que nos refiera!',	'Bize yönlendirdiğiniz her kullanıcı için ${amount} kadar kazanın!'),
(306,	'',	'earn_users_pro',	'Earn up to ${amount} for each user your refer to us and will subscribe to any of our pro packages.',	'اربح مبلغًا يصل إلى {{} مبلغ لكل مستخدم تقوم بإحالته إلينا وسيشترك في أي من حزمنا الاحترافية.',	'Verdien tot ${amount} voor elke gebruiker die naar ons verwijst en abonneert zich op een van onze pro-pakketten.',	'Gagnez jusqu&#039;à ${amount} pour chaque utilisateur que vous nous référez et vous vous abonner à l&#039;un de nos forfaits professionnels.',	'Verdienen Sie bis zu ${amount} für jeden Nutzer, den Sie uns nennen, und abonnieren Sie eines unserer Profi-Pakete.',	'Заработайте до ${amount} за каждого пользователя, которого вы пригласили, и подпишитесь на любой из наших профессиональных пакетов.',	'Gane hasta ${amount} por cada usuario que nos refiera y se suscribirá a cualquiera de nuestros paquetes profesionales.',	'Bize yönlendirdiğiniz her kullanıcı için ${amount} kadar kazanın ve profesyonel paketlerimize abone olun.'),
(307,	'',	'your_ref_link',	'Your affiliate link is',	'الرابط التابع الخاص بك هو',	'Uw affiliate link is',	'Votre lien d&#039;affilié est',	'Ihr Affiliate-Link lautet',	'Ваша партнерская ссылка',	'Su enlace de afiliado es',	'Ortaklık bağlantınız'),
(308,	'',	'share_to',	'Share to',	'حصة ل',	'Delen naar',	'Partager à',	'Teilen mit',	'Поделиться с',	'Compartir a',	'Paylaş'),
(309,	'',	'liked_my_comment',	'liked my comment',	'أعجبني تعليقي',	'vond mijn reactie leuk',	'aimé mon commentaire',	'mochte mein Kommentar',	'понравился мой комментарий',	'me gustó mi comentario',	'yorumumu beğendim'),
(310,	'',	'liked_ur_comment',	'liked your comment',	'أعجبك تعليقك',	'vond je reactie leuk',	'aimé ton commentaire',	'mochte dein Kommentar',	'понравился твой комментарий',	'me gustó tu comentario',	'yorumunu beğendim'),
(311,	'',	'reply_ur_comment',	'replied to your comment',	'رد على تعليقك',	'heeft op je reactie gereageerd',	'répondu à votre commentaire',	'hat auf deinen Kommentar geantwortet',	'ответил на ваш комментарий',	'respondió a tu comentario',	'yorumuna cevap verdi'),
(312,	'',	'replied_my_comment',	'replied to my comment',	'رد على تعليقي',	'reageerde op mijn opmerking',	'a répondu à mon commentaire',	'antwortete auf meinen Kommentar',	'ответил на мой комментарий',	'respondió a mi comentario',	'yorumuma cevap verdi'),
(313,	'',	'go_pro',	'Go Pro',	'جو برو',	'Ga Pro',	'Go Pro',	'Pro gehen',	'Go Pro',	'Go Pro',	'Pro git'),
(314,	'',	'upgrade_to_pro',	'Upgrade To Pro',	'التطور للاحترافية',	'Upgraden naar Pro',	'Passer à Pro',	'Upgrade auf Pro',	'Обновить до Pro',	'Actualizar a Pro',	'Pro&#039;ya yükselt'),
(315,	'',	'upgrade',	'Upgrade',	'تطوير',	'Upgrade',	'Améliorer',	'Aktualisierung',	'Обновить',	'Mejorar',	'Yükselt'),
(316,	'',	'choose_method',	'Choose a payment method',	'اختيار طريقة الدفع',	'Kies een betaal methode',	'Choisissez une méthode de paiement',	'Wählen Sie eine Bezahlungsart',	'Выберите способ оплаты',	'Elija un método de pago',	'Bir ödeme yöntemi seçin'),
(317,	'',	'upgraded',	'Upgraded',	'ترقية',	'Upgraded',	'Mis à niveau',	'Aufgerüstet',	'Модернизированный',	'Actualizado',	'Yükseltilmiş'),
(318,	'',	'c_payment',	'Confirming your payment, please wait..',	'لتأكيد الدفع ، يرجى الانتظار ..',	'Bevestiging van uw betaling, even geduld aub ..',	'Confirmant votre paiement, veuillez patienter ..',	'Bestätigung Ihrer Zahlung, bitte warten Sie ..',	'Подтверждение оплаты, пожалуйста, подождите ..',	'Confirmando su pago, por favor espere ..',	'Ödemenizi onaylayın, lütfen bekleyin ..'),
(319,	'',	'payment_declined',	'Payment declined, please try again later.',	'تم رفض الدفع ، يرجى المحاولة مرة أخرى لاحقًا.',	'Betaling geweigerd. Probeer het later opnieuw.',	'Paiement refusé, veuillez réessayer plus tard.',	'Zahlung abgelehnt, bitte versuchen Sie es später erneut.',	'Платеж отклонен, повторите попытку позже.',	'Pago rechazado, inténtalo de nuevo más tarde.',	'Ödeme reddedildi, lütfen daha sonra tekrar deneyin.'),
(320,	'',	'bank_transfer',	'Bank transfer',	'التحويل المصرفي',	'overschrijving',	'virement',	'Banküberweisung',	'банковский перевод',	'transferencia bancaria',	'banka transferi'),
(321,	'',	'bank_transfer_request',	'Your request has been successfully sent, we will notify you once it&#039;s approved.',	'تم إرسال طلبك بنجاح ، وسوف نخطرك بمجرد الموافقة عليه.',	'Uw verzoek is succesvol verzonden, wij zullen u op de hoogte brengen zodra het is goedgekeurd.',	'Votre demande a été envoyée avec succès, nous vous en informerons une fois approuvée.',	'Ihre Anfrage wurde erfolgreich gesendet, wir werden Sie benachrichtigen, sobald sie genehmigt wurde.',	'Ваш запрос был успешно отправлен, мы сообщим вам, как только он будет одобрен.',	'Su solicitud ha sido enviada exitosamente, le notificaremos una vez que sea aprobada.',	'İsteğiniz başarıyla gönderildi, onaylandığında size bildireceğiz.'),
(322,	'',	'paypal',	'PayPal',	'باي بال',	'PayPal',	'Pay Pal',	'PayPal',	'PayPal',	'PayPal',	'PayPal'),
(323,	'',	'credit_card',	'Credit Card',	'بطاقة الائتمان',	'Kredietkaart',	'Carte de crédit',	'Kreditkarte',	'Кредитная карта',	'Tarjeta de crédito',	'Kredi kartı'),
(324,	'',	'pro_members',	'Pro Members',	'الأعضاء المحترفين',	'Pro-leden',	'Membres Pro',	'Pro Mitglieder',	'Про Члены',	'Miembros Pro',	'Pro Üyeler'),
(325,	'',	'boost_post',	'Boost Post',	'يعلن منشورا',	'Boostpost',	'Boost Post',	'Boost Post',	'Boost Post',	'Boost Post',	'Gönderiyi Artır'),
(326,	'',	'unboost_post',	'UnBoost Post',	'إلغاء نشر بوست',	'UnBoost-bericht',	'UnBoost Post',	'UnBoost Post',	'UnBoost Post',	'Publicar unBoost',	'Gönderiyi Kaldır'),
(327,	'',	'new_profile',	'Pro Profile',	'برو الشخصي',	'Pro profiel',	'Profil pro',	'Pro-Profil',	'Про Профиль',	'Pro Profile',	'Pro Profili'),
(328,	'',	'default_profile',	'Default Profile',	'الملف الشخصي الافتراضي',	'Standaard profiel',	'Profil par défaut',	'Standard Profil',	'Профиль по умолчанию',	'Perfil por defecto',	'Varsayılan Profil'),
(329,	'',	'profile_style',	'Unique Profile Style',	'نمط الملف الشخصي الفريد',	'Unieke profielstijl',	'Style de profil unique',	'Einzigartiger Profilstil',	'Уникальный стиль профиля',	'Estilo de perfil único',	'Benzersiz Profil Stili'),
(330,	'',	'pro_member',	'Pro Member',	'عضو محترف',	'Pro Lid',	'Membre Pro',	'Pro-Mitglied',	'Pro Member',	'Miembro Pro',	'Pro Üyesi'),
(331,	'',	'boosted_posts',	'Boosted Posts',	'المشاركات المعززة',	'Versterkte berichten',	'Messages boostés',	'Boosted Posts',	'Усиленные посты',	'Publicaciones mejoradas',	'Yükseltilmiş Gönderiler'),
(332,	'',	'wallet',	'Wallet',	'محفظة نقود',	'Portemonnee',	'Portefeuille',	'Brieftasche',	'Бумажник',	'Billetera',	'Cüzdan'),
(333,	'',	'bank_decline',	'Your bank receipt has been declined!',	'تم رفض إيصالك المصرفي!',	'Uw bankbewijs is geweigerd!',	'Votre ticket de banque a été refusé!',	'Ihr Bankbeleg wurde abgelehnt!',	'Ваша банковская квитанция была отклонена!',	'Su recibo bancario ha sido rechazado!',	'Banka dekontunuz reddedildi!'),
(334,	'',	'bank_pro',	'Your bank receipt has been approved!',	'تمت الموافقة على إيصالك المصرفي!',	'Uw bank-factuur is goedgekeurd!',	'Votre reçu de banque a été approuvé!',	'Ihre Bankquittung wurde genehmigt!',	'Ваша банковская квитанция была подтверждена!',	'Su recibo bancario ha sido aprobado!',	'Banka dekontunuz onaylandı!'),
(335,	'',	'advertising',	'Advertising',	'إعلان',	'Advertising',	'La publicité',	'Werbung',	'реклама',	'Publicidad',	'reklâm'),
(336,	'',	'id',	'ID',	'هوية شخصية',	'ID kaart',	'ID',	'ICH WÜRDE',	'Я БЫ',	'CARNÉ DE IDENTIDAD',	'İD'),
(337,	'',	'company',	'Company',	'شركة',	'Bedrijf',	'Entreprise',	'Unternehmen',	'Компания',	'Empresa',	'şirket'),
(338,	'',	'bidding',	'Bidding',	'مزايدة',	'bod',	'Enchère',	'Bieten',	'торги',	'Ofertas',	'teklif verme'),
(339,	'',	'clicks',	'Clicks',	'نقرات',	'klikken',	'Clics',	'Klicks',	'щелчки',	'Clics',	'Tıklanma'),
(340,	'',	'views',	'Views',	'الآراء',	'Keer bekeken',	'Des vues',	'Ansichten',	'Просмотры',	'Puntos de vista',	'Görünümler'),
(341,	'',	'status',	'Status',	'الحالة',	'staat',	'Statut',	'Status',	'Статус',	'Estado',	'durum'),
(342,	'',	'action',	'Action',	'عمل',	'Actie',	'action',	'Aktion',	'действие',	'Acción',	'Aksiyon'),
(343,	'',	'create',	'Create',	'خلق',	'creëren',	'Créer',	'Erstellen',	'Создайте',	'Crear',	'yaratmak'),
(344,	'',	'url',	'Target URL',	'الرابط',	'Doel-URL',	'Cible URL',	'Ziel-URL',	'Целевой URL',	'URL de destino',	'Hedef URL'),
(345,	'',	'title',	'Title',	'عنوان',	'Titel',	'Titre',	'Titel',	'заглавие',	'Título',	'Başlık'),
(346,	'',	'description',	'Description',	'وصف',	'Omschrijving',	'La description',	'Beschreibung',	'Описание',	'Descripción',	'Açıklama'),
(347,	'',	'location',	'Location',	'موقعك',	'Plaats',	'Emplacement',	'Ort',	'Место нахождения',	'Ubicación',	'yer'),
(348,	'',	'pay_per_click',	'Pay Per Click ({{PRICE}})',	'الدفع بالنقرة ({{PRICE}})',	'Betaal per klik ({{PRICE}})',	'Pay Per Click ({{PRIX}})',	'Pay Per Click ({{PRICE}})',	'Оплата за клик ({{PRICE}})',	'Pago por clic ({{PRICE}})',	'Tıklama Başına Ödeme ({{PRICE}})'),
(349,	'',	'pay_per_imprssion',	'Pay Per Impression ({{PRICE}})',	'الدفع لكل ظهور ({{PRICE}})',	'Betaal per vertoning ({{PRICE}})',	'Paiement par impression ({{PRICE}})',	'Pay Per Impression ({{PRICE}})',	'Оплата за показ ({{PRICE}})',	'Pago por impresión ({{PRICE}})',	'Gösterim Başına Ödeme ({{PRICE}})'),
(350,	'',	'sidebar',	'Sidebar',	'الشريط الجانبي',	'sidebar',	'Barre latérale',	'Seitenleiste',	'Боковая панель',	'Barra lateral',	'Kenar çubuğu'),
(351,	'',	'placement',	'Placement',	'تحديد مستوى',	'Plaatsing',	'Placement',	'Platzierung',	'размещение',	'Colocación',	'Yerleştirme'),
(352,	'',	'upload_file',	'Upload Photo',	'حمل الصورة',	'Upload foto',	'Envoyer la photo',	'Foto hochladen',	'Загрузить фото',	'Subir foto',	'Fotoğraf yükle'),
(353,	'',	'submit',	'Submit',	'خضع',	'voorleggen',	'Soumettre',	'einreichen',	'Отправить',	'Enviar',	'Gönder'),
(354,	'',	'url_invalid',	'Please use a valid URL.',	'يرجى استخدام عنوان URL صالح.',	'Gebruik alstublieft een geldige URL.',	'Veuillez utiliser une URL valide.',	'Bitte verwenden Sie eine gültige URL.',	'Пожалуйста, используйте действительный URL.',	'Por favor, use una URL válida.',	'Lütfen geçerli bir URL kullanın.'),
(355,	'',	'top_wallet',	'Please top up your wallet.',	'يرجى تعبئة محفظتك.',	'Gelieve uw portemonnee te herladen.',	'S&#039;il vous plaît recharger votre portefeuille.',	'Bitte füllen Sie Ihre Geldbörse auf.',	'Пожалуйста, пополните свой кошелек.',	'Por favor recargue su billetera.',	'Lütfen cüzdanını doldur.'),
(356,	'',	'ad_created',	'Your ad has been successfully created.',	'تم إنشاء إعلانك بنجاح.',	'Uw advertentie is succesvol gemaakt.',	'Votre annonce a été créée avec succès.',	'Ihre Anzeige wurde erfolgreich erstellt.',	'Ваше объявление было успешно создано.',	'Su anuncio ha sido creado con éxito.',	'Reklamınız başarıyla oluşturuldu.'),
(357,	'',	'all',	'All',	'الكل',	'Allemaal',	'Tout',	'Alles',	'Все',	'Todos',	'Herşey'),
(358,	'',	'media_not_supported',	'Media file is not supported.',	'ملف الوسائط غير مدعوم.',	'Mediabestand wordt niet ondersteund.',	'Le fichier multimédia n&#039;est pas pris en charge.',	'Mediendatei wird nicht unterstützt.',	'Медиа-файл не поддерживается.',	'El archivo multimedia no es compatible.',	'Medya dosyası desteklenmiyor.'),
(359,	'',	'ad_edited',	'Your ad has been successfully updated.',	'تم تحديث إعلانك بنجاح.',	'Uw advertentie is succesvol bijgewerkt.',	'Votre annonce a été mise à jour avec succès.',	'Ihre Anzeige wurde erfolgreich aktualisiert.',	'Ваше объявление было успешно обновлено.',	'Su anuncio ha sido actualizado con éxito.',	'Reklamınız başarıyla güncellendi.'),
(360,	'',	'ad_not_found',	'Ad not found.',	'لم يتم العثور على الإعلان.',	'Advertentie niet gevonden.',	'Annonce non trouvée.',	'Anzeige nicht gefunden',	'Объявление не найдено.',	'Anuncio no encontrado.',	'Reklam bulunamadı.'),
(361,	'',	'not_active',	'Not Active',	'غير نشيط',	'Niet actief',	'Pas actif',	'Nicht aktiv',	'Не активен',	'No activo',	'Aktif değil'),
(362,	'',	'delete_ad',	'Delete Ad',	'حذف الإعلان',	'Advertentie verwijderen',	'Supprimer une annonce',	'Anzeige löschen',	'Удалить объявление',	'Eliminar anuncio',	'Reklamı Sil'),
(363,	'',	'confirm_del_ad',	'Are you sure you want to delete this ad? this action can not be undo.',	'هل أنت متأكد أنك تريد حذف هذا الإعلان؟ لا يمكن التراجع عن هذا الإجراء.',	'Weet je zeker dat je deze advertentie wilt verwijderen? deze actie kan niet ongedaan worden gemaakt.',	'Êtes-vous sûr de vouloir supprimer cette annonce? cette action ne peut pas être annulée.',	'Möchten Sie diese Anzeige wirklich löschen? Diese Aktion kann nicht rückgängig gemacht werden.',	'Вы уверены, что хотите удалить эту рекламу? это действие не может быть отменено.',	'¿Estás seguro de que quieres eliminar esta publicidad? Esta acción no se puede deshacer.',	'Bu reklamı silmek istediğinize emin misiniz? bu işlem geri alınamaz.'),
(364,	'',	'edit_ad',	'Edit Ad',	'تحرير الإعلان',	'Bewerk advertentie',	'Modifier une annonce',	'Anzeige bearbeiten',	'Изменить объявление',	'Editar Anuncio',	'Reklamı Düzenle'),
(365,	'',	'sponsored',	'Sponsored',	'برعاية',	'Sponsored',	'Sponsorisé',	'Gesponsert',	'Рекламные',	'Patrocinado',	'Sponsor'),
(366,	'',	'featured_member',	'Featured member',	'عضو مميز',	'Uitgelicht lid',	'Membre vedette',	'Vorgestelltes Mitglied',	'Избранный участник',	'Miembro destacado',	'Öne çıkan üye'),
(367,	'',	'verified_badge',	'Verified badge',	'شارة التحقق',	'Geverifieerde badge',	'Badge vérifié',	'Verifizierter Ausweis',	'Проверенный значок',	'Insignia verificada',	'Doğrulanmış rozet'),
(368,	'',	'posts_promotion',	'Posts promotion',	'المشاركات الترويج',	'Promotie van berichten',	'Postes en promotion',	'Beiträge Promotion',	'Продвижение постов',	'Promocion de publicaciones',	'Yayın promosyonu'),
(369,	'',	'profile_Style',	'Unique Profile Style',	'نمط الملف الشخصي الفريد',	'Unieke profielstijl',	'Style de profil unique',	'Einzigartiger Profilstil',	'Уникальный стиль профиля',	'Estilo de perfil único',	'Benzersiz Profil Stili'),
(370,	'',	'please_wait',	'Please wait..',	'ارجوك انتظر..',	'Wacht alsjeblieft..',	'S&#039;il vous plaît, attendez..',	'Warten Sie mal..',	'Пожалуйста, подождите..',	'Por favor espera..',	'Lütfen bekle..'),
(371,	'',	'business_account',	'Business account',	'حساب الأعمال',	'Zakelijke account',	'Compte commercial',	'Geschäftskonto',	'Бизнес аккаунт',	'Cuenta de negocios',	'İş hesabı'),
(372,	'',	'account_analytics',	'Account analytics',	'تحليلات الحساب',	'Accountanalyse',	'Analyse de compte',	'Kontoanalyse',	'Аналитика аккаунта',	'Análisis de cuentas',	'Hesap analitiği'),
(373,	'',	'today',	'Today',	'اليوم',	'Vandaag',	'Aujourd&#039;hui',	'Heute',	'сегодня',	'Hoy',	'Bugün'),
(374,	'',	'this_week',	'This Week',	'هذا الاسبوع',	'Deze week',	'Cette semaine',	'Diese Woche',	'На этой неделе',	'Esta semana',	'Bu hafta'),
(375,	'',	'this_month',	'This Month',	'هذا الشهر',	'Deze maand',	'Ce mois-ci',	'Diesen Monat',	'Этот месяц',	'Este mes',	'Bu ay'),
(376,	'',	'this_year',	'This Year',	'هذا العام',	'Dit jaar',	'Cette année',	'Dieses Jahr',	'В этом году',	'Este año',	'Bu yıl'),
(377,	'',	'withdraw',	'Withdrawal',	'انسحاب',	'het terugtrekken',	'Retrait',	'Rückzug',	'Вывод',	'Retirada',	'Para çekme'),
(378,	'',	'available_balance',	'Available Balance',	'الرصيد المتوفر',	'beschikbaar saldo',	'Solde disponible',	'Verfügbares Guthaben',	'доступные средства',	'Saldo disponible',	'Kalan bakiye'),
(379,	'',	'paypal_email',	'PayPal E-mail',	'بريد باي بال',	'Paypal E-mail',	'Email Paypal',	'Paypal Email',	'PayPal E-mail',	'E-mail de Paypal',	'PayPal E-posta'),
(380,	'',	'amount',	'Amount',	'كمية',	'Bedrag',	'Montant',	'Menge',	'Количество',	'Cantidad',	'Miktar'),
(381,	'',	'min',	'Min',	'دقيقة',	'min',	'Min',	'Mindest',	'Min',	'Min',	'Min'),
(382,	'',	'amount_more_balance',	'The requested amount can not be more than your actual balance.',	'لا يمكن أن يكون المبلغ المطلوب أكثر من رصيدك الفعلي.',	'Het gevraagde bedrag kan niet meer zijn dan uw werkelijke saldo.',	'Le montant demandé ne peut être supérieur à votre solde réel.',	'Der angeforderte Betrag kann nicht mehr als Ihr tatsächlicher Kontostand betragen.',	'Запрашиваемая сумма не может превышать ваш фактический баланс.',	'La cantidad solicitada no puede ser más que su saldo real.',	'İstenen miktar, gerçek bakiyenizden fazla olamaz.'),
(383,	'',	'amount_less_50',	'The requested amount can not be less than',	'المبلغ المطلوب لا يمكن أن يكون أقل من',	'Het gevraagde bedrag kan niet kleiner zijn dan',	'Le montant demandé ne peut être inférieur à',	'Der angeforderte Betrag kann nicht geringer sein als',	'Запрашиваемая сумма не может быть меньше',	'La cantidad solicitada no puede ser inferior a',	'İstenilen miktardan az olamaz'),
(384,	'',	'cant_request_withdrawal',	'You can not submit withdrawal request until the previous requests has been approved / rejected.',	'لا يمكنك إرسال طلب السحب حتى تتم الموافقة على / رفض الطلبات السابقة.',	'U kunt geen opnameverzoek indienen totdat de vorige verzoeken zijn goedgekeurd / afgewezen.',	'Vous ne pouvez pas soumettre de demande de retrait avant que les demandes précédentes aient été approuvées / rejetées.',	'Sie können eine Auszahlungsanforderung erst absenden, wenn die vorherigen Anforderungen genehmigt / abgelehnt wurden.',	'Вы не можете подать запрос на снятие средств, пока предыдущие запросы не были одобрены / отклонены.',	'No puede enviar una solicitud de retiro hasta que las solicitudes anteriores hayan sido aprobadas / rechazadas.',	'Önceki istekler onaylanıp reddedilene kadar para çekme talebi gönderemezsiniz.'),
(385,	'',	'withdrawal_request_sent',	'Your withdrawal request has been successfully sent!',	'تم إرسال طلب السحب الخاص بك بنجاح!',	'Uw opnameverzoek is met succes verzonden!',	'Votre demande de retrait a été envoyée avec succès!',	'Ihre Auszahlungsanfrage wurde erfolgreich gesendet!',	'Ваш запрос на вывод средств был успешно отправлен!',	'Su solicitud de retiro ha sido enviada con éxito!',	'Para çekme isteğiniz başarıyla gönderildi!'),
(386,	'',	'requested_at',	'Requested at',	'طلب في',	'Gevraagd om',	'Demandé à',	'Angefordert bei',	'Запрошено в',	'Solicitado en',	'Talep edildi'),
(387,	'',	'paid',	'Paid',	'دفع',	'Betaald',	'Payé',	'Bezahlt',	'оплаченный',	'Pagado',	'Ücretli'),
(388,	'',	'pending',	'Pending',	'قيد الانتظار',	'In afwachting',	'en attendant',	'steht aus',	'в ожидании',	'Pendiente',	'kadar'),
(389,	'',	'declined',	'Declined',	'رفض',	'Afgewezen',	'Diminué',	'Abgelehnt',	'Отклонено',	'Rechazado',	'Reddedilen'),
(390,	'',	'raise_money',	'Raise Money',	'جمع المال',	'Geld inzamelen',	'Amasser de l&#039;argent',	'Geld sammeln',	'Собирать деньги',	'Recaudar dinero',	'Para toplamak'),
(391,	'',	'funding_acquisition',	'Create new funding request',	'إنشاء طلب تمويل جديد',	'Maak een nieuw financieringsverzoek',	'Créer une nouvelle demande de financement',	'Neue Finanzierungsanfrage erstellen',	'Создать новый запрос на финансирование',	'Crear nueva solicitud de financiación',	'Yeni fon talebi yarat'),
(392,	'',	'funding_created',	'Funding request has been successfully created.',	'تم إنشاء طلب التمويل بنجاح.',	'Financieringsaanvraag is succesvol aangemaakt.',	'La demande de financement a été créée avec succès.',	'Finanzierungsanfrage wurde erfolgreich erstellt.',	'Запрос на финансирование был успешно создан.',	'Solicitud de financiación ha sido creado con éxito.',	'Finansman isteği başarıyla oluşturuldu.'),
(393,	'',	'raised_of',	'Raised of',	'أثارت من',	'Opgeheven van',	'Élevé de',	'Angehoben von',	'Поднял из',	'Planteado de',	'Yükseltilmiş'),
(394,	'',	'funding',	'Create new funding request',	'إنشاء طلب تمويل جديد',	'Maak een nieuw financieringsverzoek',	'Créer une nouvelle demande de financement',	'Neue Finanzierungsanfrage erstellen',	'Создать новый запрос на финансирование',	'Crear nueva solicitud de financiación',	'Yeni fon talebi yarat'),
(395,	'',	'load_more',	'Load More',	'تحميل المزيد',	'Meer laden',	'Charger plus',	'Mehr laden',	'Загрузи больше',	'Carga más',	'Daha fazla yükle'),
(396,	'',	'donate',	'Donate',	'تبرع',	'schenken',	'Faire un don',	'Spenden',	'жертвовать',	'Donar',	'bağışlamak'),
(397,	'',	'fund_not_found',	'Funding request not found',	'طلب تمويل غير موجود',	'Financieringsaanvraag niet gevonden',	'Demande de financement non trouvée',	'Finanzierungsanfrage nicht gefunden',	'Запрос на финансирование не найден',	'Solicitud de financiación no encontrada',	'Fon talebi bulunamadı'),
(398,	'',	'donated',	'donated to your request.',	'تبرع لك',	'Doneer je',	'Vous faire un don',	'Spende dich',	'Подарить тебе',	'Donate',	'Sana bağış'),
(399,	'',	'recent_donations',	'Recent donations',	'التبرعات الأخيرة',	'Recente donaties',	'Dons récents',	'Letzte Spenden',	'Недавние пожертвования',	'Donaciones recientes',	'Son bağışlar'),
(400,	'',	'total_donations',	'Total donations',	'مجموع التبرعات',	'Totale donaties',	'Total des dons',	'Spenden insgesamt',	'Всего пожертвований',	'Donaciones totales',	'Toplam bağış'),
(401,	'',	'user_funding',	'Funding Requests',	'طلبات التمويل',	'Financieringsverzoeken',	'Demandes de financement',	'Finanzierungsanträge',	'Запросы на финансирование',	'Solicitudes de financiación',	'Finansman Talepleri'),
(402,	'',	'no_funding_yet',	'There are no funding requests yet.',	'لا توجد طلبات تمويل بعد.',	'Er zijn nog geen financieringsverzoeken.',	'Il n&#039;y a pas encore de demande de financement.',	'Es gibt noch keine Finanzierungsanträge.',	'Пока нет запросов на финансирование.',	'No hay solicitudes de financiación todavía.',	'Henüz bir fon talebi yok.'),
(403,	'',	'requested',	'Requested',	'طلب',	'Aangevraagd',	'Demandé',	'Beantragt',	'запрошенный',	'Pedido',	'Talep edilen'),
(404,	'',	'follow_requests',	'Follow Requests',	'متابعة الطلبات',	'Volg Verzoeken',	'Suivre les demandes',	'Anfragen folgen',	'Следуйте запросам',	'Seguir Solicitudes',	'İstekleri takip et'),
(405,	'',	'is_following_you',	'is following you now',	'يتابعك الآن',	'volgt je nu',	'vous suit maintenant',	'folgt dir jetzt',	'следит за тобой сейчас',	'te esta siguiendo ahora',	'şimdi seni takip ediyor'),
(406,	'',	'accept_request',	'accepted your follow request',	'قبلت طلب المتابعة الخاص بك',	'accepteerde uw volgverzoek',	'accepté votre demande de suivi',	'Ihre Anfrage wurde akzeptiert',	'принял ваш запрос',	'aceptó su solicitud de seguimiento',	'takip isteğini kabul et'),
(407,	'',	'accept',	'Accept',	'قبول',	'Aanvaarden',	'Acceptez',	'Akzeptieren',	'принимать',	'Aceptar',	'Kabul etmek'),
(408,	'',	'u_dont_have_requests',	'You do not have any requests',	'ليس لديك أي طلبات',	'U hebt geen verzoeken',	'Vous n&#039;avez aucune demande',	'Sie haben keine Anfragen',	'У вас нет запросов',	'No tienes ninguna petición.',	'Herhangi bir isteğiniz yok'),
(409,	'',	'business_name',	'Business Name',	'الاسم التجاري',	'Bedrijfsnaam',	'Nom de l&#039;entreprise',	'Geschäftsname',	'Наименование фирмы',	'Nombre del Negocio',	'iş adı'),
(410,	'',	'phone_number',	'Phone Number',	'رقم الهاتف',	'Telefoonnummer',	'Numéro de téléphone',	'Telefonnummer',	'Номер телефона',	'Número de teléfono',	'Telefon numarası'),
(411,	'',	'bus_request_done',	'Your request has been submitted and under review.',	'تم تقديم طلبك وقيد المراجعة.',	'Uw aanvraag is ingediend en wordt beoordeeld.',	'Votre demande a été soumise et en cours de révision.',	'Ihre Anfrage wurde übermittelt und wird geprüft.',	'Ваш запрос был отправлен и находится на рассмотрении.',	'Su solicitud ha sido enviada y en revisión.',	'İsteğiniz gönderildi ve incelendi.'),
(412,	'',	'edit_funding',	'Edit funding request',	'تحرير طلب التمويل',	'Bewerkingsverzoek bewerken',	'Modifier la demande de financement',	'Finanzierungsanfrage bearbeiten',	'Изменить заявку на финансирование',	'Editar solicitud de financiación',	'Finansman talebini düzenle'),
(413,	'',	'funding_edited',	'Funding request has been successfully updated.',	'تم تحديث طلب التمويل بنجاح.',	'Financieringsaanvraag is succesvol bijgewerkt.',	'La demande de financement a été mise à jour avec succès.',	'Finanzierungsanfrage wurde erfolgreich aktualisiert.',	'Запрос на финансирование был успешно обновлен.',	'Solicitud de financiación se ha actualizado con éxito.',	'Fon talebi başarıyla güncellendi.'),
(414,	'',	'call_now',	'Call now',	'اتصل الان',	'Bel nu',	'Appelle maintenant',	'Jetzt anrufen',	'Позвони сейчас',	'Llama ahora',	'Şimdi ara'),
(415,	'',	'go_to',	'Go to',	'اذهب إلى',	'Ga naar',	'Aller à',	'Gehe zu',	'Идти к',	'Ir',	'Git'),
(416,	'',	'send_email',	'Send email',	'ارسل بريد الكتروني',	'Verzend e-mail',	'Envoyer un email',	'E-Mail senden',	'Отправить письмо',	'Enviar correo electrónico',	'Eposta gönder'),
(417,	'',	'read_more',	'Read more',	'قراءة المزيد',	'Lees verder',	'Lire la suite',	'Weiterlesen',	'Прочитайте больше',	'Lee mas',	'Daha fazla oku'),
(418,	'',	'shop_now',	'Shop now',	'تسوق الآن',	'Winkel nu',	'Achetez maintenant',	'Jetzt einkaufen',	'Магазин сейчас',	'Compra ahora',	'Şimdi satın al'),
(419,	'',	'view_now',	'View now',	'عرض الآن',	'Kijk nu',	'Voir maintenant',	'Jetzt ansehen',	'Смотри сейчас',	'Ver ahora',	'Şimdi göster'),
(420,	'',	'visit_now',	'Visit now',	'زيارة الآن',	'Bezoek nu',	'Visitez maintenant',	'Jetzt besuchen',	'Посетите сейчас',	'Visitar ahora',	'Şimdi ziyaret'),
(421,	'',	'book_now',	'Book now',	'احجز الآن',	'Boek nu',	'Reserve maintenant',	'Buchen Sie jetzt',	'Забронируйте сейчас',	'Reservar ahora',	'Şimdi rezervasyon yap'),
(422,	'',	'learn_more',	'Learn more',	'أعرف أكثر',	'Kom meer te weten',	'Apprendre encore plus',	'Mehr erfahren',	'Учить больше',	'Aprende más',	'Daha fazla bilgi edin'),
(423,	'',	'play_now',	'Play now',	'العب الان',	'Nu afspelen',	'Joue maintenant',	'Jetzt spielen',	'Играть сейчас',	'Reproducir ahora',	'Şimdi oyna'),
(424,	'',	'bet_now',	'Bet now',	'الرهان الآن',	'Wed nu',	'Parier maintenant',	'Wetten Sie jetzt',	'Ставка сейчас',	'Apuesta ahora',	'Şimdi bahis yap'),
(425,	'',	'apply_here',	'Apply here',	'قدم هنا',	'Voeg hier toe',	'Appliquer ici',	'Hier bewerben',	'Подать заявку здесь',	'Aplicar aquí',	'Buraya uygula'),
(426,	'',	'quote_here',	'Quote here',	'اقتبس هنا',	'Quote hier',	'Citez ici',	'Hier zitieren',	'Цитировать здесь',	'Cita aqui',	'Burada alıntı yap'),
(427,	'',	'order_now',	'Order now',	'اطلب الان',	'Bestel nu',	'Commandez maintenant',	'Jetzt bestellen',	'Заказать сейчас',	'Ordenar ahora',	'Şimdi sipariş ver'),
(428,	'',	'book_tickets',	'Book tickets',	'حجز التذاكر',	'Boek tickets',	'Réserver des billets',	'Tickets buchen',	'Забронировать билеты',	'Reservar pasajes',	'Kitap biletleri'),
(429,	'',	'enroll_now',	'Enroll now',	'تسجيل الآن',	'Schrijf nu in',	'Inscrivez-vous maintenant',	'Jetzt anmelden',	'Зарегистрируйтесь сейчас',	'Enlístate ahora',	'Şimdi kayıt'),
(430,	'',	'find_card',	'Find a card',	'العثور على بطاقة',	'Zoek een kaart',	'Trouver une carte',	'Eine Karte finden',	'Найти карту',	'Encontrar una tarjeta',	'Bir kart bul'),
(431,	'',	'get_quote',	'Get a quote',	'إقتبس',	'Vraag een offerte aan',	'Obtenir un devis',	'Ein Angebot bekommen',	'Получить цитату',	'Consigue una cotización',	'Bir teklif alın'),
(432,	'',	'get_tickets',	'Get tickets',	'أحصل على تذاكر',	'Krijg kaartjes',	'Procurez-vous des billets',	'Tickets bekommen',	'Получить билеты',	'Conseguir entradas',	'Bilet al'),
(433,	'',	'locate_dealer',	'Locate a dealer',	'تحديد موقع تاجر',	'Zoek een dealer',	'Localiser un revendeur',	'Finden Sie einen Händler',	'Найдите дилера',	'Encuentra un distribuidor',	'Bir satıcı bulun'),
(434,	'',	'order_online',	'Order online',	'اطلب عبر الإنترنت',	'Bestel online',	'Commander en ligne',	'Online bestellen',	'Заказать онлайн',	'Comprar online',	'Online sipariş ver'),
(435,	'',	'preorder_now',	'Preorder now',	'Preorder الآن',	'Bestel nu vooraf',	'Pré commandez maintenant',	'Jetzt vorbestellen',	'Предварительный заказ сейчас',	'Preordenar ahora',	'Ön sipariş ver'),
(436,	'',	'schedule_now',	'Schedule now',	'الجدول الزمني الآن',	'Plan nu',	'Horaire maintenant',	'Jetzt planen',	'Расписание сейчас',	'Programar ahora',	'Şimdi planla'),
(437,	'',	'sign_up_now',	'Sign up now',	'أفتح حساب الأن',	'Meld je nu aan',	'S&#039;inscrire maintenant',	'Jetzt registrieren',	'Войти Сейчас',	'Regístrate ahora',	'Şimdi kayıt ol'),
(438,	'',	'subscribe',	'Subscribe',	'الاشتراك',	'abonneren',	'Souscrire',	'Abonnieren',	'Подписывайся',	'Suscribir',	'Abone ol'),
(439,	'',	'register_now',	'Register now',	'سجل الان',	'Registreer nu',	'inscrire maintenant',	'Jetzt registrieren',	'Зарегистрироваться',	'Regístrate ahora',	'Şimdi üye Ol'),
(440,	'',	'call_to_target_url',	'Call to target url',	'دعوة لاستهداف رابط',	'Call naar doel-URL',	'Appeler pour cibler l&#039;URL',	'Rufen Sie die Ziel-URL auf',	'Звоните на целевой URL',	'Llamar a la URL de destino',	'URL&#039;yi hedeflemek için arayın'),
(441,	'',	'call_to_action',	'Call to action',	'دعوة إلى العمل',	'Oproep tot actie',	'Appel à l&#039;action',	'Aufruf zum Handeln',	'Призыв к действию',	'Llamada a la acción',	'Eylem çağrısı'),
(442,	'',	'reply',	'Reply',	'الرد',	'Antwoord',	'Répondre',	'Antworten',	'Ответить',	'Respuesta',	'cevap'),
(443,	'',	'how_it_works',	'How it works',	'كيف تعمل',	'Hoe het werkt',	'Comment ça marche',	'Wie es funktioniert',	'Как это устроено',	'Cómo funciona',	'Nasıl çalışır'),
(444,	'',	'earn_money',	'Earn Money',	'يكتسب نقود',	'Geld verdienen',	'Gagner de l&#039;argent',	'Geld verdienen',	'Зарабатывайте деньги',	'Ganar dinero',	'Para kazan'),
(445,	'',	'users_register',	'Users Register',	'تسجيل المستخدمين',	'Gebruikers registreren',	'Registre des utilisateurs',	'Benutzer registrieren',	'Регистрация пользователей',	'Registro de Usuarios',	'Kullanıcılar Kayıt'),
(446,	'',	'share_link',	'Share Link',	'حصة الرابط',	'Deel link',	'Lien de partage',	'Einen Link teilen',	'Поделиться ссылкой',	'Compartir enlace',	'Linki paylaş'),
(447,	'',	'add',	'Add',	'إضافة',	'Toevoegen',	'Ajouter',	'Hinzufügen',	'добавлять',	'Añadir',	'Eklemek'),
(448,	'',	'add_money',	'Add Money',	'إضافة المال',	'Voeg geld toe',	'Ajouter de l&#039;argent',	'Geld hinzufügen',	'Добавить деньги',	'Agregar dinero',	'Para ekle'),
(449,	'',	'free_member',	'Free Member',	'عضو مجاني',	'gratis lid',	'Membre gratuit',	'Freies Mitglied',	'Бесплатный участник',	'miembro gratuito',	'Ücretsiz Üye'),
(450,	'',	'stay_free',	'Stay Free',	'ابق حرا',	'Blijf vrij',	'Reste libre',	'Bleibe frei',	'Оставайся свободным',	'Mantente Libre',	'Ücretsiz kalın'),
(451,	'',	'enjoy_more_features',	'Enjoy more Features with out pro package!',	'استمتع بمزيد من الميزات مع حزمة خارج الموالية!',	'Geniet van meer functies zonder pro-pakket!',	'Profitez de plus de fonctionnalités avec le forfait pro!',	'Genießen Sie weitere Funktionen mit unserem Pro-Paket!',	'Наслаждайтесь большим количеством функций без нашего профессионального пакета!',	'Disfrute de más características con nuestro paquete pro!',	'Profesyonel paketi olmayan daha fazla özelliğin tadını çıkarın!'),
(452,	'',	'join_pro',	'Join Pro!',	'انضمام برو!',	'Word lid van Pro!',	'Rejoignez Pro!',	'Pro beitreten',	'Присоединяйтесь к Pro!',	'Únete a Pro!',	'Pro&#039;ya katıl!'),
(453,	'',	'posts_promote_up',	'Promote up to',	'تعزيز ما يصل الى',	'Promoot tot',	'Promouvoir jusqu&#039;à',	'Bis zu fördern',	'Продвигать до',	'Promocionar hasta',	'Kadar terfi'),
(454,	'',	'funding_requets',	'Funding Requests',	'طلبات التمويل',	'Financieringsverzoeken',	'Demandes de financement',	'Finanzierungsanträge',	'Запросы на финансирование',	'Solicitudes de financiación',	'Finansman Talepleri'),
(455,	'',	'per_month',	'per month',	'كل شهر',	'per maand',	'par mois',	'pro Monat',	'в месяц',	'por mes',	'her ay'),
(456,	'blog_categories',	'1309',	'Comedy',	'كوميديا',	'Komedie',	'La comédie',	'Komödie',	'комедия',	'Comedia',	'Komedi'),
(457,	'blog_categories',	'1310',	'Cars and Vehicles',	'السيارات والمركبات',	'Auto&#39;s en voertuigen',	'Voitures et véhicules',	'Autos und Fahrzeuge',	'Автомобили и Транспорт',	'Autos y vehiculos',	'Otomobiller ve Araçlar'),
(458,	'blog_categories',	'1311',	'Economics and Trade',	'الاقتصاد والتجارة',	'Economie en handel',	'Économie et commerce',	'Wirtschaft und Handel',	'Экономика и торговля',	'Economía y comercio',	'Ekonomi ve Ticaret'),
(459,	'blog_categories',	'1312',	'Education',	'التعليم',	'Opleiding',	'Éducation',	'Bildung',	'образование',	'Educación',	'Eğitim'),
(460,	'blog_categories',	'1313',	'Entertainment',	'وسائل الترفيه',	'vermaak',	'Divertissement',	'Unterhaltung',	'Развлечения',	'Entretenimiento',	'Eğlence'),
(461,	'blog_categories',	'1314',	'Movies &amp; Animation',	'أفلام',	'Films',	'Films',	'Filme',	'Кино',	'Películas',	'filmler'),
(462,	'blog_categories',	'1315',	'Gaming',	'الألعاب',	'gaming',	'Gaming',	'Gaming',	'азартные игры',	'Juego de azar',	'kumar'),
(463,	'blog_categories',	'1316',	'History and Facts',	'التاريخ والحقائق',	'Geschiedenis en feiten',	'Histoire et faits',	'Geschichte und Fakten',	'История и факты',	'Historia y hechos',	'Tarihçe ve Gerçekler'),
(464,	'blog_categories',	'1317',	'Live Style',	'نمط الحياة',	'Levensstijl',	'Style de vie',	'Lebensstil',	'Стиль жизни',	'Estilo de vida',	'Yaşam tarzı'),
(465,	'blog_categories',	'1318',	'Natural',	'طبيعي &gt;&gt; صفة',	'natuurlijk',	'Naturel',	'Natürlich',	'натуральный',	'Natural',	'Doğal'),
(466,	'blog_categories',	'1319',	'News and Politics',	'الأخبار والسياسة',	'Nieuws en politiek',	'Actualités et politique',	'Nachrichten und Politik',	'Новости и Политика',	'Noticias y politica',	'Haberler ve Politika'),
(467,	'blog_categories',	'1320',	'People and Nations',	'الناس والأمم',	'Mensen en naties',	'Les gens et les nations',	'Menschen und Nationen',	'Люди и народы',	'Pueblos y naciones',	'İnsanlar ve Milletler'),
(468,	'blog_categories',	'1321',	'Pets and Animals',	'الحيوانات الأليفة والحيوانات',	'Huisdieren en dieren',	'Animaux et animaux',	'Haustiere und Tiere',	'Домашние животные и животные',	'Mascotas y animales',	'Evcil Hayvanlar ve Hayvanlar'),
(469,	'blog_categories',	'1322',	'Places and Regions',	'الأماكن والمناطق',	'Plaatsen en regio&#39;s',	'Lieux et régions',	'Orte und Regionen',	'Места и Регионы',	'Lugares y Regiones',	'Yerler ve Bölgeler'),
(470,	'blog_categories',	'1323',	'Science and Technology',	'العلوم والتكنولوجيا',	'Wetenschap en technologie',	'Science et technologie',	'Wissenschaft und Technik',	'Наука и технология',	'Ciencia y Tecnología',	'Bilim ve Teknoloji'),
(471,	'blog_categories',	'1324',	'Sport',	'رياضة',	'Sport',	'Sport',	'Sport',	'Sport',	'Deporte',	'Spor'),
(472,	'blog_categories',	'1325',	'Travel and Events',	'السفر والأحداث',	'Reizen en evenementen',	'Voyages et événements',	'Reisen und Veranstaltungen',	'Путешествия и События',	'Viajes y eventos',	'Seyahat ve Etkinlikler'),
(473,	'blog_categories',	'1326',	'Other',	'آخر',	'anders',	'Autre',	'Andere',	'Другие',	'Otro',	'Diğer'),
(474,	'',	'blog',	'Blog',	'مدونة',	'blog',	'Blog',	'Blog',	'Блог',	'Blog',	'Blog'),
(475,	'',	'explore_blog_desc',	'Explore all blog posts.',	'استكشاف جميع المشاركات بلوق.',	'Ontdek alle blogberichten.',	'Explorez tous les articles de blog.',	'Entdecken Sie alle Blog-Beiträge.',	'Изучите все сообщения в блоге.',	'Explore todas las publicaciones de blog.',	'Tüm blog gönderilerini keşfedin.'),
(476,	'',	'categories',	'Categories',	'الاقسام',	'Categorieën',	'Les catégories',	'Kategorien',	'категории',	'Categorías',	'Kategoriler'),
(477,	'store_categories',	'491',	'Abstract',	'نبذة مختصرة',	'Abstract',	'Abstrait',	'Abstrakt',	'Аннотация',	'Abstracto',	'soyut'),
(478,	'store_categories',	'492',	'Animals/Wildlife',	'الحيوانات / الحياة البرية',	'Animals / Wildlife',	'Animaux / Faune',	'Tiere / Wildlife',	'Животные / Дикая природа',	'Animales / Fauna',	'Hayvanlar / Vahşi Yaşam'),
(479,	'store_categories',	'493',	'Arts',	'فنون',	'Arts',	'Arts',	'Kunst',	'искусства',	'Letras',	'Sanat'),
(480,	'store_categories',	'494',	'Backgrounds/Textures',	'خلفيات / القوام',	'Achtergronden / Structuren',	'Arrière-plans / textures',	'Hintergründe / Texturen',	'Фоны / Текстуры',	'Fondos / Texturas',	'Arka / Dokular'),
(481,	'store_categories',	'495',	'Beauty/Fashion',	'الجمال / الموضة',	'Beauty / Mode',	'Beauté / Mode',	'Schönheit / Mode',	'Красота / Мода',	'Belleza / moda',	'Güzellik / Moda'),
(482,	'store_categories',	'496',	'Buildings/Landmarks',	'المباني / معالم',	'Gebouwen / Monumenten',	'Bâtiments / Monuments',	'Gebäude / Sehenswürdigkeiten',	'Здания / достопримечательности',	'Edificios / Monumentos',	'Binalar / Simgesel'),
(483,	'store_categories',	'497',	'Business/Finance',	'تمويل الأعمال التجارية',	'Bedrijfsfinanciering',	'Business/Finance',	'Unternehmensfinanzierung',	'Деловые финансы',	'Financiación de las empresas',	'İş finansı'),
(484,	'store_categories',	'498',	'Celebrities',	'مشاهير',	'Beroemdheden',	'Célébrités',	'Prominente',	'Знаменитости',	'Famosos',	'Ünlüler'),
(485,	'store_categories',	'499',	'Education',	'التعليم',	'Opleiding',	'Éducation',	'Bildung',	'образование',	'Educación',	'Eğitim'),
(486,	'store_categories',	'500',	'Food and drink',	'طعام و شراب',	'Eten en drinken',	'Nourriture et boisson',	'Essen und Trinken',	'Еда и напитки',	'Comida y bebida',	'Yiyecek ve içecek'),
(487,	'store_categories',	'501',	'Healthcare/Medical',	'الرعاية الصحية طب /',	'Gezondheidszorg / Medisch',	'Santé / Médical',	'Gesundheitswesen / Medizin',	'Здоровье / Медицина',	'Asistencia sanitaria / médica',	'Sağlık / Tıbbi'),
(488,	'store_categories',	'502',	'Holidays',	'العطل',	'Vakantie',	'Vacances',	'Ferien',	'каникулы',	'Vacaciones',	'Bayram'),
(489,	'store_categories',	'503',	'Industrial',	'صناعي',	'industrieel',	'Industriel',	'Industrie',	'промышленные',	'Industrial',	'Sanayi'),
(490,	'store_categories',	'504',	'Interiors',	'الداخلية',	'Interiors',	'Intérieurs',	'Innenräume',	'Интерьеры',	'Interiores',	'İç'),
(491,	'store_categories',	'505',	'Miscellaneous',	'متنوع',	'Diversen',	'Divers',	'Sonstiges',	'Разнообразный',	'Diverso',	'Çeşitli'),
(492,	'store_categories',	'506',	'Nature',	'طبيعة',	'Natuur',	'Nature',	'Natur',	'Природа',	'Naturaleza',	'Doğa'),
(493,	'store_categories',	'507',	'Objects',	'شاء',	'Voorwerpen',	'Objets',	'Objekte',	'Объекты',	'Objetos',	'Nesneler'),
(494,	'store_categories',	'508',	'Parks/Outdoor',	'الحدائق / في الهواء الطلق',	'Parken / Buiten',	'Parcs / Extérieur',	'Parks / Im Freien',	'Парки / Открытый',	'Parques / al aire libre',	'Parks / Açık'),
(495,	'store_categories',	'509',	'People',	'اشخاص',	'Mensen',	'Gens',	'Menschen',	'люди',	'Personas',	'İnsanlar'),
(496,	'store_categories',	'510',	'Religion',	'دين',	'Religie',	'Religion',	'Religion',	'религия',	'Religión',	'Din'),
(497,	'store_categories',	'511',	'Science',	'علم',	'Wetenschap',	'Science',	'Wissenschaft',	'Наука',	'Ciencia',	'Bilim'),
(498,	'store_categories',	'512',	'Signs/Symbols',	'علامات / الرموز',	'Signs / Symbols',	'Signes / symboles',	'Zeichen / Symbole',	'Знаки / Символы',	'Signos / Símbolos',	'İşaretler / Simgeler'),
(499,	'store_categories',	'513',	'Sports/Recreation',	'الرياضة / الترفيه',	'Sport / Recreatie',	'Sports/Recreation',	'Sport &amp; Erholung',	'Спорт / Отдых',	'Deportes y Recreación',	'Spor ve yenilenme'),
(500,	'store_categories',	'514',	'Technology',	'تقنية',	'Technologie',	'La technologie',	'Technologie',	'Технология',	'Tecnología',	'teknoloji'),
(501,	'store_categories',	'515',	'Transportation',	'وسائل النقل',	'vervoer',	'Transport',	'Transport',	'Транспорт',	'Transporte',	'taşımacılık'),
(502,	'store_categories',	'516',	'Vintage',	'عتيق',	'Wijnoogst',	'Ancien',	'Jahrgang',	'марочный',	'Vendimia',	'bağbozumu'),
(503,	'',	'store',	'Store',	'متجر',	'Winkel',	'le magasin',	'Geschäft',	'хранить',	'Almacenar',	'mağaza'),
(504,	'',	'upload',	'Upload',	'رفع',	'Uploaden',	'Télécharger',	'Hochladen',	'Загрузить',	'Subir',	'Yükleme'),
(505,	'',	'my_store',	'My Store',	'متجري',	'Mijn winkel',	'Mon magasin',	'Mein Laden',	'Мой магазин',	'Mi tienda',	'Benim hikayem'),
(506,	'',	'price',	'Price',	'السعر',	'Prijs',	'Prix',	'Preis',	'Цена',	'Precio',	'Fiyat'),
(507,	'',	'license_type',	'License type',	'نوع الرخصة',	'Licentie type',	'License type',	'Lizenz-Typ',	'Тип лицензии',	'Tipo de licencia',	'Lisans türü'),
(508,	'',	'rights_managed_license',	'Rights Managed (RM) License',	'الحقوق المدارة (RM) الترخيص',	'Rights Managed (RM) -licentie',	'Licence Rights Managed (RM)',	'Lizenz für Rights Managed (RM)',	'Лицензия с управлением правами (RM)',	'Licencia de derechos gestionados (RM)',	'Yönetilen Haklar (RM) Lisansı'),
(509,	'',	'editorial_use_license',	'Editorial Use License',	'رخصة استخدام التحرير',	'Licentie voor redactioneel gebruik',	'Licence d&#39;utilisation éditoriale',	'Lizenz zur redaktionellen Nutzung',	'Лицензия на использование в редакции',	'Licencia de uso editorial',	'Editoryal Kullanım Lisansı'),
(510,	'',	'royalty_free_license',	'Royalty Free License (RF)',	'الاتاوات الحرة رخصة (RF)',	'Royalty-vrije licentie (RF)',	'Licence libre de droits (RF)',	'Royalty Free Lizenz (RF)',	'Роялти Фри Лицензия (РФ)',	'Licencia libre de derechos (RF)',	'Telif Ücretsiz Lisansı (RF)'),
(511,	'',	'royalty_free_extended_license',	'Royalty Free Extended License',	'الاتاوات الحرة الرخصة الموسعة',	'Royalty Free Uitgebreide Licentie',	'Licence étendue libre de droits',	'Royalty Free Erweiterte Lizenz',	'Бесплатная лицензия',	'Licencia Extendida Libre de Derechos',	'Royalty Free Genişletilmiş Lisans'),
(512,	'',	'creative_commons_license',	'Creative Commons License',	'رخصة المشاع الإبداعي',	'Creative Commons-licentie',	'Licence Creative Commons',	'Creative Commons License',	'Лицензия Creative Commons',	'Licencia Creative Commons',	'Creative Commons License'),
(513,	'',	'public_domain',	'Public Domain',	'المجال العام',	'Publiek domein',	'Public Domain',	'Public Domain',	'Всеобщее достояние',	'Dominio publico',	'Kamu malı'),
(514,	'',	'none',	'None',	'لا شيء',	'Geen',	'Aucun',	'Keiner',	'Никто',	'Ninguna',	'Yok'),
(515,	'',	'tags',	'Tags',	'الكلمات',	'Tags',	'Tags',	'Stichworte',	'Теги',	'Etiquetas',	'Etiketler'),
(516,	'',	'category',	'Category',	'الفئة',	'Categorie',	'Catégorie',	'Kategorie',	'категория',	'Categoría',	'Kategori'),
(517,	'',	'image_dimension_error',	'Image dimension must be more than: {0}px , height : {1}px',	'يجب أن يكون حجم الصورة أكبر من: {0} بكسل ، الارتفاع: {1} بكسل',	'Afbeeldingsdimensie moet groter zijn dan: {0} px, hoogte: {1} px',	'La dimension de l&#39;image doit être supérieure à: {0} px, hauteur: {1} px',	'Die Bildgröße muss größer sein als: {0} px, die Höhe: {1} px',	'Размер изображения должен быть больше чем: {0} px, высота: {1} px',	'La dimensión de la imagen debe ser mayor que: {0} px, altura: {1} px',	'Resim boyutu: {0} px, yükseklik: {1} px&#39;den büyük olmalıdır'),
(518,	'',	'img_upload_success',	'Your image was successfully uploaded. ',	'تم تحميل صورتك بنجاح.',	'Uw afbeelding is succesvol geüpload.',	'Votre image a été téléchargée avec succès.',	'Ihr Bild wurde erfolgreich hochgeladen.',	'Ваше изображение было успешно загружено.',	'Su imagen se cargó correctamente.',	'Resminiz başarıyla yüklendi.'),
(519,	'',	'downloads',	'Downloads',	'التنزيلات',	'downloads',	'Téléchargements',	'Downloads',	'Загрузки',	'Descargas',	'İndirilenler'),
(520,	'',	'buy',	'Buy',	'يشترى',	'Kopen',	'Acheter',	'Kaufen',	'купить',	'Comprar',	'Satın'),
(521,	'',	'sells',	'Sells',	'يبيع',	'Sells',	'Vend',	'Verkauft',	'Продает',	'Vende',	'Satıyor'),
(522,	'',	'download',	'Download',	'تحميل',	'Download',	'Télécharger',	'Herunterladen',	'Скачать',	'Descargar',	'İndir'),
(523,	'',	'max',	'Max',	'ماكس',	'Max',	'Max',	'Max',	'Максимум',	'Max',	'maksimum'),
(524,	'',	'store_purchase',	'bought one of your images',	'اشترى واحدة من الصور الخاصة بك',	'kocht een van je afbeeldingen',	'acheté une de vos images',	'kaufte eines Ihrer Bilder',	'купил одно из ваших изображений',	'compró una de tus imágenes',	'resimlerinden birini satın aldı'),
(525,	'',	'history',	'Sales History',	'تاريخ المبيعات',	'Verkoopgeschiedenis',	'Historique des ventes',	'Verkaufsgeschichte',	'История продаж',	'Historial de ventas',	'Satış geçmişi'),
(526,	'',	'total_sell',	'Total Sells',	'مجموع عمليات البيع',	'Totaal verkoopt',	'Total des ventes',	'Gesamtverkäufe',	'Всего продано',	'Ventas totales',	'Toplam Satıyor'),
(527,	'',	'buyer',	'Buyer',	'مشتر',	'Koper',	'Acheteur',	'Käufer',	'Покупатель',	'Comprador',	'Alıcı'),
(528,	'',	'date',	'Transaction date',	'تاريخ الصفقة',	'Transactie datum',	'Transaction date',	'Transaktionsdatum',	'Дата сделки',	'Fecha de Transacción',	'İşlem günü'),
(529,	'',	'admin_commission',	'Admin commission',	'لجنة الادارية',	'Administratiecommissie',	'Admin commission',	'Verwaltungskommission',	'Комиссия администратора',	'Comisión administrativa',	'Admin commission'),
(530,	'',	'net_earning',	'Net earning',	'صافي ربح',	'Netto inkomsten',	'Gain net',	'Nettoeinkommen',	'Чистый доход',	'Ganancia neta',	'Net kazanç'),
(531,	'',	'sort_by',	'Sort by',	'ترتيب حسب',	'Sorteer op',	'Trier par',	'Sortiere nach',	'Сортировать по',	'Ordenar por',	'Göre sırala'),
(532,	'',	'my_downloads',	'My Downloads',	'بلدي التنزيلات',	'Mijn downloads',	'Mes Téléchargements',	'Meine Downloads',	'Мои Загрузки',	'Mis descargas',	'İndirdiklerim'),
(533,	'',	'image_type',	'Image Type',	'نوع الصورة',	'Beeldtype',	'Image Type',	'Bildtyp',	'Тип изображения',	'Tipo de imagen',	'Resim türü'),
(534,	'',	'resolution',	'Resolution',	'القرار',	'Resolutie',	'Résolution',	'Auflösung',	'разрешение',	'Resolución',	'çözüm'),
(535,	'',	'toggle_mode',	'Toggle Mode',	'تبديل الوضع',	'Schakelmodus',	'Toggle Mode',	'Toggle Mode',	'Режим переключения',	'Modo de alternar',	'Geçiş Modu'),
(536,	'',	'no_more_downloads',	'There are no downloads yet.',	'لا توجد تنزيلات حتى الان.',	'Er zijn nog geen downloads.',	NULL,	'Es gibt noch keine Downloads.',	'Еще нет загрузок.',	'Aún no hay descargas.',	'Henüz indirme yok.'),
(537,	'',	'file_is_not_support',	'File is not supported',	'الملف غير مدعوم',	'Bestand wordt niet ondersteund',	NULL,	'Datei wird nicht unterstützt',	'Файл не поддерживается',	'El archivo no es compatible',	'Dosya desteklenmiyor'),
(538,	'',	'manage_funding',	'Manage Funding Requests',	'إدارة طلبات التمويل',	'Beheer financieringsverzoeken',	'Gérer les demandes de financement',	'Finanzierungsanfragen verwalten',	'Управление запросами на финансирование',	'Gestionar solicitudes de financiación',	'Finansman Taleplerini Yönetin'),
(539,	'',	'delete_funding',	'Delete funding request',	'حذف طلب التمويل',	'Financieringsverzoek verwijderen',	'Supprimer la demande de financement',	'Finanzierungsantrag löschen',	'Удалить запрос на финансирование',	'Eliminar solicitud de financiación',	'Finansman talebini sil'),
(540,	'',	'confirm_del_fund',	'Are you sure you want to delete this fund request?',	'هل أنت متأكد أنك تريد حذف طلب التمويل هذا؟',	'Weet u zeker dat u dit fondsverzoek wilt verwijderen?',	'Voulez-vous vraiment supprimer cette demande de fonds?',	'Möchten Sie diese Fondsanfrage wirklich löschen?',	'Вы уверены, что хотите удалить этот запрос фонда?',	'¿Seguro que quieres eliminar esta solicitud de fondo?',	'Bu fon talebini silmek istediğinizden emin misiniz?'),
(541,	'',	'report_fund',	'Report this fund request.',	'أبلغ عن طلب التمويل هذا.',	'Rapporteer dit fondsverzoek.',	'Signalez cette demande de fonds.',	'Melden Sie diese Fondsanfrage.',	'Сообщить об этом запросе фонда.',	'Informe esta solicitud de fondo.',	'Bu fon talebini bildirin.'),
(542,	'',	'email_provider_banned',	'The email provider is blacklisted and not allowed, please choose another email provider.',	'موفر البريد الإلكتروني مدرج في القائمة السوداء وغير مسموح به ، يرجى اختيار مزود بريد إلكتروني آخر.',	'De e-mailprovider staat op de zwarte lijst en is niet toegestaan. Kies een andere e-mailprovider.',	NULL,	'Der E-Mail-Anbieter ist auf der schwarzen Liste und nicht zulässig. Bitte wählen Sie einen anderen E-Mail-Anbieter.',	'Поставщик электронной почты занесен в черный список и не допускается, выберите другого поставщика электронной почты',	'El proveedor de correo electrónico está en la lista negra y no está permitido, elija otro proveedor de correo electrónico.',	'E-posta sağlayıcısı kara listeye alındı ​​ve izin verilmiyor, lütfen başka bir e-posta sağlayıcısı seçin.'),
(543,	'',	'email_provider_specific_mail',	'you must signup using {0} only.',	'يجب عليك الاشتراك باستخدام {0} فقط.',	'u moet zich alleen aanmelden met {0}.',	'vous devez vous inscrire en utilisant uniquement {0}.',	'Sie müssen sich nur mit {0} anmelden.',	'Вы должны зарегистрироваться, используя только {0}.',	'debes registrarte usando {0} solamente.',	'yalnızca {0} kullanarak kaydolmanız gerekir.'),
(544,	'',	'share',	'Share',	'شارك',	'Delen',	'Partager',	'Aktie',	'доля',	'Compartir',	'Paylaş'),
(545,	'',	'free_limit_storage',	'You exceed the storage limit. please upgrade your account.',	'لقد تجاوزت حد التخزين. ',	'U overschrijdt de opslaglimiet. ',	'Vous dépassez la limite de stockage. ',	'Sie überschreiten das Speicherlimit. ',	'Вы превысили лимит хранения. ',	'Superas el límite de almacenamiento. ',	'Depolama sınırını aştınız. '),
(546,	'',	'create_blog_bost',	'Create blog bost',	'إنشاء مشاركة مدونة',	'Maak een blogpost',	'Créer un article de blog',	'Erstellen Sie einen Blog-Beitrag',	'Создать блог',	'Crear publicación de blog',	'Blog yayını oluştur'),
(547,	'',	'create_article_success',	NULL,	'تمت إضافة مشاركتك بنجاح ، وسيراجع الفريق مقالك ، بمجرد الانتهاء من ذلك ، سيتم إعلامك.',	'Uw bericht is met succes toegevoegd, het team zal uw artikel beoordelen, zodra u klaar bent, ontvangt u een melding.',	NULL,	'Ihr Beitrag wurde erfolgreich hinzugefügt. Das Team überprüft Ihren Artikel. Sobald Sie fertig sind, werden Sie benachrichtigt.',	'Ваше сообщение было успешно добавлено, команда рассмотрит вашу статью, как только вы закончите, вы получите уведомление.',	'Su publicación se agregó con éxito, el equipo revisará su artículo, una vez hecho esto se le notificará.',	'Yayınınız başarıyla eklendi, ekip makalenizi inceleyecek, işiniz bittiğinde size bildirilecektir.'),
(548,	'',	'create_article_html',	'Content',	'المحتوى',	'Inhoud',	'Contenu',	'Inhalt',	'содержание',	'Contenido',	'içerik'),
(549,	'',	'sms',	'SMS',	'رسالة قصيرة',	'sms',	'SMS',	'SMS',	'смс',	'SMS',	'SMS'),
(550,	'',	'paystack',	'Paystack',	'Paystack',	'Paystack',	'Paystack',	'Paystack',	'Paystack',	'Paystack',	'Paystack'),
(551,	'',	'razorpay',	'Pay using Razorpay',	'الدفع باستخدام Razorpay',	'Betaal met Razorpay',	'Payer avec Razorpay',	'Zahlen Sie mit Razorpay',	'Оплатить с помощью Razorpay',	'Pague con Razorpay',	'Razorpay kullanarak ödeme yapın'),
(552,	'',	'video_call',	'Video call',	'مكالمة فيديو',	'Video-oproep',	'Appel vidéo',	'Videoanruf',	'Видеозвонок',	'Videollamada',	'Görüntülü arama'),
(553,	'',	'no_answer',	'No answer',	'لا اجابة',	'Geen antwoord',	'Pas de réponse',	'Keine Antwort',	'Нет ответа',	'Sin respuesta',	'Cevapsız'),
(554,	'',	'try_again_later',	'Please try again later.',	'الرجاء معاودة المحاولة في وقت لاحق.',	'Probeer het later opnieuw.',	'Veuillez réessayer plus tard.',	'Bitte versuchen Sie es später noch einmal.',	'Пожалуйста, попробуйте позже.',	'Por favor, inténtelo de nuevo más tarde.',	'Lütfen daha sonra tekrar deneyiniz.'),
(555,	'',	'calling',	'Calling',	'جارٍ الاتصال',	'Roeping',	'Appel',	'Berufung',	'призвание',	'Vocación',	'çağrı'),
(556,	'',	'please_wait_answer',	'Please wait for your friend answer.',	'من فضلك انتظر رد صديقك.',	'Wacht alstublieft op het antwoord van uw vriend.',	'Veuillez attendre la réponse de votre ami.',	'Bitte warten Sie auf die Antwort Ihres Freundes.',	'Пожалуйста, дождитесь ответа вашего друга.',	'Por favor espera la respuesta de tu amigo.',	'Lütfen arkadaşınızın cevabını bekleyin.'),
(557,	'',	'cancel',	'Cancel',	'إلغاء',	'Annuleer',	'Annuler',	'Stornieren',	'Отмена',	'Cancelar',	'İptal etmek'),
(558,	'',	'answered',	'Answered!',	'مجاب!',	'Beantwoord!',	'Répondu!',	'Antwortete!',	'Ответил!',	'¡Contestado!',	'Yanıtlanmış!'),
(559,	'',	'please_wait',	'Please wait..',	'ارجوك انتظر..',	'Wacht alsjeblieft..',	NULL,	'Warten Sie mal..',	'Пожалуйста, подождите..',	'Por favor espera..',	'Lütfen bekle..'),
(560,	'',	'call_declined',	'Call declined',	'تم رفض المكالمة',	'Oproep geweigerd',	'Appel refusé',	'Anruf abgelehnt',	'Звонок отклонен',	'Llamada rechazada',	'Çağrı reddedildi'),
(561,	'',	'recipient_has_declined',	'The recipient has declined the call, please try again later.',	'رفض المستلم المكالمة ، يرجى المحاولة مرة أخرى في وقت لاحق.',	'De ontvanger heeft het gesprek geweigerd, probeer het later opnieuw.',	NULL,	'Der Empfänger hat den Anruf abgelehnt. Bitte versuchen Sie es später erneut.',	'Получатель отклонил звонок, повторите попытку позже.',	'El destinatario ha rechazado la llamada. Vuelve a intentarlo más tarde.',	'Alıcı çağrıyı reddetti, lütfen daha sonra tekrar deneyin.'),
(562,	'',	'new_video_call',	'New video call',	'مكالمة فيديو جديدة',	'Nieuw videogesprek',	'Nouvel appel vidéo',	'Neuer Videoanruf',	'Новый видеозвонок',	'Nueva videollamada',	'Yeni video görüşmesi'),
(563,	'',	'want_to_video_chat',	'wants to video chat with you.',	'يريد الدردشة معك.',	'wil videochatten met jou.',	'souhaite discuter par vidéo avec vous.',	'möchte mit dir per Video chatten.',	'хочет с тобой видеочат',	'quiere chatear por video contigo.',	'sizinle görüntülü sohbet etmek istiyor.'),
(564,	'',	'accept_start',	'Accept & Start',	'القبول والبدء',	'Accepteren en starten',	'Accepter et démarrer',	'Akzeptieren & starten',	'Принять и начать',	'Aceptar y comenzar',	'Kabul Et ve Başlat'),
(565,	'',	'decline',	'Decline',	'انخفاض',	'Afwijzen',	'Déclin',	'Ablehnen',	'снижение',	'Disminución',	'düşüş'),
(566,	'',	'end_call',	'End Call',	'إنهاء المكالمة',	'Ophangen',	NULL,	'Anruf beenden',	'Конец вызова',	'Finalizar llamada',	'Son Arama'),
(567,	'',	'get_full_access',	'Get full access to the site',	'الحصول على حق الوصول الكامل إلى الموقع',	'Krijg volledige toegang tot de site',	'Accédez pleinement au site',	'Erhalten Sie vollen Zugriff auf die Website',	'Получить полный доступ к сайту',	'Obtenga acceso completo al sitio',	'Siteye tam erişim sağlayın'),
(568,	'',	'shared_your_post',	'shared your post',	'نشر مشاركتك',	'heeft je post gedeeld',	'a partagé votre message',	'hat deinen Beitrag geteilt',	'поделился своим постом',	'ha compartido tu publicación',	'yayınınızı paylaştı'),
(569,	'',	'cant_share_own',	'You can&#039;t share your posts.',	'لا يمكنك نشر مشاركاتك.',	'Je kunt je berichten niet delen.',	'Vous ne pouvez pas partager vos messages.',	'Sie können Ihre Beiträge nicht teilen.',	'Вы не можете поделиться своими сообщениями.',	'No puedes compartir tus publicaciones.',	'Yayınlarınızı paylaşamazsınız.'),
(570,	'',	'share_post',	'shared a {post}.',	'شارك {post}.',	'heeft een {post} gedeeld.',	'a partagé un {post}.',	'hat einen {Beitrag} geteilt.',	'поделился {post}.',	'ha compartido una {publicación}.',	'bir {post} paylaştı.'),
(571,	'',	'update_blog_post',	'Update blog post',	'تحديث منشور المدونة',	'Blogpost bijwerken',	'Mettre à jour le billet de blog',	'Blog-Beitrag aktualisieren',	'Обновить сообщение в блоге',	'Actualizar publicación de blog',	'Blog yayınını güncelle');


-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_media_files`;

CREATE TABLE `pxp_media_files` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `post_id` int(30) DEFAULT 0,
  `user_id` int(15) NOT NULL DEFAULT 0,
  `file` varchar(3000) NOT NULL DEFAULT '',
  `extra` varchar(3000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `pxp_media_files_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `pxp_posts` (`post_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO `pxp_media_files` (`id`, `post_id`, `user_id`, `file`, `extra`) VALUES
(2,	3,	2,	'media/upload/photos/2021/03/GGil2b1wGjok3SH9aLSTTXQdZxFdkflMSvPvGrFp5GTSEMMnOk_02_6deae04ca1ee55044d787b435c4a4f1a_image.jpeg',	'E6F6EBA3-F7D5-4D6E-B445-6373F8293A4F.jpeg'),
(4,	5,	1,	'media/upload/photos/2021/03/AfP14ugpakDNoereh8ddV2ALeYBC3sniMznvGkB87RVmSb3QK7_03_7f07a917495a17fa42e8ab1cc9baeb1c_image.jpeg',	'778B7A93-ADC2-4FFE-B37A-C21B3E9276A4.jpeg'),
(5,	6,	4,	'media/upload/photos/2021/03/afpLai1rhqibOeyc6f7W6OmGPRuyHPn8asnYG46cjV3tjdjdAV_03_14e82d314144c21c1812c07ff17b167d_image.jpeg',	'AA000C53-C990-4A3C-8726-2E103602015D.jpeg'),
(6,	7,	7,	'media/upload/photos/2021/03/uveBoKHOYpOulDKslfXBtIqbLjIE3N75SIAZFwpv34obsM638h_03_5f75dcdd51ac98982b18f14f329aa2e3_image.jpg',	'IMG_20201010_182417_863.jpg'),
(7,	8,	9,	'media/upload/photos/2021/03/BKyOtUpYVYGWYOR5UfQnBIyNkvUYT6y2WbkXcwttkSPIQcqPbZ_03_a65b9f05fa40cb4a854d75b97a64f9ad_image.jpeg',	'00CEB6B4-C3DF-4BA0-B7E2-9CD8D909BCC5.jpeg'),
(8,	9,	5,	'media/upload/photos/2021/03/soEHrluG2iP2ZPE2rRROE7nEx7U29OuKXnNhtfVued6wpS7ijZ_04_c358d5bd72f7a108bb70e1c84bf42bb2_image.jpg',	'IMG_20210116_211041_846.jpg');


-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_messages`;

CREATE TABLE `pxp_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(15) NOT NULL DEFAULT 0,
  `to_id` int(15) NOT NULL DEFAULT 0,
  `text` text DEFAULT NULL,
  `media_file` varchar(3000) NOT NULL DEFAULT '',
  `media_type` varchar(20) NOT NULL DEFAULT '',
  `media_name` varchar(100) NOT NULL DEFAULT '',
  `deleted_fs1` enum('0','1') NOT NULL DEFAULT '0',
  `deleted_fs2` enum('0','1') NOT NULL DEFAULT '0',
  `seen` varchar(50) NOT NULL DEFAULT '0',
  `time` varchar(50) NOT NULL DEFAULT '0',
  `extra` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `seen` (`seen`),
  KEY `from_id` (`from_id`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `pxp_messages` (`id`, `from_id`, `to_id`, `text`, `media_file`, `media_type`, `media_name`, `deleted_fs1`, `deleted_fs2`, `seen`, `time`, `extra`) VALUES
(1,	3,	2,	'Hey Radharani bumi',	'',	'',	'',	'0',	'0',	'1614724091',	'1614722635',	''),
(2,	2,	3,	'Hi Eha',	'',	'',	'',	'0',	'0',	'1614730639',	'1614724098',	''),
(3,	3,	2,	'Nice messaging is working',	'',	'',	'',	'0',	'0',	'0',	'1614730652',	''),
(4,	3,	2,	':)',	'',	'',	'',	'0',	'0',	'0',	'1614730665',	''),
(5,	3,	2,	':)',	'',	'',	'',	'1',	'0',	'0',	'1614730673',	'');


-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_notifications`;

CREATE TABLE `pxp_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notifier_id` int(11) NOT NULL DEFAULT 0,
  `recipient_id` int(11) NOT NULL DEFAULT 0,
  `type` varchar(100) NOT NULL DEFAULT '',
  `text` text DEFAULT NULL,
  `url` varchar(3000) NOT NULL DEFAULT '',
  `seen` varchar(50) NOT NULL DEFAULT '0',
  `time` varchar(50) NOT NULL DEFAULT '0',
  `sent_push` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `type` (`type`),
  KEY `notifier_id` (`notifier_id`),
  CONSTRAINT `pxp_notifications_ibfk_1` FOREIGN KEY (`notifier_id`) REFERENCES `pxp_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `pxp_notifications_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `pxp_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

INSERT INTO `pxp_notifications` (`id`, `notifier_id`, `recipient_id`, `type`, `text`, `url`, `seen`, `time`, `sent_push`) VALUES
(1,	3,	2,	'followed_u',	'',	'http://104.0.175.125/eharouge',	'0',	'1614720826',	0),
(3,	3,	2,	'mentioned_u_in_comment',	'',	'http://104.0.175.125/post/1',	'0',	'1614722740',	0),
(5,	1,	2,	'followed_u',	'',	'http://104.0.175.125/admin',	'0',	'1614723564',	0),
(9,	4,	2,	'followed_u',	'',	'http://104.0.175.125/elexisansley',	'0',	'1614724260',	0),
(10,	1,	2,	'liked_ur_post',	'',	'http://104.0.175.125/post/3',	'0',	'1614724291',	0),
(14,	1,	2,	'accept_request',	'',	'http://104.0.175.125/admin',	'0',	'1614724663',	0),
(17,	1,	2,	'commented_ur_post',	'',	'http://104.0.175.125/post/3',	'0',	'1614730313',	0),
(18,	3,	2,	'liked_ur_post',	'',	'http://104.0.175.125/post/3',	'0',	'1614732062',	0),
(20,	4,	2,	'liked_ur_post',	'',	'http://104.0.175.125/post/3',	'0',	'1614738495',	0),
(24,	4,	2,	'commented_ur_post',	'',	'http://104.0.175.125/post/3',	'0',	'1614738581',	0),
(26,	5,	4,	'followed_u',	'',	'http://104.0.175.125/Sdarlotus',	'0',	'1614741198',	0),
(28,	5,	2,	'followed_u',	'',	'http://104.0.175.125/Sdarlotus',	'0',	'1614741198',	0),
(29,	5,	2,	'liked_ur_post',	'',	'http://104.0.175.125/post/3',	'0',	'1614741207',	0),
(30,	5,	4,	'liked_ur_post',	'',	'http://104.0.175.125/post/6',	'0',	'1614741209',	0),
(32,	5,	4,	'commented_ur_post',	'',	'http://104.0.175.125/post/6',	'0',	'1614741235',	0),
(33,	5,	2,	'commented_ur_post',	'',	'http://104.0.175.125/post/3',	'0',	'1614741251',	0),
(41,	3,	4,	'commented_ur_post',	'',	'http://104.0.175.125/post/6',	'0',	'1614743897',	0),
(44,	7,	4,	'followed_u',	'',	'http://104.0.175.125/CubaThatGass',	'0',	'1614744347',	0),
(46,	7,	2,	'followed_u',	'',	'http://104.0.175.125/CubaThatGass',	'0',	'1614744347',	0),
(47,	7,	4,	'liked_ur_post',	'',	'http://104.0.175.125/post/6',	'0',	'1614744732',	0),
(48,	7,	2,	'liked_ur_post',	'',	'http://104.0.175.125/post/3',	'0',	'1614744734',	0),
(55,	3,	4,	'liked_ur_comment',	'',	'http://104.0.175.125/post/3',	'0',	'1614745519',	0),
(62,	8,	4,	'followed_u',	'',	'http://104.0.175.125/Bhoss_sevenTen',	'0',	'1614745925',	0),
(64,	8,	2,	'followed_u',	'',	'http://104.0.175.125/Bhoss_sevenTen',	'0',	'1614745925',	0),
(65,	9,	2,	'followed_u',	'',	'http://104.0.175.125/Inspireju',	'0',	'1614746225',	0),
(66,	9,	2,	'liked_ur_post',	'',	'http://104.0.175.125/post/3',	'0',	'1614746256',	0),
(76,	11,	2,	'liked_ur_post',	'',	'http://104.0.175.125/post/3',	'0',	'1614758301',	0),
(77,	11,	2,	'commented_ur_post',	'',	'http://104.0.175.125/post/3',	'0',	'1614758354',	0),
(79,	11,	2,	'followed_u',	'',	'http://104.0.175.125/Megastar',	'0',	'1614758370',	0),
(82,	11,	4,	'followed_u',	'',	'http://104.0.175.125/Megastar',	'0',	'1614758982',	0),
(83,	10,	9,	'followed_u',	'',	'http://104.0.175.125/nuvoid',	'0',	'1614759209',	0),
(84,	10,	8,	'followed_u',	'',	'http://104.0.175.125/nuvoid',	'0',	'1614759210',	0),
(86,	10,	6,	'followed_u',	'',	'http://104.0.175.125/nuvoid',	'0',	'1614759213',	0),
(89,	10,	4,	'followed_u',	'',	'http://104.0.175.125/nuvoid',	'0',	'1614759216',	0),
(90,	10,	2,	'followed_u',	'',	'http://104.0.175.125/nuvoid',	'0',	'1614759218',	0),
(94,	3,	11,	'followed_u',	'',	'http://104.0.175.125/eharouge',	'0',	'1614775643',	0),
(97,	3,	8,	'followed_u',	'',	'http://104.0.175.125/eharouge',	'0',	'1614775919',	0),
(98,	5,	9,	'followed_u',	'',	'http://104.0.175.125/Sdarlotus',	'0',	'1614818888',	0),
(99,	5,	11,	'followed_u',	'',	'http://104.0.175.125/Sdarlotus',	'0',	'1614818900',	0),
(100,	5,	8,	'followed_u',	'',	'http://104.0.175.125/Sdarlotus',	'0',	'1614818910',	0),
(101,	5,	7,	'followed_u',	'',	'http://104.0.175.125/Sdarlotus',	'0',	'1614818929',	0),
(102,	5,	9,	'liked_ur_post',	'',	'http://104.0.175.125/post/8',	'0',	'1614818952',	0),
(103,	5,	9,	'commented_ur_post',	'',	'http://104.0.175.125/post/8',	'0',	'1614818960',	0),
(104,	1,	7,	'followed_u',	'',	'http://104.0.175.125/BouGee',	'0',	'1614819038',	0),
(106,	1,	7,	'liked_ur_post',	'',	'http://104.0.175.125/post/7',	'0',	'1614819188',	0),
(107,	1,	11,	'followed_u',	'',	'http://104.0.175.125/BouGee',	'0',	'1614819210',	0),
(109,	1,	5,	'liked_ur_post',	'',	'http://104.0.175.125/post/9',	'0',	'1614819216',	0),
(110,	1,	5,	'commented_ur_post',	'',	'http://104.0.175.125/post/9',	'0',	'1614819226',	0),
(111,	1,	5,	'followed_u',	'',	'http://104.0.175.125/BouGee',	'0',	'1614819236',	0),
(112,	1,	9,	'followed_u',	'',	'http://104.0.175.125/BouGee',	'0',	'1614819281',	0),
(113,	1,	8,	'followed_u',	'',	'http://104.0.175.125/BouGee',	'0',	'1614819281',	0),
(115,	1,	11,	'accept_request',	'',	'http://104.0.175.125/BouGee',	'0',	'1614819642',	0),
(116,	1,	9,	'accept_request',	'',	'http://104.0.175.125/BouGee',	'0',	'1614819644',	0),
(117,	1,	8,	'accept_request',	'',	'http://104.0.175.125/BouGee',	'0',	'1614819646',	0),
(118,	1,	7,	'accept_request',	'',	'http://104.0.175.125/BouGee',	'0',	'1614819648',	0),
(119,	3,	5,	'liked_ur_post',	'',	'http://104.0.175.125/post/9',	'0',	'1614873279',	0);


-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_payments`;

CREATE TABLE `pxp_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0,
  `type` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_post_comments`;

CREATE TABLE `pxp_post_comments` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `post_id` int(20) NOT NULL DEFAULT 0,
  `user_id` int(20) NOT NULL DEFAULT 0,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `pxp_post_comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `pxp_posts` (`post_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

INSERT INTO `pxp_post_comments` (`id`, `post_id`, `user_id`, `text`, `time`) VALUES
(1,	3,	1,	'Welcome to BouGee!',	'1614730313'),
(2,	3,	4,	'My fave pic of you ever ???',	'1614738581'),
(3,	6,	5,	'Yaaaaaassssss queen!',	'1614741235'),
(4,	3,	5,	'Smoking ????',	'1614741251'),
(5,	2,	5,	'Love this video! ?',	'1614741262'),
(6,	6,	3,	'ayyy ??? fuck Instagram lol',	'1614743897'),
(7,	7,	3,	'ayy what good my dude',	'1614745494'),
(9,	8,	3,	'welcome',	'1614746794'),
(10,	3,	11,	'Live and in color. Awesome ?',	'1614758354'),
(11,	2,	10,	'fun time at that shoot!',	'1614761607'),
(12,	8,	5,	'Gorgeous!',	'1614818960'),
(13,	9,	1,	'Welcome to BouGee',	'1614819226');


-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_post_likes`;

CREATE TABLE `pxp_post_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(30) NOT NULL DEFAULT 0,
  `user_id` int(30) NOT NULL DEFAULT 0,
  `type` varchar(20) NOT NULL DEFAULT 'up',
  `time` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `type` (`type`),
  CONSTRAINT `pxp_post_likes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `pxp_posts` (`post_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `pxp_post_likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `pxp_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

INSERT INTO `pxp_post_likes` (`id`, `post_id`, `user_id`, `type`, `time`) VALUES
(2,	2,	2,	'up',	'1614724071'),
(4,	3,	1,	'up',	'1614724291'),
(6,	2,	1,	'up',	'1614730280'),
(7,	3,	3,	'up',	'1614732062'),
(8,	2,	3,	'up',	'1614732066'),
(9,	5,	1,	'up',	'1614734180'),
(10,	6,	4,	'up',	'1614738479'),
(11,	3,	4,	'up',	'1614738495'),
(12,	5,	4,	'up',	'1614738500'),
(13,	2,	4,	'up',	'1614738505'),
(14,	6,	1,	'up',	'1614738510'),
(15,	6,	3,	'up',	'1614738675'),
(16,	3,	5,	'up',	'1614741207'),
(17,	6,	5,	'up',	'1614741209'),
(18,	2,	5,	'up',	'1614741213'),
(19,	6,	7,	'up',	'1614744732'),
(20,	3,	7,	'up',	'1614744734'),
(21,	2,	7,	'up',	'1614744736'),
(22,	7,	3,	'up',	'1614745484'),
(23,	5,	3,	'up',	'1614745513'),
(24,	3,	9,	'up',	'1614746256'),
(25,	8,	3,	'up',	'1614746745'),
(26,	3,	11,	'up',	'1614758301'),
(27,	2,	10,	'up',	'1614759558'),
(28,	8,	5,	'up',	'1614818952'),
(29,	7,	1,	'up',	'1614819188'),
(30,	9,	1,	'up',	'1614819216'),
(31,	9,	3,	'up',	'1614873279');


-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_post_reports`;

CREATE TABLE `pxp_post_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(30) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `text` varchar(1000) NOT NULL DEFAULT '',
  `type` varchar(150) NOT NULL DEFAULT '',
  `time` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `pxp_post_reports_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `pxp_posts` (`post_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `pxp_post_reports_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `pxp_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_posts`;

CREATE TABLE `pxp_posts` (
  `post_id` int(30) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(3000) NOT NULL DEFAULT '',
  `youtube` varchar(150) NOT NULL DEFAULT '',
  `vimeo` varchar(20) NOT NULL DEFAULT '',
  `dailymotion` varchar(50) NOT NULL DEFAULT '',
  `playtube` varchar(250) NOT NULL DEFAULT '',
  `mp4` text DEFAULT NULL,
  `time` varchar(100) NOT NULL DEFAULT '0',
  `type` varchar(100) NOT NULL DEFAULT '',
  `registered` varchar(32) NOT NULL DEFAULT '0000/0',
  `views` int(11) NOT NULL DEFAULT 0,
  `boosted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `registered` (`registered`),
  CONSTRAINT `pxp_posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `pxp_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO `pxp_posts` (`post_id`, `user_id`, `description`, `link`, `youtube`, `vimeo`, `dailymotion`, `playtube`, `mp4`, `time`, `type`, `registered`, `views`, `boosted`) VALUES
(2,	3,	NULL,	'https://youtu.be/cTb_dPaafS8',	'cTb_dPaafS8',	'',	'',	'',	NULL,	'1614722940',	'youtube',	'2021/3',	0,	0),
(3,	2,	'Princess Leia in Action ✨',	'',	'',	'',	'',	'',	NULL,	'1614724063',	'image',	'2021/3',	0,	0),
(5,	1,	'Welcome to BouGee!!!',	'',	'',	'',	'',	'',	NULL,	'1614734145',	'image',	'2021/3',	0,	0),
(6,	4,	'Luminous ✨',	'',	'',	'',	'',	'',	NULL,	'1614738471',	'image',	'2021/3',	0,	0),
(7,	7,	'Life at my smokeshop ?',	'',	'',	'',	'',	'',	NULL,	'1614744679',	'image',	'2021/3',	0,	0),
(8,	9,	'#[2]',	'',	'',	'',	'',	'',	NULL,	'1614746420',	'image',	'2021/3',	0,	0),
(9,	5,	'Loving bougee network ?',	'',	'',	'',	'',	'',	NULL,	'1614819102',	'image',	'2021/3',	0,	0);


-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_saved_posts`;

CREATE TABLE `pxp_saved_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(15) NOT NULL DEFAULT 0,
  `post_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `pxp_saved_posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `pxp_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `pxp_saved_posts_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `pxp_posts` (`post_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_sessions`;

CREATE TABLE `pxp_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(100) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `platform` varchar(30) NOT NULL DEFAULT 'web',
  `platform_details` text CHARACTER SET utf8 DEFAULT NULL,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `user_id` (`user_id`),
  KEY `platform` (`platform`),
  KEY `time` (`time`),
  CONSTRAINT `pxp_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `pxp_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

INSERT INTO `pxp_sessions` (`id`, `session_id`, `user_id`, `platform`, `platform_details`, `time`) VALUES
(1,	'a399ba18a4f93a59afa64c01dbeb3f479e05dd3f1614712888fb32f88a72f6a2ad83029a7382c56193',	1,	'windows',	'{\"userAgent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/88.0.4324.192 Safari\\/537.36\",\"name\":\"Google Chrome\",\"version\":\"88.0.4324.192\",\"platform\":\"windows\",\"pattern\":\"#(?<browser>Version|Chrome|other)[\\/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"::1\"}',	1614721015),
(2,	'a79339046bde32c8390ab83c8a53b402ec80e81316147200226b96ad31cb7ae96808850499c1dce546',	2,	'Mac',	'{\"userAgent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 11_1_0) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/88.0.4324.96 Safari\\/537.36\",\"name\":\"Google Chrome\",\"version\":\"88.0.4324.96\",\"platform\":\"Mac\",\"pattern\":\"#(?<browser>Version|Chrome|other)[\\/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"192.168.1.254\"}',	1614726562),
(3,	'42a6d280ef1afc344e9507f14a2158af8ddf643016147201652ccd01ddd9b24b42d68da315c27800d6',	3,	'Mac',	'{\"userAgent\":\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/14.0 Mobile\\/15E148 Safari\\/604.1\",\"name\":\"Apple Safari\",\"version\":\"14.0\",\"platform\":\"Mac\",\"pattern\":\"#(?<browser>Version|Safari|other)[\\/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"107.72.162.34\"}',	1614721507),
(4,	'dfe3ef377e2b72b91596df655a9ce78cf237bf3a161472251234245b5e1956e633c5dcd1529e311bfd',	3,	'Mac',	'{\"userAgent\":\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/14.0.2 Mobile\\/15E148 Safari\\/604.1\",\"name\":\"Apple Safari\",\"version\":\"14.0.2\",\"platform\":\"Mac\",\"pattern\":\"#(?<browser>Version|Safari|other)[\\/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"107.72.162.34\"}',	1614722765),
(6,	'8d9239f80c3c402aaec7ab2cfe409a45f5511a6516147235574fcc69e9c62f3d29b1c81d8348bd3688',	1,	'Mac',	'{\"userAgent\":\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/14.0.2 Mobile\\/15E148 Safari\\/604.1\",\"name\":\"Apple Safari\",\"version\":\"14.0.2\",\"platform\":\"Mac\",\"pattern\":\"#(?<browser>Version|Safari|other)[\\/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"107.72.162.34\"}',	1614723621),
(7,	'56ddffbd65960218101b2c34430613047bc21cc01614723918ad334722739a778798fe4bfc84fdbe4d',	2,	'Mac',	'{\"userAgent\":\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/14.0.3 Mobile\\/15E148 Safari\\/604.1\",\"name\":\"Apple Safari\",\"version\":\"14.0.3\",\"platform\":\"Mac\",\"pattern\":\"#(?<browser>Version|Safari|other)[\\/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"172.58.14.165\"}',	1614724064),
(8,	'f62295ed83d56e79961274901e70e7514093193d1614724159a393aed040feb914bf188a228d8b8e26',	4,	'Mac',	'{\"userAgent\":\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/14.3 Mobile\\/15E148 DuckDuckGo\\/7 Safari\\/605.1.15\",\"name\":\"Apple Safari\",\"version\":\"14.3\",\"platform\":\"Mac\",\"pattern\":\"#(?<browser>Version|Safari|other)[\\/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"76.211.178.254\"}',	1614724825),
(10,	'b22840246d913a519cd94b338951fa5837269aaf16147271141bc9291c085731966beb91c8a5c72be4',	3,	'windows',	'{\"userAgent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/88.0.4324.192 Safari\\/537.36\",\"name\":\"Google Chrome\",\"version\":\"88.0.4324.192\",\"platform\":\"windows\",\"pattern\":\"#(?<browser>Version|Chrome|other)[\\/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"192.168.1.254\"}',	1614873271),
(13,	'3e8f2c81244abe7bcd04b0d4f3098a9fe33fbcc916147380164fd1b1aff2f19cf997f708badd14446b',	4,	'Mac',	'{\"userAgent\":\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/14.0.2 Mobile\\/15E148 Safari\\/604.1\",\"name\":\"Apple Safari\",\"version\":\"14.0.2\",\"platform\":\"Mac\",\"pattern\":\"#(?<browser>Version|Safari|other)[\\/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"76.211.178.254\"}',	1614739623),
(14,	'53bc18c68721908d631c188d4032dab9990af1a016147381118f322caf96021446d2e4709d7cfe148c',	4,	'Mac',	'{\"userAgent\":\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/87.0.4280.77 Mobile\\/15E148 Safari\\/604.1\",\"name\":\"Apple Safari\",\"version\":\"604.1\",\"platform\":\"Mac\",\"pattern\":\"#(?<browser>Version|Safari|other)[\\/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"76.211.178.254\"}',	1614738111),
(16,	'dfa967650d3dcf5e9ef34b67f49933e1f74d4e0b16147408451ce9d892809ad326d398978a8f957c9c',	5,	'linux',	'{\"userAgent\":\"Mozilla\\/5.0 (Linux; Android 11; SM-G986U Build\\/RP1A.200720.012; wv) AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/88.0.4324.152 Mobile Safari\\/537.36 Instagram 173.0.0.39.120 Android (30\\/11; 450dpi; 1080x2192; samsung; SM-G986U; y2q; qcom; en_US; 271182270)\",\"name\":\"Google Chrome\",\"version\":\"4.0\",\"platform\":\"linux\",\"pattern\":\"#(?<browser>Version|Chrome|other)[\\/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"174.228.43.39\"}',	1614740983),
(17,	'67ff7e614542c6bd92b30c8ce14cec11049c85dd16147409508718fd45026a0133363c1104c8237efe',	5,	'linux',	'{\"userAgent\":\"Mozilla\\/5.0 (Linux; Android 11; SM-G986U) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/88.0.4324.152 Mobile Safari\\/537.36\",\"name\":\"Google Chrome\",\"version\":\"88.0.4324.152\",\"platform\":\"linux\",\"pattern\":\"#(?<browser>Version|Chrome|other)[\\/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"174.228.43.39\"}',	1614822250),
(18,	'a305a2a4c58443ce866a836e8b7850fd8b05dce416147425644cd9aa7b3fd88ad61566d4b7a16b67e2',	6,	'Mac',	'{\"userAgent\":\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/14.0.3 Mobile\\/15E148 Safari\\/604.1\",\"name\":\"Apple Safari\",\"version\":\"14.0.3\",\"platform\":\"Mac\",\"pattern\":\"#(?<browser>Version|Safari|other)[\\/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"71.47.145.120\"}',	1614815350),
(21,	'4783e6c9ebd7410840a549d324d5bde0ca2de60a16147442354a12d583ca3dc61a976d746b1f7c0365',	7,	'linux',	'{\"userAgent\":\"Mozilla\\/5.0 (Linux; Android 11; IN2017 Build\\/RP1A.201005.001; wv) AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/88.0.4324.181 Mobile Safari\\/537.36 [FB_IAB\\/Orca-Android;FBAV\\/301.0.0.12.112;]\",\"name\":\"Google Chrome\",\"version\":\"4.0\",\"platform\":\"linux\",\"pattern\":\"#(?<browser>Version|Chrome|other)[\\/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"172.58.172.158\"}',	1614744511),
(22,	'6757c38a64421ab1b2bbd1617170beef6f8ab13d1614744587192940b139483352b446a09f6296d671',	7,	'linux',	'{\"userAgent\":\"Mozilla\\/5.0 (Linux; Android 11; IN2017) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/88.0.4324.181 Mobile Safari\\/537.36\",\"name\":\"Google Chrome\",\"version\":\"88.0.4324.181\",\"platform\":\"linux\",\"pattern\":\"#(?<browser>Version|Chrome|other)[\\/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"172.58.172.158\"}',	1614785531),
(23,	'f6d497a2de9052610defcef0601bed294abf33761614745816aea7b41a295cf8e5998b3bc96b90173a',	8,	'Mac',	'{\"userAgent\":\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Mobile\\/15E148 LightSpeed [FBAN\\/MessengerLiteForiOS;FBAV\\/301.0.0.25.108;FBBV\\/274145607;FBDV\\/iPhone11,8;FBMD\\/iPhone;FBSN\\/iOS;FBSV\\/14.4;FBSS\\/2;FBCR\\/;FBID\\/phone;FBLC\\/en;FBOP\\/0]\",\"name\":\"Unknown\",\"version\":\"?\",\"platform\":\"Mac\",\"pattern\":\"#(?<browser>Version||other)[\\/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"97.115.137.255\"}',	1614747372),
(24,	'bf60bb58046f01929d6c607057b68af5681236d81614746093e3133b1f2a00076f50d7b16f7a93503c',	9,	'Mac',	'{\"userAgent\":\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Mobile\\/15E148 Instagram 177.0.0.20.117 (iPhone10,4; iOS 14_4; en_US; en-US; scale=2.00; 750x1334; 275424340)\",\"name\":\"Unknown\",\"version\":\"?\",\"platform\":\"Mac\",\"pattern\":\"#(?<browser>Version||other)[\\/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"159.250.162.137\"}',	1614748133),
(25,	'1fa521bc8939f8ce8eb37b164128430a1844afcf16147579624cce7c601712536a539ef55264b7ef01',	10,	'Mac',	'{\"userAgent\":\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_5 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Mobile\\/15E148 LightSpeed [FBAN\\/MessengerLiteForiOS;FBAV\\/301.0.0.25.108;FBBV\\/274145607;FBDV\\/iPhone9,1;FBMD\\/iPhone;FBSN\\/iOS;FBSV\\/13.5;FBSS\\/2;FBCR\\/;FBID\\/phone;FBLC\\/en;FBOP\\/0]\",\"name\":\"Unknown\",\"version\":\"?\",\"platform\":\"Mac\",\"pattern\":\"#(?<browser>Version||other)[\\/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"172.58.11.19\"}',	1614772339),
(27,	'02173716de786717acec0758a6639bfb0ea04d7f16148187848a25e80079e5c17aaaa62262c78776c8',	1,	'Mac',	'{\"userAgent\":\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/76.0.3809.123 Mobile\\/15E148 Safari\\/605.1\",\"name\":\"Apple Safari\",\"version\":\"605.1\",\"platform\":\"Mac\",\"pattern\":\"#(?<browser>Version|Safari|other)[\\/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"107.72.176.16\"}',	1614884077),
(28,	'43e1c9e049c6980094d5c386ac8c61882897c2931614819746b99154a8283727f54b59167d9c6cd5ce',	1,	'Mac',	'{\"userAgent\":\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/14.0.2 Mobile\\/15E148 Safari\\/604.1\",\"name\":\"Apple Safari\",\"version\":\"14.0.2\",\"platform\":\"Mac\",\"pattern\":\"#(?<browser>Version|Safari|other)[\\/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"107.72.176.16\"}',	1614820897),
(29,	'd701d0fbfca0267926cf00ca957c9ca1020d6c1016149756004bf1307fb07eb273c00da3013d9a02ed',	1,	'windows',	'{\"userAgent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/89.0.4389.72 Safari\\/537.36\",\"name\":\"Google Chrome\",\"version\":\"89.0.4389.72\",\"platform\":\"windows\",\"pattern\":\"#(?<browser>Version|Chrome|other)[\\/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"3.237.29.224\"}',	1614975600);


-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_static_pages`;

CREATE TABLE `pxp_static_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_name` varchar(255) NOT NULL DEFAULT '',
  `content` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `pxp_static_pages` (`id`, `page_name`, `content`) VALUES
(1,	'terms_of_use',	'&lt;h4&gt;1- Write your Terms Of Use here.&lt;/h4&gt;&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis sdnostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&amp;nbsp;&lt;br&gt;&lt;br&gt;&lt;/p&gt;&lt;h4&gt;2- Random title&lt;/h4&gt;&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;'),
(2,	'privacy_and_policy',	'&lt;h2&gt;Who we are?&lt;/h2&gt;&lt;p&gt;Provide name and contact details of the data controller. This will typically be your business or you, if you are a sole trader. Where applicable, you should include the identity and contact details of the controller’s representative and/or the data protection officer.&lt;/p&gt;&lt;h2&gt;What information do we collect?&lt;/h2&gt;&lt;p&gt;Specify the types of personal information you collect, eg names, addresses, user names, etc. You should include specific details on: how you collect data (eg when a user registers, purchases or uses your services, completes a contact form, signs up to a newsletter, etc) what specific data you collect through each of the data collection method if you collect data from third parties, you must specify categories of data and source if you process sensitive personal data or financial information, and how you handle this&amp;nbsp;&lt;br&gt;&lt;br&gt;You may want to provide the user with relevant definitions in relation to personal data and sensitive personal data.&amp;nbsp;&lt;br&gt;&lt;br&gt;&lt;/p&gt;&lt;h2&gt;How do we use personal information?&lt;/h2&gt;&lt;p&gt;Describe in detail all the service- and business-related purposes for which you will process data. For example, this may include things like: personalisation of content, business information or user experience account set up and administration delivering marketing and events communication carrying out polls and surveys internal research and development purposes providing goods and services legal obligations (eg prevention of fraud) meeting internal audit requirements&amp;nbsp;&lt;br&gt;&lt;br&gt;Please note this list is not exhaustive. You will need to record all purposes for which you process personal data.&amp;nbsp;&lt;br&gt;&lt;br&gt;&lt;/p&gt;&lt;h2&gt;What legal basis do we have for processing your personal data?&lt;/h2&gt;&lt;p&gt;Describe the relevant processing conditions contained within the GDPR. There are six possible legal grounds: consent contract legitimate interests vital interests public task legal obligation&amp;nbsp;&lt;br&gt;&lt;br&gt;Provide detailed information on all grounds that apply to your processing, and why. If you rely on consent, explain how individuals can withdraw and manage their consent. If you rely on legitimate interests, explain clearly what these are.&amp;nbsp;&lt;br&gt;&lt;br&gt;If you’re processing special category personal data, you will have to satisfy at least one of the six processing conditions, as well as additional requirements for processing under the GDPR. Provide information on all additional grounds that apply.&amp;nbsp;&lt;br&gt;&lt;br&gt;&lt;/p&gt;&lt;h2&gt;When do we share personal data?&lt;/h2&gt;&lt;p&gt;Explain that you will treat personal data confidentially and describe the circumstances when you might disclose or share it. Eg, when necessary to provide your services or conduct your business operations, as outlined in your purposes for processing. You should provide information on: how you will share the data what safeguards you will have in place what parties you may share the data with and why&lt;/p&gt;&lt;h2&gt;Where do we store and process personal data?&lt;/h2&gt;&lt;p&gt;If applicable, explain if you intend to store and process data outside of the data subject’s home country. Outline the steps you will take to ensure the data is processed according to your privacy policy and the applicable law of the country where data is located. If you transfer data outside the European Economic Area, outline the measures you will put in place to provide an appropriate level of data privacy protection. Eg contractual clauses, data transfer agreements, etc.&lt;/p&gt;&lt;h2&gt;How do we secure personal data?&lt;/h2&gt;&lt;p&gt;Describe your approach to data security and the technologies and procedures you use to protect personal information. For example, these may be measures: to protect data against accidental loss to prevent unauthorised access, use, destruction or disclosure to ensure business continuity and disaster recovery to restrict access to personal information to conduct privacy impact assessments in accordance with the law and your business policies to train staff and contractors on data security to manage third party risks, through use of contracts and security reviews&amp;nbsp;&lt;br&gt;&lt;br&gt;Please note this list is not exhaustive. You should record all mechanisms you rely on to protect personal data. You should also state if your organisation adheres to certain accepted standards or regulatory requirements.&amp;nbsp;&lt;br&gt;&lt;br&gt;&lt;/p&gt;&lt;h2&gt;How long do we keep your personal data for?&lt;/h2&gt;&lt;p&gt;Provide specific information on the length of time you will keep the information for in relation to each processing purpose. The GDPR requires you to retain data for no longer than reasonably necessary. Include details of your data or records retention schedules, or link to additional resources where these are published.&amp;nbsp;&lt;br&gt;&lt;br&gt;If you cannot state a specific period, you need to set out the criteria you will apply to determine how long to keep the data for (eg local laws, contractual obligations, etc)&amp;nbsp;&lt;br&gt;&lt;br&gt;You should also outline how you securely dispose of data after you no longer need it.&amp;nbsp;&lt;br&gt;&lt;br&gt;&lt;/p&gt;&lt;h2&gt;Your rights in relation to personal data&lt;/h2&gt;&lt;p&gt;Under the GDPR, you must respect the right of data subjects to access and control their personal data. In your privacy notice, you must outline their rights in respect of: access to personal information correction and deletion withdrawal of consent (if processing data on condition of consent) data portability restriction of processing and objection lodging a complaint with the Information Commissioner’s Office You should explain how individuals can exercise their rights, and how you plan to respond to subject data requests. State if any relevant exemptions may apply and set out any identity verifications procedures you may rely on. Include details of the circumstances where data subject rights may be limited, eg if fulfilling the data subject request may expose personal data about another person, or if you’re asked to delete data which you are required to keep by law.&lt;/p&gt;&lt;h2&gt;Use of automated decision-making and profiling&lt;/h2&gt;&lt;p&gt;Where you use profiling or other automated decision-making, you must disclose this in your privacy policy. In such cases, you must provide details on existence of any automated decision-making, together with information about the logic involved, and the likely significance and consequences of the processing of the individual.&lt;/p&gt;&lt;h2&gt;How to contact us?&lt;/h2&gt;&lt;p&gt;Explain how data subject can get in touch if they have questions or concerns about your privacy practices, their personal information, or if they wish to file a complaint. Describe all ways in which they can contact you – eg online, by email or postal mail.&amp;nbsp;&lt;br&gt;&lt;br&gt;If applicable, you may also include information on:&amp;nbsp;&lt;br&gt;&lt;br&gt;&lt;/p&gt;&lt;h2&gt;Use of cookies and other technologies&lt;/h2&gt;&lt;p&gt;You may include a link to further information, or describe within the policy if you intend to set and use cookies, tracking and similar technologies to store and manage user preferences on your website, advertise, enable content or otherwise analyse user and usage data. Provide information on what types of cookies and technologies you use, why you use them and how an individual can control and manage them.&amp;nbsp;&lt;br&gt;&lt;br&gt;Linking to other websites / third party content If you link to external sites and resources from your website, be specific on whether this constitutes endorsement, and if you take any responsibility for the content (or information contained within) any linked website.&amp;nbsp;&lt;br&gt;&lt;br&gt;You may wish to consider adding other optional clauses to your privacy policy, depending on your business’ circumstances.&lt;/p&gt;'),
(3,	'about_us',	'&lt;h4&gt;1- Write about your website here.&lt;/h4&gt;&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&amp;nbsp;&lt;br&gt;&lt;br&gt;&lt;/p&gt;&lt;h4&gt;2- Random title&lt;/h4&gt;&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dxzcolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;'),
(4,	'contact_us',	'<form id=\"contact_us_form\" class=\"form row pp_sett_form\"><div class=\"col-md-3\">&nbsp;</div><div class=\"col-md-6\"><div class=\"pp_mat_input\"><input class=\"form-control\" name=\"first_name\" required=\"true\" type=\"text\"> <label>First Name*</label></div><div class=\"pp_mat_input\"><input class=\"form-control\" name=\"last_name\" required=\"true\" type=\"text\"> <label>Last Name*</label></div><div class=\"pp_mat_input\" style=\"margin-bottom: 1.7em;\" data-mce-style=\"margin-bottom: 1.7em;\"><input class=\"form-control\" name=\"email\" required=\"true\" type=\"email\"> <label>Email*</label></div><div class=\"pp_mat_input\"><textarea class=\"form-control\" name=\"message\" rows=\"3\"></textarea> <label>Messages</label></div><div class=\"pp_terms\"><input id=\"terms\" name=\"terms\" type=\"checkbox\" onchange=\"activate_Button(this)\" > <label for=\"terms\"> I agree to the <a href=\"http://localhost/pixelphoto/terms-of-use\" data-ajax=\"ajax_loading.php?app=terms&apph=terms&page=terms-of-use\">Terms of use</a></label></div><div class=\"col-md-3\">&nbsp;</div><div class=\"pp_load_loader\"><button id=\"contact_submit\" class=\"btn btn-info pp_flat_btn\" disabled=\"disabled\" type=\"submit\">Send</button></div><div class=\"clear\">&nbsp;</div></div><div class=\"col-md-3\">&nbsp;</div></form>');


-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_store`;

CREATE TABLE `pxp_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `title` varchar(250) DEFAULT '',
  `category` int(11) unsigned DEFAULT NULL,
  `price` int(11) unsigned DEFAULT NULL,
  `license` varchar(50) DEFAULT '',
  `tags` text DEFAULT NULL,
  `small_file` varchar(250) DEFAULT '',
  `full_file` varchar(255) DEFAULT '',
  `sells` int(11) unsigned DEFAULT 0,
  `views` int(11) unsigned DEFAULT 0,
  `downloads` int(11) unsigned DEFAULT 0,
  `created_date` int(11) unsigned NOT NULL,
  `license_options` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_story`;

CREATE TABLE `pxp_story` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `caption` varchar(500) NOT NULL DEFAULT '',
  `time` varchar(50) NOT NULL DEFAULT '0',
  `media_file` varchar(3000) NOT NULL DEFAULT '',
  `type` enum('1','2') NOT NULL DEFAULT '1',
  `duration` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `time` (`time`),
  CONSTRAINT `pxp_story_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `pxp_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_story_views`;

CREATE TABLE `pxp_story_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `story_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `time` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `story_id` (`story_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `pxp_story_views_ibfk_1` FOREIGN KEY (`story_id`) REFERENCES `pxp_story` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_transactions`;

CREATE TABLE `pxp_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `amount` varchar(50) NOT NULL DEFAULT '0',
  `admin_com` varchar(50) NOT NULL DEFAULT '0',
  `type` varchar(100) NOT NULL DEFAULT '',
  `item_store_id` int(11) unsigned DEFAULT 0,
  `item_license` varchar(200) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `time` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `admin_com` (`admin_com`),
  KEY `amount` (`amount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_user_reports`;

CREATE TABLE `pxp_user_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(15) NOT NULL DEFAULT 0,
  `profile_id` int(15) NOT NULL DEFAULT 0,
  `type` int(5) NOT NULL DEFAULT 0,
  `time` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `profile_id` (`profile_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_userads`;

CREATE TABLE `pxp_userads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(3000) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `headline` varchar(200) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `location` varchar(1000) NOT NULL DEFAULT 'us',
  `audience` longtext DEFAULT NULL,
  `ad_media` varchar(3000) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `gender` varchar(15) CHARACTER SET utf8 COLLATE utf8_danish_ci NOT NULL DEFAULT 'all',
  `bidding` varchar(15) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `clicks` int(15) NOT NULL DEFAULT 0,
  `views` int(15) NOT NULL DEFAULT 0,
  `posted` varchar(15) NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT 1,
  `appears` varchar(10) NOT NULL DEFAULT 'post',
  `user_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `appears` (`appears`),
  KEY `user_id` (`user_id`),
  KEY `location` (`location`(255)),
  KEY `gender` (`gender`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_users`;

CREATE TABLE `pxp_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `email` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `ip_address` varchar(150) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `password` varchar(61) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `fname` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lname` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gender` varchar(10) CHARACTER SET latin1 NOT NULL DEFAULT 'male',
  `email_code` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `language` varchar(22) CHARACTER SET latin1 NOT NULL DEFAULT 'english',
  `avatar` varchar(1000) CHARACTER SET latin1 NOT NULL DEFAULT 'media/img/d-avatar.jpg',
  `cover` varchar(3000) CHARACTER SET utf8 NOT NULL DEFAULT 'media/img/d-cover.jpg',
  `country_id` int(11) NOT NULL DEFAULT 0,
  `about` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `google` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `facebook` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `twitter` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `website` varchar(300) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `active` int(11) NOT NULL DEFAULT 0,
  `admin` int(11) NOT NULL DEFAULT 0,
  `verified` int(11) NOT NULL DEFAULT 0,
  `last_seen` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `registered` varchar(40) CHARACTER SET latin1 NOT NULL DEFAULT '0000/0',
  `is_pro` int(11) NOT NULL DEFAULT 0,
  `posts` int(11) NOT NULL DEFAULT 0,
  `p_privacy` enum('2','1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '2',
  `c_privacy` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `n_on_like` enum('1','0') CHARACTER SET utf8 NOT NULL DEFAULT '1',
  `n_on_mention` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `n_on_comment` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `n_on_follow` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `n_on_comment_like` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `n_on_comment_reply` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `startup_avatar` int(11) NOT NULL DEFAULT 0,
  `startup_info` int(11) NOT NULL DEFAULT 0,
  `startup_follow` int(11) NOT NULL DEFAULT 0,
  `src` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `login_token` char(32) COLLATE utf8_unicode_ci DEFAULT '',
  `search_engines` enum('0','1') CHARACTER SET utf8 NOT NULL DEFAULT '1',
  `mode` varchar(11) CHARACTER SET utf8 NOT NULL DEFAULT 'day',
  `device_id` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `balance` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `wallet` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '0.00',
  `referrer` int(11) NOT NULL DEFAULT 0,
  `profile` int(11) NOT NULL DEFAULT 1,
  `business_account` int(11) NOT NULL DEFAULT 0,
  `paypal_email` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `b_name` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `b_email` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `b_phone` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `b_site` varchar(300) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `b_site_action` varchar(11) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `uploads` int(11) unsigned DEFAULT 0,
  PRIMARY KEY (`user_id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `password` (`password`),
  KEY `last_active` (`last_seen`),
  KEY `admin` (`admin`),
  KEY `active` (`active`),
  KEY `registered` (`registered`),
  KEY `p_privacy` (`p_privacy`),
  KEY `c_privacy` (`c_privacy`),
  KEY `n_on_like` (`n_on_like`),
  KEY `n_on_mention` (`n_on_mention`),
  KEY `n_on_comment` (`n_on_comment`),
  KEY `n_on_follow` (`n_on_follow`),
  KEY `src` (`src`),
  KEY `n_on_comment_like` (`n_on_comment_like`),
  KEY `n_on_comment_reply` (`n_on_comment_reply`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

INSERT INTO `pxp_users` (`user_id`, `username`, `email`, `ip_address`, `password`, `fname`, `lname`, `gender`, `email_code`, `language`, `avatar`, `cover`, `country_id`, `about`, `google`, `facebook`, `twitter`, `website`, `active`, `admin`, `verified`, `last_seen`, `registered`, `is_pro`, `posts`, `p_privacy`, `c_privacy`, `n_on_like`, `n_on_mention`, `n_on_comment`, `n_on_follow`, `n_on_comment_like`, `n_on_comment_reply`, `startup_avatar`, `startup_info`, `startup_follow`, `src`, `login_token`, `search_engines`, `mode`, `device_id`, `balance`, `wallet`, `referrer`, `profile`, `business_account`, `paypal_email`, `b_name`, `b_email`, `b_phone`, `b_site`, `b_site_action`, `uploads`) VALUES
(1,	'BouGee',	'support@bougee.xyz',	'3.237.29.224',	'$2y$10$SIgfkUslMOJD7/bm.xuAB.0W54mC.C.VlOuGfTmXIfsWGcbBCWjme',	'BouGee',	'Support',	'male',	'',	'english',	'media/upload/photos/2021/03/ycML6d5rpnQvcLGZu5SyxbImYYXOb8YL75JWxYmLusviJO9qV4_04_2b285c7643cf63ab4e86fc026ea86f1f_image.jpeg',	'media/img/d-cover.jpg',	1,	'',	'',	'',	'',	'',	1,	1,	1,	'1614975630',	'00/0000',	1,	0,	'1',	'2',	'1',	'1',	'1',	'1',	'1',	'1',	1,	1,	1,	'',	'',	'1',	'day',	'',	'0',	'0.00',	0,	1,	1,	'',	'',	'',	'',	'',	'',	0),
(2,	'Radharani',	'mirandashinesofficial@gmail.com',	'172.58.14.165',	'$2y$10$kvsSFrxZ2hX3VZIaw4P3n.vuIGsZhmRhrFW5UcrNt97fRemkdiyjq',	'Miranda',	'Shines',	'female',	'',	'english',	'media/upload/photos/2021/03/5xjmfeQ3Qo3uoMd4IVETk6LHkdjnsBEkeOPsPxiX6j2goytWg8_02_f5639bbc94ddd03c64aa8069fa329114_image.jpeg',	'media/img/d-cover.jpg',	1,	NULL,	'',	'',	'',	'',	1,	0,	1,	'1614973292',	'2021/3',	1,	0,	'2',	'1',	'1',	'1',	'1',	'1',	'1',	'1',	1,	1,	1,	'',	'',	'1',	'day',	'',	'0',	'0.00',	0,	1,	1,	'',	'',	'',	'',	'',	'',	0),
(3,	'eharouge',	'eharouge@gmail.com',	'107.72.162.34',	'$2y$10$jl39UWt2s7GuMfCCWHTmKuaA/6Wsktm/NhYmwIzvJrIe/JJBV1N1y',	'',	'',	'male',	'',	'english',	'media/upload/photos/2021/03/Ir1ZL4pp8hznsxEYeA9G4LENkjCgssd6YrLbPtdtbzD7O3oc8J_02_c8a29d24958c275de348f5e89791e4b0_image.jpeg',	'media/img/d-cover.jpg',	0,	NULL,	'',	'',	'',	'',	1,	0,	1,	'1614972305',	'2021/3',	1,	0,	'2',	'1',	'1',	'1',	'1',	'1',	'1',	'1',	1,	1,	1,	'',	'',	'1',	'day',	'',	'0',	'0.00',	0,	1,	1,	'',	'',	'',	'',	'',	'',	0),
(4,	'elexisansley',	'elexisansley@gmail.com',	'76.211.178.254',	'$2y$10$W1pqjzygK42OjQ38HQ5jbOsrVBJ3CT.VfKP8CFe9CB9rk7AfHaQOG',	'Elexis',	'Ansley',	'female',	'',	'english',	'media/upload/photos/2021/03/p5UYWQfdQqwCtTktHt9D9kou7ZjZ255EG676Zrz7cdC2Z3khCH_03_cf34dbbc68421ba0b190c1897662b808_image.jpeg',	'media/img/d-cover.jpg',	1,	'Two time Billboard Charting Artist <br>Singer • Songwriter • Actress • Multi-Instrumentalist',	'',	'https%3A%2F%2Fm.facebook.com%2Fmusicbyelexis',	'https%3A%2F%2Fmobile.twitter.com%2Felexisansley',	'https%3A%2F%2Felexisansley.com%2F',	1,	0,	1,	'1614784266',	'2021/3',	1,	0,	'2',	'1',	'1',	'1',	'1',	'1',	'1',	'1',	1,	1,	1,	'',	'',	'1',	'day',	'',	'0',	'0.00',	0,	1,	1,	'',	'Ninth Dimension Records',	'',	'',	'',	'1',	0),
(5,	'Sdarlotus',	'darfro24@gmail.com',	'174.228.43.39',	'$2y$10$f2Fj74RM4atZ2WGuNFsGneCj7RBrZzJTcCplfsy4rxgFEbi4ZoQ/u',	'',	'',	'female',	'',	'english',	'media/upload/photos/2021/03/oX1rSXAf8HIECMHMN9T3UYsaWNdNWeEpE2wOwkrJoc37ZAttdq_03_718206c4a431f3268d8de538f851ad6b_image.jpg',	'media/img/d-cover.jpg',	0,	NULL,	'',	'',	'',	'',	1,	0,	1,	'1614822284',	'2021/3',	1,	0,	'2',	'1',	'1',	'1',	'1',	'1',	'1',	'1',	1,	1,	1,	'',	'',	'1',	'day',	'',	'0',	'0.00',	0,	1,	1,	'',	'',	'',	'',	'',	'',	0),
(6,	'PrimoCruz',	'bmfprimocruz@gmail.com',	'0.0.0.0',	'$2y$10$I9glOfBWBZBV2LEZ77pfIOBHQ0h1t.1w4XhjkVZ7TvYYR61RAFIKe',	'Primo',	'Cruz',	'male',	'',	'english',	'media/upload/photos/2021/03/lhQEaBk3RzqueMipw5z4bFm6stUNNULEptWEf72pxIHsg8hioI_03_0bb76c2445411e3bbe6a33e6dbb91d01_image.jpeg',	'media/img/d-cover.jpg',	1,	NULL,	'',	'',	'',	'',	1,	0,	1,	'1614824039',	'2021/3',	1,	0,	'2',	'1',	'1',	'1',	'1',	'1',	'1',	'1',	1,	1,	1,	'',	'',	'1',	'day',	'',	'0',	'0.00',	0,	1,	1,	'',	'',	'',	'',	'',	'',	0),
(7,	'CubaThatGass',	'thatgassbrand@gmail.com',	'172.58.172.158',	'$2y$10$r9/TTy7Y93yWANW7Em8eQ.x8XhOa5FLaA4SJl4PY3dtoGEld5qD.2',	'Cuba',	'ThatGass',	'male',	'',	'english',	'media/upload/photos/2021/03/Q8pCHqZiHTxXYigo9cShayOqQpkC3GLtWdJ47XVoacHXlVZnmn_03_b86336965d7c1edfa2d26efcad97afbc_image.jpg',	'media/img/d-cover.jpg',	1,	NULL,	'',	'',	'',	'',	1,	0,	1,	'1614785581',	'2021/3',	0,	0,	'2',	'1',	'1',	'1',	'1',	'1',	'1',	'1',	1,	1,	1,	'',	'',	'1',	'day',	'',	'0',	'0.00',	0,	1,	0,	'',	'',	'',	'',	'',	'',	0),
(8,	'Bhoss_sevenTen',	'olugo1117@gmail.com',	'0.0.0.0',	'$2y$10$GvmjoDemLRBUGhWj6GV60.XIi2zUhpYfL4nTE2J6ztXm15F9YHCKy',	'Ohmar',	'Lugo',	'male',	'',	'english',	'media/upload/photos/2021/03/1IaX1gNI3XfJyuJcIqVSfbJfSsB9iCBVwSlI91y7fHnDbocD6Q_03_5a63600c375c7204d273b2c13c64ae11_image.jpeg',	'media/img/d-cover.jpg',	1,	NULL,	'',	'',	'',	'',	1,	0,	0,	'1614747394',	'2021/3',	0,	0,	'2',	'1',	'1',	'1',	'1',	'1',	'1',	'1',	1,	1,	1,	'',	'',	'1',	'day',	'',	'0',	'0.00',	0,	1,	0,	'',	'',	'',	'',	'',	'',	0),
(9,	'Inspireju',	'inspireju8@gmail.com',	'0.0.0.0',	'$2y$10$twZn26xInUaB0TlU8LQVae/vbznnok6TVC6VAH5gbeQul6Rpgo3g.',	'Julija',	'Sajaz',	'female',	'',	'english',	'media/upload/photos/2021/03/JscCRYEAeN2TVjvTqihmyvA5kTkKZjJ37Ziy92FmQUvxgKz14S_03_899f811d60be3451e5e3e14b977a82f8_image.jpeg',	'media/img/d-cover.jpg',	1,	NULL,	'',	'',	'',	'',	1,	0,	0,	'1614748173',	'2021/3',	0,	0,	'2',	'1',	'1',	'1',	'1',	'1',	'1',	'1',	1,	1,	1,	'',	'',	'1',	'day',	'',	'0',	'0.00',	0,	1,	0,	'',	'',	'',	'',	'',	'',	0),
(10,	'nuvoid',	'nuvoidk@gmail.com',	'0.0.0.0',	'$2y$10$fg0wL8.ZkV0weVx3zSeVjO4qOGMVdz/UU2KNUXkOqtsnIoNzizsna',	'Mike',	'K',	'male',	'',	'english',	'media/upload/photos/2021/03/2MacDmFkE1touSUFr4kOHNsIIKZDEtRB5GMw4OImTW484UTj9c_03_3663856f22862b40718fe3691fb45147_image.jpeg',	'media/img/d-cover.jpg',	1,	'music, film, comedy.',	'',	'',	'',	'',	1,	0,	0,	'1614885797',	'2021/3',	0,	0,	'2',	'1',	'1',	'1',	'1',	'1',	'1',	'1',	1,	1,	1,	'',	'',	'1',	'day',	'',	'0',	'0.00',	0,	1,	0,	'',	'',	'',	'',	'',	'',	0),
(11,	'Megastar',	'megastarnation@gmail.com',	'0.0.0.0',	'$2y$10$Kws3kTj9gfbWaa3HU6e7S.8P8o4qSTgKdxQIMdJHkdtn.1740z7cS',	'Megastar',	'Global',	'male',	'',	'english',	'media/upload/photos/2021/03/WI7rAVwIyKajeMJlxinpNJGLHokrPkKR3aEh2vRGmFMVeroMUk_03_ebcb376a73d4741ce01c374974e0d03c_image.png',	'media/img/d-cover.jpg',	1,	'',	'',	'',	'',	'',	1,	0,	0,	'1614766318',	'2021/3',	0,	0,	'2',	'1',	'1',	'1',	'1',	'1',	'1',	'1',	1,	1,	1,	'',	'',	'1',	'day',	'',	'0',	'0.00',	0,	1,	0,	'',	'',	'',	'',	'',	'',	0);


-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_verification_requests`;

CREATE TABLE `pxp_verification_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT '',
  `passport` text DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `message` varchar(200) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT 0,
  `time` int(50) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `pxp_withdrawal_requests`;

CREATE TABLE `pxp_withdrawal_requests` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `email` varchar(200) NOT NULL DEFAULT '',
  `amount` varchar(100) NOT NULL DEFAULT '0',
  `currency` varchar(20) NOT NULL DEFAULT '',
  `requested` varchar(100) NOT NULL DEFAULT '',
  `status` int(5) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `videocalles`;

CREATE TABLE `videocalles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_token` text DEFAULT NULL,
  `access_token_2` text DEFAULT NULL,
  `from_id` int(11) NOT NULL DEFAULT 0,
  `to_id` int(11) NOT NULL DEFAULT 0,
  `room_name` varchar(50) NOT NULL DEFAULT '',
  `active` int(11) NOT NULL DEFAULT 0,
  `called` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  `declined` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `to_id` (`to_id`),
  KEY `from_id` (`from_id`),
  KEY `called` (`called`),
  KEY `declined` (`declined`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- THE END
