SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT=0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `acls`
--

DROP TABLE IF EXISTS `acls`;
CREATE TABLE IF NOT EXISTS `acls` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(32) NOT NULL,
  `action` varchar(32) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `menu` int(11) NOT NULL,
  `parent` int(11) NOT NULL DEFAULT '0',
  `order` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=148 ;

--
-- Zrzut danych tabeli `acls`
--

INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(1, 'admin', 'customer_add', '', '', 0, 7, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(2, 'admin', 'customer_add_user', '', '', 0, 7, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(3, 'admin', 'customer_delete', '', '', 0, 7, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(4, 'admin', 'customer_edit', '', '', 0, 7, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(5, 'admin', 'customers', 'icon-list', 'Lista klientów', 1, 7, 1);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(6, 'admin', 'customer_users', '', '', 0, 7, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(7, 'admin', 'index', 'icon-user', 'Administracja', 1, 0, 1);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(8, 'admin', 'storagecategories', 'icon-layers', 'Kategorie', 1, 7, 4);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(9, 'admin', 'storagecategory_add', '', '', 0, 7, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(10, 'admin', 'storagecategory_delete', '', '', 0, 7, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(11, 'admin', 'storagecategory_edit', '', '', 0, 7, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(12, 'admin', 'user_add', 'icon-user', 'Dodaj użytkownika', 1, 7, 3);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(13, 'admin', 'user_delete', '', '', 0, 7, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(14, 'admin', 'user_edit', '', '', 0, 7, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(15, 'admin', 'user_lock', '', '', 0, 7, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(16, 'admin', 'users', 'icon-list', 'Lista użytkowników', 1, 7, 2);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(17, 'admin', 'user_unlock', '', '', 0, 7, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(18, 'admin', 'shipmentcompanies', 'icon-handbag', 'Firmy kurierskie', 1, 7, 5);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(19, 'admin', 'shipmentcompany_add', '', '', 0, 7, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(20, 'admin', 'shipmentcompany_delete', '', '', 0, 7, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(21, 'admin', 'shipmentcompany_edit', '', '', 0, 7, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(22, 'ajax', 'check_email_availability', '', '', 0, 0, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(23, 'ajax', 'check_user_availability', '', '', 0, 0, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(24, 'ajax', 'generate_password', '', '', 0, 0, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(25, 'ajax', 'get_user_notifications', '', '', 0, 0, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(26, 'ajax', 'get_utilisation_document', '', '', 0, 0, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(27, 'ajax', 'get_utilisation_document_pdf', '', '', 0, 0, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(28, 'ajax', 'index', '', '', 0, 0, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(29, 'config', 'dashboard', '', '', 0, 0, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(30, 'customer', 'add_address', '', '', 0, 35, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(31, 'customer', 'division_add', '', '', 0, 35, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(32, 'customer', 'division_edit', '', '', 0, 35, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(33, 'customer', 'divisions', 'icon-list', 'Lista działów', 1, 35, 2);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(34, 'customer', 'division_view', '', '', 0, 35, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(35, 'customer', 'index', 'icon-basket', 'Klient', 1, 0, 2);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(36, 'customer', 'info', 'icon-notebook', 'Informacje o firmie', 1, 35, 3);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(37, 'customer', 'edit', 'icon-globe', 'Edycja danych firmowych', 1, 35, 4);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(38, 'customer', 'search', '', '', 0, 35, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(39, 'customer', 'user_add', '', '', 0, 35, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(40, 'customer', 'user_edit', '', '', 0, 35, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(41, 'customer', 'user_lock', '', '', 0, 35, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(42, 'customer', 'users', 'icon-list', 'Lista użytkowników', 1, 35, 1);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(43, 'customer', 'user_unlock', '', '', 0, 35, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(44, 'default', 'index', '', '', 0, 0, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(45, 'default', 'login', '', '', 0, 0, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(46, 'default', 'logout', 'icon-logout', 'Wyloguj', 1, 0, 999);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(47, 'default', 'reset', '', '', 0, 0, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(48, 'finance', 'index', 'icon-diamond', 'Finanse', 1, 0, 5);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(49, 'finance', 'invoices', 'icon-doc', 'Faktury', 1, 48, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(50, 'finance', 'prices', 'icon-list', 'Cenniki', 1, 48, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(51, 'finance', 'pricetable_add', '', '', 0, 48, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(52, 'order', 'accept', '', '', 0, 58, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(53, 'order', 'add', 'icon-plus', 'Dodaj', 1, 58, 1);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(54, 'order', 'complete', '', '', 0, 58, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(55, 'order', 'delete', '', '', 0, 58, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(56, 'order', 'deliver', '', '', 0, 58, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(57, 'order', 'edit_order', '', '', 0, 58, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(58, 'order', 'index', 'icon-calculator', 'Zamówienia', 1, 0, 4);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(59, 'order', 'order_document', '', '', 0, 58, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(60, 'order', 'orders', 'icon-list', 'Lista zamówień', 1, 58, 2);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(61, 'order', 'orders_inprogress', 'icon-basket-loaded', 'W trakcie', 1, 58, 3);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(62, 'order', 'orders_new', 'icon-basket', 'Nowe', 1, 58, 4);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(63, 'order', 'orders_realized', 'icon-cup', 'Zrealizowane', 1, 58, 5);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(64, 'order', 'orders_search', 'icon-direction', 'Szukaj', 1, 58, 7);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(65, 'order', 'send', '', '', 0, 58, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(66, 'order', 'utilisation_document', '', '', 0, 58, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(67, 'order', 'view_order', '', '', 0, 58, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(68, 'profile', 'index', 'icon-user', 'Profil', 1, 0, 998);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(69, 'profile', 'profile', 'icon-ghost', 'Edytuj dane', 1, 68, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(70, 'report', 'index', 'icon-doc', 'Raporty', 1, 0, 8);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(71, 'user', 'calendar', '', '', 0, 0, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(72, 'user', 'create', '', '', 0, 0, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(73, 'user', 'dashboard', 'glyphicon glyphicon-dashboard', 'Panel', 1, 0, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(74, 'user', 'index', '', '', 0, 0, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(75, 'user', 'login', '', '', 0, 0, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(76, 'user', 'logout', '', '', 0, 0, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(77, 'user', 'profile', '', '', 0, 0, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(78, 'virtualbriefcase', 'add_item_vb', 'icon-docs', 'Dodaj do teczki', 1, 93, 6);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(79, 'virtualbriefcase', 'box_add', '', '', 0, 93, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(80, 'virtualbriefcase', 'boxes', 'glyphicon glyphicon-inbox', 'Pudła', 1, 93, 2);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(81, 'virtualbriefcase', 'box_remove', '', '', 0, 93, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(82, 'virtualbriefcase', 'bulkpackaging_add', '', '', 0, 93, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(83, 'virtualbriefcase', 'bulkpackaging_remove', '', '', 0, 93, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(84, 'virtualbriefcase', 'bulkpackagings', 'glyphicon glyphicon-th', 'Teczki', 1, 93, 5);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(85, 'virtualbriefcase', 'childvirtualbriefcase_add', '', '', 0, 93, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(86, 'virtualbriefcase', 'childvirtualbriefcase_remove', '', '', 0, 93, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(87, 'virtualbriefcase', 'document_add', '', '', 0, 93, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(88, 'virtualbriefcase', 'documentlist_add', '', '', 0, 93, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(89, 'virtualbriefcase', 'documentlist_remove', '', '', 0, 93, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(90, 'virtualbriefcase', 'documentlists', 'glyphicon glyphicon-list-alt ', 'Listy dokumentów', 1, 93, 4);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(91, 'virtualbriefcase', 'document_remove', '', '', 0, 93, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(92, 'virtualbriefcase', 'documents', 'icon-pencil', 'Dokumenty', 1, 93, 3);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(93, 'virtualbriefcase', 'index', 'icon-list', 'Wirtualne teczki', 1, 0, 3.1);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(94, 'virtualbriefcase', 'nested_virtualbriefcases', '', '', 0, 93, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(95, 'virtualbriefcase', 'virtualbriefcase_add', '', '', 0, 93, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(96, 'virtualbriefcase', 'virtualbriefcase_delete', '', '', 0, 93, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(97, 'virtualbriefcase', 'virtualbriefcase_edit', '', '', 0, 93, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(98, 'virtualbriefcase', 'virtualbriefcases', 'icon-list', 'Lista wirtualnych teczek', 1, 93, 1);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(99, 'virtualbriefcase', 'virtualbriefcase_view', '', '', 0, 93, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(100, 'warehouse', 'add_item', 'icon-docs', 'Dodaj do magazynu', 1, 129, 5);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(101, 'warehouse', 'add_item_bp', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(102, 'warehouse', 'box_add', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(103, 'warehouse', 'box_delete', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(104, 'warehouse', 'box_edit', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(105, 'warehouse', 'boxes', 'glyphicon glyphicon-inbox', 'Pudła', 1, 129, 2);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(106, 'warehouse', 'boxes_search', 'icon-magnifier', 'Wyszukaj...', 1, 129, 4);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(107, 'warehouse', 'boxes_search_result', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(108, 'warehouse', 'box_view', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(109, 'warehouse', 'bulkpackaging_add', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(110, 'warehouse', 'bulkpackaging_delete', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(111, 'warehouse', 'bulkpackaging_edit', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(112, 'warehouse', 'bulkpackagings', 'glyphicon glyphicon-th', 'Teczki', 1, 105, 5);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(113, 'warehouse', 'bulkpackaging_view', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(114, 'warehouse', 'childbulkpackaging_add', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(115, 'warehouse', 'childbulkpackaging_remove', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(116, 'warehouse', 'document_add', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(117, 'warehouse', 'document_add_bp', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(118, 'warehouse', 'document_delete', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(119, 'warehouse', 'document_edit', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(120, 'warehouse', 'documentlist_add', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(121, 'warehouse', 'documentlist_add_bp', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(122, 'warehouse', 'documentlist_delete', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(123, 'warehouse', 'documentlist_edit', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(124, 'warehouse', 'documentlists', 'glyphicon glyphicon-list-alt', 'Listy dokumentów', 1, 105, 3);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(125, 'warehouse', 'documentlist_view', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(126, 'warehouse', 'documents', 'icon-pencil', 'Dokumenty', 1, 105, 2);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(127, 'warehouse', 'documents_search', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(128, 'warehouse', 'documents_search_result', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(129, 'warehouse', 'index', 'icon-grid', 'Magazyn', 1, 0, 3);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(130, 'warehouse', 'warehouse_add', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(131, 'warehouse', 'warehouse_delete', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(132, 'warehouse', 'warehouse_edit', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(133, 'warehouse', 'warehouses', 'icon-layers', 'Magazyny', 1, 129, 1);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(134, 'warehouse', 'warehouse_view', '', '', 0, 129, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(135, 'warehouse', 'boxes', 'glyphicon glyphicon-inbox', 'Lista pudeł', 1, 105, 1);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(136, 'warehouse', 'places', 'icon-list', 'Regały', 1, 129, 2);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(137, 'warehouse', 'box_barcode_print', 'icon-printer', 'Drukuj kody', 1, 129, 6);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(138, 'finance', 'invoice_add', 'icon-plus', 'Wystaw', 1, 49, 0);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(139, 'finance', 'invoices', 'icon-list', 'Wystawione', 1, 49, 1);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(140, 'admin', 'acls', ' icon-key', 'System Acls ', 1, 7, 6);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(142, 'report', 'warehouse_period_report', 'icon-doc', 'Raport okresowy magazynowanych pudeł', 1, 70, 1);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(143, 'report', 'boxes_per_division_report', 'icon-doc', 'Raport pudeł per dział', 1, 70, 2);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(144, 'report', 'orders_report', 'icon-doc', 'Raport zamówień', 1, 70, 3);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(145, 'report', 'orders_per_box_report', 'icon-doc', 'Raport pudeł per zamówienie', 1, 70, 4);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(146, 'report', 'utilisation_report', 'icon-doc', 'Raport brakowania', 1, 70, 5);
INSERT INTO `acls` (`id`, `controller`, `action`, `icon`, `description`, `menu`, `parent`, `order`) VALUES(147, 'virtualbriefcase', 'virtualbriefcase_template', 'icon-pencil', 'Szablony teczek', 1, 93, 9);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `acls_roles`
--

DROP TABLE IF EXISTS `acls_roles`;
CREATE TABLE IF NOT EXISTS `acls_roles` (
  `role_id` int(11) unsigned DEFAULT NULL,
  `acl_id` int(11) unsigned DEFAULT NULL,
  UNIQUE KEY `unique_acls_roles` (`role_id`,`acl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `acls_roles`
--

INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 22);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 23);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 24);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 25);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 26);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 27);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 28);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 29);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 35);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 36);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 44);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 45);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 46);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 47);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 53);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 58);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 60);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 61);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 62);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 63);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 64);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 68);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 69);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 70);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 71);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 72);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 73);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 74);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 75);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 76);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 77);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 78);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 79);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 80);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 81);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 82);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 83);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 84);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 85);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 86);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 87);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 88);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 89);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 90);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 91);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 92);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 93);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 94);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 95);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 96);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 97);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 98);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 99);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 144);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(1, 146);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 1);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 2);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 3);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 4);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 5);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 6);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 7);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 8);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 9);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 10);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 11);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 12);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 13);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 14);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 15);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 16);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 17);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 18);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 19);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 20);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 21);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 22);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 23);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 24);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 25);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 26);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 27);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 28);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 29);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 30);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 31);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 32);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 33);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 34);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 35);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 36);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 37);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 38);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 39);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 40);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 41);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 42);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 43);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 44);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 45);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 46);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 47);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 48);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 49);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 50);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 51);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 52);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 53);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 54);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 55);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 56);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 57);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 58);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 59);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 60);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 61);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 62);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 63);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 64);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 65);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 66);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 67);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 68);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 69);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 70);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 71);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 72);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 73);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 74);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 75);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 76);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 77);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 78);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 79);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 80);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 81);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 82);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 83);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 84);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 85);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 86);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 87);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 88);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 89);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 90);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 91);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 92);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 93);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 94);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 95);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 96);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 97);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 98);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 99);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 100);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 101);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 102);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 103);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 104);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 105);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 106);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 107);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 108);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 109);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 110);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 111);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 112);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 113);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 114);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 115);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 116);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 117);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 118);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 119);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 120);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 121);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 122);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 123);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 124);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 125);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 126);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 127);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 128);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 129);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 130);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 131);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 132);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 133);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 134);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 135);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 136);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 137);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 138);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 139);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 140);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 142);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 143);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 144);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 145);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 146);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(2, 147);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 22);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 23);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 24);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 25);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 26);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 27);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 28);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 29);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 30);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 31);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 32);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 33);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 34);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 35);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 36);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 37);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 38);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 39);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 40);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 41);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 42);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 43);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 44);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 45);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 46);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 47);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 48);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 49);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 52);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 53);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 54);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 55);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 56);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 57);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 58);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 59);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 60);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 61);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 62);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 63);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 64);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 65);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 66);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 67);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 68);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 69);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 70);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 71);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 72);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 73);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 74);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 75);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 76);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 77);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 78);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 79);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 80);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 81);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 82);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 83);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 84);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 85);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 86);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 87);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 88);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 89);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 90);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 91);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 92);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 93);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 94);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 95);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 96);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 97);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 98);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 99);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 119);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 135);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 139);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 142);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 143);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 144);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 145);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(3, 146);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 22);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 23);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 24);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 25);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 26);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 27);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 28);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 29);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 44);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 45);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 46);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 47);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 50);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 52);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 53);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 54);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 55);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 56);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 57);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 58);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 59);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 60);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 61);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 62);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 63);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 64);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 65);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 66);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 67);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 68);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 69);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 70);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 71);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 72);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 73);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 74);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 75);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 76);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 77);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 100);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 101);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 102);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 103);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 104);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 105);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 106);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 107);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 108);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 109);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 110);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 111);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 112);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 113);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 114);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 115);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 116);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 117);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 118);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 120);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 121);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 122);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 123);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 124);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 125);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 126);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 127);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 128);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 129);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 130);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 131);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 132);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 133);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 134);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 138);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 142);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 143);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 144);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 145);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(4, 146);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(5, 140);
INSERT INTO `acls_roles` (`role_id`, `acl_id`) VALUES(5, 147);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `addresses`
--

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(64) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `number` varchar(8) DEFAULT NULL,
  `flat` varchar(8) DEFAULT NULL,
  `postal` varchar(8) DEFAULT NULL,
  `country` varchar(11) DEFAULT NULL,
  `telephone` varchar(12) DEFAULT NULL,
  `address_type` set('firmowy','odbioru','wysyłki') DEFAULT NULL,
  `customer_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `definiuje` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Zrzut danych tabeli `addresses`
--

INSERT INTO `addresses` (`id`, `city`, `street`, `number`, `flat`, `postal`, `country`, `telephone`, `address_type`, `customer_id`) VALUES(1, 'Default', 'Detault', '1', '1', '00-000', 'Default', '600123123', 'firmowy', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `archive`
--

DROP TABLE IF EXISTS `archive`;
CREATE TABLE IF NOT EXISTS `archive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `medicine_id` int(11) NOT NULL DEFAULT '0',
  `line_id` int(11) NOT NULL DEFAULT '0',
  `product_name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `current_stock` int(11) NOT NULL DEFAULT '0',
  `archive_date` date DEFAULT NULL,
  `product_year` int(4) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `create_date` datetime DEFAULT NULL,
  `photo` tinyint(1) NOT NULL DEFAULT '0',
  `pdf` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `attachments`
--

DROP TABLE IF EXISTS `attachments`;
CREATE TABLE IF NOT EXISTS `attachments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` text,
  `type` enum('image/gif','image/jpeg','image/pjpeg','image/png','image/bmp','image/svg+xml','image/tiff','image/vnd.djvu','application/pdf') NOT NULL,
  `file` varchar(255) NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`,`upload_date`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `boxbarcodes`
--

DROP TABLE IF EXISTS `boxbarcodes`;
CREATE TABLE IF NOT EXISTS `boxbarcodes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `box_number` int(11) DEFAULT NULL,
  `box_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_kp_przypisany_do_p` (`box_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `boxes`
--

DROP TABLE IF EXISTS `boxes`;
CREATE TABLE IF NOT EXISTS `boxes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `barcode` int(11) NOT NULL,
  `place_id` int(11) unsigned DEFAULT NULL,
  `storage_category_id` int(11) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `date_reception` date NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lock` varchar(32) DEFAULT NULL,
  `seal` varchar(32) DEFAULT NULL,
  `seal1` varchar(32) DEFAULT NULL,
  `seal2` varchar(32) DEFAULT NULL,
  `status` enum('Puste','Na magazynie','W trakcie transportu','Wypożyczone','Przyjęcie na magazyn','Usunięte','Zdjęte z pozycji') DEFAULT 'Na magazynie',
  `utilisation_status` int(2) DEFAULT '0',
  `utilisation_document` varchar(255) DEFAULT NULL,
  `warehouse_id` int(11) unsigned DEFAULT NULL,
  `division_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_p_przypisana_do_km` (`storage_category_id`),
  KEY `FK_m_ma_na_stanie` (`warehouse_id`),
  KEY `status` (`status`),
  KEY `division_id` (`division_id`),
  KEY `barcode` (`barcode`),
  KEY `place_id` (`place_id`),
  KEY `seal1` (`seal1`,`seal2`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


--
-- Struktura tabeli dla tabeli `bulkpackagings`
--

DROP TABLE IF EXISTS `bulkpackagings`;
CREATE TABLE IF NOT EXISTS `bulkpackagings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `box_id` int(11) unsigned NOT NULL,
  `attachment_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attachment_id` (`attachment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Struktura tabeli dla tabeli `bulkpackagings_bulkpackagings`
--

DROP TABLE IF EXISTS `bulkpackagings_bulkpackagings`;
CREATE TABLE IF NOT EXISTS `bulkpackagings_bulkpackagings` (
  `bulkpackaging1_id` int(10) unsigned NOT NULL,
  `bulkpackaging2_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`bulkpackaging1_id`,`bulkpackaging2_id`),
  KEY `fk_bulkpackaging7_id` (`bulkpackaging1_id`),
  KEY `fk_bulkpackaging8_id` (`bulkpackaging2_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE IF NOT EXISTS `cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `group_id` int(11) NOT NULL DEFAULT '0',
  `per_user` text COLLATE utf8_polish_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `description` text COLLATE utf8_polish_ci,
  `create_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `confirm` tinyint(1) NOT NULL DEFAULT '0',
  `free_sample` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `customer_id_index` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `conferences_dates`
--

DROP TABLE IF EXISTS `conferences_dates`;
CREATE TABLE IF NOT EXISTS `conferences_dates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `place` text COLLATE utf8_polish_ci,
  `street` text COLLATE utf8_polish_ci,
  `post_code` char(6) COLLATE utf8_polish_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `person` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `users_count` int(11) NOT NULL DEFAULT '0',
  `set_id` int(11) NOT NULL DEFAULT '0',
  `phar_build` tinyint(1) NOT NULL DEFAULT '0',
  `info` text COLLATE utf8_polish_ci,
  `meters` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `pdf` tinyint(1) NOT NULL DEFAULT '0',
  `montage` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `import_date` datetime DEFAULT NULL,
  `line` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `www` text COLLATE utf8_polish_ci,
  `company` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `conferences_dates_pdfs`
--

DROP TABLE IF EXISTS `conferences_dates_pdfs`;
CREATE TABLE IF NOT EXISTS `conferences_dates_pdfs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conference_date_id` int(11) NOT NULL DEFAULT '0',
  `pdf_name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `pdf_title` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `conferences_orders`
--

DROP TABLE IF EXISTS `conferences_orders`;
CREATE TABLE IF NOT EXISTS `conferences_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `type_id` int(11) NOT NULL DEFAULT '0',
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `place` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `post_code` char(6) COLLATE utf8_polish_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `person` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `rep_place` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `rep_street` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `rep_post_code` char(6) COLLATE utf8_polish_ci DEFAULT NULL,
  `rep_city` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `dsm` int(11) NOT NULL DEFAULT '0',
  `products_date` date DEFAULT NULL,
  `additional_info` text COLLATE utf8_polish_ci,
  `guests_count` int(11) NOT NULL DEFAULT '0',
  `set_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `montage` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `status_id` tinyint(4) NOT NULL DEFAULT '0',
  `complete_date` datetime DEFAULT NULL,
  `phar_status` tinyint(1) NOT NULL DEFAULT '0',
  `packs_count` int(11) NOT NULL DEFAULT '0',
  `errors` text COLLATE utf8_polish_ci,
  `info_standalones` text COLLATE utf8_polish_ci,
  `info_letter` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `info_packs_count` int(11) NOT NULL DEFAULT '0',
  `info_date` datetime DEFAULT NULL,
  `meters` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `products_change` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `conferences_orders_dsms`
--

DROP TABLE IF EXISTS `conferences_orders_dsms`;
CREATE TABLE IF NOT EXISTS `conferences_orders_dsms` (
  `order_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `order_id` (`order_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `conferences_orders_products`
--

DROP TABLE IF EXISTS `conferences_orders_products`;
CREATE TABLE IF NOT EXISTS `conferences_orders_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `is_standalone` tinyint(4) NOT NULL DEFAULT '0',
  `is_big` tinyint(4) NOT NULL DEFAULT '0',
  `reservation` date DEFAULT NULL,
  `reservation_user_id` int(11) NOT NULL DEFAULT '0',
  `returned` tinyint(1) NOT NULL DEFAULT '0',
  `returned_date` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_virtual` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `conferences_orders_statuses`
--

DROP TABLE IF EXISTS `conferences_orders_statuses`;
CREATE TABLE IF NOT EXISTS `conferences_orders_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `conferences_orders_users`
--

DROP TABLE IF EXISTS `conferences_orders_users`;
CREATE TABLE IF NOT EXISTS `conferences_orders_users` (
  `order_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `order_id` (`order_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `conferences_sets`
--

DROP TABLE IF EXISTS `conferences_sets`;
CREATE TABLE IF NOT EXISTS `conferences_sets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `type_id` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_polish_ci,
  `create_date` datetime DEFAULT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `conferences_sets_products`
--

DROP TABLE IF EXISTS `conferences_sets_products`;
CREATE TABLE IF NOT EXISTS `conferences_sets_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conference_set_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `conferences_sets_standalones`
--

DROP TABLE IF EXISTS `conferences_sets_standalones`;
CREATE TABLE IF NOT EXISTS `conferences_sets_standalones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conference_set_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) DEFAULT NULL,
  `is_big` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_customer` int(11) unsigned DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `nip` varchar(32) DEFAULT NULL,
  `regon` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `comments` varchar(1024) NOT NULL,
  `www` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `paleta_price` float(8,2) DEFAULT NULL,
  `pack_price` float(8,2) NOT NULL DEFAULT '0.00',
  `fixed_price` float(8,2) NOT NULL DEFAULT '0.00',
  `message` text CHARACTER SET utf8 COLLATE utf8_polish_ci,
  `store_front` tinyint(4) DEFAULT NULL,
  `store_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL,
  `store_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL,
  `store_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `create_date` (`create_date`),
  KEY `parent_customer` (`parent_customer`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Zrzut danych tabeli `customers`
--

INSERT INTO `customers` (`id`, `parent_customer`, `name`, `nip`, `regon`, `code`, `comments`, `www`, `create_date`, `update_date`, `user_id`, `paleta_price`, `pack_price`, `fixed_price`, `message`, `store_front`, `store_url`, `store_key`, `store_user`) VALUES(0, NULL, '_Default', '123-123-12-12', '123456', 'DEFAULT', 'Domyślna firma - nie usuwać', 'https://www.bsdterminal.pl', '2013-12-31 22:59:36', NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL);
-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `divisions`
--

DROP TABLE IF EXISTS `divisions`;
CREATE TABLE IF NOT EXISTS `divisions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `customer_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_nalezy_do` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Zrzut danych tabeli `divisions`
--

INSERT INTO `divisions` (`id`, `name`, `description`, `customer_id`) VALUES(1, 'DA 1', 'Dział testowy Admina 1', 0);
INSERT INTO `divisions` (`id`, `name`, `description`, `customer_id`) VALUES(2, 'DA 2', 'Dział testowy Admina 2', 0);
INSERT INTO `divisions` (`id`, `name`, `description`, `customer_id`) VALUES(3, 'DA 3', 'Dział testowy Admina 3			', 0);
INSERT INTO `divisions` (`id`, `name`, `description`, `customer_id`) VALUES(4, 'Dział ogólny', 'Dział ogólny', 19);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `divisions_users`
--

DROP TABLE IF EXISTS `divisions_users`;
CREATE TABLE IF NOT EXISTS `divisions_users` (
  `division_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`division_id`,`user_id`),
  KEY `fk_division_id` (`division_id`),
  KEY `divisions_users_ibfk_1` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `divisions_users`
--

INSERT INTO `divisions_users` (`division_id`, `user_id`) VALUES(1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `documentlists`
--

DROP TABLE IF EXISTS `documentlists`;
CREATE TABLE IF NOT EXISTS `documentlists` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `bulkpackaging_id` int(11) unsigned NOT NULL,
  `box_id` int(11) unsigned NOT NULL,
  `attachment_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attachment_id` (`attachment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Zrzut danych tabeli `documentlists`
--

INSERT INTO `documentlists` (`id`, `name`, `description`, `bulkpackaging_id`, `box_id`, `attachment_id`) VALUES(1, 'Lista A', 'Lista magazynowania A', 0, 11, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `documents`
--

DROP TABLE IF EXISTS `documents`;
CREATE TABLE IF NOT EXISTS `documents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `documentlist_id` int(11) unsigned DEFAULT NULL,
  `bulkpackaging_id` int(11) unsigned DEFAULT NULL,
  `box_id` int(11) unsigned DEFAULT NULL,
  `attachment_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `box_id` (`box_id`),
  KEY `attachment_id` (`attachment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Struktura tabeli dla tabeli `documentscans`
--

DROP TABLE IF EXISTS `documentscans`;
CREATE TABLE IF NOT EXISTS `documentscans` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(255) NOT NULL,
  `type` varchar(64) NOT NULL,
  `document_id` int(10) unsigned NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `document_fk` (`document_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;


--
-- Struktura tabeli dla tabeli `filters`
--

DROP TABLE IF EXISTS `filters`;
CREATE TABLE IF NOT EXISTS `filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_polish_ci,
  PRIMARY KEY (`id`),
  KEY `customer_id_index` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(32) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `pricetable_id` int(11) unsigned NOT NULL,
  `customer_id` int(11) unsigned NOT NULL,
  `division_id` int(11) unsigned DEFAULT NULL,
  `invoice_file` varchar(255) DEFAULT NULL,
  `order_id` int(11) unsigned DEFAULT NULL,
  `payed` tinyint(4) NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 COLLATE utf8_polish_ci,
  PRIMARY KEY (`id`),
  KEY `wystawiona_na` (`customer_id`),
  KEY `liczona_wg` (`pricetable_id`),
  KEY `FK_order_przypisany_do_p` (`order_id`),
  KEY `fk_invoice_division` (`division_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=118 ;

--
-- Struktura tabeli dla tabeli `invoices_trays`
--

DROP TABLE IF EXISTS `invoices_trays`;
CREATE TABLE IF NOT EXISTS `invoices_trays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` tinyint(2) NOT NULL DEFAULT '0',
  `year` mediumint(4) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `tray_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `invoices_tray_daily`
--

DROP TABLE IF EXISTS `invoices_tray_daily`;
CREATE TABLE IF NOT EXISTS `invoices_tray_daily` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  `medicine_name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `product_sizes` varchar(32) COLLATE utf8_polish_ci DEFAULT NULL,
  `product_s_x` decimal(6,2) DEFAULT NULL,
  `product_s_y` decimal(6,2) DEFAULT NULL,
  `product_s_z` decimal(6,2) DEFAULT NULL,
  `product_packaging` int(11) NOT NULL,
  `cm_3` decimal(18,6) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `m3` decimal(18,6) DEFAULT NULL,
  `packs_count` decimal(15,4) DEFAULT NULL,
  `total_m3` decimal(37,14) DEFAULT NULL,
  `trays_count` decimal(44,18) DEFAULT NULL,
  `price_per_tray` decimal(46,19) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lines`
--

DROP TABLE IF EXISTS `lines`;
CREATE TABLE IF NOT EXISTS `lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `description` text COLLATE utf8_polish_ci,
  `create_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `login_log`
--

DROP TABLE IF EXISTS `login_log`;
CREATE TABLE IF NOT EXISTS `login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `login_date` datetime DEFAULT NULL,
  `login_ip` varchar(15) COLLATE utf8_polish_ci DEFAULT NULL,
  `login_address` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `medicines`
--

DROP TABLE IF EXISTS `medicines`;
CREATE TABLE IF NOT EXISTS `medicines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `productmanager_id` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_polish_ci,
  `create_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `message` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_notifications` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


--
-- Struktura tabeli dla tabeli `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE IF NOT EXISTS `orderdetails` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `box_number` int(11) NOT NULL,
  `box_storagecategory` int(11) NOT NULL,
  `box_description` varchar(255) NOT NULL,
  `box_date` date NOT NULL,
  `order_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;


--
-- Struktura tabeli dla tabeli `orderhistories`
--

DROP TABLE IF EXISTS `orderhistories`;
CREATE TABLE IF NOT EXISTS `orderhistories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `operation` text NOT NULL,
  `last_status` enum('Nowe','Przyjęte do realizacji','Oczekuje na wysłanie','W doręczeniu','Dostarczone','W trakcie realizacji','W trakcie odbioru','W dostarczeniu na magazyn','Na stanie magazynu','Odebrane','Zrealizowane') NOT NULL,
  `current_status` enum('Nowe','Przyjęte do realizacji','Oczekuje na wysłanie','W doręczeniu','Dostarczone','W trakcie realizacji','W trakcie odbioru','W dostarczeniu na magazyn','Na stanie magazynu','Odebrane','Zrealizowane') NOT NULL,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=125 ;


--
-- Struktura tabeli dla tabeli `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `status` enum('Nowe','Przyjęte do realizacji','Oczekuje na wysłanie','W doręczeniu','Dostarczone','W trakcie realizacji','W trakcie odbioru','W dostarczeniu na magazyn','Na stanie magazynu','Odebrane','Zrealizowane') DEFAULT NULL,
  `type` enum('Zamówienie pustych pudeł i kodów kreskowych','Zamówienie odbioru i magazynowania pudeł','Zamówienie zniszczenie magazynowanych pudeł','Zamówienie skanowania, kopii dokumentów','Zamówienie kopii notarialnej dokumentów','Wypożyczenie pudeł','Zamówienie ogólne') DEFAULT NULL,
  `address_id` int(11) unsigned NOT NULL,
  `warehouse_id` int(11) unsigned DEFAULT NULL,
  `division_id` int(11) unsigned DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `pickup_date` date NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_document` varchar(255) DEFAULT NULL,
  `utilisation_document` varchar(255) DEFAULT NULL,
  `shipmentcompany_id` int(11) unsigned DEFAULT NULL,
  `shipping_number` varchar(64) DEFAULT NULL,
  `shipping_label` varchar(255) DEFAULT NULL,
  `shipping_protocol` varchar(255) DEFAULT NULL,
  `pricetable_id` int(11) unsigned NOT NULL,
  `final_price` float DEFAULT NULL,
  `sealed_boxes` tinyint(4) DEFAULT '0',
  `description` text,
  `pin` int(4) DEFAULT NULL,
  `increment_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL,
  `key` char(32) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `number` varchar(32) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `remarks` text CHARACTER SET utf8 COLLATE utf8_polish_ci,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  `confirm` tinyint(1) NOT NULL DEFAULT '0',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `confirmed_date` datetime DEFAULT NULL,
  `confirmed_user_id` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `cost` float(9,2) NOT NULL DEFAULT '0.00',
  `users_to_confirm` text CHARACTER SET utf8 COLLATE utf8_polish_ci,
  `price_over_1000` tinyint(1) NOT NULL DEFAULT '0',
  `price_over_1000_accepted` tinyint(1) NOT NULL DEFAULT '0',
  `price_over_1000_hash` varchar(32) CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL,
  `tm_accepted` int(1) NOT NULL DEFAULT '0',
  `tm_to_accept` tinyint(1) NOT NULL DEFAULT '0',
  `print` tinyint(1) NOT NULL DEFAULT '0',
  `print_user_id` int(11) NOT NULL DEFAULT '0',
  `print_date` datetime DEFAULT NULL,
  `realisation_date` datetime DEFAULT NULL,
  `waybill` varchar(25) CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL,
  `count_pack_count` int(11) NOT NULL DEFAULT '0',
  `reservation_from` date DEFAULT NULL,
  `reservation_to` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_z_zlozone` (`user_id`),
  KEY `FK_z_adres` (`address_id`),
  KEY `warehouse_id_fk` (`warehouse_id`),
  KEY `division_id_fk` (`division_id`),
  KEY `quantity_idx` (`quantity`),
  KEY `order_document` (`order_document`),
  KEY `utlisation_document` (`utilisation_document`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


--
-- Struktura tabeli dla tabeli `orders_archive`
--

DROP TABLE IF EXISTS `orders_archive`;
CREATE TABLE IF NOT EXISTS `orders_archive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `order_number` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `order_customer_id` int(11) NOT NULL DEFAULT '0',
  `order_user_id` int(11) NOT NULL DEFAULT '0',
  `order_product_id` int(11) NOT NULL DEFAULT '0',
  `order_pm_id` int(11) NOT NULL DEFAULT '0',
  `order_products_count` int(11) NOT NULL DEFAULT '0',
  `order_remarks` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `order_exported` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `order_product_id` (`order_product_id`),
  KEY `order_pm_id` (`order_pm_id`),
  KEY `order_customer_id` (`order_customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders_boxes`
--

DROP TABLE IF EXISTS `orders_boxes`;
CREATE TABLE IF NOT EXISTS `orders_boxes` (
  `order_id` int(10) unsigned NOT NULL,
  `box_id` int(10) unsigned NOT NULL,
  KEY `order_id_fk_pk` (`order_id`),
  KEY `box_id_fk` (`box_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Struktura tabeli dla tabeli `orders_documents`
--

DROP TABLE IF EXISTS `orders_documents`;
CREATE TABLE IF NOT EXISTS `orders_documents` (
  `order_id` int(11) unsigned NOT NULL,
  `document_id` int(11) unsigned NOT NULL,
  KEY `order_id` (`order_id`),
  KEY `document_id` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Struktura tabeli dla tabeli `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
CREATE TABLE IF NOT EXISTS `orders_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned DEFAULT NULL,
  `order_key` char(32) COLLATE utf8_polish_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_stock_change` int(11) NOT NULL DEFAULT '0',
  `product_pm` text COLLATE utf8_polish_ci,
  `product_state` tinyint(1) NOT NULL DEFAULT '1',
  `product_send_remarks` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `product_send_date` datetime DEFAULT NULL,
  `product_send_operator_id` int(11) NOT NULL DEFAULT '0',
  `product_confirm_info` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `product_user_id` int(11) NOT NULL DEFAULT '0',
  `product_customer_id` int(11) NOT NULL,
  `product_null` int(11) NOT NULL,
  `product_create` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `order_key` (`order_key`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders_products_reservations`
--

DROP TABLE IF EXISTS `orders_products_reservations`;
CREATE TABLE IF NOT EXISTS `orders_products_reservations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `reserved_stock` int(11) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pharmacies`
--

DROP TABLE IF EXISTS `pharmacies`;
CREATE TABLE IF NOT EXISTS `pharmacies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `nip` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `street_no` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `post_code` varchar(6) COLLATE utf8_polish_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `contact_person` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `contact_person_phone` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_user_id` int(11) NOT NULL DEFAULT '0',
  `unit_limit` int(11) NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `products_valid` int(11) NOT NULL DEFAULT '0',
  `products_invalid` int(11) NOT NULL DEFAULT '0',
  `products_count` int(11) NOT NULL DEFAULT '0',
  `wydane` int(11) NOT NULL DEFAULT '0',
  `rozliczone` int(11) NOT NULL DEFAULT '0',
  `zwrocone` int(11) NOT NULL DEFAULT '0',
  `zwrocone_karta` int(11) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `places`
--

DROP TABLE IF EXISTS `places`;
CREATE TABLE IF NOT EXISTS `places` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `barcode` varchar(32) DEFAULT NULL,
  `description` text,
  `status` enum('Puste','Używane','Pełne','Usunięte') DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


--
-- Struktura tabeli dla tabeli `pricetables`
--

DROP TABLE IF EXISTS `pricetables`;
CREATE TABLE IF NOT EXISTS `pricetables` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `boxes_reception` float DEFAULT NULL,
  `boxes_sending` float DEFAULT NULL,
  `boxes_storage` float DEFAULT NULL,
  `document_scan` float DEFAULT NULL,
  `document_copy` float DEFAULT NULL,
  `document_notarial_copy` float DEFAULT NULL,
  `position_disposal` float NOT NULL,
  `discount` float DEFAULT NULL,
  `active` int(2) NOT NULL DEFAULT '1',
  `customer_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ma_przypisany` (`customer_id`),
  KEY `active` (`active`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Zrzut danych tabeli `pricetables`
--

INSERT INTO `pricetables` (`id`, `boxes_reception`, `boxes_sending`, `boxes_storage`, `document_scan`, `document_copy`, `document_notarial_copy`, `position_disposal`, `discount`, `active`, `customer_id`) VALUES(1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0);

--
-- Struktura tabeli dla tabeli `productmanagers`
--

DROP TABLE IF EXISTS `productmanagers`;
CREATE TABLE IF NOT EXISTS `productmanagers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `company` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `street_no` varchar(64) COLLATE utf8_polish_ci DEFAULT NULL,
  `flat_no` varchar(64) COLLATE utf8_polish_ci DEFAULT NULL,
  `post_code` varchar(6) COLLATE utf8_polish_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `notes` text COLLATE utf8_polish_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `cell` varchar(32) COLLATE utf8_polish_ci DEFAULT NULL,
  `code` varchar(32) COLLATE utf8_polish_ci DEFAULT NULL,
  `teva_id` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `is_marked` tinyint(1) NOT NULL DEFAULT '0',
  `monthly_orders_count` int(11) NOT NULL DEFAULT '0',
  `monthly_orders_limit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`customer_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `productmanagers_groups`
--

DROP TABLE IF EXISTS `productmanagers_groups`;
CREATE TABLE IF NOT EXISTS `productmanagers_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `description` text COLLATE utf8_polish_ci,
  PRIMARY KEY (`id`),
  KEY `user_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `line_id` int(11) NOT NULL DEFAULT '0',
  `medicine_id` int(11) NOT NULL DEFAULT '0',
  `magazine_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `description` text COLLATE utf8_polish_ci,
  `photo` tinyint(1) NOT NULL DEFAULT '0',
  `code` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `packaging` int(11) NOT NULL DEFAULT '0',
  `sizes` varchar(32) COLLATE utf8_polish_ci DEFAULT NULL,
  `place` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `current_stock` int(11) NOT NULL DEFAULT '0',
  `last_stock_change` datetime NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `pdf` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `price` float(12,2) NOT NULL DEFAULT '0.00',
  `value` float(8,2) NOT NULL DEFAULT '0.00',
  `weight` int(11) NOT NULL DEFAULT '0',
  `weight_pack` int(11) NOT NULL,
  `a_lot` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `a_validity` date DEFAULT NULL,
  `archive_quantity` int(11) NOT NULL DEFAULT '0',
  `archive_date` datetime DEFAULT NULL,
  `is_archive` tinyint(1) NOT NULL DEFAULT '0',
  `is_pz` tinyint(1) NOT NULL DEFAULT '0',
  `is_pz_open` tinyint(1) NOT NULL DEFAULT '0',
  `is_pz_closed` tinyint(1) NOT NULL DEFAULT '0',
  `class` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `manufacter` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `reserved_stock` int(11) NOT NULL DEFAULT '0',
  `as_srodek_trwaly` tinyint(1) NOT NULL DEFAULT '0',
  `as_priority` tinyint(4) NOT NULL DEFAULT '0',
  `as_type` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `as_kod_sap` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `as_kod_sap_2` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `as_kod_funkcjonalny` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `as_kod_akceptacji` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `as_objetosc` float(5,2) NOT NULL DEFAULT '0.00',
  `as_teren` tinyint(1) NOT NULL,
  `teva_invoice` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `teva_conference` tinyint(1) NOT NULL DEFAULT '0',
  `teva_price` float(9,2) NOT NULL DEFAULT '0.00',
  `teva_sub_line` tinyint(1) NOT NULL,
  `disposal_request_user_id` int(11) NOT NULL DEFAULT '0',
  `disposal_request_date` datetime NOT NULL,
  `disposal_status` tinyint(1) NOT NULL DEFAULT '0',
  `disposal_date` datetime NOT NULL,
  `ucb_size_open` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `ucb_size_closed` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `sub_code` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `product_pdf` tinyint(1) NOT NULL DEFAULT '0',
  `minimal_stock` int(11) NOT NULL DEFAULT '0',
  `teva_vat` tinyint(2) NOT NULL DEFAULT '0',
  `size` varchar(32) COLLATE utf8_polish_ci DEFAULT NULL,
  `servier_photos` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `first_entry` datetime DEFAULT NULL,
  `first_count` int(11) NOT NULL DEFAULT '0',
  `tm_repeat` tinyint(1) NOT NULL DEFAULT '0',
  `orders_count` int(11) NOT NULL DEFAULT '0',
  `ordered_products` int(11) NOT NULL DEFAULT '0',
  `last_to_stock_count` int(11) NOT NULL DEFAULT '0',
  `last_to_stock_date` datetime DEFAULT NULL,
  `all_to_stock` int(11) NOT NULL DEFAULT '0',
  `last_order_date` datetime DEFAULT NULL,
  `last_order_count` int(11) NOT NULL DEFAULT '0',
  `virtual_stock_count` int(11) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  `medical_accept` date DEFAULT NULL,
  `medical_accept_show` tinyint(1) NOT NULL DEFAULT '0',
  `global_stats` tinyint(4) NOT NULL DEFAULT '0',
  `global_to_stock` int(11) NOT NULL DEFAULT '0',
  `global_from_stock` int(11) NOT NULL DEFAULT '0',
  `s_x` decimal(6,2) NOT NULL DEFAULT '0.00',
  `s_y` decimal(6,2) NOT NULL DEFAULT '0.00',
  `s_z` decimal(6,2) NOT NULL DEFAULT '0.00',
  `minimal_date` date DEFAULT NULL,
  `product_chpl` tinyint(1) NOT NULL DEFAULT '0',
  `notification_date` date DEFAULT NULL,
  `notification_email` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `po_number` varchar(32) COLLATE utf8_polish_ci DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT '0',
  `pages` int(11) DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `remarks` text COLLATE utf8_polish_ci,
  PRIMARY KEY (`id`),
  KEY `client_id` (`customer_id`),
  KEY `category_id` (`category_id`),
  KEY `line_id` (`line_id`),
  KEY `medicine_id` (`medicine_id`),
  KEY `expiry_date` (`notification_date`),
  KEY `po_number` (`po_number`),
  KEY `inactive` (`inactive`),
  KEY `product_type` (`type_id`),
  FULLTEXT KEY `remarks` (`remarks`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

--
-- Wyzwalacze `products`
--
DROP TRIGGER IF EXISTS `products_upd_check`;
DELIMITER //
CREATE TRIGGER `products_upd_check` BEFORE UPDATE ON `products`
 FOR EACH ROW BEGIN
    IF NEW.current_stock < 0 THEN
        SET NEW.current_stock = 0;
    END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products_storage_stats`
--

DROP TABLE IF EXISTS `products_storage_stats`;
CREATE TABLE IF NOT EXISTS `products_storage_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `year` year(4) NOT NULL,
  `month` tinyint(2) NOT NULL DEFAULT '0',
  `stock` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`,`year`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `producttypes`
--

DROP TABLE IF EXISTS `producttypes`;
CREATE TABLE IF NOT EXISTS `producttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `description` text COLLATE utf8_polish_ci,
  `customer_id` int(11) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  FULLTEXT KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pz`
--

DROP TABLE IF EXISTS `pz`;
CREATE TABLE IF NOT EXISTS `pz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `pack_count` int(11) NOT NULL DEFAULT '0',
  `in_pack_count` int(11) NOT NULL DEFAULT '0',
  `all_count` int(11) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `product_code` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `product_name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `manufacter` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `invoice_no` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `order_no` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `mpk` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `account` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `accept_code` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  `complaint` int(11) NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0',
  `price` float(9,4) NOT NULL DEFAULT '0.0000',
  `unit` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `to_archive` int(11) NOT NULL DEFAULT '0',
  `class` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `editor_id` int(11) NOT NULL DEFAULT '0',
  `edit_date` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_polish_ci,
  `close_id` int(11) NOT NULL DEFAULT '0',
  `close_date` datetime DEFAULT NULL,
  `to_id` int(11) NOT NULL DEFAULT '0',
  `note_id` int(11) NOT NULL DEFAULT '0',
  `number` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `ship_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`),
  KEY `customer_id` (`customer_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pz_owners`
--

DROP TABLE IF EXISTS `pz_owners`;
CREATE TABLE IF NOT EXISTS `pz_owners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `regions`
--

DROP TABLE IF EXISTS `regions`;
CREATE TABLE IF NOT EXISTS `regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `description` text COLLATE utf8_polish_ci,
  `create_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `regions_customer_id_index` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `returns`
--

DROP TABLE IF EXISTS `returns`;
CREATE TABLE IF NOT EXISTS `returns` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `click_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `quantity` (`quantity`),
  KEY `click_date` (`click_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `returns_virtual`
--

DROP TABLE IF EXISTS `returns_virtual`;
CREATE TABLE IF NOT EXISTS `returns_virtual` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `move_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `stock` int(9) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Zrzut danych tabeli `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES(1, 'login', 'Pozwala na logowanie się do systemu');
INSERT INTO `roles` (`id`, `name`, `description`) VALUES(2, 'admin', 'Admin, posiada dostęp do całości systemu');
INSERT INTO `roles` (`id`, `name`, `description`) VALUES(3, 'manager', 'Rola zarządzająca klienta');
INSERT INTO `roles` (`id`, `name`, `description`) VALUES(4, 'operator', 'Operator, rola systemowe dla pracowników');
INSERT INTO `roles` (`id`, `name`, `description`) VALUES(5, 'developer', 'Rola tylko do testów aplikacji');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
CREATE TABLE IF NOT EXISTS `roles_users` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `roles_users`
--

INSERT INTO `roles_users` (`user_id`, `role_id`) VALUES(1, 1);
INSERT INTO `roles_users` (`user_id`, `role_id`) VALUES(1, 2);
INSERT INTO `roles_users` (`user_id`, `role_id`) VALUES(1, 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(24) NOT NULL,
  `last_active` int(10) unsigned NOT NULL,
  `contents` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_active` (`last_active`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


--
-- Struktura tabeli dla tabeli `shipmentcompanies`
--

DROP TABLE IF EXISTS `shipmentcompanies`;
CREATE TABLE IF NOT EXISTS `shipmentcompanies` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `address` varchar(512) DEFAULT NULL,
  `telephone` varchar(64) DEFAULT NULL,
  `shipping_price` float DEFAULT NULL,
  `comments` text,
  `customer_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Zrzut danych tabeli `shipmentcompanies`
--

INSERT INTO `shipmentcompanies` (`id`, `name`, `address`, `telephone`, `shipping_price`, `comments`, `customer_id`) VALUES(1, 'DHL', 'Dhaelowa 123', '+48664043792', 19.1, 'Testowa firma																														', 0);
INSERT INTO `shipmentcompanies` (`id`, `name`, `address`, `telephone`, `shipping_price`, `comments`, `customer_id`) VALUES(2, 'Siudemka', 'Testowy 12', '456 456 456', 12.3, 'Testowa numer dwa																		', 0);
INSERT INTO `shipmentcompanies` (`id`, `name`, `address`, `telephone`, `shipping_price`, `comments`, `customer_id`) VALUES(3, 'Transport własny', 'Cibora 12', '123123123', 1, 'Dostawa transportem wewnętrznym					1							', 0);
INSERT INTO `shipmentcompanies` (`id`, `name`, `address`, `telephone`, `shipping_price`, `comments`, `customer_id`) VALUES(4, 'UPS', 'Kolorowa 123', '123 123 123', 10, '123 123 123						', 0);
INSERT INTO `shipmentcompanies` (`id`, `name`, `address`, `telephone`, `shipping_price`, `comments`, `customer_id`) VALUES(5, 'DPD', '02-274 Warszawa, ul. Mineralna 15 ', '22 577-55-55', 22, 'API						', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stockchanges`
--

DROP TABLE IF EXISTS `stockchanges`;
CREATE TABLE IF NOT EXISTS `stockchanges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `stock_change` int(11) NOT NULL DEFAULT '0',
  `current_stock` int(11) NOT NULL DEFAULT '0',
  `stock_change_description` text COLLATE utf8_polish_ci,
  `stock_change_date` datetime NOT NULL,
  `stock_change_letter` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `conference_order_id` int(11) NOT NULL DEFAULT '0',
  `tm_stock_change` int(11) NOT NULL DEFAULT '0',
  `tm_stock_change_description` text COLLATE utf8_polish_ci,
  `tm_stock_change_return` tinyint(1) NOT NULL DEFAULT '0',
  `tm_stock_change_return_date` datetime DEFAULT NULL,
  `tm_stock_change_return_description` text COLLATE utf8_polish_ci,
  `tm_stock_change_show` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_id_index` (`product_id`),
  KEY `customer_id_index` (`customer_id`),
  KEY `order_id_index` (`order_id`),
  KEY `user_id_index` (`user_id`),
  KEY `tm_stock_change_index` (`tm_stock_change`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `storagecategories`
--

DROP TABLE IF EXISTS `storagecategories`;
CREATE TABLE IF NOT EXISTS `storagecategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(64) NOT NULL,
  `period` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Zrzut danych tabeli `storagecategories`
--

INSERT INTO `storagecategories` (`id`, `name`, `description`, `period`) VALUES(2, 'BC', 'Dokumenty do wybrakowania', 0);
INSERT INTO `storagecategories` (`id`, `name`, `description`, `period`) VALUES(4, 'B05', 'Okres przechowywania 5 lat', 5);
INSERT INTO `storagecategories` (`id`, `name`, `description`, `period`) VALUES(5, 'B50', 'Okres przechowywania 50 lat', 50);
INSERT INTO `storagecategories` (`id`, `name`, `description`, `period`) VALUES(7, 'B10', 'Okres przechowywania 10 lat', 10);
INSERT INTO `storagecategories` (`id`, `name`, `description`, `period`) VALUES(12, 'B25', 'Okres przechowywania 25 lat', 25);
INSERT INTO `storagecategories` (`id`, `name`, `description`, `period`) VALUES(13, 'B05+2', 'Okres przechowywania 5 lat + deklarowany dodatkowy 2 lata', 7);
INSERT INTO `storagecategories` (`id`, `name`, `description`, `period`) VALUES(15, 'B2', 'Okres przechowywania 2 lata', 2);
INSERT INTO `storagecategories` (`id`, `name`, `description`, `period`) VALUES(16, 'B15', 'Analizy badań', 15);
INSERT INTO `storagecategories` (`id`, `name`, `description`, `period`) VALUES(17, 'B30', 'Dokumentacja medyczna', 30);
INSERT INTO `storagecategories` (`id`, `name`, `description`, `period`) VALUES(18, 'B20', 'Okres przechowywania 20 lat', 20);
INSERT INTO `storagecategories` (`id`, `name`, `description`, `period`) VALUES(19, 'B06', 'Okres przechowywania 6 lat', 6);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sublines`
--

DROP TABLE IF EXISTS `sublines`;
CREATE TABLE IF NOT EXISTS `sublines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `username` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL,
  `logins` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login` int(10) unsigned DEFAULT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `status` enum('Zablokowany','Aktywny','Zawieszony','Wyłączony','Usunięty') NOT NULL DEFAULT 'Aktywny',
  `customer_id` int(11) unsigned NOT NULL,
  `person_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL,
  `client_type` tinyint(1) NOT NULL DEFAULT '0',
  `usertype_id` int(11) NOT NULL DEFAULT '0',
  `notes` text CHARACTER SET utf8 COLLATE utf8_polish_ci,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `product_manager` tinyint(1) NOT NULL DEFAULT '0',
  `asm` int(11) NOT NULL DEFAULT '0',
  `stats_rights` tinyint(1) NOT NULL DEFAULT '0',
  `pz_rights` tinyint(1) NOT NULL DEFAULT '0',
  `as_confirm` tinyint(1) NOT NULL DEFAULT '0',
  `virtualstock_manager` tinyint(1) NOT NULL DEFAULT '0',
  `lilly_dcm` tinyint(1) NOT NULL DEFAULT '0',
  `lilly_nsm` tinyint(1) NOT NULL DEFAULT '0',
  `lilly_line` varchar(255) CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL,
  `lilly_reports_view` tinyint(1) NOT NULL DEFAULT '0',
  `lilly_line_id` int(11) NOT NULL DEFAULT '0',
  `update_user_id` int(11) NOT NULL DEFAULT '0',
  `teva_hr_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL,
  `sub_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL,
  `stock_view` tinyint(1) NOT NULL DEFAULT '0',
  `finanse` tinyint(1) NOT NULL DEFAULT '0',
  `ucb_region` varchar(255) CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL,
  `servier_type` tinyint(1) NOT NULL DEFAULT '0',
  `astellas_set_confirm` tinyint(1) NOT NULL DEFAULT '0',
  `tmobile_type` tinyint(1) NOT NULL DEFAULT '0',
  `orders_lock` int(2) DEFAULT '1',
  `magento_user_id` int(11) DEFAULT NULL,
  `dm_region` int(11) unsigned DEFAULT NULL,
  `region_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_username` (`username`),
  UNIQUE KEY `uniq_email` (`email`),
  KEY `fk_customer_id` (`customer_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `logins`, `last_login`, `firstname`, `lastname`, `status`, `customer_id`, `person_id`, `client_type`, `usertype_id`, `notes`, `user_id`, `create_date`, `update_date`, `product_manager`, `asm`, `stats_rights`, `pz_rights`, `as_confirm`, `virtualstock_manager`, `lilly_dcm`, `lilly_nsm`, `lilly_line`, `lilly_reports_view`, `lilly_line_id`, `update_user_id`, `teva_hr_id`, `sub_code`, `stock_view`, `finanse`, `ucb_region`, `servier_type`, `astellas_set_confirm`, `tmobile_type`, `orders_lock`, `magento_user_id`, `dm_region`, `region_id`) VALUES(1, 'admin@local.host', 'admin', '', 337, 1536427276, 'Maciej', 'Kowalczyk-Tepfer', 'Aktywny', 0, NULL, 0, 0, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `usertypes`
--

DROP TABLE IF EXISTS `usertypes`;
CREATE TABLE IF NOT EXISTS `usertypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_filters`
--

DROP TABLE IF EXISTS `user_filters`;
CREATE TABLE IF NOT EXISTS `user_filters` (
  `user_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  UNIQUE KEY `user_id` (`user_id`,`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_lines`
--

DROP TABLE IF EXISTS `user_lines`;
CREATE TABLE IF NOT EXISTS `user_lines` (
  `user_id` int(11) NOT NULL,
  `line_id` int(11) NOT NULL,
  UNIQUE KEY `user_id` (`user_id`,`line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_medicines`
--

DROP TABLE IF EXISTS `user_medicines`;
CREATE TABLE IF NOT EXISTS `user_medicines` (
  `user_id` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  UNIQUE KEY `user_id` (`user_id`,`medicine_id`),
  KEY `user_id_index` (`user_id`),
  KEY `medicine_id_index` (`medicine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_productmanagers`
--

DROP TABLE IF EXISTS `user_productmanagers`;
CREATE TABLE IF NOT EXISTS `user_productmanagers` (
  `user_id` int(11) NOT NULL,
  `productmanager_group_id` int(11) NOT NULL,
  UNIQUE KEY `user_id` (`user_id`,`productmanager_group_id`),
  KEY `user_id_index` (`user_id`),
  KEY `pm_group_id_index` (`productmanager_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_rights`
--

DROP TABLE IF EXISTS `user_rights`;
CREATE TABLE IF NOT EXISTS `user_rights` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `get_notification` tinyint(4) NOT NULL DEFAULT '1',
  `get_monthly_email` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Zrzut danych tabeli `user_rights`
--

INSERT INTO `user_rights` (`id`, `user_id`, `get_notification`, `get_monthly_email`) VALUES(3, 16, 0, 1);
INSERT INTO `user_rights` (`id`, `user_id`, `get_notification`, `get_monthly_email`) VALUES(5, 1, 1, 1);
INSERT INTO `user_rights` (`id`, `user_id`, `get_notification`, `get_monthly_email`) VALUES(9, 20, 1, 0);
INSERT INTO `user_rights` (`id`, `user_id`, `get_notification`, `get_monthly_email`) VALUES(10, 21, 1, 1);
INSERT INTO `user_rights` (`id`, `user_id`, `get_notification`, `get_monthly_email`) VALUES(11, 22, 1, 1);
INSERT INTO `user_rights` (`id`, `user_id`, `get_notification`, `get_monthly_email`) VALUES(12, 23, 1, 1);
INSERT INTO `user_rights` (`id`, `user_id`, `get_notification`, `get_monthly_email`) VALUES(13, 24, 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_tokens`
--

DROP TABLE IF EXISTS `user_tokens`;
CREATE TABLE IF NOT EXISTS `user_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `user_agent` varchar(40) NOT NULL,
  `token` varchar(40) NOT NULL,
  `created` int(10) unsigned NOT NULL,
  `expires` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_token` (`token`),
  KEY `fk_user_id` (`user_id`),
  KEY `expires` (`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `virtualbriefcases`
--

DROP TABLE IF EXISTS `virtualbriefcases`;
CREATE TABLE IF NOT EXISTS `virtualbriefcases` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `division_id` int(11) unsigned NOT NULL,
  `attachment_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_wt_przypisana_do` (`division_id`),
  KEY `attachment_id` (`attachment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;


--
-- Struktura tabeli dla tabeli `virtualbriefcases_boxes`
--

DROP TABLE IF EXISTS `virtualbriefcases_boxes`;
CREATE TABLE IF NOT EXISTS `virtualbriefcases_boxes` (
  `virtualbriefcase_id` int(10) unsigned NOT NULL,
  `box_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`virtualbriefcase_id`,`box_id`),
  KEY `fk_virtualbriefcase1_id` (`virtualbriefcase_id`),
  KEY `fk_box_id` (`box_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `virtualbriefcases_bulkpackagings`
--

DROP TABLE IF EXISTS `virtualbriefcases_bulkpackagings`;
CREATE TABLE IF NOT EXISTS `virtualbriefcases_bulkpackagings` (
  `virtualbriefcase_id` int(10) unsigned NOT NULL,
  `bulkpackaging_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`virtualbriefcase_id`,`bulkpackaging_id`),
  KEY `fk_virtualbriefcase4_id` (`virtualbriefcase_id`),
  KEY `fk_bulkpackaging_id` (`bulkpackaging_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `virtualbriefcases_documentlists`
--

DROP TABLE IF EXISTS `virtualbriefcases_documentlists`;
CREATE TABLE IF NOT EXISTS `virtualbriefcases_documentlists` (
  `virtualbriefcase_id` int(10) unsigned NOT NULL,
  `documentlist_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`virtualbriefcase_id`,`documentlist_id`),
  KEY `fk_virtualbriefcase3_id` (`virtualbriefcase_id`),
  KEY `fk_documentlist_id` (`documentlist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `virtualbriefcases_documents`
--

DROP TABLE IF EXISTS `virtualbriefcases_documents`;
CREATE TABLE IF NOT EXISTS `virtualbriefcases_documents` (
  `virtualbriefcase_id` int(10) unsigned NOT NULL,
  `document_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`virtualbriefcase_id`,`document_id`),
  KEY `fk_virtualbriefcase2_id` (`virtualbriefcase_id`),
  KEY `fk_document_id` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Struktura tabeli dla tabeli `virtualbriefcases_virtualbriefcases`
--

DROP TABLE IF EXISTS `virtualbriefcases_virtualbriefcases`;
CREATE TABLE IF NOT EXISTS `virtualbriefcases_virtualbriefcases` (
  `virtualbriefcase1_id` int(10) unsigned NOT NULL,
  `virtualbriefcase2_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`virtualbriefcase1_id`,`virtualbriefcase2_id`),
  KEY `fk_virtualbriefcase5_id` (`virtualbriefcase1_id`),
  KEY `fk_virtualbriefcase6_id` (`virtualbriefcase2_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `virtualbriefcases_virtualbriefcases`
--

INSERT INTO `virtualbriefcases_virtualbriefcases` (`virtualbriefcase1_id`, `virtualbriefcase2_id`) VALUES(2, 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `virtualbriefcasetemplates`
--

DROP TABLE IF EXISTS `virtualbriefcasetemplates`;
CREATE TABLE IF NOT EXISTS `virtualbriefcasetemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_polish_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;


--
-- Struktura tabeli dla tabeli `virtualstockchanges`
--

DROP TABLE IF EXISTS `virtualstockchanges`;
CREATE TABLE IF NOT EXISTS `virtualstockchanges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `stock_change` int(11) NOT NULL DEFAULT '0',
  `current_stock` int(11) NOT NULL DEFAULT '0',
  `stock_change_description` text COLLATE utf8_polish_ci,
  `stock_change_date` datetime NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `conference_order_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `customer_id_index` (`customer_id`),
  KEY `product_id_index` (`product_id`),
  KEY `order_id_index` (`order_id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `virtualstockmanagers`
--

DROP TABLE IF EXISTS `virtualstockmanagers`;
CREATE TABLE IF NOT EXISTS `virtualstockmanagers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `virtualstockmanager_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `virtualstocks`
--

DROP TABLE IF EXISTS `virtualstocks`;
CREATE TABLE IF NOT EXISTS `virtualstocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `stock` int(11) NOT NULL DEFAULT '0',
  `out_products` int(11) NOT NULL DEFAULT '0',
  `return_products` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_product_user` (`user_id`,`product_id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

--
-- Wyzwalacze `virtualstocks`
--
DROP TRIGGER IF EXISTS `virtualstocks_upd_check`;
DELIMITER //
CREATE TRIGGER `virtualstocks_upd_check` BEFORE UPDATE ON `virtualstocks`
 FOR EACH ROW BEGIN
    IF NEW.stock < 0 THEN
        SET NEW.stock = 0;
    END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `warehousebarcodes`
--

DROP TABLE IF EXISTS `warehousebarcodes`;
CREATE TABLE IF NOT EXISTS `warehousebarcodes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `position_number` int(11) DEFAULT NULL,
  `warehouse_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_km_przypisany_do_m` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `warehousehistories`
--

DROP TABLE IF EXISTS `warehousehistories`;
CREATE TABLE IF NOT EXISTS `warehousehistories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `operation_type` enum('Wejście na magazyn','Wyjście z magazynu','Przesunięcie') NOT NULL,
  `operation_description` varchar(255) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `warehouse_id` int(11) unsigned NOT NULL,
  `box_id` int(11) unsigned NOT NULL,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `operation_type` (`operation_type`,`user_id`,`warehouse_id`,`box_id`),
  KEY `change_date` (`change_date`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=187 ;


--
-- Struktura tabeli dla tabeli `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
CREATE TABLE IF NOT EXISTS `warehouses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `customer_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_zarzadza` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Zrzut danych tabeli `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `description`, `customer_id`) VALUES(1, 'NW', 'Opakowania nowe', 0);
INSERT INTO `warehouses` (`id`, `name`, `description`, `customer_id`) VALUES(2, 'MZ', 'Opakowania na lokalizacji', 0);
INSERT INTO `warehouses` (`id`, `name`, `description`, `customer_id`) VALUES(3, 'MT', 'Opakowania w przeglądaniu', 0);
INSERT INTO `warehouses` (`id`, `name`, `description`, `customer_id`) VALUES(4, 'MS', 'Opakowania u klienta', 0);
INSERT INTO `warehouses` (`id`, `name`, `description`, `customer_id`) VALUES(5, 'PZ', 'Opakowania pozostawione u klienta', 0);
INSERT INTO `warehouses` (`id`, `name`, `description`, `customer_id`) VALUES(6, 'U', 'Opakowania przeznaczone do brakowania', 0);
INSERT INTO `warehouses` (`id`, `name`, `description`, `customer_id`) VALUES(7, 'D', 'Opakowania zniszczone', 0);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `attachments`
--
ALTER TABLE `attachments`
  ADD CONSTRAINT `attachments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ograniczenia dla tabeli `boxbarcodes`
--
ALTER TABLE `boxbarcodes`
  ADD CONSTRAINT `FK_kp_przypisany_do_p` FOREIGN KEY (`box_id`) REFERENCES `boxes` (`id`);

--
-- Ograniczenia dla tabeli `boxes`
--
ALTER TABLE `boxes`
  ADD CONSTRAINT `boxes_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `boxes_ibfk_2` FOREIGN KEY (`storage_category_id`) REFERENCES `storagecategories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `boxes_ibfk_3` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `bulkpackagings`
--
ALTER TABLE `bulkpackagings`
  ADD CONSTRAINT `bulkpackagings_ibfk_1` FOREIGN KEY (`attachment_id`) REFERENCES `attachments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `bulkpackagings_bulkpackagings`
--
ALTER TABLE `bulkpackagings_bulkpackagings`
  ADD CONSTRAINT `fk_bulkpackaging5_id` FOREIGN KEY (`bulkpackaging1_id`) REFERENCES `bulkpackagings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_bulkpackaging6_id` FOREIGN KEY (`bulkpackaging2_id`) REFERENCES `bulkpackagings` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`parent_customer`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Ograniczenia dla tabeli `divisions`
--
ALTER TABLE `divisions`
  ADD CONSTRAINT `divisions_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `divisions_users`
--
ALTER TABLE `divisions_users`
  ADD CONSTRAINT `divisions_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `divisions_users_ibfk_2` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `documentlists`
--
ALTER TABLE `documentlists`
  ADD CONSTRAINT `documentlists_ibfk_1` FOREIGN KEY (`attachment_id`) REFERENCES `attachments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`box_id`) REFERENCES `boxes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `documents_ibfk_2` FOREIGN KEY (`attachment_id`) REFERENCES `attachments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `documentscans`
--
ALTER TABLE `documentscans`
  ADD CONSTRAINT `documentscans_ibfk_1` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_4` FOREIGN KEY (`pricetable_id`) REFERENCES `pricetables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_ibfk_5` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_ibfk_6` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_ibfk_7` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_ibfk_8` FOREIGN KEY (`pricetable_id`) REFERENCES `pricetables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `orderhistories`
--
ALTER TABLE `orderhistories`
  ADD CONSTRAINT `orderhistories_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `orderhistories_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_7` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`);

--
-- Ograniczenia dla tabeli `orders_boxes`
--
ALTER TABLE `orders_boxes`
  ADD CONSTRAINT `orders_boxes_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_boxes_ibfk_4` FOREIGN KEY (`box_id`) REFERENCES `boxes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `orders_documents`
--
ALTER TABLE `orders_documents`
  ADD CONSTRAINT `orders_documents_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_documents_ibfk_2` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `pricetables`
--
ALTER TABLE `pricetables`
  ADD CONSTRAINT `pricetables_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `roles_users`
--
ALTER TABLE `roles_users`
  ADD CONSTRAINT `roles_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `roles_users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `user_rights`
--
ALTER TABLE `user_rights`
  ADD CONSTRAINT `user_rights_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD CONSTRAINT `user_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `virtualbriefcases`
--
ALTER TABLE `virtualbriefcases`
  ADD CONSTRAINT `virtualbriefcases_ibfk_1` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `virtualbriefcases_ibfk_2` FOREIGN KEY (`attachment_id`) REFERENCES `attachments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `virtualbriefcases_boxes`
--
ALTER TABLE `virtualbriefcases_boxes`
  ADD CONSTRAINT `fk_box_id` FOREIGN KEY (`box_id`) REFERENCES `boxes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_virtualbriefcase1_id` FOREIGN KEY (`virtualbriefcase_id`) REFERENCES `virtualbriefcases` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `virtualbriefcases_bulkpackagings`
--
ALTER TABLE `virtualbriefcases_bulkpackagings`
  ADD CONSTRAINT `fk_bulkpackaging_id` FOREIGN KEY (`bulkpackaging_id`) REFERENCES `bulkpackagings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_virtualbriefcase4_id` FOREIGN KEY (`virtualbriefcase_id`) REFERENCES `virtualbriefcases` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `virtualbriefcases_documentlists`
--
ALTER TABLE `virtualbriefcases_documentlists`
  ADD CONSTRAINT `fk_documentlist_id` FOREIGN KEY (`documentlist_id`) REFERENCES `documentlists` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_virtualbriefcase3_id` FOREIGN KEY (`virtualbriefcase_id`) REFERENCES `virtualbriefcases` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `virtualbriefcases_documents`
--
ALTER TABLE `virtualbriefcases_documents`
  ADD CONSTRAINT `fk_document_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_virtualbriefcase2_id` FOREIGN KEY (`virtualbriefcase_id`) REFERENCES `virtualbriefcases` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `virtualbriefcases_virtualbriefcases`
--
ALTER TABLE `virtualbriefcases_virtualbriefcases`
  ADD CONSTRAINT `fk_virtualbriefcase5_id` FOREIGN KEY (`virtualbriefcase1_id`) REFERENCES `virtualbriefcases` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_virtualbriefcase6_id` FOREIGN KEY (`virtualbriefcase2_id`) REFERENCES `virtualbriefcases` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `warehousebarcodes`
--
ALTER TABLE `warehousebarcodes`
  ADD CONSTRAINT `FK_km_przypisany_do_m` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Ograniczenia dla tabeli `warehouses`
--
ALTER TABLE `warehouses`
  ADD CONSTRAINT `FK_zarzadza` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
