/*
Navicat MySQL Data Transfer

Source Server         : localMysql
Source Server Version : 50550
Source Host           : localhost:3306
Source Database       : osoma

Target Server Type    : MYSQL
Target Server Version : 50550
File Encoding         : 65001

Date: 2019-11-10 13:03:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('12', 'Felermino', 'Ali', 'felerminoali@gmail.com', 'b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86');

-- ----------------------------
-- Table structure for `attempt_result`
-- ----------------------------
DROP TABLE IF EXISTS `attempt_result`;
CREATE TABLE `attempt_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam` int(11) NOT NULL DEFAULT '0',
  `user` int(11) NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `choice` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attempt_result_ibfk_1` (`exam`),
  KEY `user` (`user`) USING BTREE,
  KEY `timestamp` (`timestamp`),
  KEY `choice` (`choice`),
  CONSTRAINT `attempt_result_ibfk_1` FOREIGN KEY (`exam`) REFERENCES `exam_attempts` (`exam`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `attempt_result_ibfk_2` FOREIGN KEY (`user`) REFERENCES `exam_attempts` (`user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `attempt_result_ibfk_3` FOREIGN KEY (`timestamp`) REFERENCES `exam_attempts` (`timestamp`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `attempt_result_ibfk_4` FOREIGN KEY (`choice`) REFERENCES `choice` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of attempt_result
-- ----------------------------
INSERT INTO `attempt_result` VALUES ('14', '113', '236', '2019-11-10 12:35:40', '1163');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `cover` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('2', 'matÃ©matica', 'images/cover/matematica.png', 'images/disciplinas/matematica.png');
INSERT INTO `category` VALUES ('12', 'fÃ­sica', 'images/cover/fisica.png', 'images/disciplinas/fisica.png');
INSERT INTO `category` VALUES ('22', 'quÃ­mica', 'images/cover/quimica.png', 'images/disciplinas/quimica.png');
INSERT INTO `category` VALUES ('32', 'geografia', 'images/cover/geografia.png', 'images/disciplinas/geografia.png');
INSERT INTO `category` VALUES ('42', 'histÃ³ria', 'images/cover/historia.png', 'images/disciplinas/historia.png');
INSERT INTO `category` VALUES ('52', 'francÃªs', 'images/cover/frances.png', 'images/disciplinas/frances.png');
INSERT INTO `category` VALUES ('62', 'inglÃªs', 'images/cover/ingles.png', 'images/disciplinas/ingles.png');
INSERT INTO `category` VALUES ('72', 'desenho', 'images/cover/desenho.png', 'images/disciplinas/desenho.png');
INSERT INTO `category` VALUES ('82', 'filosofia', 'images/cover/filosofia.png', 'images/disciplinas/filosofia.png');
INSERT INTO `category` VALUES ('92', 'biologia', 'images/cover/biologia.png', 'images/disciplinas/biologia.png');
INSERT INTO `category` VALUES ('102', 'portuguÃªs', 'images/cover/portugues.png', 'images/disciplinas/portugues.png');

-- ----------------------------
-- Table structure for `choice`
-- ----------------------------
DROP TABLE IF EXISTS `choice`;
CREATE TABLE `choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` int(11) DEFAULT NULL,
  `answer` longtext,
  `image` varchar(100) DEFAULT NULL,
  `fraction` decimal(10,0) DEFAULT NULL,
  `rightchoice` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `question` (`question`),
  CONSTRAINT `choice_ibfk_1` FOREIGN KEY (`question`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1170 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of choice
-- ----------------------------
INSERT INTO `choice` VALUES ('2', '2', '$$31.1\\% $$', null, '0', '1');
INSERT INTO `choice` VALUES ('12', '2', '$$4.7\\% $$', null, '0', '0');
INSERT INTO `choice` VALUES ('22', '2', '$$150\\% $$', null, '0', '0');
INSERT INTO `choice` VALUES ('32', '2', '$$46.7\\% $$', null, '1', '0');
INSERT INTO `choice` VALUES ('42', '12', '$$128$$', null, '0', '1');
INSERT INTO `choice` VALUES ('52', '12', '$$256$$', null, '0', '0');
INSERT INTO `choice` VALUES ('62', '12', '$${1 \\over {128}}$$', null, '1', '0');
INSERT INTO `choice` VALUES ('72', '12', '$${1 \\over {256}}$$', null, '0', '0');
INSERT INTO `choice` VALUES ('82', '22', '$$2 - \\sqrt 5 $$', null, '1', '1');
INSERT INTO `choice` VALUES ('92', '22', '$$\\sqrt 5  - 2$$', null, '0', '0');
INSERT INTO `choice` VALUES ('102', '22', '$$9 - 4\\sqrt 5 $$', null, '0', '0');
INSERT INTO `choice` VALUES ('112', '22', '$$9 + 4\\sqrt 5 $$', null, '0', '0');
INSERT INTO `choice` VALUES ('122', '32', 'Lâ€™homme et la vie professionnelle.', null, '0', null);
INSERT INTO `choice` VALUES ('132', '32', 'Comment devenir femme contemporaine', null, '0', null);
INSERT INTO `choice` VALUES ('142', '32', 'Le couple, la femme et la vie professionnelle.', null, '1', null);
INSERT INTO `choice` VALUES ('152', '32', 'La femme au travail', null, '0', null);
INSERT INTO `choice` VALUES ('162', '42', 'Le dÃ©but du XXI siÃ¨cle', null, '1', null);
INSERT INTO `choice` VALUES ('172', '42', 'Vingt ans.', null, '0', null);
INSERT INTO `choice` VALUES ('182', '42', 'Deux siÃ¨cles.', null, '0', null);
INSERT INTO `choice` VALUES ('192', '42', 'Lâ€™existence des temps.', null, '0', null);
INSERT INTO `choice` VALUES ('202', '52', 'de la sociÃ©tÃ©.', null, '0', null);
INSERT INTO `choice` VALUES ('212', '52', 'de la femme.', null, '1', null);
INSERT INTO `choice` VALUES ('222', '52', 'du couple.', null, '0', null);
INSERT INTO `choice` VALUES ('232', '52', 'de lâ€™homme.', null, '0', null);
INSERT INTO `choice` VALUES ('242', '62', 'CristÃ³vÃ£o Colombo. de 1487 a 1492', null, '1', null);
INSERT INTO `choice` VALUES ('252', '62', 'Vasco da Gama. de 1495 a 1499', null, '0', null);
INSERT INTO `choice` VALUES ('262', '62', 'Bartolomeu Dias. de 1482 a 1487', null, '0', null);
INSERT INTO `choice` VALUES ('272', '62', 'FernÃ£o de MagalhÃ£es. de 1519 a 1522', null, '0', null);
INSERT INTO `choice` VALUES ('282', '72', 'Alexandre von Humboldt (1769-1859)', null, '0', null);
INSERT INTO `choice` VALUES ('292', '72', 'Paul Vidal de La Blache (1845-1918)', null, '0', null);
INSERT INTO `choice` VALUES ('302', '72', 'Frederico Ratzel (1844-1904)', null, '1', null);
INSERT INTO `choice` VALUES ('312', '72', 'Karl Ritter (1779-1859)', null, '0', null);
INSERT INTO `choice` VALUES ('322', '82', 'entre os paralelos 30Â° e 12`e 41Â° e 51` de latitude Sul, e entre os meridianos\r\n10Â° e 27`e 26Â° e 52` de longitude Este;', null, '0', null);
INSERT INTO `choice` VALUES ('332', '82', 'entre os paralelos 10Â° e 27`e 26Â° e 52` de latitude Sul, e entre os meridianos\r\n30Â° e 12` e 41Â° e 51` de longitude Este;', null, '0', null);
INSERT INTO `choice` VALUES ('342', '82', 'na costa Oriental do continente Africano, na regiÃ£o da Ãfrica Austral;', null, '1', null);
INSERT INTO `choice` VALUES ('352', '82', 'estende-se do rio Rovuma ao rio Maputo.', null, '0', null);
INSERT INTO `choice` VALUES ('402', '92', 'Dizer nÃ£o', null, '0', null);
INSERT INTO `choice` VALUES ('412', '92', 'Movimento que leva do saber Ã  ignorÃ¢ncia', null, '1', null);
INSERT INTO `choice` VALUES ('422', '92', 'Ter os olhos fechados sem nunca os abrir', null, '0', null);
INSERT INTO `choice` VALUES ('432', '92', 'HistÃ³ria do uso da razÃ£o', null, '0', null);
INSERT INTO `choice` VALUES ('442', '92', 'Estar a caminho', null, '0', null);
INSERT INTO `choice` VALUES ('452', '102', 'A Filosofia nÃ£o tem definiÃ§Ã£o alguma', null, '0', null);
INSERT INTO `choice` VALUES ('462', '102', 'Com a definiÃ§Ã£o da Filosofia comeÃ§a o filosofar', null, '1', null);
INSERT INTO `choice` VALUES ('472', '102', 'Toda a definiÃ§Ã£o de Filosofia nÃ£o nos leva a nada', null, '0', null);
INSERT INTO `choice` VALUES ('482', '102', 'A Filosofia nÃ£o tem objecto de estudo', null, '0', null);
INSERT INTO `choice` VALUES ('492', '102', 'Todos podem filosofar', null, '0', null);
INSERT INTO `choice` VALUES ('502', '112', 'TeÃ³rica', null, '1', null);
INSERT INTO `choice` VALUES ('512', '112', 'Nula', null, '0', null);
INSERT INTO `choice` VALUES ('522', '112', 'TeÃ³rica e prÃ¡tica', null, '0', null);
INSERT INTO `choice` VALUES ('532', '112', 'Desconhecida', null, '0', null);
INSERT INTO `choice` VALUES ('542', '112', 'PrÃ¡tica', null, '0', null);
INSERT INTO `choice` VALUES ('552', '152', 'Na osmose o solvente difunde-se em direcÃ§Ã£o Ã  regiÃ£o de maior concentraÃ§Ã£o de suas molÃ©culas.', null, '0', null);
INSERT INTO `choice` VALUES ('562', '152', 'No transporte activo certas substÃ¢ncias migram a favor do gradiente de concentraÃ§Ã£o com alto gasto de ATP.', null, '0', null);
INSERT INTO `choice` VALUES ('572', '152', 'No transporte activo as substÃ¢ncias atravessam a membrana contra um gradiente de concentraÃ§Ã£o com proteinas e com gasto de ATP.', null, '1', null);
INSERT INTO `choice` VALUES ('582', '152', 'Na pinocitose a libertaÃ§Ã£o de macropartÃ­culas no interior da cÃ©lula requer a formaÃ§Ã£o de grandes vesÃ­culas.', null, '0', null);
INSERT INTO `choice` VALUES ('592', '162', '4x', null, '0', null);
INSERT INTO `choice` VALUES ('602', '162', '400x', null, '1', null);
INSERT INTO `choice` VALUES ('612', '162', '50x', null, '0', null);
INSERT INTO `choice` VALUES ('622', '162', '30x', null, '0', null);
INSERT INTO `choice` VALUES ('632', '172', 'enzima', null, '0', null);
INSERT INTO `choice` VALUES ('642', '172', 'sais minerais', null, '0', null);
INSERT INTO `choice` VALUES ('652', '172', 'aminoÃ¡cidos', null, '1', null);
INSERT INTO `choice` VALUES ('662', '172', 'Ã¡gua', null, '0', null);
INSERT INTO `choice` VALUES ('672', '182', null, 'images/qa/672_182_a.png', '0', null);
INSERT INTO `choice` VALUES ('682', '182', null, 'images/qa/672_182_b.png', '0', null);
INSERT INTO `choice` VALUES ('692', '182', null, 'images/qa/672_182_c.png', '0', null);
INSERT INTO `choice` VALUES ('702', '182', null, 'images/qa/672_182_d.png', '1', null);
INSERT INTO `choice` VALUES ('712', '192', '11.25 m ', null, '0', null);
INSERT INTO `choice` VALUES ('722', '192', '10.0 m ', null, '1', null);
INSERT INTO `choice` VALUES ('732', '192', '9.25 m', null, '0', null);
INSERT INTO `choice` VALUES ('742', '192', '8.0 m', null, '0', null);
INSERT INTO `choice` VALUES ('752', '202', 'se deslocou de marcha atrÃ¡s', null, '0', null);
INSERT INTO `choice` VALUES ('772', '202', 'o movimento teve sentido contrÃ¡rio a orientaÃ§Ã£o positiva do eixo coincidente com a trajectÃ³ria', null, '1', null);
INSERT INTO `choice` VALUES ('782', '202', 'Ã© impossÃ­vel esta situaÃ§Ã£o, pois nÃ£o hÃ¡ significado fÃ­sico para velocidade escalar negativa', null, '0', null);
INSERT INTO `choice` VALUES ('792', '202', 'a velocidade escalar(instantanea) foi diminuindo', null, '0', null);
INSERT INTO `choice` VALUES ('802', '212', 'I/Rutherford; II/Dalton; III/Bohr', null, '0', null);
INSERT INTO `choice` VALUES ('812', '212', 'I/Bohr; II/Dalton; III/Rutherford', null, '1', null);
INSERT INTO `choice` VALUES ('822', '212', 'I/Dalton; II/Rutherford; III/Bohr', null, '0', null);
INSERT INTO `choice` VALUES ('832', '212', 'I/Rutherford; II/Bohr; III/Dalton', null, '0', null);
INSERT INTO `choice` VALUES ('842', '222', 'dois Ã¡tomos com o mesmo nÃºmero de neutrÃµes pertencem ao mesmo elemento quÃ­mico', null, '1', null);
INSERT INTO `choice` VALUES ('852', '222', 'dois Ã¡tomos com o mesmo nÃºmero de electrÃµes de valÃªncia pertencem ao mesmo elemento quÃ­mico', null, '0', null);
INSERT INTO `choice` VALUES ('862', '222', 'dois Ã¡tomos com o mesmo nÃºmero de protÃµes pertencem ao mesmo elemento quÃ­mico', null, '0', null);
INSERT INTO `choice` VALUES ('872', '222', 'dois Ã¡tomos com o mesmo nÃºmero de massa sÃ£o isÃ³topos.', null, '0', null);
INSERT INTO `choice` VALUES ('882', '232', '5s2', null, '0', null);
INSERT INTO `choice` VALUES ('892', '232', ' 5s2 ; 4d3.', null, '0', null);
INSERT INTO `choice` VALUES ('902', '232', '5s2 ; 4d6.', null, '1', null);
INSERT INTO `choice` VALUES ('912', '232', '5s2 ; 6s1.', null, '0', null);
INSERT INTO `choice` VALUES ('922', '252', 'AIDS should kill many people.', null, '0', null);
INSERT INTO `choice` VALUES ('942', '252', 'The wages of sin are death.', null, '0', null);
INSERT INTO `choice` VALUES ('952', '252', 'Sex is meant for the married.', null, '1', null);
INSERT INTO `choice` VALUES ('962', '252', 'AIDS has spread like wild fire.', null, '0', null);
INSERT INTO `choice` VALUES ('972', '262', 'in the United States and in AIDS havens only.', null, '0', null);
INSERT INTO `choice` VALUES ('982', '262', 'in TV programmes and in the neighbourhood only.', null, '0', null);
INSERT INTO `choice` VALUES ('992', '262', 'in the United States, taking a walk and watching TV only.', null, '0', null);
INSERT INTO `choice` VALUES ('1002', '262', 'almost everywhere.', null, '1', null);
INSERT INTO `choice` VALUES ('1012', '272', 'many people started dying of AIDS.', null, '1', null);
INSERT INTO `choice` VALUES ('1022', '272', 'many people started dying of electrical shock.', null, '0', null);
INSERT INTO `choice` VALUES ('1032', '272', 'many people started dying of demonic power.', null, '0', null);
INSERT INTO `choice` VALUES ('1042', '272', 'many people started dying of cancer and diabetes.', null, '0', null);
INSERT INTO `choice` VALUES ('1052', '292', 'Ã© uma lenda.', null, '0', null);
INSERT INTO `choice` VALUES ('1062', '292', 'Ã© mÃ­stica.', null, '0', null);
INSERT INTO `choice` VALUES ('1072', '292', 'Ã© bela e tem mulheres bonitas', null, '0', null);
INSERT INTO `choice` VALUES ('1082', '292', 'Ã© histÃ³rica, mÃ­stica e lendÃ¡ria', null, '1', null);
INSERT INTO `choice` VALUES ('1092', '302', 'Rui Knopfli e VirgÃ­lio de Lemos.', null, '0', null);
INSERT INTO `choice` VALUES ('1102', '302', 'Rui Knopfli e VirgÃ­lio de Lemos.', null, '0', null);
INSERT INTO `choice` VALUES ('1112', '302', 'Rui Knopfli e VirgÃ­lio de Lemos e AntÃ³nio Sopa.', null, '1', null);
INSERT INTO `choice` VALUES ('1122', '302', 'tÃ³nio Sopa e Sarmento Rodrigues.', null, '0', null);
INSERT INTO `choice` VALUES ('1132', '312', 'ao interesse das autoridades locais', null, '0', null);
INSERT INTO `choice` VALUES ('1142', '312', 'a um interesse pessoal.', null, '0', null);
INSERT INTO `choice` VALUES ('1152', '312', 'ao lusotropicalismo.', null, '0', null);
INSERT INTO `choice` VALUES ('1162', '312', 'Ã  existÃªncia de relÃ­quias histÃ³ricas', null, '1', null);
INSERT INTO `choice` VALUES ('1163', '313', 'Alternativa 1', null, null, '0');
INSERT INTO `choice` VALUES ('1164', '313', 'Alternativa 2', null, null, '1');
INSERT INTO `choice` VALUES ('1165', '313', 'Alternstiva 3', null, null, '0');
INSERT INTO `choice` VALUES ('1166', '314', '$$31.1\\% $$', null, null, '0');
INSERT INTO `choice` VALUES ('1167', '314', '$$4.7\\% $$', null, null, '0');
INSERT INTO `choice` VALUES ('1168', '314', '$$150\\% $$', null, null, '1');
INSERT INTO `choice` VALUES ('1169', '314', '$$46.7\\% $$', null, null, '0');

-- ----------------------------
-- Table structure for `countries`
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of countries
-- ----------------------------
INSERT INTO `countries` VALUES ('1', 'Afghanistan', 'AF');
INSERT INTO `countries` VALUES ('2', 'ÃƒÆ’Ã†â€™land Islands', 'AX');
INSERT INTO `countries` VALUES ('3', 'Albania', 'AL');
INSERT INTO `countries` VALUES ('4', 'Algeria', 'DZ');
INSERT INTO `countries` VALUES ('5', 'American Samoa', 'AS');
INSERT INTO `countries` VALUES ('6', 'Andorra', 'AD');
INSERT INTO `countries` VALUES ('7', 'Angola', 'AO');
INSERT INTO `countries` VALUES ('8', 'Anguilla', 'AI');
INSERT INTO `countries` VALUES ('9', 'Antarctica', 'AQ');
INSERT INTO `countries` VALUES ('10', 'Antigua And Barbuda', 'AG');
INSERT INTO `countries` VALUES ('11', 'Argentina', 'AR');
INSERT INTO `countries` VALUES ('12', 'Armenia', 'AM');
INSERT INTO `countries` VALUES ('13', 'Aruba', 'AW');
INSERT INTO `countries` VALUES ('14', 'Australia', 'AU');
INSERT INTO `countries` VALUES ('15', 'Austria', 'AT');
INSERT INTO `countries` VALUES ('16', 'Azerbaijan', 'AZ');
INSERT INTO `countries` VALUES ('17', 'Bahamas', 'BS');
INSERT INTO `countries` VALUES ('18', 'Bahrain', 'BH');
INSERT INTO `countries` VALUES ('19', 'Bangladesh', 'BD');
INSERT INTO `countries` VALUES ('20', 'Barbados', 'BB');
INSERT INTO `countries` VALUES ('21', 'Belarus', 'BY');
INSERT INTO `countries` VALUES ('22', 'Belgium', 'BE');
INSERT INTO `countries` VALUES ('23', 'Belize', 'BZ');
INSERT INTO `countries` VALUES ('24', 'Benin', 'BJ');
INSERT INTO `countries` VALUES ('25', 'Bermuda', 'BM');
INSERT INTO `countries` VALUES ('26', 'Bhutan', 'BT');
INSERT INTO `countries` VALUES ('27', 'Bolivia', 'BO');
INSERT INTO `countries` VALUES ('28', 'Bosnia And Herzegovina', 'BA');
INSERT INTO `countries` VALUES ('29', 'Botswana', 'BW');
INSERT INTO `countries` VALUES ('30', 'Bouvet Island', 'BV');
INSERT INTO `countries` VALUES ('31', 'Brazil', 'BR');
INSERT INTO `countries` VALUES ('32', 'British Indian Ocean Territory', 'IO');
INSERT INTO `countries` VALUES ('33', 'Brunei Darussalam', 'BN');
INSERT INTO `countries` VALUES ('34', 'Bulgaria', 'BG');
INSERT INTO `countries` VALUES ('35', 'Burkina Faso', 'BF');
INSERT INTO `countries` VALUES ('36', 'Burundi', 'BI');
INSERT INTO `countries` VALUES ('37', 'Cambodia', 'KH');
INSERT INTO `countries` VALUES ('38', 'Cameroon', 'CM');
INSERT INTO `countries` VALUES ('39', 'Canada', 'CA');
INSERT INTO `countries` VALUES ('40', 'Cape Verde', 'CV');
INSERT INTO `countries` VALUES ('41', 'Cayman Islands', 'KY');
INSERT INTO `countries` VALUES ('42', 'Central African Republic', 'CF');
INSERT INTO `countries` VALUES ('43', 'Chad', 'TD');
INSERT INTO `countries` VALUES ('44', 'Chile', 'CL');
INSERT INTO `countries` VALUES ('45', 'China', 'CN');
INSERT INTO `countries` VALUES ('46', 'Christmas Island', 'CX');
INSERT INTO `countries` VALUES ('47', 'Cocos (keeling) Islands', 'CC');
INSERT INTO `countries` VALUES ('48', 'Colombia', 'CO');
INSERT INTO `countries` VALUES ('49', 'Comoros', 'KM');
INSERT INTO `countries` VALUES ('50', 'Congo', 'CG');
INSERT INTO `countries` VALUES ('51', 'Congo, The Democratic Republic Of', 'CD');
INSERT INTO `countries` VALUES ('52', 'Cook Islands', 'CK');
INSERT INTO `countries` VALUES ('53', 'Costa Rica', 'CR');
INSERT INTO `countries` VALUES ('54', 'Cote D\'ivoire', 'CI');
INSERT INTO `countries` VALUES ('55', 'Croatia', 'HR');
INSERT INTO `countries` VALUES ('56', 'Cuba', 'CU');
INSERT INTO `countries` VALUES ('57', 'Cyprus', 'CY');
INSERT INTO `countries` VALUES ('58', 'Czech Republic', 'CZ');
INSERT INTO `countries` VALUES ('59', 'Denmark', 'DK');
INSERT INTO `countries` VALUES ('60', 'Djibouti', 'DJ');
INSERT INTO `countries` VALUES ('61', 'Dominica', 'DM');
INSERT INTO `countries` VALUES ('62', 'Dominican Republic', 'DO');
INSERT INTO `countries` VALUES ('63', 'Ecuador', 'EC');
INSERT INTO `countries` VALUES ('64', 'Egypt', 'EG');
INSERT INTO `countries` VALUES ('65', 'El Salvador', 'SV');
INSERT INTO `countries` VALUES ('66', 'Equatorial Guinea', 'GQ');
INSERT INTO `countries` VALUES ('67', 'Eritrea', 'ER');
INSERT INTO `countries` VALUES ('68', 'Estonia', 'EE');
INSERT INTO `countries` VALUES ('69', 'Ethiopia', 'ET');
INSERT INTO `countries` VALUES ('70', 'Falkland Islands (malvinas)', 'FK');
INSERT INTO `countries` VALUES ('71', 'Faroe Islands', 'FO');
INSERT INTO `countries` VALUES ('72', 'Fiji', 'FJ');
INSERT INTO `countries` VALUES ('73', 'Finland', 'FI');
INSERT INTO `countries` VALUES ('74', 'France', 'FR');
INSERT INTO `countries` VALUES ('75', 'French Guiana', 'GF');
INSERT INTO `countries` VALUES ('76', 'French Polynesia', 'PF');
INSERT INTO `countries` VALUES ('77', 'French Southern Territories', 'TF');
INSERT INTO `countries` VALUES ('78', 'Gabon', 'GA');
INSERT INTO `countries` VALUES ('79', 'Gambia', 'GM');
INSERT INTO `countries` VALUES ('80', 'Georgia', 'GE');
INSERT INTO `countries` VALUES ('81', 'Germany', 'DE');
INSERT INTO `countries` VALUES ('82', 'Ghana', 'GH');
INSERT INTO `countries` VALUES ('83', 'Gibraltar', 'GI');
INSERT INTO `countries` VALUES ('84', 'Greece', 'GR');
INSERT INTO `countries` VALUES ('85', 'Greenland', 'GL');
INSERT INTO `countries` VALUES ('86', 'Grenada', 'GD');
INSERT INTO `countries` VALUES ('87', 'Guadeloupe', 'GP');
INSERT INTO `countries` VALUES ('88', 'Guam', 'GU');
INSERT INTO `countries` VALUES ('89', 'Guatemala', 'GT');
INSERT INTO `countries` VALUES ('90', 'Guernsey', 'GG');
INSERT INTO `countries` VALUES ('91', 'Guinea', 'GN');
INSERT INTO `countries` VALUES ('92', 'Guinea-bissau', 'GW');
INSERT INTO `countries` VALUES ('93', 'Guyana', 'GY');
INSERT INTO `countries` VALUES ('94', 'Haiti', 'HT');
INSERT INTO `countries` VALUES ('95', 'Heard Island And Mcdonald Islands', 'HM');
INSERT INTO `countries` VALUES ('96', 'Holy See (vatican City State)', 'VA');
INSERT INTO `countries` VALUES ('97', 'Honduras', 'HN');
INSERT INTO `countries` VALUES ('98', 'Hong Kong', 'HK');
INSERT INTO `countries` VALUES ('99', 'Hungary', 'HU');
INSERT INTO `countries` VALUES ('100', 'Iceland', 'IS');
INSERT INTO `countries` VALUES ('101', 'India', 'IN');
INSERT INTO `countries` VALUES ('102', 'Indonesia', 'ID');
INSERT INTO `countries` VALUES ('103', 'Iran, Islamic Republic Of', 'IR');
INSERT INTO `countries` VALUES ('104', 'Iraq', 'IQ');
INSERT INTO `countries` VALUES ('105', 'Ireland', 'IE');
INSERT INTO `countries` VALUES ('106', 'Isle Of Man', 'IM');
INSERT INTO `countries` VALUES ('107', 'Israel', 'IL');
INSERT INTO `countries` VALUES ('108', 'Italy', 'IT');
INSERT INTO `countries` VALUES ('109', 'Jamaica', 'JM');
INSERT INTO `countries` VALUES ('110', 'Japan', 'JP');
INSERT INTO `countries` VALUES ('111', 'Jersey', 'JE');
INSERT INTO `countries` VALUES ('112', 'Jordan', 'JO');
INSERT INTO `countries` VALUES ('113', 'Kazakhstan', 'KZ');
INSERT INTO `countries` VALUES ('114', 'Kenya', 'KE');
INSERT INTO `countries` VALUES ('115', 'Kiribati', 'KI');
INSERT INTO `countries` VALUES ('116', 'Korea, Democratic People\'s Republic Of', 'KP');
INSERT INTO `countries` VALUES ('117', 'Korea, Republic Of', 'KR');
INSERT INTO `countries` VALUES ('118', 'Kuwait', 'KW');
INSERT INTO `countries` VALUES ('119', 'Kyrgyzstan', 'KG');
INSERT INTO `countries` VALUES ('120', 'Lao People\'s Democratic Republic', 'LA');
INSERT INTO `countries` VALUES ('121', 'Latvia', 'LV');
INSERT INTO `countries` VALUES ('122', 'Lebanon', 'LB');
INSERT INTO `countries` VALUES ('123', 'Lesotho', 'LS');
INSERT INTO `countries` VALUES ('124', 'Liberia', 'LR');
INSERT INTO `countries` VALUES ('125', 'Libyan Arab Jamahiriya', 'LY');
INSERT INTO `countries` VALUES ('126', 'Liechtenstein', 'LI');
INSERT INTO `countries` VALUES ('127', 'Lithuania', 'LT');
INSERT INTO `countries` VALUES ('128', 'Luxembourg', 'LU');
INSERT INTO `countries` VALUES ('129', 'Macao', 'MO');
INSERT INTO `countries` VALUES ('130', 'Macedonia, The Former Yugoslav Republic Of', 'MK');
INSERT INTO `countries` VALUES ('131', 'Madagascar', 'MG');
INSERT INTO `countries` VALUES ('132', 'Malawi', 'MW');
INSERT INTO `countries` VALUES ('133', 'Malaysia', 'MY');
INSERT INTO `countries` VALUES ('134', 'Maldives', 'MV');
INSERT INTO `countries` VALUES ('135', 'Mali', 'ML');
INSERT INTO `countries` VALUES ('136', 'Malta', 'MT');
INSERT INTO `countries` VALUES ('137', 'Marshall Islands', 'MH');
INSERT INTO `countries` VALUES ('138', 'Martinique', 'MQ');
INSERT INTO `countries` VALUES ('139', 'Mauritania', 'MR');
INSERT INTO `countries` VALUES ('140', 'Mauritius', 'MU');
INSERT INTO `countries` VALUES ('141', 'Mayotte', 'YT');
INSERT INTO `countries` VALUES ('142', 'Mexico', 'MX');
INSERT INTO `countries` VALUES ('143', 'Micronesia, Federated States Of', 'FM');
INSERT INTO `countries` VALUES ('144', 'Moldova, Republic Of', 'MD');
INSERT INTO `countries` VALUES ('145', 'Monaco', 'MC');
INSERT INTO `countries` VALUES ('146', 'Mongolia', 'MN');
INSERT INTO `countries` VALUES ('147', 'Montserrat', 'MS');
INSERT INTO `countries` VALUES ('148', 'Morocco', 'MA');
INSERT INTO `countries` VALUES ('149', 'Mozambique', 'MZ');
INSERT INTO `countries` VALUES ('150', 'Myanmar', 'MM');
INSERT INTO `countries` VALUES ('151', 'Namibia', 'NA');
INSERT INTO `countries` VALUES ('152', 'Nauru', 'NR');
INSERT INTO `countries` VALUES ('153', 'Nepal', 'NP');
INSERT INTO `countries` VALUES ('154', 'Netherlands', 'NL');
INSERT INTO `countries` VALUES ('155', 'Netherlands Antilles', 'AN');
INSERT INTO `countries` VALUES ('156', 'New Caledonia', 'NC');
INSERT INTO `countries` VALUES ('157', 'New Zealand', 'NZ');
INSERT INTO `countries` VALUES ('158', 'Nicaragua', 'NI');
INSERT INTO `countries` VALUES ('159', 'Niger', 'NE');
INSERT INTO `countries` VALUES ('160', 'Nigeria', 'NG');
INSERT INTO `countries` VALUES ('161', 'Niue', 'NU');
INSERT INTO `countries` VALUES ('162', 'Norfolk Island', 'NF');
INSERT INTO `countries` VALUES ('163', 'Northern Mariana Islands', 'MP');
INSERT INTO `countries` VALUES ('164', 'Norway', 'NO');
INSERT INTO `countries` VALUES ('165', 'Oman', 'OM');
INSERT INTO `countries` VALUES ('166', 'Pakistan', 'PK');
INSERT INTO `countries` VALUES ('167', 'Palau', 'PW');
INSERT INTO `countries` VALUES ('168', 'Palestinian Territory, Occupied', 'PS');
INSERT INTO `countries` VALUES ('169', 'Panama', 'PA');
INSERT INTO `countries` VALUES ('170', 'Papua New Guinea', 'PG');
INSERT INTO `countries` VALUES ('171', 'Paraguay', 'PY');
INSERT INTO `countries` VALUES ('172', 'Peru', 'PE');
INSERT INTO `countries` VALUES ('173', 'Philippines', 'PH');
INSERT INTO `countries` VALUES ('174', 'Pitcairn', 'PN');
INSERT INTO `countries` VALUES ('175', 'Poland', 'PL');
INSERT INTO `countries` VALUES ('176', 'Portugal', 'PT');
INSERT INTO `countries` VALUES ('177', 'Puerto Rico', 'PR');
INSERT INTO `countries` VALUES ('178', 'Qatar', 'QA');
INSERT INTO `countries` VALUES ('179', 'Reunion', 'RE');
INSERT INTO `countries` VALUES ('180', 'Romania', 'RO');
INSERT INTO `countries` VALUES ('181', 'Russian Federation', 'RU');
INSERT INTO `countries` VALUES ('182', 'Rwanda', 'RW');
INSERT INTO `countries` VALUES ('183', 'Saint Helena', 'SH');
INSERT INTO `countries` VALUES ('184', 'Saint Kitts And Nevis', 'KN');
INSERT INTO `countries` VALUES ('185', 'Saint Lucia', 'LC');
INSERT INTO `countries` VALUES ('186', 'Saint Pierre And Miquelon', 'PM');
INSERT INTO `countries` VALUES ('187', 'Saint Vincent And The Grenadines', 'VC');
INSERT INTO `countries` VALUES ('188', 'Samoa', 'WS');
INSERT INTO `countries` VALUES ('189', 'San Marino', 'SM');
INSERT INTO `countries` VALUES ('190', 'Sao Tome And Principe', 'ST');
INSERT INTO `countries` VALUES ('191', 'Saudi Arabia', 'SA');
INSERT INTO `countries` VALUES ('192', 'Senegal', 'SN');
INSERT INTO `countries` VALUES ('193', 'Serbia And Montenegro', 'CS');
INSERT INTO `countries` VALUES ('194', 'Seychelles', 'SC');
INSERT INTO `countries` VALUES ('195', 'Sierra Leone', 'SL');
INSERT INTO `countries` VALUES ('196', 'Singapore', 'SG');
INSERT INTO `countries` VALUES ('197', 'Slovakia', 'SK');
INSERT INTO `countries` VALUES ('198', 'Slovenia', 'SI');
INSERT INTO `countries` VALUES ('199', 'Solomon Islands', 'SB');
INSERT INTO `countries` VALUES ('200', 'Somalia', 'SO');
INSERT INTO `countries` VALUES ('201', 'South Africa', 'ZA');
INSERT INTO `countries` VALUES ('202', 'South Georgia And The South Sandwich Islands', 'GS');
INSERT INTO `countries` VALUES ('203', 'Spain', 'ES');
INSERT INTO `countries` VALUES ('204', 'Sri Lanka', 'LK');
INSERT INTO `countries` VALUES ('205', 'Sudan', 'SD');
INSERT INTO `countries` VALUES ('206', 'Suriname', 'SR');
INSERT INTO `countries` VALUES ('207', 'Svalbard And Jan Mayen', 'SJ');
INSERT INTO `countries` VALUES ('208', 'Swaziland', 'SZ');
INSERT INTO `countries` VALUES ('209', 'Sweden', 'SE');
INSERT INTO `countries` VALUES ('210', 'Switzerland', 'CH');
INSERT INTO `countries` VALUES ('211', 'Syrian Arab Republic', 'SY');
INSERT INTO `countries` VALUES ('212', 'Taiwan, Province Of China', 'TW');
INSERT INTO `countries` VALUES ('213', 'Tajikistan', 'TJ');
INSERT INTO `countries` VALUES ('214', 'Tanzania, United Republic Of', 'TZ');
INSERT INTO `countries` VALUES ('215', 'Thailand', 'TH');
INSERT INTO `countries` VALUES ('216', 'Timor-leste', 'TL');
INSERT INTO `countries` VALUES ('217', 'Togo', 'TG');
INSERT INTO `countries` VALUES ('218', 'Tokelau', 'TK');
INSERT INTO `countries` VALUES ('219', 'Tonga', 'TO');
INSERT INTO `countries` VALUES ('220', 'Trinidad And Tobago', 'TT');
INSERT INTO `countries` VALUES ('221', 'Tunisia', 'TN');
INSERT INTO `countries` VALUES ('222', 'Turkey', 'TR');
INSERT INTO `countries` VALUES ('223', 'Turkmenistan', 'TM');
INSERT INTO `countries` VALUES ('224', 'Turks And Caicos Islands', 'TC');
INSERT INTO `countries` VALUES ('225', 'Tuvalu', 'TV');
INSERT INTO `countries` VALUES ('226', 'Uganda', 'UG');
INSERT INTO `countries` VALUES ('227', 'Ukraine', 'UA');
INSERT INTO `countries` VALUES ('228', 'United Arab Emirates', 'AE');
INSERT INTO `countries` VALUES ('229', 'United Kingdom', 'GB');
INSERT INTO `countries` VALUES ('230', 'United States', 'US');
INSERT INTO `countries` VALUES ('231', 'United States Minor Outlying Islands', 'UM');
INSERT INTO `countries` VALUES ('232', 'Uruguay', 'UY');
INSERT INTO `countries` VALUES ('233', 'Uzbekistan', 'UZ');
INSERT INTO `countries` VALUES ('234', 'Vanuatu', 'VU');
INSERT INTO `countries` VALUES ('235', 'Venezuela', 'VE');
INSERT INTO `countries` VALUES ('236', 'Viet Nam', 'VN');
INSERT INTO `countries` VALUES ('237', 'Virgin Islands, British', 'VG');
INSERT INTO `countries` VALUES ('238', 'Virgin Islands, U.S.', 'VI');
INSERT INTO `countries` VALUES ('239', 'Wallis And Futuna', 'WF');
INSERT INTO `countries` VALUES ('240', 'Western Sahara', 'EH');
INSERT INTO `countries` VALUES ('241', 'Yemen', 'YE');
INSERT INTO `countries` VALUES ('242', 'Zambia', 'ZM');
INSERT INTO `countries` VALUES ('243', 'Zimbabwe', 'ZW');

-- ----------------------------
-- Table structure for `district`
-- ----------------------------
DROP TABLE IF EXISTS `district`;
CREATE TABLE `district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` int(11) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `province` (`province`),
  CONSTRAINT `district_ibfk_1` FOREIGN KEY (`province`) REFERENCES `province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of district
-- ----------------------------
INSERT INTO `district` VALUES ('1', '1', 'Ancuabe');
INSERT INTO `district` VALUES ('2', '1', 'Balama');
INSERT INTO `district` VALUES ('3', '1', 'Chiúre');
INSERT INTO `district` VALUES ('4', '1', 'Ibo');
INSERT INTO `district` VALUES ('5', '1', 'Macomia');
INSERT INTO `district` VALUES ('6', '1', 'Macomia');
INSERT INTO `district` VALUES ('7', '1', 'Meluco');
INSERT INTO `district` VALUES ('8', '1', 'Metuge');
INSERT INTO `district` VALUES ('9', '1', 'Mocímboa da Praia');
INSERT INTO `district` VALUES ('10', '1', 'Montepuez');
INSERT INTO `district` VALUES ('11', '1', 'Mueda');
INSERT INTO `district` VALUES ('12', '1', 'Muidumbe');
INSERT INTO `district` VALUES ('13', '1', 'Namuno');
INSERT INTO `district` VALUES ('14', '1', 'Nangade');
INSERT INTO `district` VALUES ('15', '1', 'Palma');
INSERT INTO `district` VALUES ('16', '1', 'Pemba');
INSERT INTO `district` VALUES ('17', '1', 'Quissanga');
INSERT INTO `district` VALUES ('18', '9', 'Bilene');
INSERT INTO `district` VALUES ('19', '9', 'Chibuto');
INSERT INTO `district` VALUES ('20', '9', 'Chicualacuala');
INSERT INTO `district` VALUES ('21', '9', 'Chigubo');
INSERT INTO `district` VALUES ('22', '9', 'Chókwè');
INSERT INTO `district` VALUES ('23', '9', 'Chongoene');
INSERT INTO `district` VALUES ('24', '9', 'Guijá');
INSERT INTO `district` VALUES ('25', '9', 'Limpopo');
INSERT INTO `district` VALUES ('26', '9', 'Mabalane');
INSERT INTO `district` VALUES ('27', '9', 'Manjacaze');
INSERT INTO `district` VALUES ('28', '9', 'Mapai');
INSERT INTO `district` VALUES ('29', '9', 'Massangena');
INSERT INTO `district` VALUES ('30', '9', 'Massingir');
INSERT INTO `district` VALUES ('31', '9', 'Xai-Xai');
INSERT INTO `district` VALUES ('32', '8', 'Funhalouro');
INSERT INTO `district` VALUES ('33', '8', 'Govuro');
INSERT INTO `district` VALUES ('34', '8', 'Homoíne');
INSERT INTO `district` VALUES ('35', '8', 'Inhambane');
INSERT INTO `district` VALUES ('36', '8', 'Inharrime');
INSERT INTO `district` VALUES ('37', '8', 'Inhassoro');
INSERT INTO `district` VALUES ('38', '8', 'Jangamo');
INSERT INTO `district` VALUES ('39', '8', 'Mabote');
INSERT INTO `district` VALUES ('40', '8', 'Massinga');
INSERT INTO `district` VALUES ('41', '8', 'Maxixe');
INSERT INTO `district` VALUES ('42', '8', 'Morrumbene');
INSERT INTO `district` VALUES ('43', '8', 'Panda');
INSERT INTO `district` VALUES ('44', '8', 'Vilanculos');
INSERT INTO `district` VALUES ('45', '8', 'Zavala');
INSERT INTO `district` VALUES ('46', '9', 'Bárue');
INSERT INTO `district` VALUES ('47', '9', 'Chimoio');
INSERT INTO `district` VALUES ('48', '9', 'Gondola');
INSERT INTO `district` VALUES ('49', '9', 'Guro');
INSERT INTO `district` VALUES ('50', '9', 'Macate');
INSERT INTO `district` VALUES ('51', '9', 'Machaze');
INSERT INTO `district` VALUES ('52', '9', 'Macossa');
INSERT INTO `district` VALUES ('53', '9', 'Manica');
INSERT INTO `district` VALUES ('54', '9', 'Mossurize');
INSERT INTO `district` VALUES ('55', '9', 'Sussundenga');
INSERT INTO `district` VALUES ('56', '9', 'Tambara');
INSERT INTO `district` VALUES ('57', '9', 'Vanduzi');
INSERT INTO `district` VALUES ('58', '10', 'Boane');
INSERT INTO `district` VALUES ('59', '10', 'Magude');
INSERT INTO `district` VALUES ('60', '10', 'Manhiça');
INSERT INTO `district` VALUES ('61', '10', 'Marracuene');
INSERT INTO `district` VALUES ('62', '10', 'Matola');
INSERT INTO `district` VALUES ('63', '10', 'Matutuíne');
INSERT INTO `district` VALUES ('64', '10', 'Moamba');
INSERT INTO `district` VALUES ('65', '10', 'Namaacha');
INSERT INTO `district` VALUES ('66', '3', 'Angoche');
INSERT INTO `district` VALUES ('67', '3', 'Eráti');
INSERT INTO `district` VALUES ('68', '3', 'Ilha de Moçambique');
INSERT INTO `district` VALUES ('69', '3', 'Lalaua');
INSERT INTO `district` VALUES ('70', '3', 'Larde');
INSERT INTO `district` VALUES ('71', '3', 'Liúpo');
INSERT INTO `district` VALUES ('72', '3', 'Malema');
INSERT INTO `district` VALUES ('73', '3', 'Meconta');
INSERT INTO `district` VALUES ('74', '3', 'Mecubúri');
INSERT INTO `district` VALUES ('75', '3', 'Memba');
INSERT INTO `district` VALUES ('76', '3', 'Mogincual');
INSERT INTO `district` VALUES ('77', '3', 'Mogovolas');
INSERT INTO `district` VALUES ('78', '3', 'Moma');
INSERT INTO `district` VALUES ('79', '3', 'Moma');
INSERT INTO `district` VALUES ('80', '3', 'Mossuril');
INSERT INTO `district` VALUES ('81', '3', 'Muecate');
INSERT INTO `district` VALUES ('82', '3', 'Murrupula');
INSERT INTO `district` VALUES ('83', '3', 'Nacala-a-Velha');
INSERT INTO `district` VALUES ('84', '3', 'Nacala Porto');
INSERT INTO `district` VALUES ('85', '3', 'Nacarôa');
INSERT INTO `district` VALUES ('86', '3', 'Nampula');
INSERT INTO `district` VALUES ('87', '3', 'Rapale');
INSERT INTO `district` VALUES ('88', '3', 'Ribaué');
INSERT INTO `district` VALUES ('89', '2', 'Chimbonila');
INSERT INTO `district` VALUES ('90', '2', 'Cuamba');
INSERT INTO `district` VALUES ('91', '2', 'Lago');
INSERT INTO `district` VALUES ('92', '2', 'Lichinga');
INSERT INTO `district` VALUES ('93', '2', 'Majune');
INSERT INTO `district` VALUES ('94', '2', 'Mandimba');
INSERT INTO `district` VALUES ('95', '2', 'Marrupa');
INSERT INTO `district` VALUES ('96', '2', 'Maúa');
INSERT INTO `district` VALUES ('97', '2', 'Mavago');
INSERT INTO `district` VALUES ('98', '2', 'Mecanhelas');
INSERT INTO `district` VALUES ('99', '2', 'Mecula');
INSERT INTO `district` VALUES ('100', '2', 'Metarica');
INSERT INTO `district` VALUES ('101', '2', 'Muembe');
INSERT INTO `district` VALUES ('102', '2', 'N\'gauma');
INSERT INTO `district` VALUES ('103', '2', 'Nipepe');
INSERT INTO `district` VALUES ('104', '2', 'Sanga');
INSERT INTO `district` VALUES ('105', '5', 'Angónia');
INSERT INTO `district` VALUES ('106', '5', 'Cahora-Bassa');
INSERT INTO `district` VALUES ('107', '5', 'Changara');
INSERT INTO `district` VALUES ('108', '5', 'Chifunde');
INSERT INTO `district` VALUES ('109', '5', 'Chiuta');
INSERT INTO `district` VALUES ('110', '5', 'Dôa');
INSERT INTO `district` VALUES ('111', '5', 'Macanga');
INSERT INTO `district` VALUES ('112', '5', 'Magoé');
INSERT INTO `district` VALUES ('113', '5', 'Marara');
INSERT INTO `district` VALUES ('114', '5', 'Marávia');
INSERT INTO `district` VALUES ('115', '5', 'Moatize');
INSERT INTO `district` VALUES ('116', '5', 'Mutarara');
INSERT INTO `district` VALUES ('117', '5', 'Tete');
INSERT INTO `district` VALUES ('118', '5', 'Tsangano');
INSERT INTO `district` VALUES ('119', '5', 'Zumbo');
INSERT INTO `district` VALUES ('120', '4', 'Alto Molócue');
INSERT INTO `district` VALUES ('121', '4', 'Chinde');
INSERT INTO `district` VALUES ('122', '4', 'Derre');
INSERT INTO `district` VALUES ('123', '4', 'Gilé');
INSERT INTO `district` VALUES ('124', '4', 'Gurué');
INSERT INTO `district` VALUES ('125', '4', 'Ile');
INSERT INTO `district` VALUES ('126', '4', 'Inhassunge');
INSERT INTO `district` VALUES ('127', '4', 'Luabo');
INSERT INTO `district` VALUES ('128', '4', 'Lugela');
INSERT INTO `district` VALUES ('129', '4', 'Maganja da Costa');
INSERT INTO `district` VALUES ('130', '4', 'Milange');
INSERT INTO `district` VALUES ('131', '4', 'Mocuba');
INSERT INTO `district` VALUES ('132', '4', 'Mocubela');
INSERT INTO `district` VALUES ('133', '4', 'Molumbo');
INSERT INTO `district` VALUES ('134', '4', 'Mopeia');
INSERT INTO `district` VALUES ('135', '4', 'Morrumbala');
INSERT INTO `district` VALUES ('136', '4', 'Mulevala');
INSERT INTO `district` VALUES ('137', '4', 'Namacurra');
INSERT INTO `district` VALUES ('138', '4', 'Namarroi');
INSERT INTO `district` VALUES ('139', '4', 'Nicoadala');
INSERT INTO `district` VALUES ('140', '4', 'Pebane');
INSERT INTO `district` VALUES ('141', '4', 'Quelimane');

-- ----------------------------
-- Table structure for `exam`
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `exam_year` int(11) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `noquestion` int(11) DEFAULT NULL,
  `assessment` tinyint(1) DEFAULT NULL,
  `pdfresource` varchar(250) DEFAULT NULL,
  `elearning` varchar(250) DEFAULT NULL,
  `university` int(11) NOT NULL,
  `hassimulation` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `exam_ibfk_2` (`university`),
  CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `exam_ibfk_2` FOREIGN KEY (`university`) REFERENCES `university` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES ('2', '2', '2005', 'Exame de Matemática', '10', '3', null, 'https://drive.google.com/open?id=0B-dOo9jrft_6ZHcwZXNGa0xxblk', null, '2', '1');
INSERT INTO `exam` VALUES ('12', '52', '2007', 'Exame de Frances', '30', '3', null, null, null, '12', '0');
INSERT INTO `exam` VALUES ('22', '32', '2005', 'Exame de Geografia', '10', '3', null, 'https://drive.google.com/open?id=0B-dOo9jrft_6Z0Jmd3JlU3FCT3M', null, '22', '0');
INSERT INTO `exam` VALUES ('32', '82', '2013', 'Exame de Filosofia', '10', '3', null, null, null, '2', '0');
INSERT INTO `exam` VALUES ('52', '92', '2005', 'Exame de Biologia', '10', '3', null, 'https://drive.google.com/open?id=0B-dOo9jrft_6cTVNMHNESGNUMEk', null, '2', '0');
INSERT INTO `exam` VALUES ('62', '12', '2005', 'Exame de Fisica', '10', '3', null, 'https://drive.google.com/open?id=0B-dOo9jrft_6eDVLRkRrcUFwLVE', null, '2', '0');
INSERT INTO `exam` VALUES ('72', '22', '2005', 'Exame de Química', '10', '3', null, 'https://drive.google.com/open?id=0B-dOo9jrft_6OGVvdFhYZ0hvcUE', null, '2', '0');
INSERT INTO `exam` VALUES ('92', '62', '2005', 'Exame de Ingles', '10', '3', null, 'https://drive.google.com/open?id=0B-dOo9jrft_6UmloVHozRWFodHM', null, '2', '0');
INSERT INTO `exam` VALUES ('112', '102', '2005', 'Exame de Portugues', '10', '3', null, 'https://drive.google.com/open?id=0B-dOo9jrft_6SklCWXdZQkFNQWc', null, '2', '0');
INSERT INTO `exam` VALUES ('113', '102', '2019', 'Exame de Português', '10', '4', null, null, null, '33', '1');
INSERT INTO `exam` VALUES ('114', '2', '2019', 'Exame de Matemática', '10', '1', null, null, null, '33', '1');

-- ----------------------------
-- Table structure for `exam_attempts`
-- ----------------------------
DROP TABLE IF EXISTS `exam_attempts`;
CREATE TABLE `exam_attempts` (
  `exam` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `start` datetime DEFAULT NULL,
  `score` double(10,0) DEFAULT NULL,
  PRIMARY KEY (`exam`,`user`,`timestamp`),
  KEY `user` (`user`),
  KEY `exam` (`exam`),
  KEY `end` (`timestamp`),
  CONSTRAINT `exam_attempts_ibfk_1` FOREIGN KEY (`exam`) REFERENCES `exam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `exam_attempts_ibfk_2` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_attempts
-- ----------------------------
INSERT INTO `exam_attempts` VALUES ('113', '236', '2019-11-10 12:35:40', '2019-11-10 12:35:31', '0');

-- ----------------------------
-- Table structure for `province`
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES ('1', 'Cabo Delgado');
INSERT INTO `province` VALUES ('2', 'Niassa');
INSERT INTO `province` VALUES ('3', 'Nampula');
INSERT INTO `province` VALUES ('4', 'Zambézia');
INSERT INTO `province` VALUES ('5', 'Tete');
INSERT INTO `province` VALUES ('6', 'Manica');
INSERT INTO `province` VALUES ('7', 'Sofala');
INSERT INTO `province` VALUES ('8', 'Inhambane');
INSERT INTO `province` VALUES ('9', 'Gaza');
INSERT INTO `province` VALUES ('10', 'Maputo');
INSERT INTO `province` VALUES ('11', 'Maputo Cidade');

-- ----------------------------
-- Table structure for `qtype`
-- ----------------------------
DROP TABLE IF EXISTS `qtype`;
CREATE TABLE `qtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qtype
-- ----------------------------
INSERT INTO `qtype` VALUES ('2', 'single-response');
INSERT INTO `qtype` VALUES ('12', 'multiple-response');
INSERT INTO `qtype` VALUES ('22', 'order-response');

-- ----------------------------
-- Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam` int(11) DEFAULT NULL,
  `question` longtext,
  `image` varchar(100) DEFAULT NULL,
  `feedback` longtext,
  `qtype` int(11) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `caseofstudy` longtext,
  `youtubeurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qtype` (`qtype`),
  KEY `createdby` (`createdby`),
  KEY `modifiedby` (`modifiedby`),
  KEY `exam` (`exam`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`qtype`) REFERENCES `qtype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `question_ibfk_2` FOREIGN KEY (`createdby`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `question_ibfk_3` FOREIGN KEY (`modifiedby`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `question_ibfk_4` FOREIGN KEY (`exam`) REFERENCES `exam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=330 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('2', '2', 'Escreva sob forma de percentagem a razÃ£o: $${7 \\over {15}}$$', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('12', '2', 'Qual Ã¨ o valor de $${(16)^{ - 1.75}}$$', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('22', '2', '$$\\sqrt {{{(2 - \\sqrt 5 )}^2}} $$ Ã© igual a:', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('32', '12', 'Choisissez la phrase qui rÃ©sume le mieux le contenu du texte', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('42', '12', 'Le problÃ¨me de la place de la femme dans la sociÃ©tÃ© existe depuis', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('52', '12', 'La complÃ©mentaritÃ© homme femme fait la force ', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('62', '22', 'A primeira viagem Ã  volta do mundo foi feita por:', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('72', '22', 'Quem afirmou que â€œO homem Ã© um ser activo na natureza, sendo capaz de\r\nadaptÃ¡-la Ã s suas necessidades. O homem modifica o meioâ€ foi:', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('82', '22', 'Quanto a sua localizaÃ§Ã£o cÃ³smica MoÃ§ambique situa-se', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('92', '32', 'Para Karl Jaspers, filosofar Ã©:', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('102', '32', 'A definiÃ§Ã£o da Filosofia Ã© jÃ¡ um problema filosÃ³fico porque:', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('112', '32', 'A utilidade da Filosofia Ã©:', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('152', '52', 'Uma das propriedades da membrana plasmÃ¡tica Ã© o controle de entrada e saÃ­da de substÃ¢ncias na cÃ©lula.Sobre os mecanismos desse transporte Ã© correcto afirmar:', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('162', '52', 'Quando se usa o microscÃ³pio, Ã© importante saber quanto o instrumento amplia a imagem observada. Se, por exemplo se observar uma cÃ©lula com uma ocular de10 e uma objectiva de 40, a ampliaÃ§Ã£o da imagem obtida serÃ¡ de :', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('172', '52', 'Se submetermos uma molÃ©cula de proteina a hidrÃ³lise o produto obtido serÃ¡:', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('182', '62', 'A relaÃ§Ã£o entre os vectores (v) e aceleraÃ§Ã£o (a) de um movimento circular uniforme Ã© graficamente representado por:', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('192', '62', 'Um corpo parte do repouso e percorre em queda livre 10m no Ãºltimo segundo. Desprezando a restencia do ar, a altura a que se encontra o corpo Ã© igual a:', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('202', '62', 'Um automÃ³vel fez um percurso rectilÃ­neo com velocidade escalar mÃ©dia negativa. Podemos afirmar que:', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('212', '72', 'A associaÃ§Ã£o correcta modelo/cientista Ã©:', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('222', '72', 'Entre as alternativas abaixo, a correcta Ã©:', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('232', '72', 'O isÃ³topo de 40K 19 transforma-se no isÃ³topo de 40Ca 20. Qual Ã© tipo de desintegraÃ§Ã£o radioactiva que se dÃ¡:', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('252', '92', ' Which biblical principle is the writer referring to in the first paragraph:', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('262', '92', 'According to the writer, victims of AIDS can be found', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('272', '92', 'In the notorious and infamous area of Jozi', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('292', '112', 'Segundo o texto, a Ilha de MoÃ§ambique Ã© importante porque:', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('302', '112', 'De acordo com o texto, a Ilha de MoÃ§ambique foi visitada por:', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('312', '112', 'A visita de alguns escritores Ã  Ilha deve-se:', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('313', '113', 'A opção que melhor completa a frase “O efeito do casamento prematuro nas raparigas é nefasto, na medida em que”', null, null, '2', null, null, null, null, '<p style=\"text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent iaculis tincidunt neque eu luctus. Curabitur et aliquam ex, vitae tincidunt metus. Vivamus quis sem neque. Phasellus faucibus sagittis tortor. In odio turpis, malesuada sit amet vulputate in, vulputate a est. Vestibulum malesuada sapien at leo interdum sagittis. Suspendisse potenti. Donec gravida sem tortor, at sollicitudin lorem luctus quis. Mauris egestas ac lorem nec condimentum. Pellentesque tincidunt vulputate quam. In dapibus quis sapien a malesuada. Duis ac ligula nunc. Mauris sollicitudin faucibus quam, sed bibendum mi pharetra sed. Etiam quis turpis lacinia, sollicitudin arcu eget, hendrerit arcu.</p>\r\n<p style=\"text-align: justify;\">Vivamus pellentesque sagittis justo accumsan pellentesque. Fusce ac venenatis sapien, at feugiat lectus. Etiam vehicula ante ut sollicitudin porttitor. Nunc id malesuada mauris, vitae pretium odio. Fusce molestie nec metus a porta. Donec gravida hendrerit lorem sit amet cursus. Suspendisse sit amet dolor sem. Aliquam et lacus tincidunt sem aliquam mattis. Etiam quam dui, sollicitudin et porttitor id, elementum ac urna. Phasellus leo nulla, porttitor at lectus at, laoreet auctor massa. Vivamus dignissim congue augue, eget fringilla ipsum mollis ac. Duis vel neque ac libero feugiat bibendum. Suspendisse aliquam nulla lectus, nec posuere nunc lacinia vitae. Aliquam suscipit dolor ut libero lobortis vulputate. Praesent eu augue porttitor, convallis tellus at, porttitor sem. Morbi commodo lacinia nisl, vel congue est ullamcorper id.</p>\r\n<p style=\"text-align: justify;\">Mauris sed mattis purus. Quisque viverra arcu id tincidunt posuere. Aenean at sem rutrum, consequat nibh tincidunt, elementum justo. Donec varius ante quis volutpat posuere. Morbi eu ullamcorper tortor, at aliquet nisi. Proin aliquam augue sit amet urna rhoncus posuere. Sed turpis purus, condimentum quis finibus sed, lobortis semper eros. Donec non sem elementum, ullamcorper ligula vitae, finibus ante. Curabitur porta maximus dolor. Praesent id egestas nibh. Donec ultrices lectus vel nibh laoreet cursus quis vel lacus. Suspendisse quis nulla egestas, consequat magna at, rhoncus est. Ut eleifend at neque sit amet venenatis. Maecenas nec nisi ut sem tincidunt tempus a id risus.</p>\r\n<p style=\"text-align: justify;\">Nullam id tortor varius, commodo odio vel, pharetra erat. Fusce dui lorem, iaculis eget porttitor ac, faucibus non quam. Proin feugiat elit sed elementum accumsan. Nulla porttitor interdum arcu, nec iaculis ligula vulputate in. Maecenas sit amet rutrum ante. In suscipit, est vitae finibus pretium, velit lacus bibendum urna, at elementum erat purus eu quam. Aenean dolor ipsum, aliquam quis congue et, euismod id diam. Mauris eleifend cursus mauris, vel vehicula dolor porttitor id. Nam et accumsan velit. In sed lobortis mauris. In suscipit id diam in volutpat. Integer volutpat enim id bibendum aliquet. Donec fermentum elementum arcu in tincidunt. Morbi viverra massa quis elit dapibus ullamcorper.</p>', null);
INSERT INTO `question` VALUES ('314', '114', '$$\\sqrt {{{(2 - \\sqrt 5 )}^2}} $$ É igual a:', null, null, '2', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'ADMIN');
INSERT INTO `role` VALUES ('2', 'USER');

-- ----------------------------
-- Table structure for `university`
-- ----------------------------
DROP TABLE IF EXISTS `university`;
CREATE TABLE `university` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `shortname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of university
-- ----------------------------
INSERT INTO `university` VALUES ('2', 'Universidade Eduardo Mondlane', 'UEM');
INSERT INTO `university` VALUES ('12', 'Universidade LÃºrio', 'UniLÃºrio');
INSERT INTO `university` VALUES ('22', 'Universidade Zambenze', 'UniZambeze');
INSERT INTO `university` VALUES ('32', 'Universidade PedagÃ³gica', 'UP');
INSERT INTO `university` VALUES ('33', 'Universidade Lurio - Bussiness School', 'UBS');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `datecreated` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  `hash` varchar(255) DEFAULT NULL,
  `district` int(11) DEFAULT NULL,
  `university` int(11) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `pin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `district` (`district`),
  KEY `university` (`university`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`district`) REFERENCES `district` (`id`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`university`) REFERENCES `university` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('235', 'Bania', 'Fonseca', 'bfonseca@unilurio.ac.mzo', '$2a$10$h68zxfuxp/6iF38/Euefpe0MTyuML72dh233PhF.bullttXxiIaFu', '2019-10-07 20:24:22', '1', null, '1', '2', 'ghugyu', '0648');
INSERT INTO `user` VALUES ('236', 'Dario', 'Mario', 'felasbe@hotmail.com', '$2a$10$1DI/wpMmgCi/TPC0BoNL9O9Y9u.rLixWPNbn/bH7V7JbdKSAQoPyy', '2019-10-09 19:37:52', '1', null, '1', '2', '825407883', '1576');
INSERT INTO `user` VALUES ('237', 'Babe', 'Bealgun', 'egimo@unilurio.ac.mz', '$2a$10$I2aa/enXEBtaT4TUp0VkwuWFmLTEs50CJKKO6J4R.DJaDup/nmd22', '2019-10-19 15:58:20', '1', null, '1', '2', '846689637', '5738');
INSERT INTO `user` VALUES ('238', 'Admin', 'Admin', 'felermino.ali@unilurio.ac.mz', '$2a$10$1DI/wpMmgCi/TPC0BoNL9O9Y9u.rLixWPNbn/bH7V7JbdKSAQoPyy', null, '1', null, null, null, null, null);

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('238', '1');
INSERT INTO `user_role` VALUES ('235', '2');
INSERT INTO `user_role` VALUES ('236', '2');
INSERT INTO `user_role` VALUES ('237', '2');
