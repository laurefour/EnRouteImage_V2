-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2017 at 07:02 AM
-- Server version: 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `labelimgdb`
--
CREATE DATABASE IF NOT EXISTS `labelimgdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `labelimgdb`;

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'An identifier used to track the type of activity.',
  `occurred_at` timestamp NULL DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `icon` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fa fa-user' COMMENT 'The icon representing users in this group.',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `slug`, `name`, `description`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'groupuser', 'GroupUser', 'standard user', '', '2017-01-31 14:33:19', '2017-02-17 05:47:44');

-- --------------------------------------------------------

--
-- Table structure for table `labelimgarea`
--

CREATE TABLE `labelimgarea` (
  `id` int(4) NOT NULL,
  `source` int(4) NOT NULL,
  `rectType` int(4) NOT NULL,
  `rectLeft` int(4) NOT NULL,
  `rectTop` int(4) NOT NULL,
  `rectRight` int(4) NOT NULL,
  `rectBottom` int(4) NOT NULL,
  `user` int(4) NOT NULL DEFAULT '0' COMMENT 'id of the user that submitted the area',
  `alive` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'when 0 considered area as deleted'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `labelimgcategories`
--

CREATE TABLE `labelimgcategories` (
  `id` int(4) NOT NULL,
  `Category` char(25) NOT NULL,
  `Color` char(7) NOT NULL DEFAULT '#FFFFFF' COMMENT 'Color associated with the category'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `labelimgexportlinks`
--

CREATE TABLE `labelimgexportlinks` (
  `id` int(4) NOT NULL,
  `token` char(50) NOT NULL,
  `archivePath` char(100) NOT NULL,
  `expires` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `labelimglinks`
--

CREATE TABLE `labelimglinks` (
  `id` int(4) NOT NULL,
  `path` char(250) NOT NULL,
  `validated` tinyint(1) NOT NULL DEFAULT '0',
  `available` tinyint(4) NOT NULL DEFAULT '1',
  `requested` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `expires_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'A code that references a specific action or URI that an assignee of this permission has access to.',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `conditions` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'The conditions under which members of this group have access to this hook.',
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `slug`, `name`, `conditions`, `description`, `created_at`, `updated_at`) VALUES
(1, 'create_group', 'Create group', 'always()', 'Create a new group.', '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(2, 'create_user', 'Create user', 'always()', 'Create a new user in your own group and assign default roles.', '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(3, 'create_user_field', 'Set new user group', 'subset(fields,[\'group\'])', 'Set the group when creating a new user.', '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(4, 'delete_group', 'Delete group', 'always()', 'Delete a group.', '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(5, 'delete_user', 'Delete user', '!has_role(user.id,2) && !is_master(user.id)', 'Delete users who are not Site Administrators.', '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(6, 'update_account_settings', 'Edit user', 'always()', 'Edit your own account settings.', '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(7, 'update_group_field', 'Edit group', 'always()', 'Edit basic properties of any group.', '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(8, 'update_user_field', 'Edit user', '!has_role(user.id,2) && subset(fields,[\'name\',\'email\',\'locale\',\'group\',\'flag_enabled\',\'flag_verified\',\'password\'])', 'Edit users who are not Site Administrators.', '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(9, 'update_user_field', 'Edit group user', 'equals_num(self.group_id,user.group_id) && !is_master(user.id) && !has_role(user.id,2) && (!has_role(user.id,3) || equals_num(self.id,user.id)) && subset(fields,[\'name\',\'email\',\'locale\',\'flag_enabled\',\'flag_verified\',\'password\',\'roles\'])', 'Edit users in your own group who are not Site or Group Administrators, except yourself.', '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(10, 'uri_account_settings', 'Account settings page', 'always()', 'View the account settings page.', '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(11, 'uri_activities', 'Activity monitor', 'always()', 'View a list of all activities for all users.', '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(12, 'uri_dashboard', 'Admin dashboard', 'has_role(self.id,2) || has_role(self.id,3)', 'View the administrative dashboard.', '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(13, 'uri_group', 'View group', 'always()', 'View the group page of any group.', '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(14, 'uri_group', 'View own group', 'equals_num(self.group_id,group.id)', 'View the group page of your own group.', '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(15, 'uri_groups', 'Group management page', 'always()', 'View a page containing a list of groups.', '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(16, 'uri_user', 'View user', 'always()', 'View the user page of any user.', '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(17, 'uri_user', 'View user', 'equals_num(self.group_id,user.group_id) && !is_master(user.id) && !has_role(user.id,2) && (!has_role(user.id,3) || equals_num(self.id,user.id))', 'View the user page of any user in your group, except the master user and Site and Group Administrators (except yourself).', '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(18, 'uri_users', 'User management page', 'always()', 'View a page containing a table of users.', '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(19, 'view_group_field', 'View group', 'in(property,[\'name\',\'icon\',\'slug\',\'description\',\'users\'])', 'View certain properties of any group.', '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(20, 'view_group_field', 'View group', 'equals_num(self.group_id,group.id) && in(property,[\'name\',\'icon\',\'slug\',\'description\',\'users\'])', 'View certain properties of your own group.', '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(21, 'view_user_field', 'View user', 'in(property,[\'user_name\',\'name\',\'email\',\'locale\',\'theme\',\'roles\',\'group\',\'activities\'])', 'View certain properties of any user.', '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(22, 'view_user_field', 'View user', 'equals_num(self.group_id,user.group_id) && !is_master(user.id) && !has_role(user.id,2) && (!has_role(user.id,3) || equals_num(self.id,user.id)) && in(property,[\'user_name\',\'name\',\'email\',\'locale\',\'roles\',\'group\',\'activities\'])', 'View certain properties of any user in your own group, except the master user and Site and Group Administrators (except yourself).', '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(23, 'uri_label', 'view label page', 'has_role(self.id,1) || has_role(self.id,2) || has_role(self.id,3)', 'View the page to annotate the photos', NULL, NULL),
(24, 'uri_validate', 'view validate page', 'has_role(self.id,2) || has_role(self.id,3)', 'View the page to validate the photos', NULL, NULL),
(25, 'uri_upload', 'view upload page', 'has_role(self.id,2)', 'View the page to upload the photos, manage category, export processed data.', NULL, NULL),
(26, 'uri_roles', 'access roles', 'has_role(self.id,2)', 'get the info about roles,', NULL, NULL),
(27, 'uri_export', 'export data', 'has_role(self.id,2)', 'Grant right to export data', NULL, NULL),
(28, 'uri_catEdit', 'export data', 'has_role(self.id,2)', 'Grant right to edit categories of areas', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_roles`
--

CREATE TABLE `permission_roles` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_roles`
--

INSERT INTO `permission_roles` (`permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 2, '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(2, 2, '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(2, 3, '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(3, 2, '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(4, 2, '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(5, 2, '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(6, 1, '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(7, 2, '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(8, 2, '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(9, 3, '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(10, 1, '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(11, 2, '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(12, 2, NULL, NULL),
(13, 2, '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(14, 3, '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(15, 2, '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(16, 2, '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(17, 3, '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(18, 2, '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(19, 2, '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(20, 3, '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(21, 2, '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(22, 3, '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(23, 1, '2017-02-09 07:50:42', '2017-02-09 07:50:42'),
(23, 2, '2017-02-09 07:57:07', '2017-02-09 07:57:07'),
(23, 3, '2017-02-09 07:58:25', '2017-02-09 07:58:25'),
(24, 2, '2017-02-09 07:57:07', '2017-02-09 07:57:07'),
(24, 3, '2017-02-09 07:58:25', '2017-02-09 07:58:25'),
(25, 2, '2017-02-09 07:57:07', '2017-02-09 07:57:07'),
(26, 2, NULL, NULL),
(27, 2, NULL, NULL),
(28, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `persistences`
--

CREATE TABLE `persistences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `token` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `persistent_token` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `slug`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'user', 'User', 'This role provides basic user functionality.', '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(2, 'site-admin', 'Site Administrator', 'This role is meant for "site administrators", who can basically do anything except create, edit, or delete other administrators.', '2017-01-31 14:33:19', '2017-01-31 14:33:19'),
(3, 'group-admin', 'Group Administrator', 'This role is meant for "group administrators", who can basically do anything with users in their own group, except other administrators of that group.', '2017-01-31 14:33:19', '2017-01-31 14:33:19');

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8_unicode_ci,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `throttles`
--

CREATE TABLE `throttles` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `request_data` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en_US' COMMENT 'The language and locale to use for this user.',
  `theme` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The user theme.',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'The id of the user group.',
  `flag_verified` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Set to 1 if the user has verified their account via email, 0 otherwise.',
  `flag_enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Set to 1 if the user account is currently enabled, 0 otherwise.  Disabled accounts cannot be logged in to, but they retain all of their data and settings.',
  `last_activity_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'The id of the last activity performed by this user.',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `email`, `first_name`, `last_name`, `locale`, `theme`, `group_id`, `flag_verified`, `flag_enabled`, `last_activity_id`, `password`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'root', 'labelimage.manager@gmail.com', 'labelimage', 'Manager', 'en_US', 'root', 1, 1, 1, 124, '$2y$10$0pqkT4iLXlNI6ak7omYPteDPen02qY80ygl1GzLIQ.C2aS1QrAscm', NULL, '2017-01-31 15:46:59', '2017-02-14 08:46:18'),
(2, 'AdminSh', 'shaun.mermet@labromance.com', 'Shaun', 'Mermet', 'en_US', NULL, 1, 1, 1, 133, '$2y$10$X40HcSTm15VBZqv0SoIiBeU1sAfOBhHxsmNijsBprZ8hF9Kl8nQii', NULL, '2017-02-14 01:27:37', '2017-02-17 05:57:04');

-- --------------------------------------------------------

--
-- Table structure for table `verifications`
--

CREATE TABLE `verifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `expires_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `version`
--

CREATE TABLE `version` (
  `sprinkle` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `version`
--

INSERT INTO `version` (`sprinkle`, `version`, `created_at`, `updated_at`) VALUES
('core', '4.0.0-alpha', '2017-01-31 14:33:02', '2017-01-31 14:33:02'),
('account', '4.0.0-alpha', '2017-01-31 14:33:02', '2017-01-31 14:33:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activities_user_id_index` (`user_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `groups_slug_unique` (`slug`),
  ADD KEY `groups_slug_index` (`slug`);

--
-- Indexes for table `labelimgarea`
--
ALTER TABLE `labelimgarea`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `labelimgcategories`
--
ALTER TABLE `labelimgcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `labelimgexportlinks`
--
ALTER TABLE `labelimgexportlinks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`);

--
-- Indexes for table `labelimglinks`
--
ALTER TABLE `labelimglinks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `path` (`path`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_user_id_index` (`user_id`),
  ADD KEY `password_resets_hash_index` (`hash`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_roles`
--
ALTER TABLE `permission_roles`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_roles_permission_id_index` (`permission_id`),
  ADD KEY `permission_roles_role_id_index` (`role_id`);

--
-- Indexes for table `persistences`
--
ALTER TABLE `persistences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persistences_user_id_index` (`user_id`),
  ADD KEY `persistences_token_index` (`token`),
  ADD KEY `persistences_persistent_token_index` (`persistent_token`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`),
  ADD KEY `roles_slug_index` (`slug`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_users_user_id_index` (`user_id`),
  ADD KEY `role_users_role_id_index` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `throttles`
--
ALTER TABLE `throttles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `throttles_type_index` (`type`),
  ADD KEY `throttles_ip_index` (`ip`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_name_unique` (`user_name`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_user_name_index` (`user_name`),
  ADD KEY `users_email_index` (`email`),
  ADD KEY `users_group_id_index` (`group_id`),
  ADD KEY `users_last_activity_id_index` (`last_activity_id`);

--
-- Indexes for table `verifications`
--
ALTER TABLE `verifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verifications_user_id_index` (`user_id`),
  ADD KEY `verifications_hash_index` (`hash`);

--
-- Indexes for table `version`
--
ALTER TABLE `version`
  ADD UNIQUE KEY `version_sprinkle_unique` (`sprinkle`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `labelimgarea`
--
ALTER TABLE `labelimgarea`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=282;
--
-- AUTO_INCREMENT for table `labelimgcategories`
--
ALTER TABLE `labelimgcategories`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `labelimgexportlinks`
--
ALTER TABLE `labelimgexportlinks`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT for table `labelimglinks`
--
ALTER TABLE `labelimglinks`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;
--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `persistences`
--
ALTER TABLE `persistences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `throttles`
--
ALTER TABLE `throttles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `verifications`
--
ALTER TABLE `verifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
DELIMITER $$
--
-- Events
--
CREATE DEFINER=`labelImgManager`@`localhost` EVENT `free images` ON SCHEDULE EVERY '60:0' MINUTE_SECOND STARTS '2017-01-29 00:00:00' ENDS '2018-02-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE labelimglinks SET available = 1 WHERE available = 0 AND requested < DATE_SUB(NOW(), INTERVAL 1 MINUTE)$$

CREATE DEFINER=`labelImgManager`@`localhost` EVENT `Clean download links` ON SCHEDULE EVERY '0 6' DAY_HOUR STARTS '2017-01-29 00:00:00' ENDS '2018-01-29 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM `labelimgexportlinks` WHERE `labelimgexportlinks`.`expires`< NOW()$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


--Change for Alpha 0.2.1

ALTER TABLE `labelimglinks` ADD `category` INT(1) NULL DEFAULT NULL COMMENT 'category tag on image ref : labelimgcategories' AFTER `requested`;



--Change for Alpha 0.2.2

INSERT INTO `permissions` (`id`, `slug`, `name`, `conditions`, `description`, `created_at`, `updated_at`) VALUES (NULL, 'uri_validated', 'view validated page', 'has_role(self.id,2)', 'View the page to check validated images.', NULL, NULL);
INSERT INTO `permission_roles` (`permission_id`, `role_id`, `created_at`, `updated_at`) VALUES ('29', '2', NULL, NULL);
UPDATE `permissions` SET `name` = 'edit category' WHERE `permissions`.`id` = 28;
INSERT INTO `permissions` (`id`, `slug`, `name`, `conditions`, `description`, `created_at`, `updated_at`) VALUES (NULL, 'get_area', 'Get area', 'always()', 'Grant access to request areas', NULL, NULL);
INSERT INTO `permission_roles` (`permission_id`, `role_id`, `created_at`, `updated_at`) VALUES ('30', '2', NULL, NULL);
INSERT INTO `permission_roles` (`permission_id`, `role_id`, `created_at`, `updated_at`) VALUES ('30', '3', NULL, NULL);
INSERT INTO `permissions` (`id`, `slug`, `name`, `conditions`, `description`, `created_at`, `updated_at`) VALUES (NULL, 'create_area', 'Create area', 'always()', 'Grant access to create areas', NULL, NULL);
INSERT INTO `permission_roles` (`permission_id`, `role_id`, `created_at`, `updated_at`) VALUES ('31', '1', NULL, NULL);
INSERT INTO `permission_roles` (`permission_id`, `role_id`, `created_at`, `updated_at`) VALUES ('31', '2', NULL, NULL);
INSERT INTO `permission_roles` (`permission_id`, `role_id`, `created_at`, `updated_at`) VALUES ('31', '3', NULL, NULL);
INSERT INTO `permissions` (`id`, `slug`, `name`, `conditions`, `description`, `created_at`, `updated_at`) VALUES (NULL, 'update_area', 'Update area', 'always()', 'Grant access to update areas', NULL, NULL);
INSERT INTO `permission_roles` (`permission_id`, `role_id`, `created_at`, `updated_at`) VALUES ('32', '2', NULL, NULL);
INSERT INTO `permission_roles` (`permission_id`, `role_id`, `created_at`, `updated_at`) VALUES ('32', '3', NULL, NULL);
INSERT INTO `permissions` (`id`, `slug`, `name`, `conditions`, `description`, `created_at`, `updated_at`) VALUES (NULL, 'delete_area', 'Delete area', 'always()', 'Grant access to delete areas', NULL, NULL);
INSERT INTO `permission_roles` (`permission_id`, `role_id`, `created_at`, `updated_at`) VALUES ('33', '2', NULL, NULL);
INSERT INTO `permission_roles` (`permission_id`, `role_id`, `created_at`, `updated_at`) VALUES ('33', '3', NULL, NULL);

ALTER TABLE `labelimglinks` ADD `validated_at` DATETIME NULL DEFAULT NULL AFTER `category`;


--------------------------------
--- Changes for Alpha 0.2.3 ----
--------------------------------


--------------------------------
--- Changes for Alpha 0.2.4 ----
--------------------------------

DROP EVENT `free images`; CREATE DEFINER=`labelImgManager`@`localhost` EVENT `free images` ON SCHEDULE EVERY 3600 MINUTE_SECOND STARTS '2017-01-29 00:00:00' ENDS '2018-02-01 00:00:00' ON COMPLETION NOT PRESERVEENABLE DO UPDATE labelimglinks SET available = 1 WHERE available = 0 AND requested < DATE_SUB(NOW(), INTERVAL 1 HOUR);

INSERT INTO `role_users` (`user_id`, `role_id`, `created_at`, `updated_at`) VALUES ('2', '1', NOW(), NOW()), ('2', '2', NOW(), NOW()), ('2', '3', NOW(), NOW())
ON DUPLICATE KEY UPDATE `user_id` = `user_id`;

alter table `labelimgarea`
ADD CONSTRAINT UNIQUE(`source`,
                      `rectType`,
                      `rectLeft`,
                      `rectTop`,
                      `rectRight`,
                      `rectBottom`,
                      `alive`);

--------------------------------
--- Changes for Alpha 0.2.5 ----
--------------------------------

--------------------------------
--- Changes for Alpha 0.2.6 ----
--------------------------------

ALTER TABLE `labelimgarea` ADD `deleted_at` DATETIME NULL DEFAULT NULL AFTER `alive`;
UPDATE `labelimgarea` SET `deleted_at`= NOW() WHERE `alive` = 0;
ALTER TABLE `labelimgarea`
  DROP `alive`;
alter table `labelimgarea`
ADD CONSTRAINT UNIQUE(`source`,
                      `rectType`,
                      `rectLeft`,
                      `rectTop`,
                      `rectRight`,
                      `rectBottom`,
                      `deleted_at`);

--------------------------------
--- Changes for Alpha 0.2.7 ----
--------------------------------

--------------------------------
--- Changes for Alpha 0.2.8 ----
--------------------------------

--------------------------------
--- Changes for Beta 0.3.0 ----
--------------------------------

--------------------------------
--- Changes for Beta 0.3.1 ----
--------------------------------
CREATE TABLE `segCategories` (
  `id` int(4) NOT NULL,
  `Category` char(25) NOT NULL,
  `Color` char(7) NOT NULL DEFAULT '#FFFFFF' COMMENT 'Color associated with the category'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for table `segCategories`
--
ALTER TABLE `segCategories`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `segcategories` 
  ADD UNIQUE(` Color `);

--
-- AUTO_INCREMENT for table `segCategories`
--
ALTER TABLE `segCategories`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;


  --
-- Table structure for table `labelimglinks`
--

--DROP TABLE IF EXISTS `segImages`;
CREATE TABLE IF NOT EXISTS `segImages` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `path` char(250) NOT NULL,
  `validated` tinyint(1) NOT NULL DEFAULT '0',
  `requested` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `category` int(1) DEFAULT NULL COMMENT 'category tag on image ref : segCategories',
  `validated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


--
-- Table structure for table `segAreas`
--

CREATE TABLE `segAreas` (
  `id` int(4) NOT NULL,
  `source` int(4) NOT NULL,
  `areaType` int(4) NOT NULL,
  `data` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `user` int(4) NOT NULL DEFAULT '0' COMMENT 'id of the user that submitted the area',
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for table `segAreas`
--
ALTER TABLE `segAreas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for table `segAreas`
--
ALTER TABLE `segAreas`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--------------------------------
--- Changes for Beta 0.3.2 ----
--------------------------------

INSERT INTO `permissions` (`id`, `slug`, `name`, `conditions`, `description`, `created_at`, `updated_at`) VALUES (NULL, 'create_role', 'create role', 'has_role(self.id,2)', 'grants rights to create roles', NULL, NULL);
INSERT INTO `permission_roles` (`permission_id`, `role_id`, `created_at`, `updated_at`) VALUES ('34', '2', NULL, NULL);

INSERT INTO `roles` (`id`, `slug`, `name`, `description`) VALUES (4, 'uploader', 'Uploader', 'This role provide rights to access the upload page and upload images');
INSERT INTO `permission_roles` (`permission_id`, `role_id`, `created_at`, `updated_at`) VALUES ('25', '4', '2017-05-08 11:33:59', '2017-05-08 11:33:59');
INSERT INTO `permission_roles` (`permission_id`, `role_id`, `created_at`, `updated_at`) VALUES ('27', '4', '2017-05-08 11:33:59', '2017-05-08 11:33:59');
INSERT INTO `permission_roles` (`permission_id`, `role_id`, `created_at`, `updated_at`) VALUES ('12', '4', '2017-05-08 11:33:59', '2017-05-08 11:33:59');
UPDATE `permissions` SET `conditions` = 'has_role(self.id,2) || has_role(self.id,3) || has_role(self.id,4)' WHERE `permissions`.`id` = 12;
UPDATE `permissions` SET `conditions` = 'has_role(self.id,2) || has_role(self.id,4)' WHERE `permissions`.`id` = 25;
UPDATE `permissions` SET `conditions` = 'has_role(self.id,2) || has_role(self.id,4)' WHERE `permissions`.`id` = 27;
INSERT INTO `permissions` (`id`, `slug`, `name`, `conditions`, `description`, `created_at`, `updated_at`) VALUES (NULL, 'delete_img', 'delete images', 'has_role(self.id,2) || has_role(self.id,4)', 'grants rights to create roles', NULL, NULL);
INSERT INTO `permission_roles` (`permission_id`, `role_id`, `created_at`, `updated_at`) VALUES ('35', '2', NULL, NULL);


CREATE TABLE `user_groups` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for table `permission_roles`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`user_id`,`group_id`),
  ADD KEY `user_groups_user_id_index` (`user_id`),
  ADD KEY `user_groups_group_id_index` (`group_id`);

UPDATE `groups` SET `slug` = 'public' WHERE `groups`.`id` = 1;
UPDATE `groups` SET `name` = 'Public' WHERE `groups`.`id` = 1;


insert into user_groups
( 
    user_id ,
    group_id ,
    created_at ,
    updated_at
)
select
    id,
    group_id,
    now(),
    now()
from
    users

UPDATE `users` SET `group_id`=0 WHERE 1;
ALTER TABLE `users` CHANGE `group_id` `group_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The id of the user group.';
UPDATE `permissions` SET `conditions` = 'in_group(self.id,group.id)' WHERE `permissions`.`id` = 14;
UPDATE `permissions` SET `conditions` = 'has_role(self.id,3) && share_group(self.id,user.id) && !is_master(user.id) && !has_role(user.id,2) && (!has_role(user.id,3) || equals_num(self.id,user.id)) && subset(fields,[\'name\',\'email\',\'locale\',\'flag_enabled\',\'flag_verified\',\'password\',\'roles\'])' WHERE `permissions`.`id` = 9;
UPDATE `permissions` SET `conditions` = 'share_group(self.id,user.id) && !is_master(user.id) && !has_role(user.id,2) && (!has_role(user.id,3) || equals_num(self.id,user.id))' WHERE `permissions`.`id` = 17;
UPDATE `permissions` SET `conditions` = 'in_group(self.id,group.id) && in(property,[\'name\',\'icon\',\'slug\',\'description\',\'users\'])' WHERE `permissions`.`id` = 20;
UPDATE `permissions` SET `conditions` = 'share_group(self.id,user.id) && !is_master(user.id) && !has_role(user.id,2) && (!has_role(user.id,3) || equals_num(self.id,user.id)) && in(property,[\'user_name\',\'name\',\'email\',\'locale\',\'roles\',\'group\',\'activities\'])' WHERE `permissions`.`id` = 22;
UPDATE `permissions` SET `conditions` = 'has_role(self.id,2) || has_role(self.id,5)' WHERE `permissions`.`id` = 24;
INSERT INTO `roles` (`id`, `slug`, `name`, `description`, `created_at`, `updated_at`) VALUES (NULL, 'validator', 'Validator', 'This role provide rights to access to the validation process and the validation pages.', '2017-05-08 11:09:53', '2017-05-08 11:09:53');
INSERT INTO `permission_roles` (`permission_id`, `role_id`, `created_at`, `updated_at`) VALUES ('24', '5', NULL, NULL);
UPDATE `permissions` SET `conditions` = '(!has_role(user.id,2) || equals_num(self.id,user.id)) && subset(fields,[\'name\',\'email\',\'locale\',\'group\',\'flag_enabled\',\'flag_verified\',\'password\',roles])' WHERE `permissions`.`id` = 8;


--------------------------------------------------------

ALTER TABLE `labelimglinks` ADD `group` INT(1) NULL DEFAULT NULL COMMENT 'group tag on image ref : groups' AFTER `category`;
ALTER TABLE `segimages` ADD `group` INT(1) NULL DEFAULT NULL COMMENT 'group tag on image ref : groups' AFTER `category`;

ALTER TABLE `labelimglinks` ADD `naturalWidth` INT(4) NULL COMMENT 'Image width' AFTER `validated_at`, ADD `naturalHeight` INT(4) NULL COMMENT 'Image Height' AFTER `naturalWidth`;
ALTER TABLE `segimages` ADD `naturalWidth` INT(4) NULL COMMENT 'Image width' AFTER `validated_at`, ADD `naturalHeight` INT(4) NULL COMMENT 'Image Height' AFTER `naturalWidth`;

ALTER TABLE `labelimglinks` ADD `state` INT(1) NOT NULL DEFAULT '1' COMMENT '1 : waiting for tag, 2 : wating for validation, 3 : Validated, 4 : Rejected' AFTER `validated`;
ALTER TABLE `segimages` ADD `state` INT(1) NOT NULL DEFAULT '1' COMMENT '1 : waiting for tag, 2 : wating for validation, 3 : Validated, 4 : Rejected' AFTER `validated`;

ALTER TABLE `users` ADD `stats_validated` INT NOT NULL DEFAULT '0' COMMENT 'Nbr of images validated' AFTER `group_id`, ADD `stats_rejected` INT NOT NULL DEFAULT '0' COMMENT 'Nbr of images validated' AFTER `stats_validated`;
ALTER TABLE `users` ADD `stats_validated_seg` INT NOT NULL DEFAULT '0' COMMENT 'Nbr of seg images validated' AFTER `stats_rejected`, ADD `stats_rejected_seg` INT NOT NULL DEFAULT '0' COMMENT 'Nbr of seg images validated' AFTER `stats_validated_seg`;


--Lines to run after the scripts initImageStateColumn.php and initSegImageStateColumn.php otherwise info on img validated or not is lost.
--It's ok it those line aren't run, it will be just an unused column in DB
--ALTER TABLE `labelimglinks`
--  DROP `validated`;
--ALTER TABLE `segimages`
--  DROP `validated`;


ALTER TABLE `groups` ADD `bb_cprs_rate` INT NOT NULL DEFAULT '75' COMMENT 'Compression rate for Bbox images 0 is low quality small file 100 is best quality' AFTER `icon`, ADD `seg_cprs_rate` INT NOT NULL DEFAULT '75' COMMENT 'Compression rate for segmentation images 0 is low quality small file 100 is best quality' AFTER `bb_cprs_rate`;
ALTER TABLE `labelimglinks` ADD `cprs_rate` INT NOT NULL DEFAULT '-1' COMMENT 'Rate of the image compressed in \'light\' folder' AFTER `group`;
ALTER TABLE `segimages` ADD `cprs_rate` INT NOT NULL DEFAULT '-1' COMMENT 'Rate of the image compressed in \'light\' folder' AFTER `group`;

--------------------------------
--- Changes for Beta 0.3.3 ----
--------------------------------

--------------------------------
--- Changes for Beta 0.3.4 ----
--------------------------------

--------------------------------
--- Changes for Beta 0.3.5 ----
--------------------------------

--------------------------------
--- Changes for Beta 0.3.6 ----
--------------------------------

--------------------------------
--- Changes for Beta 0.3.7 ----
--------------------------------

--For Japanese categories (feature canceled)
--ALTER TABLE `labelimgcategories` CHANGE `Category` `Category` CHAR(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
--ALTER TABLE `segcategories` CHANGE `Category` `Category` CHAR(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;


ALTER TABLE `labelimglinks` ADD `originalName` CHAR(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'Original name of the image' AFTER `naturalHeight`;
ALTER TABLE `segimages` ADD `originalName` CHAR(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'Original name of the image' AFTER `naturalHeight`;

--------------------------------
--- Changes for Beta 0.3.8 ----
--------------------------------

--------------------------------
--- Changes for Beta 0.3.9 ----
--------------------------------

--------------------------------
--- Changes for Beta 0.3.10 ----
--------------------------------

ALTER TABLE `labelimglinks` ADD `set_id` INT(1) NOT NULL DEFAULT '1' COMMENT 'Id of the set the image belongs to' AFTER `requested`;


--
-- Table structure for table `sets`
--
CREATE TABLE `sets` (
  `id` int(1) NOT NULL,
  `name` char(50) NOT NULL,
  `group_id` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for table `sets`
--
ALTER TABLE `sets`
  ADD PRIMARY KEY (`id`);

--
-- Dumping data for table `sets`
--

  INSERT INTO `sets` (`id`, `name`, `group_id`) VALUES
(1, 'Default', 1);

--
-- AUTO_INCREMENT for table `sets`
--
ALTER TABLE `sets`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

  INSERT INTO `permissions` (`id`, `slug`, `name`, `conditions`, `description`, `created_at`, `updated_at`) VALUES (NULL, 'uri_setEdit', 'Edit set', 'always()', 'Grant access to edit set of images', NULL, NULL);
  INSERT INTO `permission_roles` (`permission_id`, `role_id`, `created_at`, `updated_at`) VALUES ('36', '2', NULL, NULL);
  INSERT INTO `permission_roles` (`permission_id`, `role_id`, `created_at`, `updated_at`) VALUES ('36', '3', NULL, NULL);



ALTER TABLE `segimages` ADD `set_id` INT(1) NOT NULL DEFAULT '1' COMMENT 'Id of the set the image belongs to' AFTER `requested`;


--
-- Table structure for table `segsets`
--
CREATE TABLE `segsets` (
  `id` int(1) NOT NULL,
  `name` char(50) NOT NULL,
  `group_id` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for table `segsets`
--
ALTER TABLE `segsets`
  ADD PRIMARY KEY (`id`);
  
--
-- Dumping data for table `segsets`
--

  INSERT INTO `segsets` (`id`, `name`, `group_id`) VALUES
(1, 'Default', 1);

--
-- AUTO_INCREMENT for table `segsets`
--
ALTER TABLE `segsets`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;




--To be run after the script initImageSetColumn.php and initSegImageColumn are runned

--  ALTER TABLE `labelimglinks`
--  DROP `category`,
--  DROP `group`;
--  ALTER TABLE `segimages`
--  DROP `category`,
--  DROP `group`;


ALTER TABLE `labelimgarea` CHANGE `user` `user` INT(4) NOT NULL DEFAULT '0' COMMENT 'id of the user that submitted the area' AFTER `source`;
ALTER TABLE `labelimgarea` ADD `state` INT(1) NOT NULL DEFAULT '2' COMMENT '1 : none, 2 : wating for validation - Yellow, 3 : Validated - Green, 4 : Rejected - Red' AFTER `user`;

-- run initAreaStateColumn.php to initialize the new column.

ALTER TABLE `segAreas` CHANGE `user` `user` INT(4) NOT NULL DEFAULT '0' COMMENT 'id of the user that submitted the area' AFTER `source`;
ALTER TABLE `segAreas` ADD `state` INT(1) NOT NULL DEFAULT '2' COMMENT '1 : none, 2 : wating for validation - Yellow, 3 : Validated - Green, 4 : Rejected - Red' AFTER `user`;


 -- Categories rework
ALTER TABLE `labelimgcategories` ADD `set_id` INT(1) NOT NULL DEFAULT '1' AFTER `Color`;
alter table `segcategories` drop index Color;
ALTER TABLE `segcategories` ADD `set_id` INT(1) NOT NULL DEFAULT '1' AFTER `Color`;

--then run the scripts, initCategoriesSetColumn.php and initSegcategoriesSetColumn.php

ALTER TABLE `labelimglinks`
alter table `labelimglinks` drop index path;
ADD CONSTRAINT `1ImgBySet` UNIQUE (path,set_id);
ALTER TABLE `segimages`
alter table `segimages` drop index path;
ADD CONSTRAINT `1ImgBySet` UNIQUE (path,set_id);


--------------------------------
--- Changes for Beta 0.3.11 ----
--------------------------------

--------------------------------
--- Changes for Beta 0.3.12 ----
--------------------------------
--------------------------------
--- Changes for Beta 0.3.13 ----
--------------------------------


ALTER TABLE `labelimgexportlinks` ADD `set_id` INT NOT NULL AFTER `id`;
ALTER TABLE `labelimgexportlinks` ADD `segset_id` INT NOT NULL AFTER `set_id`;

ALTER TABLE `labelimgexportlinks` ADD `date_generated` TIMESTAMP NOT NULL AFTER `token`, 
                                  ADD `size` INT NOT NULL AFTER `date_generated`, 
                                  ADD `user` TINYTEXT NOT NULL AFTER `size`, 
                                  ADD `nbrImages` INT NOT NULL AFTER `user`, 
                                  ADD `nbrAreas` INT NOT NULL AFTER `nbrImages`, 
                                  ADD `nbrAreas_per_type` LONGTEXT NOT NULL AFTER `nbrAreas`;

ALTER TABLE `labelimgexportlinks` CHANGE `set_id` `set_id` INT(11) NOT NULL DEFAULT '0', 
                                  CHANGE `segset_id` `segset_id` INT(11) NOT NULL DEFAULT '0', 
                                  CHANGE `date_generated` `date_generated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
                                  CHANGE `size` `size` INT(11) NOT NULL DEFAULT '0', 
                                  CHANGE `nbrImages` `nbrImages` INT(11) NOT NULL DEFAULT '0', 
                                  CHANGE `nbrAreas` `nbrAreas` INT(11) NOT NULL DEFAULT '0';

ALTER TABLE `labelimgexportlinks` CHANGE `user` `user` TINYTEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL, 
                                  CHANGE `nbrAreas_per_type` `nbrAreas_per_type` LONGTEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL;

                                
--------------------------------
--- Changes for Beta 0.3.14 ----
--------------------------------  
ALTER TABLE `labelimgexportlinks` CHANGE `expires` `expires` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

--------------------------------
--- Changes for Beta 0.3.15 ----
--------------------------------  