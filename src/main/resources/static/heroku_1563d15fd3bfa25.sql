/*
Navicat MySQL Data Transfer

Source Server         : localMysql
Source Server Version : 50550
Source Host           : localhost:3306
Source Database       : osoma

Target Server Type    : MYSQL
Target Server Version : 50550
File Encoding         : 65001

Date: 2020-04-17 09:01:39
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
) ENGINE=InnoDB AUTO_INCREMENT=35590 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of attempt_result
-- ----------------------------
INSERT INTO `attempt_result` VALUES ('35584', '117', '236', '2020-04-09 13:51:26', '1343');
INSERT INTO `attempt_result` VALUES ('35585', '117', '236', '2020-04-09 13:51:26', '1347');
INSERT INTO `attempt_result` VALUES ('35586', '117', '236', '2020-04-09 13:51:26', '1354');
INSERT INTO `attempt_result` VALUES ('35587', '117', '236', '2020-04-09 13:51:26', '1356');
INSERT INTO `attempt_result` VALUES ('35588', '2', '236', '2020-04-14 10:59:01', '2');
INSERT INTO `attempt_result` VALUES ('35589', '2', '236', '2020-04-14 10:59:01', '72');

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
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('2', 'matámatica', 'images/cover/matematica.png', 'images/disciplinas/matematica.png');
INSERT INTO `category` VALUES ('12', 'física', 'images/cover/fisica.png', 'images/disciplinas/fisica.png');
INSERT INTO `category` VALUES ('22', 'química', 'images/cover/quimica.png', 'images/disciplinas/quimica.png');
INSERT INTO `category` VALUES ('32', 'geografia', 'images/cover/geografia.png', 'images/disciplinas/geografia.png');
INSERT INTO `category` VALUES ('42', 'história', 'images/cover/historia.png', 'images/disciplinas/historia.png');
INSERT INTO `category` VALUES ('52', 'francês', 'images/cover/frances.png', 'images/disciplinas/frances.png');
INSERT INTO `category` VALUES ('62', 'inglês', 'images/cover/ingles.png', 'images/disciplinas/ingles.png');
INSERT INTO `category` VALUES ('72', 'desenho', 'images/cover/desenho.png', 'images/disciplinas/desenho.png');
INSERT INTO `category` VALUES ('82', 'filosofia', 'images/cover/filosofia.png', 'images/disciplinas/filosofia.png');
INSERT INTO `category` VALUES ('92', 'biologia', 'images/cover/biologia.png', 'images/disciplinas/biologia.png');
INSERT INTO `category` VALUES ('102', 'português', 'images/cover/portugues.png', 'images/disciplinas/portugues.png');
INSERT INTO `category` VALUES ('103', 'scrum', 'images/cover/scrum.jpg', 'images/disciplinas/scrum.png');

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
  CONSTRAINT `choice_ibfk_1` FOREIGN KEY (`question`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1668 DEFAULT CHARSET=utf8;

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
INSERT INTO `choice` VALUES ('1182', '318', 'as próprias raparigas fazem as suas escolhas para assegurar a sua família, o seu bem-estar e a sua sobrevivência.', null, null, '0');
INSERT INTO `choice` VALUES ('1183', '318', 'assegura o futuro das raparigas no que toca à sua sobrevivência, desenvolvimento e enquadramento na sociedade.', null, null, '1');
INSERT INTO `choice` VALUES ('1184', '318', 'compromete o futuro das raparigas no que respeita à sua sobrevivência, desenvolvimento e enquadramento na sociedade.', null, null, '0');
INSERT INTO `choice` VALUES ('1185', '318', 'promete o futuro das raparigas no que concerne à sua sobrevivência, desenvolvimento e enquadramento na sociedade.', null, null, '0');
INSERT INTO `choice` VALUES ('1186', '319', 'pelas próprias raparigas.', null, null, '0');
INSERT INTO `choice` VALUES ('1187', '319', 'pelas suas mães e tios.', null, null, '0');
INSERT INTO `choice` VALUES ('1188', '319', 'pelos seus próprios pais.', null, null, '1');
INSERT INTO `choice` VALUES ('1189', '319', 'pelos seus pais e irmãos.', null, null, '0');
INSERT INTO `choice` VALUES ('1190', '320', '1º parágrafo', null, null, '0');
INSERT INTO `choice` VALUES ('1191', '320', '2º parágrafo.', null, null, '1');
INSERT INTO `choice` VALUES ('1192', '320', '3º parágrafo.', null, null, '0');
INSERT INTO `choice` VALUES ('1193', '320', '4º parágrafo.', null, null, '0');
INSERT INTO `choice` VALUES ('1194', '321', 'O vazio legal na legislação nacional sobre a prática das uniões forçadas, as leis acostumadas, os ritos de iniciação, o incesto e a poligamia.', null, null, '0');
INSERT INTO `choice` VALUES ('1195', '321', 'O vazio legal na legislação nacional sobre a prática das uniões autorizadas, as leis costumeiras, os ritos de iniciação, o incesto e a poligamia.', null, null, '0');
INSERT INTO `choice` VALUES ('1196', '321', 'O vazio legal na legislação racional sobre a prática das uniões forçadas, as leis costumeiras, os ritos de iniciação, o incesto e a poligamia.', null, null, '0');
INSERT INTO `choice` VALUES ('1197', '321', 'O vazio legal na legislação nacional sobre a prática das uniões forçadas, as leis costumeiras, os ritos de iniciação, o incesto e a poligamia. ', null, null, '1');
INSERT INTO `choice` VALUES ('1198', '322', 'a maioria dos pais que enviam os seus filhos para a escola não tem um nível de escolaridade muito limitado.', null, null, '0');
INSERT INTO `choice` VALUES ('1199', '322', 'a maioria dos pais que enviam os seus filhos para a escola tem um nível de escolaridade muito limitado.', null, null, '0');
INSERT INTO `choice` VALUES ('1200', '322', 'as raparigas tomam certas escolhas que afectam negativamente a sua escolaridade, saúde e o seu futuro.', null, null, '1');
INSERT INTO `choice` VALUES ('1201', '322', 'as práticas culturais nocivas também têm contribuído para a alta taxa de casamentos prematuros em baixa.', null, null, '0');
INSERT INTO `choice` VALUES ('1202', '323', 'A decisão de casar é tomada muitas vezes ou quase sempre pelas mães das raparigas.', null, null, '0');
INSERT INTO `choice` VALUES ('1203', '323', 'A decisão de casar é tomada muitas vezes ou quase sempre pelos pais das raparigas.', null, null, '1');
INSERT INTO `choice` VALUES ('1204', '323', 'A decisão de casar é tomada muitas vezes ou quase sempre pelas raparigas.', null, null, '0');
INSERT INTO `choice` VALUES ('1205', '323', 'A decisão de casar é tomada muitas vezes ou quase sempre pelas raparigas.', null, null, '0');
INSERT INTO `choice` VALUES ('1206', '324', 'o incesto.', null, null, '0');
INSERT INTO `choice` VALUES ('1207', '324', 'a poligamia.', null, null, '0');
INSERT INTO `choice` VALUES ('1208', '324', 'os ritos de iniciação.', null, null, '1');
INSERT INTO `choice` VALUES ('1209', '324', 'o adultério.', null, null, '0');
INSERT INTO `choice` VALUES ('1210', '325', 'porque levam as raparigas à desistência da escola, à separação dos progenitores, à desinfecção com doenças de transmissão sexual incluindo o HIV e SIDA. ', null, null, '0');
INSERT INTO `choice` VALUES ('1211', '325', 'porque põem em risco de violência e de doenças as raparigas, privando-as dos seus direitos à saúde, educação, desenvolvimento e igualdade de género.', null, null, '1');
INSERT INTO `choice` VALUES ('1212', '325', 'porque prematuros desrespeitam as raparigas quanto aos seus direitos à saúde, educação, desenvolvimento e igualdade de género.', null, null, '0');
INSERT INTO `choice` VALUES ('1213', '325', 'porque privam precocemente as raparigas dos seus direitos à saúde, educação, desenvolvimento e igualdade de género.', null, null, '0');
INSERT INTO `choice` VALUES ('1214', '326', 'O casamento prematuro tem tido um impacto devastador na saúde, educação, mortalidade materna e infantil, e demais direitos de milhares de crianças moçambicanas, em particular raparigas.', null, null, '0');
INSERT INTO `choice` VALUES ('1215', '326', 'O casamento prematuro tem tido um impacto devastador na saúde, educação, mortalidade materna e infantil, e demais deveres de crianças moçambicanas, em particular raparigas.', null, null, '0');
INSERT INTO `choice` VALUES ('1216', '326', 'O casamento prematuro prejudica a rapariga no que respeita ao acesso, permanência e conclusão do sistema educativo.', null, null, '0');
INSERT INTO `choice` VALUES ('1217', '326', 'O casamento prematuro tem tido um impacto devastador na saúde, educação, mortalidade materna e infantil.', null, null, '1');
INSERT INTO `choice` VALUES ('1218', '327', 'desprezo familiar. ', null, null, '0');
INSERT INTO `choice` VALUES ('1219', '327', 'gravidez precoce.', null, null, '1');
INSERT INTO `choice` VALUES ('1220', '327', 'pobreza absoluta. ', null, null, '0');
INSERT INTO `choice` VALUES ('1221', '327', 'gravidez indesejada.', null, null, '0');
INSERT INTO `choice` VALUES ('1222', '328', '1º parágrafo.', null, null, '0');
INSERT INTO `choice` VALUES ('1223', '328', '3º parágrafo.', null, null, '0');
INSERT INTO `choice` VALUES ('1224', '328', '7º parágrafo.', null, null, '0');
INSERT INTO `choice` VALUES ('1225', '328', '6º parágrafo.', null, null, '1');
INSERT INTO `choice` VALUES ('1226', '329', 'pobreza extrema.', null, null, '0');
INSERT INTO `choice` VALUES ('1227', '329', 'gravidez indesejada. ', null, null, '0');
INSERT INTO `choice` VALUES ('1228', '329', 'fístula obstétrica.', null, null, '1');
INSERT INTO `choice` VALUES ('1229', '329', 'gravidez precoce.', null, null, '0');
INSERT INTO `choice` VALUES ('1230', '330', 'Incidência do casamento prematuro nas raparigas e na sociedade.', null, null, '0');
INSERT INTO `choice` VALUES ('1231', '330', 'Impacto do casamento prematuro nas raparigas e na sociedade.', null, null, '1');
INSERT INTO `choice` VALUES ('1232', '330', 'Elevação do casamento prematuro nas raparigas e na sociedade.', null, null, '0');
INSERT INTO `choice` VALUES ('1233', '330', 'Iniciação do casamento prematuro nas raparigas e na sociedade.', null, null, '0');
INSERT INTO `choice` VALUES ('1234', '331', 'Ele afirmou que o casamento prematuro prejudicava a rapariga.', null, null, '1');
INSERT INTO `choice` VALUES ('1235', '331', 'Ele assumiu que o casamento prematuro prejudicava a rapariga.', null, null, '0');
INSERT INTO `choice` VALUES ('1236', '331', 'Ele afirmou que o casamento prematuro prejudicará a rapariga.', null, null, '0');
INSERT INTO `choice` VALUES ('1237', '331', 'Ele disse que o casamento prematuro prejudicaria a rapariga.', null, null, '0');
INSERT INTO `choice` VALUES ('1238', '332', 'O Abel, aluno da 12ª classe, viajou para Nacala.', null, null, '1');
INSERT INTO `choice` VALUES ('1239', '332', 'O Abel, aluno da 12ª classe viajou para Nacala.', null, null, '0');
INSERT INTO `choice` VALUES ('1240', '332', 'O Abel aluno da 12ª classe, viajou para Nacala.', null, null, '0');
INSERT INTO `choice` VALUES ('1241', '332', 'O Abel aluno da 12ª classe viajou para Nacala.', null, null, '0');
INSERT INTO `choice` VALUES ('1242', '333', 'Apresso e assento.', null, null, '0');
INSERT INTO `choice` VALUES ('1243', '333', 'Assento e apreço.', null, null, '0');
INSERT INTO `choice` VALUES ('1244', '333', 'Apreço e assento.', null, null, '1');
INSERT INTO `choice` VALUES ('1245', '333', 'Acento e apreço.', null, null, '0');
INSERT INTO `choice` VALUES ('1246', '334', 'se não estivesse; se levasse; cheguei há cerca de uma hora.', null, null, '1');
INSERT INTO `choice` VALUES ('1247', '334', 'se não estivesse; se leva-se; cheguei há cerca de uma hora.', null, null, '0');
INSERT INTO `choice` VALUES ('1248', '334', 'senão estivesse; se levasse; cheguei acerca de uma hora.', null, null, '0');
INSERT INTO `choice` VALUES ('1249', '334', 'senão estivesse; se levasse; cheguei cerca de uma hora.', null, null, '0');
INSERT INTO `choice` VALUES ('1250', '335', 'arquipélago e bando. ', null, null, '0');
INSERT INTO `choice` VALUES ('1251', '335', 'cardume e fauna. ', null, null, '0');
INSERT INTO `choice` VALUES ('1252', '335', 'arquipélago e cardume.', null, null, '0');
INSERT INTO `choice` VALUES ('1253', '335', 'cardume e arquipélago.', null, null, '1');
INSERT INTO `choice` VALUES ('1254', '336', 'vês', null, null, '0');
INSERT INTO `choice` VALUES ('1255', '336', 'vejas', null, null, '0');
INSERT INTO `choice` VALUES ('1256', '336', 'veres', null, null, '0');
INSERT INTO `choice` VALUES ('1257', '336', 'vires', null, null, '1');
INSERT INTO `choice` VALUES ('1258', '337', 'no entanto.', null, null, '1');
INSERT INTO `choice` VALUES ('1259', '337', 'por isso.', null, null, '0');
INSERT INTO `choice` VALUES ('1260', '337', 'não obstante.', null, null, '0');
INSERT INTO `choice` VALUES ('1261', '337', 'não só … mas também.', null, null, '0');
INSERT INTO `choice` VALUES ('1262', '338', 'Businesses   ', null, null, '0');
INSERT INTO `choice` VALUES ('1263', '338', 'marketing', null, null, '0');
INSERT INTO `choice` VALUES ('1264', '338', 'text message', null, null, '0');
INSERT INTO `choice` VALUES ('1265', '338', 'text message advertising', null, null, '1');
INSERT INTO `choice` VALUES ('1266', '339', 'together with', null, null, '0');
INSERT INTO `choice` VALUES ('1267', '339', 'to join with', null, null, '1');
INSERT INTO `choice` VALUES ('1268', '339', 'to make together', null, null, '0');
INSERT INTO `choice` VALUES ('1269', '339', 'together connect with', null, null, '0');
INSERT INTO `choice` VALUES ('1270', '340', 'RSVP', null, null, '0');
INSERT INTO `choice` VALUES ('1271', '340', 'SMSA', null, null, '0');
INSERT INTO `choice` VALUES ('1272', '340', 'SMS', null, null, '1');
INSERT INTO `choice` VALUES ('1273', '340', 'TCPA', null, null, '0');
INSERT INTO `choice` VALUES ('1274', '341', '90% of text messages            ', null, null, '0');
INSERT INTO `choice` VALUES ('1275', '341', '40% of text messages', null, null, '0');
INSERT INTO `choice` VALUES ('1276', '341', '20% of text messages', null, null, '0');
INSERT INTO `choice` VALUES ('1277', '341', '99% of text messages ', null, null, '1');
INSERT INTO `choice` VALUES ('1278', '342', 'Excellent', null, null, '0');
INSERT INTO `choice` VALUES ('1279', '342', 'same', null, null, '0');
INSERT INTO `choice` VALUES ('1280', '342', 'utilize', null, null, '1');
INSERT INTO `choice` VALUES ('1281', '342', 'message', null, null, '0');
INSERT INTO `choice` VALUES ('1282', '343', 'the registration is in open doors', null, null, '0');
INSERT INTO `choice` VALUES ('1283', '343', 'the registration is in closed doors', null, null, '0');
INSERT INTO `choice` VALUES ('1284', '343', 'the registration is free of charge', null, null, '1');
INSERT INTO `choice` VALUES ('1285', '343', 'the registration is paid', null, null, '0');
INSERT INTO `choice` VALUES ('1286', '344', 'Monday', null, null, '0');
INSERT INTO `choice` VALUES ('1287', '344', '01/11/2019', null, null, '0');
INSERT INTO `choice` VALUES ('1288', '344', 'Thursday', null, null, '0');
INSERT INTO `choice` VALUES ('1289', '344', 'Friday', null, null, '1');
INSERT INTO `choice` VALUES ('1290', '345', 'are', null, null, '0');
INSERT INTO `choice` VALUES ('1291', '345', 'is', null, null, '1');
INSERT INTO `choice` VALUES ('1292', '345', 'am', null, null, '0');
INSERT INTO `choice` VALUES ('1293', '345', 'isn’ t', null, null, '0');
INSERT INTO `choice` VALUES ('1294', '346', 'are', null, null, '1');
INSERT INTO `choice` VALUES ('1295', '346', 'am', null, null, '0');
INSERT INTO `choice` VALUES ('1296', '346', 'is', null, null, '0');
INSERT INTO `choice` VALUES ('1297', '346', 'isn’ t', null, null, '0');
INSERT INTO `choice` VALUES ('1298', '347', 'are putting', null, null, '0');
INSERT INTO `choice` VALUES ('1299', '347', 'is puting', null, null, '0');
INSERT INTO `choice` VALUES ('1300', '347', 'is putting  ', null, null, '1');
INSERT INTO `choice` VALUES ('1301', '347', 'is puts', null, null, '0');
INSERT INTO `choice` VALUES ('1302', '348', 'studing', null, null, '0');
INSERT INTO `choice` VALUES ('1303', '348', 'studying', null, null, '1');
INSERT INTO `choice` VALUES ('1304', '348', 'studies', null, null, '0');
INSERT INTO `choice` VALUES ('1305', '348', 'study', null, null, '0');
INSERT INTO `choice` VALUES ('1306', '349', 'Is swimming', null, null, '0');
INSERT INTO `choice` VALUES ('1307', '349', 'are swim', null, null, '0');
INSERT INTO `choice` VALUES ('1308', '349', 'is swims', null, null, '0');
INSERT INTO `choice` VALUES ('1309', '349', 'are swimming', null, null, '1');
INSERT INTO `choice` VALUES ('1310', '350', 'aren’t', null, null, '0');
INSERT INTO `choice` VALUES ('1311', '350', 'is', null, null, '1');
INSERT INTO `choice` VALUES ('1312', '350', 'are', null, null, '0');
INSERT INTO `choice` VALUES ('1313', '350', 'am', null, null, '0');
INSERT INTO `choice` VALUES ('1314', '351', 'are', null, null, '0');
INSERT INTO `choice` VALUES ('1315', '351', 'am', null, null, '0');
INSERT INTO `choice` VALUES ('1316', '351', 'is', null, null, '1');
INSERT INTO `choice` VALUES ('1317', '351', 'isn’t ', null, null, '0');
INSERT INTO `choice` VALUES ('1318', '352', 'on', null, null, '0');
INSERT INTO `choice` VALUES ('1319', '352', 'above', null, null, '0');
INSERT INTO `choice` VALUES ('1320', '352', 'in', null, null, '1');
INSERT INTO `choice` VALUES ('1321', '352', 'at', null, null, '0');
INSERT INTO `choice` VALUES ('1322', '353', 'on', null, null, '1');
INSERT INTO `choice` VALUES ('1323', '353', 'in', null, null, '0');
INSERT INTO `choice` VALUES ('1324', '353', 'at', null, null, '0');
INSERT INTO `choice` VALUES ('1325', '353', 'between', null, null, '0');
INSERT INTO `choice` VALUES ('1326', '354', 'are', null, null, '0');
INSERT INTO `choice` VALUES ('1327', '354', 'is', null, null, '1');
INSERT INTO `choice` VALUES ('1328', '354', 'am', null, null, '0');
INSERT INTO `choice` VALUES ('1329', '354', 'isn’t ', null, null, '0');
INSERT INTO `choice` VALUES ('1330', '355', 'build', null, null, '0');
INSERT INTO `choice` VALUES ('1331', '355', 'built', null, null, '0');
INSERT INTO `choice` VALUES ('1332', '355', 'was built', null, null, '1');
INSERT INTO `choice` VALUES ('1333', '355', 'has built', null, null, '0');
INSERT INTO `choice` VALUES ('1334', '356', 'a', null, null, '0');
INSERT INTO `choice` VALUES ('1335', '356', 'the', null, null, '0');
INSERT INTO `choice` VALUES ('1336', '356', 'am', null, null, '0');
INSERT INTO `choice` VALUES ('1337', '356', 'an', null, null, '1');
INSERT INTO `choice` VALUES ('1338', '356', 'none of the options ', null, null, '0');
INSERT INTO `choice` VALUES ('1339', '357', 'sees', null, null, '0');
INSERT INTO `choice` VALUES ('1340', '357', 'see', null, null, '0');
INSERT INTO `choice` VALUES ('1341', '357', 'seen', null, null, '0');
INSERT INTO `choice` VALUES ('1342', '357', 'saw', null, null, '1');
INSERT INTO `choice` VALUES ('1343', '358', '2', null, null, '0');
INSERT INTO `choice` VALUES ('1344', '358', '3', null, null, '0');
INSERT INTO `choice` VALUES ('1345', '358', '4', null, null, '0');
INSERT INTO `choice` VALUES ('1346', '358', '5', null, null, '1');
INSERT INTO `choice` VALUES ('1347', '359', '0', null, null, '1');
INSERT INTO `choice` VALUES ('1348', '359', '1', null, null, '0');
INSERT INTO `choice` VALUES ('1349', '359', '2', null, null, '0');
INSERT INTO `choice` VALUES ('1350', '359', '3', null, null, '0');
INSERT INTO `choice` VALUES ('1351', '360', '$$\\left\\{ { - 3,\\;\\;0,\\;\\;2} \\right\\}$$', null, null, '1');
INSERT INTO `choice` VALUES ('1352', '360', '$$\\left\\{ { - 1,\\;\\;0,\\;\\;2} \\right\\}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1353', '360', '$$\\left\\{ { - 2,\\;\\;0,\\;\\;3} \\right\\}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1354', '360', '$$\\left\\{ { 2,\\;\\;1,\\;\\;3} \\right\\}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1355', '361', '$$\\left\\{ { - 1,\\;\\;2} \\right\\}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1356', '361', '$$\\left\\{ { 1,\\;\\;- 2} \\right\\}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1357', '361', '$$\\left\\{ { 2,\\;\\;- 1} \\right\\}$$', null, null, '1');
INSERT INTO `choice` VALUES ('1358', '361', '$$\\left\\{ { 2,\\;\\; 1} \\right\\}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1359', '362', '$$\\frac{{x + 1}}{{{x^2} - 4}}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1361', '362', '$$\\sqrt {{x^2} - 3}  - 4x$$', null, null, '0');
INSERT INTO `choice` VALUES ('1362', '362', '$$\\frac{1}{2}{x^2} + x + 4$$', null, null, '1');
INSERT INTO `choice` VALUES ('1363', '362', '$$3\\sqrt x  - 4x - 3{x^4}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1364', '363', '$${x^4} + 6$$', null, null, '0');
INSERT INTO `choice` VALUES ('1365', '363', '$$\\;{x^3} + 10{x^2} - 20x + 12$$', null, null, '1');
INSERT INTO `choice` VALUES ('1366', '363', '$${x^4} + 10$$', null, null, '0');
INSERT INTO `choice` VALUES ('1367', '363', '$${x^4} + 10{x^2} - 10x + 6$$', null, null, '0');
INSERT INTO `choice` VALUES ('1368', '364', '29', null, null, '0');
INSERT INTO `choice` VALUES ('1369', '364', '43', null, null, '0');
INSERT INTO `choice` VALUES ('1370', '364', '3', null, null, '0');
INSERT INTO `choice` VALUES ('1371', '364', '-1', null, null, '1');
INSERT INTO `choice` VALUES ('1372', '365', '$$D =  ℝ\\setminus \\left\\{ {1,\\;\\;3} \\right\\}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1373', '365', '$$D =  ℝ\\setminus \\left\\{ {1,\\;\\;4,\\;\\;5} \\right\\}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1374', '365', '$$D =  ℝ\\setminus \\left\\{ { - 4,\\; - 1,\\;0} \\right\\}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1375', '365', '$$D =  ℝ\\setminus \\left\\{ { - 1,\\;0,\\;5} \\right\\}$$', null, null, '1');
INSERT INTO `choice` VALUES ('1376', '366', '0', null, null, '0');
INSERT INTO `choice` VALUES ('1377', '366', '1', null, null, '0');
INSERT INTO `choice` VALUES ('1378', '366', '2', null, null, '1');
INSERT INTO `choice` VALUES ('1379', '366', '3', null, null, '0');
INSERT INTO `choice` VALUES ('1380', '367', '$$\\left] { - 7,3} \\right[$$', null, null, '1');
INSERT INTO `choice` VALUES ('1381', '367', '$$\\left] { - 5,2} \\right[$$', null, null, '0');
INSERT INTO `choice` VALUES ('1382', '367', '$$\\left] { 5,- 2} \\right[$$', null, null, '0');
INSERT INTO `choice` VALUES ('1383', '367', '$$\\left] { - \\infty , - 7} \\right[ \\cup \\left] {3, + \\infty } \\right[$$', null, null, '0');
INSERT INTO `choice` VALUES ('1384', '368', '6', null, null, '0');
INSERT INTO `choice` VALUES ('1385', '368', '29', null, null, '1');
INSERT INTO `choice` VALUES ('1386', '368', '30', null, null, '0');
INSERT INTO `choice` VALUES ('1387', '368', '720', null, null, '0');
INSERT INTO `choice` VALUES ('1388', '369', '$$ - 12$$', null, null, '0');
INSERT INTO `choice` VALUES ('1389', '369', '$$13$$', null, null, '1');
INSERT INTO `choice` VALUES ('1390', '369', '$$25$$', null, null, '0');
INSERT INTO `choice` VALUES ('1391', '369', '$$156$$', null, null, '0');
INSERT INTO `choice` VALUES ('1392', '370', '5', null, null, '0');
INSERT INTO `choice` VALUES ('1393', '370', '6', null, null, '0');
INSERT INTO `choice` VALUES ('1394', '370', '9', null, null, '0');
INSERT INTO `choice` VALUES ('1395', '370', '10', null, null, '1');
INSERT INTO `choice` VALUES ('1396', '371', '$$\\frac{2}{3}$$', null, null, '1');
INSERT INTO `choice` VALUES ('1397', '371', '$$\\frac{1}{2}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1398', '371', '$$\\frac{1}{3}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1399', '371', '1', null, null, '0');
INSERT INTO `choice` VALUES ('1400', '372', '$$3$$', null, null, '0');
INSERT INTO `choice` VALUES ('1401', '372', '$$\\frac{3}{2}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1402', '372', '$${e^3}$$', null, null, '1');
INSERT INTO `choice` VALUES ('1403', '372', '$${e^{\\frac{3}{2}}}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1404', '373', '2 e 5', null, null, '0');
INSERT INTO `choice` VALUES ('1405', '373', '4 e 2', null, null, '0');
INSERT INTO `choice` VALUES ('1406', '373', '7 e 4', null, null, '0');
INSERT INTO `choice` VALUES ('1407', '373', '2 e 4', null, null, '1');
INSERT INTO `choice` VALUES ('1408', '374', '6', null, null, '1');
INSERT INTO `choice` VALUES ('1409', '374', '5', null, null, '0');
INSERT INTO `choice` VALUES ('1410', '374', '4', null, null, '0');
INSERT INTO `choice` VALUES ('1411', '374', '3', null, null, '0');
INSERT INTO `choice` VALUES ('1412', '375', '$$\\frac{2}{{3\\sqrt {3x - 5} }}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1413', '375', '$$ - \\frac{5}{{3\\sqrt {3x - 5} }}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1414', '375', '$$\\frac{1}{{2\\sqrt {3x - 5} }}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1415', '375', '$$\\frac{3}{{2\\sqrt {3x - 5} }}$$', null, null, '1');
INSERT INTO `choice` VALUES ('1416', '376', '$$4{e^2}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1417', '376', '$$4{e^{ - 2x}}$$', null, null, '1');
INSERT INTO `choice` VALUES ('1418', '376', '$$ - 4{e^{ - 2x}}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1419', '376', '$$\\frac{1}{4}{e^{ - 2x}}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1420', '377', '$$\\left] { - \\infty , - 2} \\right[ \\cup \\left] {2, + \\infty } \\right[$$', null, null, '0');
INSERT INTO `choice` VALUES ('1421', '377', '$$\\left] { - 2,2} \\right[$$', null, null, '0');
INSERT INTO `choice` VALUES ('1422', '377', '$$\\left] { - 1,1} \\right[$$', null, null, '1');
INSERT INTO `choice` VALUES ('1423', '377', '$$\\left] { - \\infty , - 1} \\right[ \\cup \\left] {1, + \\infty } \\right[$$', null, null, '0');
INSERT INTO `choice` VALUES ('1424', '378', '$$\\frac{4}{{10}},\\;\\frac{{24}}{{10}}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1425', '378', '$$\\frac{4}{{100}},\\;\\frac{{2,4}}{{100}}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1426', '378', '$$\\frac{4}{{100}},\\;\\frac{{24}}{{100}}$$', null, null, '1');
INSERT INTO `choice` VALUES ('1427', '378', '$$\\;\\frac{{100}}{4},\\;\\frac{{100}}{{24}}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1428', '379', '30%   80%   50%   25%  35%', null, null, '1');
INSERT INTO `choice` VALUES ('1429', '379', '30%   80%   50%   25%   0,35%', null, null, '0');
INSERT INTO `choice` VALUES ('1430', '379', '3%   8%   50%   25%   0,35%', null, null, '0');
INSERT INTO `choice` VALUES ('1431', '379', ' 3%   8%   5%   0,25%   35%', null, null, '0');
INSERT INTO `choice` VALUES ('1432', '380', '6570dm       ', null, null, '0');
INSERT INTO `choice` VALUES ('1433', '380', '6,57m', null, null, '0');
INSERT INTO `choice` VALUES ('1434', '380', '65,7dm', null, null, '1');
INSERT INTO `choice` VALUES ('1435', '380', '65,7m', null, null, '0');
INSERT INTO `choice` VALUES ('1436', '381', '$$\\frac{4}{3}$$', null, null, '1');
INSERT INTO `choice` VALUES ('1437', '381', '$$\\frac{13}{6}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1438', '381', '$$\\frac{6}{8}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1439', '381', '$$\\frac{13}{12}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1440', '382', '$$ - 10\\sqrt 2 \\;$$', null, null, '0');
INSERT INTO `choice` VALUES ('1441', '382', '$$2\\sqrt 2 $$', null, null, '0');
INSERT INTO `choice` VALUES ('1442', '382', '$$10\\sqrt 2 $$', null, null, '0');
INSERT INTO `choice` VALUES ('1443', '382', '$$ - 2\\sqrt 2 $$', null, null, '1');
INSERT INTO `choice` VALUES ('1444', '383', '9', null, null, '0');
INSERT INTO `choice` VALUES ('1445', '383', '6', null, null, '0');
INSERT INTO `choice` VALUES ('1446', '383', '0', null, null, '1');
INSERT INTO `choice` VALUES ('1447', '383', '3', null, null, '0');
INSERT INTO `choice` VALUES ('1448', '384', '0,773', null, null, '0');
INSERT INTO `choice` VALUES ('1449', '384', '0,775', null, null, '1');
INSERT INTO `choice` VALUES ('1450', '384', '0', null, null, '0');
INSERT INTO `choice` VALUES ('1451', '384', '0,774', null, null, '0');
INSERT INTO `choice` VALUES ('1452', '385', '12', null, null, '0');
INSERT INTO `choice` VALUES ('1453', '385', '2', null, null, '0');
INSERT INTO `choice` VALUES ('1454', '385', '-3', null, null, '1');
INSERT INTO `choice` VALUES ('1455', '385', '3', null, null, '0');
INSERT INTO `choice` VALUES ('1456', '386', '15', null, null, '0');
INSERT INTO `choice` VALUES ('1457', '386', '-12', null, null, '0');
INSERT INTO `choice` VALUES ('1458', '386', '18', null, null, '0');
INSERT INTO `choice` VALUES ('1459', '386', '-15', null, null, '1');
INSERT INTO `choice` VALUES ('1460', '387', '21', null, null, '0');
INSERT INTO `choice` VALUES ('1461', '387', '-12', null, null, '0');
INSERT INTO `choice` VALUES ('1462', '387', '0', null, null, '1');
INSERT INTO `choice` VALUES ('1463', '387', '15', null, null, '0');
INSERT INTO `choice` VALUES ('1464', '388', '$$3n - 15$$', null, null, '0');
INSERT INTO `choice` VALUES ('1465', '388', '$$-3n - 15$$', null, null, '0');
INSERT INTO `choice` VALUES ('1466', '388', '$$-3n + 15$$', null, null, '1');
INSERT INTO `choice` VALUES ('1467', '388', '$$3n + 15$$', null, null, '0');
INSERT INTO `choice` VALUES ('1468', '389', '6', null, null, '0');
INSERT INTO `choice` VALUES ('1469', '389', '8', null, null, '1');
INSERT INTO `choice` VALUES ('1470', '389', '4', null, null, '0');
INSERT INTO `choice` VALUES ('1471', '389', '10', null, null, '0');
INSERT INTO `choice` VALUES ('1472', '390', '122,2mt', null, null, '0');
INSERT INTO `choice` VALUES ('1473', '390', '123,2mt', null, null, '0');
INSERT INTO `choice` VALUES ('1474', '390', '123,6mt', null, null, '1');
INSERT INTO `choice` VALUES ('1475', '390', '122,6mt', null, null, '0');
INSERT INTO `choice` VALUES ('1476', '391', '26  e 13', null, null, '0');
INSERT INTO `choice` VALUES ('1477', '391', '28  e  14', null, null, '1');
INSERT INTO `choice` VALUES ('1478', '391', '32  e  16', null, null, '0');
INSERT INTO `choice` VALUES ('1479', '391', '22 e 11', null, null, '0');
INSERT INTO `choice` VALUES ('1480', '392', '2000 ', null, null, '0');
INSERT INTO `choice` VALUES ('1481', '392', '200', null, null, '0');
INSERT INTO `choice` VALUES ('1482', '392', '20', null, null, '0');
INSERT INTO `choice` VALUES ('1483', '392', '20000', null, null, '1');
INSERT INTO `choice` VALUES ('1484', '393', '-12', null, null, '0');
INSERT INTO `choice` VALUES ('1485', '393', '-24', null, null, '1');
INSERT INTO `choice` VALUES ('1486', '393', '24', null, null, '0');
INSERT INTO `choice` VALUES ('1487', '393', 'Nenhuma das alternativas', null, null, '0');
INSERT INTO `choice` VALUES ('1488', '394', '-2', null, null, '1');
INSERT INTO `choice` VALUES ('1489', '394', '0', null, null, '0');
INSERT INTO `choice` VALUES ('1490', '394', '2', null, null, '0');
INSERT INTO `choice` VALUES ('1491', '394', 'Nenhuma das alternativas', null, null, '0');
INSERT INTO `choice` VALUES ('1492', '395', '$$\\frac{2}{{3\\sqrt {3x - 5} }}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1493', '395', '$$ - \\frac{5}{{3\\sqrt {3x - 5} }}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1494', '395', '$$\\frac{1}{{2\\sqrt {3x - 5} }}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1495', '395', '$$\\frac{3}{{2\\sqrt {3x - 5} }}$$', null, null, '1');
INSERT INTO `choice` VALUES ('1496', '396', '$$4{e^2}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1497', '396', '$$4{e^{ - 2x}}$$', null, null, '1');
INSERT INTO `choice` VALUES ('1498', '396', '$$ - 4{e^{ - 2x}}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1499', '396', '$$\\frac{1}{4}{e^{ - 2x}}$$', null, null, '0');
INSERT INTO `choice` VALUES ('1500', '397', '$$\\left] { - \\infty , - 2} \\right[ \\cup \\left] {2, + \\infty } \\right[$$', null, null, '0');
INSERT INTO `choice` VALUES ('1501', '397', '$$\\left] { - 2,2} \\right[$$', null, null, '0');
INSERT INTO `choice` VALUES ('1502', '397', '$$\\left] { - 1,1} \\right[$$', null, null, '1');
INSERT INTO `choice` VALUES ('1503', '397', '$$\\left] { - \\infty , - 1} \\right[ \\cup \\left] {1, + \\infty } \\right[$$', null, null, '0');
INSERT INTO `choice` VALUES ('1584', '438', 'Todas as respostas se aplicam', null, null, '0');
INSERT INTO `choice` VALUES ('1585', '438', 'Facilitar de forma a garantir que cada membro da equipe tenha a chance de falar', null, null, '0');
INSERT INTO `choice` VALUES ('1586', '438', 'Liderar as discussões na equipe de desenvolvimento', null, null, '0');
INSERT INTO `choice` VALUES ('1587', '438', 'Ensinar a Equipe de Desenvolvimento a manter o Daily Scrum dentro do prazo de 15 minutos', null, null, '1');
INSERT INTO `choice` VALUES ('1588', '438', 'Garatir se todas as 3 perguntas foram respondidas', null, null, '0');
INSERT INTO `choice` VALUES ('1589', '439', 'Quando os objectivos da Sprint tornarem-se obsoletas', null, null, '1');
INSERT INTO `choice` VALUES ('1590', '439', 'Quando o departamento de venda trazer uma oportunidade importante', null, null, '0');
INSERT INTO `choice` VALUES ('1591', '439', 'Quando a equipe de desenvolvimento sentir que o trabalho é demasiado', null, null, '0');
INSERT INTO `choice` VALUES ('1592', '420', 'Adicionar o item para o próximo Sprint', null, null, '0');
INSERT INTO `choice` VALUES ('1593', '420', 'Informar o Product Owner de modo que ele/ela possa trabalhar com CEO', null, null, '1');
INSERT INTO `choice` VALUES ('1594', '420', 'Adicionar o item para o Sprint corrente sem ajustes', null, null, '0');
INSERT INTO `choice` VALUES ('1595', '420', 'Adicionar o item para o Sprint e remover um item com estimativa similar', null, null, '0');
INSERT INTO `choice` VALUES ('1596', '421', 'Verdadeiro', null, null, '0');
INSERT INTO `choice` VALUES ('1597', '421', 'Falso', null, null, '1');
INSERT INTO `choice` VALUES ('1598', '422', '4 horas', null, null, '0');
INSERT INTO `choice` VALUES ('1599', '422', 'Mensalmente', null, null, '0');
INSERT INTO `choice` VALUES ('1600', '422', '8 horas a cada mês. Normalmente curto em Sprints curtos', null, null, '1');
INSERT INTO `choice` VALUES ('1601', '422', 'Quanto for necessário ', null, null, '0');
INSERT INTO `choice` VALUES ('1602', '423', 'Verdadeiro', null, null, '0');
INSERT INTO `choice` VALUES ('1603', '423', 'Falso', null, null, '1');
INSERT INTO `choice` VALUES ('1604', '424', 'Terminar o projecto como estimado após acordado a data e custo perante ao Product Owner', null, null, '0');
INSERT INTO `choice` VALUES ('1605', '424', 'Tornar os items do Product Backlog em incrementos com funcionalidade potencialmente usáveis', null, null, '1');
INSERT INTO `choice` VALUES ('1606', '424', 'Fazer todo trabalho de desenvolvimento, excepto testes que requeiram ferramentas e ambientes adicionais', null, null, '0');
INSERT INTO `choice` VALUES ('1608', '425', 'Sempre que membro da equipe poder acomodar mais trabalho', null, null, '0');
INSERT INTO `choice` VALUES ('1609', '425', 'Durante o Daily Scrum', null, null, '0');
INSERT INTO `choice` VALUES ('1610', '425', 'Durante o Sprint planning', null, null, '0');
INSERT INTO `choice` VALUES ('1611', '425', 'Nunca. Os items do Sprint Backlog é propriedade da equipa de desenvolvimento, mesmo em casos onde cada item estiver sendo implementado por diferentes pessoas. ', null, null, '1');
INSERT INTO `choice` VALUES ('1612', '426', 'Planejamento, Inspeção, Adaptação', null, null, '0');
INSERT INTO `choice` VALUES ('1613', '426', 'Transparência, Eliminação de Ruído, Kaizen', null, null, '0');
INSERT INTO `choice` VALUES ('1614', '426', 'Planejamento, Demostração, Retrospetiva', null, null, '0');
INSERT INTO `choice` VALUES ('1615', '426', 'Inspeção, Transparências, Adaptação', null, null, '1');
INSERT INTO `choice` VALUES ('1616', '426', 'Respeito mútuo, Kaizen,  Eliminação de Ruído', null, null, '0');
INSERT INTO `choice` VALUES ('1617', '427', 'O Sprint Backloag é totalmente formulado no Sprint Planning and não deverá mudar durante o Sprint', null, null, '1');
INSERT INTO `choice` VALUES ('1618', '427', 'A equipe de desenvolvimento deverá trabalhar com o Product Owner de modo a remover ou adicionar trabalho se perceber os items estão acima ou abaixo da sua capacidade durante o Sprint', null, null, '0');
INSERT INTO `choice` VALUES ('1619', '427', 'Durante refinamento dos itens do Product Backlog, o Spring Backlog muda e pode aumentar assim que o trabalho continuar', null, null, '0');
INSERT INTO `choice` VALUES ('1620', '427', 'O Product Owner pode ajudar a clarificar ou optimizar o Sprint quando perguntado pela edquipe de desenvolvimento', null, null, '0');
INSERT INTO `choice` VALUES ('1621', '428', 'O quanto for necessário', null, null, '0');
INSERT INTO `choice` VALUES ('1622', '428', '1 dia', null, null, '0');
INSERT INTO `choice` VALUES ('1623', '428', '2 horas', null, null, '0');
INSERT INTO `choice` VALUES ('1624', '428', '4 horas para um Sprint mensal. Normalmente curto em Sprints curtos', null, null, '1');
INSERT INTO `choice` VALUES ('1625', '428', '4 horas', null, null, '0');
INSERT INTO `choice` VALUES ('1626', '429', 'O Product Owner', null, null, '1');
INSERT INTO `choice` VALUES ('1627', '429', 'O Gestor do Projecto', null, null, '0');
INSERT INTO `choice` VALUES ('1628', '429', 'A equipa de desenvolvimento', null, null, '0');
INSERT INTO `choice` VALUES ('1629', '429', 'O Scrum Master', null, null, '0');
INSERT INTO `choice` VALUES ('1630', '430', 'Um livro prático que define melhor práticas para desenvolvimento de software', null, null, '0');
INSERT INTO `choice` VALUES ('1631', '430', 'Um processo definido e preditivo que engloba os princípios de Gestão científica', null, null, '0');
INSERT INTO `choice` VALUES ('1632', '430', 'Um framework donde produto complexo em ambientes complexos são desenvolvidos', null, null, '1');
INSERT INTO `choice` VALUES ('1633', '430', 'Uma metodologia completa que define como desenvolver um software', null, null, '0');
INSERT INTO `choice` VALUES ('1634', '431', 'Quando a duração do Sprint chega ao final', null, null, '1');
INSERT INTO `choice` VALUES ('1635', '431', 'Quando todos items do Product Backlog acalçam a “definição de feito”', null, null, '0');
INSERT INTO `choice` VALUES ('1636', '431', 'Quando todas as tarefas foram concluídas', null, null, '0');
INSERT INTO `choice` VALUES ('1637', '431', 'Quando o Product Owner dizer que está concluído', null, null, '0');
INSERT INTO `choice` VALUES ('1638', '432', ' Monitorar continuamente a quantidade dos membros da equipe de desenvolvimento', null, null, '0');
INSERT INTO `choice` VALUES ('1639', '432', 'Monitorar a produtividade da equipe de desenvolvimento', null, null, '0');
INSERT INTO `choice` VALUES ('1640', '432', 'Apoiar o Product Owner com informações possam que agregar valor no produto final. Apoiar o Scrum Master de modo a criar uma mudança de abordagem com enfoque ao empirismo, auto-organização, e entrega inteligente de software', null, null, '1');
INSERT INTO `choice` VALUES ('1641', '432', 'Identificar e remover pessoas que não estão trabalhando duro suficiente', null, null, '0');
INSERT INTO `choice` VALUES ('1642', '433', 'Próxima Segunda-Feira', null, null, '0');
INSERT INTO `choice` VALUES ('1643', '433', 'Imediatamente depois do próximo Sprint Planning', null, null, '0');
INSERT INTO `choice` VALUES ('1644', '433', 'Quando o Product Owner estiver pronto', null, null, '0');
INSERT INTO `choice` VALUES ('1645', '433', 'Imediatamente depois da conclusão do Sprint anterior', null, null, '1');
INSERT INTO `choice` VALUES ('1646', '434', 'Verdadeiro', null, null, '0');
INSERT INTO `choice` VALUES ('1647', '434', 'Falso', null, null, '1');
INSERT INTO `choice` VALUES ('1648', '435', 'O Scrum Master, O Gestor do Projecto a Equipa de desenvolvimento', null, null, '0');
INSERT INTO `choice` VALUES ('1649', '435', 'O Product Owner e Equipa de desenvolvimento', null, null, '1');
INSERT INTO `choice` VALUES ('1650', '435', 'O Product Owner e todos Stakeholder', null, null, '0');
INSERT INTO `choice` VALUES ('1651', '435', 'A Equipe de desenvolvimento', null, null, '0');
INSERT INTO `choice` VALUES ('1652', '436', 'Se não tiver um vocabulário, poucas mudanças irão acontecer', null, null, '0');
INSERT INTO `choice` VALUES ('1653', '436', 'A organização não vai entender que mudanças aconteceram após adopção do Scrum e o benefício de ter adaptado o Scrum não será evidente', null, null, '0');
INSERT INTO `choice` VALUES ('1654', '436', 'A gestão vai se sentir menos ansiosa', null, null, '0');
INSERT INTO `choice` VALUES ('1655', '436', 'Todas as respostas são aplicáveis ', null, null, '1');
INSERT INTO `choice` VALUES ('1656', '437', 'A Equipe de Desenvolvimento', null, null, '1');
INSERT INTO `choice` VALUES ('1657', '437', 'O Scrum Master', null, null, '0');
INSERT INTO `choice` VALUES ('1658', '437', 'O Product Owner', null, null, '0');
INSERT INTO `choice` VALUES ('1659', '437', 'O membro Junior da equipe de desenvolvimento ', null, null, '0');
INSERT INTO `choice` VALUES ('1660', '418', 'Empírico', null, null, '1');
INSERT INTO `choice` VALUES ('1661', '418', 'Hibrido', null, null, '0');
INSERT INTO `choice` VALUES ('1662', '418', 'Definido', null, null, '0');
INSERT INTO `choice` VALUES ('1663', '418', 'Complexo', null, null, '0');
INSERT INTO `choice` VALUES ('1664', '419', 'Cada equipe de desenvolvimento define e usa seus próprios. As diferenças são discutidas e reconciliadas durante um Sprint mais rígido.', null, null, '0');
INSERT INTO `choice` VALUES ('1665', '419', 'Cada equipe de desenvolvimento usa sua própria, mas deve tornar sua definição clara para todas as outras equipes, para que as diferenças sejam conhecidas.', null, null, '0');
INSERT INTO `choice` VALUES ('1666', '419', 'Todas as equipes de desenvolvimento devem ter uma definição de \"feito\" que torne seu trabalho combinado potencialmente entregável.', null, null, '1');
INSERT INTO `choice` VALUES ('1667', '419', 'Depende', null, null, '0');

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
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `intitution` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `period` (`period`),
  KEY `intitution` (`intitution`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`period`) REFERENCES `period` (`id`),
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`intitution`) REFERENCES `university` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'Licenciatura em Contabilidade Fiscalidade e Auditoria', '1', '33');
INSERT INTO `course` VALUES ('2', 'Licenciatura em Contabilidade Fiscalidade e Auditoria', '2', '33');
INSERT INTO `course` VALUES ('3', 'Economia', '1', '33');
INSERT INTO `course` VALUES ('4', 'Economia', '2', '33');
INSERT INTO `course` VALUES ('5', 'Gestão Empresarial', '1', '33');
INSERT INTO `course` VALUES ('6', 'Gestão Empresarial', '2', '33');
INSERT INTO `course` VALUES ('7', 'Laboratório de Engenharia de Software', '1', '33');

-- ----------------------------
-- Table structure for `course_exam`
-- ----------------------------
DROP TABLE IF EXISTS `course_exam`;
CREATE TABLE `course_exam` (
  `course_id` int(11) NOT NULL DEFAULT '0',
  `exam_id` int(11) NOT NULL DEFAULT '0',
  `year` int(11) NOT NULL,
  PRIMARY KEY (`course_id`,`exam_id`,`year`),
  KEY `course_exam_ibfk_2` (`exam_id`),
  CONSTRAINT `course_exam_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `course_exam_ibfk_2` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_exam
-- ----------------------------
INSERT INTO `course_exam` VALUES ('1', '119', '2020');
INSERT INTO `course_exam` VALUES ('7', '119', '2020');

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
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=latin1;

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
INSERT INTO `district` VALUES ('142', '6', 'Bárue');
INSERT INTO `district` VALUES ('143', '6', 'Chimoio');
INSERT INTO `district` VALUES ('144', '6', 'Gondola');
INSERT INTO `district` VALUES ('145', '6', 'Guro');
INSERT INTO `district` VALUES ('146', '6', 'Macate');
INSERT INTO `district` VALUES ('147', '6', 'Machaze');
INSERT INTO `district` VALUES ('148', '6', 'Macossa');
INSERT INTO `district` VALUES ('149', '6', 'Manica');
INSERT INTO `district` VALUES ('150', '6', 'Mossurize');
INSERT INTO `district` VALUES ('151', '6', 'Sussundenga');
INSERT INTO `district` VALUES ('152', '6', 'Tambara');
INSERT INTO `district` VALUES ('153', '6', 'Vanduzi');
INSERT INTO `district` VALUES ('154', '7', 'Beira');
INSERT INTO `district` VALUES ('155', '7', 'Búzi');
INSERT INTO `district` VALUES ('156', '7', 'Chemba');
INSERT INTO `district` VALUES ('157', '7', 'Cheringoma');
INSERT INTO `district` VALUES ('158', '7', 'Chibabava');
INSERT INTO `district` VALUES ('159', '7', 'Dondo');
INSERT INTO `district` VALUES ('160', '7', 'Gorongosa');
INSERT INTO `district` VALUES ('161', '7', 'Machanga');
INSERT INTO `district` VALUES ('162', '7', 'Maringué');
INSERT INTO `district` VALUES ('163', '7', 'Marromeu');
INSERT INTO `district` VALUES ('164', '7', 'Muanza');
INSERT INTO `district` VALUES ('165', '7', 'Nhamatanda');
INSERT INTO `district` VALUES ('166', '11', 'Maputo Cidade');

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
  `exam_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `exam_ibfk_2` (`university`),
  CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `exam_ibfk_2` FOREIGN KEY (`university`) REFERENCES `university` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES ('2', '2', '2005', 'Exame de Matemática', '10', '3', null, 'https://drive.google.com/open?id=0B-dOo9jrft_6ZHcwZXNGa0xxblk', null, '2', '1', null);
INSERT INTO `exam` VALUES ('12', '52', '2007', 'Exame de Frances', '30', '3', null, null, null, '12', '0', null);
INSERT INTO `exam` VALUES ('22', '32', '2005', 'Exame de Geografia', '10', '3', null, 'https://drive.google.com/open?id=0B-dOo9jrft_6Z0Jmd3JlU3FCT3M', null, '22', '0', null);
INSERT INTO `exam` VALUES ('32', '82', '2013', 'Exame de Filosofia', '10', '3', null, null, null, '2', '0', null);
INSERT INTO `exam` VALUES ('52', '92', '2005', 'Exame de Biologia', '10', '3', null, 'https://drive.google.com/open?id=0B-dOo9jrft_6cTVNMHNESGNUMEk', null, '2', '0', null);
INSERT INTO `exam` VALUES ('62', '12', '2005', 'Exame de Fisica', '10', '3', null, 'https://drive.google.com/open?id=0B-dOo9jrft_6eDVLRkRrcUFwLVE', null, '2', '0', null);
INSERT INTO `exam` VALUES ('72', '22', '2005', 'Exame de Química', '10', '3', null, 'https://drive.google.com/open?id=0B-dOo9jrft_6OGVvdFhYZ0hvcUE', null, '2', '0', null);
INSERT INTO `exam` VALUES ('92', '62', '2005', 'Exame de Ingles', '10', '3', null, 'https://drive.google.com/open?id=0B-dOo9jrft_6UmloVHozRWFodHM', null, '2', '0', null);
INSERT INTO `exam` VALUES ('112', '102', '2005', 'Exame de Portugues', '10', '3', null, 'https://drive.google.com/open?id=0B-dOo9jrft_6SklCWXdZQkFNQWc', null, '2', '0', null);
INSERT INTO `exam` VALUES ('115', '102', '2020', 'Exame de Português  (Variante A)', '3600', '20', null, null, null, '33', '1', '2020-02-11 09:00:00');
INSERT INTO `exam` VALUES ('116', '62', '2020', 'Exame de Inglês (Variante A)', '3600', '20', null, null, null, '33', '1', '2020-02-11 11:00:00');
INSERT INTO `exam` VALUES ('117', '2', '2020', 'Exame de Matemática (Variante A)', '3600', '20', null, null, null, '33', '1', '2020-02-11 13:00:00');
INSERT INTO `exam` VALUES ('118', '2', '2020', 'Exame de Matemática (Variante B)', '3600', '20', null, null, null, '2', '1', null);
INSERT INTO `exam` VALUES ('119', '103', '2020', 'Scrum', '3600', '20', null, null, null, '33', '1', null);

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
INSERT INTO `exam_attempts` VALUES ('2', '236', '2020-04-14 10:59:01', '2020-04-14 10:58:50', '33');
INSERT INTO `exam_attempts` VALUES ('115', '236', '2020-04-14 10:59:19', '2020-04-14 10:59:15', '0');
INSERT INTO `exam_attempts` VALUES ('117', '236', '2020-04-09 13:51:26', '2020-04-09 13:50:56', '5');

-- ----------------------------
-- Table structure for `gender`
-- ----------------------------
DROP TABLE IF EXISTS `gender`;
CREATE TABLE `gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gender
-- ----------------------------
INSERT INTO `gender` VALUES ('1', 'Masculino');
INSERT INTO `gender` VALUES ('2', 'Femenino');

-- ----------------------------
-- Table structure for `marital_status`
-- ----------------------------
DROP TABLE IF EXISTS `marital_status`;
CREATE TABLE `marital_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of marital_status
-- ----------------------------
INSERT INTO `marital_status` VALUES ('1', 'Solteiro');
INSERT INTO `marital_status` VALUES ('2', 'Casado');

-- ----------------------------
-- Table structure for `period`
-- ----------------------------
DROP TABLE IF EXISTS `period`;
CREATE TABLE `period` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of period
-- ----------------------------
INSERT INTO `period` VALUES ('1', 'Diúrno');
INSERT INTO `period` VALUES ('2', 'Nocturno');

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
  `tag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qtype` (`qtype`),
  KEY `createdby` (`createdby`),
  KEY `modifiedby` (`modifiedby`),
  KEY `exam` (`exam`),
  KEY `tag` (`tag`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`qtype`) REFERENCES `qtype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `question_ibfk_2` FOREIGN KEY (`createdby`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `question_ibfk_3` FOREIGN KEY (`modifiedby`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `question_ibfk_4` FOREIGN KEY (`exam`) REFERENCES `exam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `question_ibfk_5` FOREIGN KEY (`tag`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=440 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('2', '2', 'Escreva sob forma de percentagem a razÃ£o: $${7 \\over {15}}$$', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('12', '2', 'Qual Ã¨ o valor de $${(16)^{ - 1.75}}$$', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('22', '2', '$$\\sqrt {{{(2 - \\sqrt 5 )}^2}} $$ Ã© igual a:', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('32', '12', 'Choisissez la phrase qui rÃ©sume le mieux le contenu du texte', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('42', '12', 'Le problÃ¨me de la place de la femme dans la sociÃ©tÃ© existe depuis', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('52', '12', 'La complÃ©mentaritÃ© homme femme fait la force ', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('62', '22', 'A primeira viagem Ã  volta do mundo foi feita por:', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('72', '22', 'Quem afirmou que â€œO homem Ã© um ser activo na natureza, sendo capaz de\r\nadaptÃ¡-la Ã s suas necessidades. O homem modifica o meioâ€ foi:', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('82', '22', 'Quanto a sua localizaÃ§Ã£o cÃ³smica MoÃ§ambique situa-se', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('92', '32', 'Para Karl Jaspers, filosofar Ã©:', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('102', '32', 'A definiÃ§Ã£o da Filosofia Ã© jÃ¡ um problema filosÃ³fico porque:', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('112', '32', 'A utilidade da Filosofia Ã©:', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('152', '52', 'Uma das propriedades da membrana plasmÃ¡tica Ã© o controle de entrada e saÃ­da de substÃ¢ncias na cÃ©lula.Sobre os mecanismos desse transporte Ã© correcto afirmar:', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('162', '52', 'Quando se usa o microscÃ³pio, Ã© importante saber quanto o instrumento amplia a imagem observada. Se, por exemplo se observar uma cÃ©lula com uma ocular de10 e uma objectiva de 40, a ampliaÃ§Ã£o da imagem obtida serÃ¡ de :', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('172', '52', 'Se submetermos uma molÃ©cula de proteina a hidrÃ³lise o produto obtido serÃ¡:', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('182', '62', 'A relaÃ§Ã£o entre os vectores (v) e aceleraÃ§Ã£o (a) de um movimento circular uniforme Ã© graficamente representado por:', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('192', '62', 'Um corpo parte do repouso e percorre em queda livre 10m no Ãºltimo segundo. Desprezando a restencia do ar, a altura a que se encontra o corpo Ã© igual a:', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('202', '62', 'Um automÃ³vel fez um percurso rectilÃ­neo com velocidade escalar mÃ©dia negativa. Podemos afirmar que:', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('212', '72', 'A associaÃ§Ã£o correcta modelo/cientista Ã©:', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('222', '72', 'Entre as alternativas abaixo, a correcta Ã©:', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('232', '72', 'O isÃ³topo de 40K 19 transforma-se no isÃ³topo de 40Ca 20. Qual Ã© tipo de desintegraÃ§Ã£o radioactiva que se dÃ¡:', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('252', '92', ' Which biblical principle is the writer referring to in the first paragraph:', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('262', '92', 'According to the writer, victims of AIDS can be found', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('272', '92', 'In the notorious and infamous area of Jozi', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('292', '112', 'Segundo o texto, a Ilha de MoÃ§ambique Ã© importante porque:', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('302', '112', 'De acordo com o texto, a Ilha de MoÃ§ambique foi visitada por:', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('312', '112', 'A visita de alguns escritores Ã  Ilha deve-se:', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('318', '115', 'A opção que melhor completa a frase “O efeito do casamento prematuro nas raparigas é nefasto, na medida em que”', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null, null);
INSERT INTO `question` VALUES ('319', '115', 'Segundo o texto, a decisão de as raparigas se casarem é geralmente tomada…', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null, null);
INSERT INTO `question` VALUES ('320', '115', 'De acordo com o texto, a informação acerca da decisão sobre o futuro das raparigas é tomada por si mesmas encontra-se no…', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null, null);
INSERT INTO `question` VALUES ('321', '115', 'Qual das alternativas apresenta as causas da alta taxa de prevalência dos casamentos prematuros?', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null, null);
INSERT INTO `question` VALUES ('322', '115', 'A informação antecedida pela expressão “Por outro lado” junta-se a que ocorre na alternativa…', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null, null);
INSERT INTO `question` VALUES ('323', '115', 'Que alternativa justifica adequadamente a utilização da expressão “no entanto” no enunciado “Há, no entanto, evidências de que as raparigas e os pais tomam certas escolhas”?', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null, null);
INSERT INTO `question` VALUES ('324', '115', 'Em Moçambique, a prática tradicional que pode afectar precoce e negativamente a vida tanto das raparigas quanto dos rapazes é:', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null, null);
INSERT INTO `question` VALUES ('325', '115', 'Tendo em consideração o texto, qual das opções justifica melhor a frase “Os casamentos prematuros são uma das piores violações dos direitos humanos e da criança”?', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null, null);
INSERT INTO `question` VALUES ('326', '115', 'Um dos efeitos do casamento prematuro nas raparigas incide sobre a educação e saúde. A opção que melhor sustenta esta afirmação é:', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null, null);
INSERT INTO `question` VALUES ('327', '115', 'Segundo o texto, o que origina os casos alarmantes de fístula obstétrica nas raparigas?', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null, null);
INSERT INTO `question` VALUES ('328', '115', 'O provável impacto para as raparigas que se sujeitam ao casamento prematuro é detalhadamente apresentado no:', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null, null);
INSERT INTO `question` VALUES ('329', '115', 'Conforme a informação textual, o que leva as raparigas à discriminação e ao desprezo familiar e da sociedade?', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null, null);
INSERT INTO `question` VALUES ('330', '115', 'O título que melhor reflecte o conteúdo do texto é:', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null, null);
INSERT INTO `question` VALUES ('331', '115', 'Escolha a opção que corresponde ao discurso indirecto da frase “O casamento prematuro prejudica a rapariga”.', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('332', '115', 'A frase gramaticalmente correcta é:', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('333', '115', 'Assinale a opção que apresenta as palavras adequadas para completar as frases “Eu sinto __________ por ti” e “O ________ apropriado para o Papa se sentar comodamente é este”, respectivamente.', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('334', '115', 'As palavras gramaticalmente escritas ocorrem em:', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('335', '115', 'Os nomes que significam o conjunto de peixes e ilhas encontram-se, respectivamente, na alternativa….', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('336', '115', 'Qual das alternativas completa correctamente a frase “Se _______ o teu irmão, peço que me digas”?', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('337', '115', 'A alternativa que evita a repetição do verbo sublinhado na frase “O casamento prematuro tem uma forte ligação com a incidência da pobreza e tem um impacto negativo na produtividade nacional” é:', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('338', '116', 'The text is describing the importance of________________.', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><strong>Text:</strong></p>\r\n<p style=\"text-align: justify;\">Text message advertising is an easy way for businesses to connect with customers about sales, special promotions, or important news. It is a great way for businesses to connect with consumers about deals, promotions, upcoming events, and other offers and opportunities. It&rsquo;s also an underutilized platform of communication with lots of potential and excellent results. You may have heard of text message advertising referred to as SMS advertising. They&rsquo;re the same exact thing. SMS stands for &ldquo;Short Message Service,&rdquo; which is an industry term for a text message. According to statistical data from Innovista Law&rsquo;s April 2018 TCPA Survival Guide, 99% of text messages are opened, 90% are read within 3 minutes and 40% get a response within 15 minutes. It is believed that &nbsp;compared with email&rsquo;s 20% open rate and much lower response rates, text message advertising is one of the marketing methods that businesses should utilize for connecting with their customers and being top of mind.</p>\r\n<p style=\"text-align: justify;\">For text message advertising route, the SMS examples below should give you an idea about the direction you should take:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">VIP Pizza-20% off large pizza pie Thursday only! http://vippizza-url.here</li>\r\n<li style=\"text-align: justify;\">Invitation: Business Management Summit on Friday 01/11/2019 at 8:30AM, Grand Plaza-Nampula. Special speaker Dr. Mitha &ndash; Chairman and CEO. Open enrollment.</li>\r\n<li style=\"text-align: justify;\">Recharge with 20mts and get more talking time, just text 84211 and enjoy free talk-time every Monday.</li>\r\n</ul>', null, null);
INSERT INTO `question` VALUES ('339', '116', 'What is meant by the phrase “to connect with?”', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><strong>Text:</strong></p>\r\n<p style=\"text-align: justify;\">Text message advertising is an easy way for businesses to connect with customers about sales, special promotions, or important news. It is a great way for businesses to connect with consumers about deals, promotions, upcoming events, and other offers and opportunities. It&rsquo;s also an underutilized platform of communication with lots of potential and excellent results. You may have heard of text message advertising referred to as SMS advertising. They&rsquo;re the same exact thing. SMS stands for &ldquo;Short Message Service,&rdquo; which is an industry term for a text message. According to statistical data from Innovista Law&rsquo;s April 2018 TCPA Survival Guide, 99% of text messages are opened, 90% are read within 3 minutes and 40% get a response within 15 minutes. It is believed that &nbsp;compared with email&rsquo;s 20% open rate and much lower response rates, text message advertising is one of the marketing methods that businesses should utilize for connecting with their customers and being top of mind.</p>\r\n<p style=\"text-align: justify;\">For text message advertising route, the SMS examples below should give you an idea about the direction you should take:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">VIP Pizza-20% off large pizza pie Thursday only! http://vippizza-url.here</li>\r\n<li style=\"text-align: justify;\">Invitation: Business Management Summit on Friday 01/11/2019 at 8:30AM, Grand Plaza-Nampula. Special speaker Dr. Mitha &ndash; Chairman and CEO. Open enrollment.</li>\r\n<li style=\"text-align: justify;\">Recharge with 20mts and get more talking time, just text 84211 and enjoy free talk-time every Monday.</li>\r\n</ul>', null, null);
INSERT INTO `question` VALUES ('340', '116', 'Short Message Service  can be abbreviated as ____________________ ', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><strong>Text:</strong></p>\r\n<p style=\"text-align: justify;\">Text message advertising is an easy way for businesses to connect with customers about sales, special promotions, or important news. It is a great way for businesses to connect with consumers about deals, promotions, upcoming events, and other offers and opportunities. It&rsquo;s also an underutilized platform of communication with lots of potential and excellent results. You may have heard of text message advertising referred to as SMS advertising. They&rsquo;re the same exact thing. SMS stands for &ldquo;Short Message Service,&rdquo; which is an industry term for a text message. According to statistical data from Innovista Law&rsquo;s April 2018 TCPA Survival Guide, 99% of text messages are opened, 90% are read within 3 minutes and 40% get a response within 15 minutes. It is believed that &nbsp;compared with email&rsquo;s 20% open rate and much lower response rates, text message advertising is one of the marketing methods that businesses should utilize for connecting with their customers and being top of mind.</p>\r\n<p style=\"text-align: justify;\">For text message advertising route, the SMS examples below should give you an idea about the direction you should take:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">VIP Pizza-20% off large pizza pie Thursday only! http://vippizza-url.here</li>\r\n<li style=\"text-align: justify;\">Invitation: Business Management Summit on Friday 01/11/2019 at 8:30AM, Grand Plaza-Nampula. Special speaker Dr. Mitha &ndash; Chairman and CEO. Open enrollment.</li>\r\n<li style=\"text-align: justify;\">Recharge with 20mts and get more talking time, just text 84211 and enjoy free talk-time every Monday.</li>\r\n</ul>', null, null);
INSERT INTO `question` VALUES ('341', '116', 'Statistical data from Innovista Law’s April 2018 TCPA Survival Guide show that ___________ are opened.', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><strong>Text:</strong></p>\r\n<p style=\"text-align: justify;\">Text message advertising is an easy way for businesses to connect with customers about sales, special promotions, or important news. It is a great way for businesses to connect with consumers about deals, promotions, upcoming events, and other offers and opportunities. It&rsquo;s also an underutilized platform of communication with lots of potential and excellent results. You may have heard of text message advertising referred to as SMS advertising. They&rsquo;re the same exact thing. SMS stands for &ldquo;Short Message Service,&rdquo; which is an industry term for a text message. According to statistical data from Innovista Law&rsquo;s April 2018 TCPA Survival Guide, 99% of text messages are opened, 90% are read within 3 minutes and 40% get a response within 15 minutes. It is believed that &nbsp;compared with email&rsquo;s 20% open rate and much lower response rates, text message advertising is one of the marketing methods that businesses should utilize for connecting with their customers and being top of mind.</p>\r\n<p style=\"text-align: justify;\">For text message advertising route, the SMS examples below should give you an idea about the direction you should take:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">VIP Pizza-20% off large pizza pie Thursday only! http://vippizza-url.here</li>\r\n<li style=\"text-align: justify;\">Invitation: Business Management Summit on Friday 01/11/2019 at 8:30AM, Grand Plaza-Nampula. Special speaker Dr. Mitha &ndash; Chairman and CEO. Open enrollment.</li>\r\n<li style=\"text-align: justify;\">Recharge with 20mts and get more talking time, just text 84211 and enjoy free talk-time every Monday.</li>\r\n</ul>', null, null);
INSERT INTO `question` VALUES ('342', '116', '“Use” can mean the same as ___________ in the text.', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><strong>Text:</strong></p>\r\n<p style=\"text-align: justify;\">Text message advertising is an easy way for businesses to connect with customers about sales, special promotions, or important news. It is a great way for businesses to connect with consumers about deals, promotions, upcoming events, and other offers and opportunities. It&rsquo;s also an underutilized platform of communication with lots of potential and excellent results. You may have heard of text message advertising referred to as SMS advertising. They&rsquo;re the same exact thing. SMS stands for &ldquo;Short Message Service,&rdquo; which is an industry term for a text message. According to statistical data from Innovista Law&rsquo;s April 2018 TCPA Survival Guide, 99% of text messages are opened, 90% are read within 3 minutes and 40% get a response within 15 minutes. It is believed that &nbsp;compared with email&rsquo;s 20% open rate and much lower response rates, text message advertising is one of the marketing methods that businesses should utilize for connecting with their customers and being top of mind.</p>\r\n<p style=\"text-align: justify;\">For text message advertising route, the SMS examples below should give you an idea about the direction you should take:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">VIP Pizza-20% off large pizza pie Thursday only! http://vippizza-url.here</li>\r\n<li style=\"text-align: justify;\">Invitation: Business Management Summit on Friday 01/11/2019 at 8:30AM, Grand Plaza-Nampula. Special speaker Dr. Mitha &ndash; Chairman and CEO. Open enrollment.</li>\r\n<li style=\"text-align: justify;\">Recharge with 20mts and get more talking time, just text 84211 and enjoy free talk-time every Monday.</li>\r\n</ul>', null, null);
INSERT INTO `question` VALUES ('343', '116', 'The phrase “open enrollment” means...', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><strong>Text:</strong></p>\r\n<p style=\"text-align: justify;\">Text message advertising is an easy way for businesses to connect with customers about sales, special promotions, or important news. It is a great way for businesses to connect with consumers about deals, promotions, upcoming events, and other offers and opportunities. It&rsquo;s also an underutilized platform of communication with lots of potential and excellent results. You may have heard of text message advertising referred to as SMS advertising. They&rsquo;re the same exact thing. SMS stands for &ldquo;Short Message Service,&rdquo; which is an industry term for a text message. According to statistical data from Innovista Law&rsquo;s April 2018 TCPA Survival Guide, 99% of text messages are opened, 90% are read within 3 minutes and 40% get a response within 15 minutes. It is believed that &nbsp;compared with email&rsquo;s 20% open rate and much lower response rates, text message advertising is one of the marketing methods that businesses should utilize for connecting with their customers and being top of mind.</p>\r\n<p style=\"text-align: justify;\">For text message advertising route, the SMS examples below should give you an idea about the direction you should take:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">VIP Pizza-20% off large pizza pie Thursday only! http://vippizza-url.here</li>\r\n<li style=\"text-align: justify;\">Invitation: Business Management Summit on Friday 01/11/2019 at 8:30AM, Grand Plaza-Nampula. Special speaker Dr. Mitha &ndash; Chairman and CEO. Open enrollment.</li>\r\n<li style=\"text-align: justify;\">Recharge with 20mts and get more talking time, just text 84211 and enjoy free talk-time every Monday.</li>\r\n</ul>', null, null);
INSERT INTO `question` VALUES ('344', '116', 'On which day of the week is the Summit on Business Management? ', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><strong>Text:</strong></p>\r\n<p style=\"text-align: justify;\">Text message advertising is an easy way for businesses to connect with customers about sales, special promotions, or important news. It is a great way for businesses to connect with consumers about deals, promotions, upcoming events, and other offers and opportunities. It&rsquo;s also an underutilized platform of communication with lots of potential and excellent results. You may have heard of text message advertising referred to as SMS advertising. They&rsquo;re the same exact thing. SMS stands for &ldquo;Short Message Service,&rdquo; which is an industry term for a text message. According to statistical data from Innovista Law&rsquo;s April 2018 TCPA Survival Guide, 99% of text messages are opened, 90% are read within 3 minutes and 40% get a response within 15 minutes. It is believed that &nbsp;compared with email&rsquo;s 20% open rate and much lower response rates, text message advertising is one of the marketing methods that businesses should utilize for connecting with their customers and being top of mind.</p>\r\n<p style=\"text-align: justify;\">For text message advertising route, the SMS examples below should give you an idea about the direction you should take:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">VIP Pizza-20% off large pizza pie Thursday only! http://vippizza-url.here</li>\r\n<li style=\"text-align: justify;\">Invitation: Business Management Summit on Friday 01/11/2019 at 8:30AM, Grand Plaza-Nampula. Special speaker Dr. Mitha &ndash; Chairman and CEO. Open enrollment.</li>\r\n<li style=\"text-align: justify;\">Recharge with 20mts and get more talking time, just text 84211 and enjoy free talk-time every Monday.</li>\r\n</ul>', null, null);
INSERT INTO `question` VALUES ('345', '116', 'Choose the correct option on the following Grammar questions. What __________________ that? ', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('346', '116', 'Choose the correct option on the following Grammar questions. __________________ you Portuguese?   ', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('347', '116', 'Choose the correct option on the following Grammar questions. Maria  ____________ her books on the table now. ', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('348', '116', 'Choose the correct option on the following Grammar questions. We are ____________ for our examination this week.  ', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('349', '116', 'Choose the correct option on the following Grammar questions. They ___________ in the pool at Quinta Churrasco at the moment.', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('350', '116', 'Choose the correct option on the following Grammar questions. His name ____________________ Roberto', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('351', '116', 'Choose the correct option on the following Grammar questions. Where ____________________ she from?', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('352', '116', 'Choose the correct option on the following Grammar questions.  I always keep my money ________ my bag.  ', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('353', '116', 'Choose the correct option on the following Grammar questions. The dog is sleeping _______ the carpet.  ', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('354', '116', 'Choose the correct option on the following Grammar questions. My address ______________________ 90 Central Street, London.', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('355', '116', 'Choose the correct option on the following Grammar questions. This house is quite old, it _______________ in 1960.', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('356', '116', 'Choose the correct option on the following Grammar questions. This is ______ excellent business proposal you have written.', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('357', '116', 'Choose the correct option on the following Grammar questions. I _________________ her in the library yesterday. ', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('358', '117', 'O grau do polinómio da expressão a seguir é: $$3{x^5} - 7{x^3} - {x^2} + 8$$', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('359', '117', 'O resto da divisão dos polinómios a seguir é: $$3{x^4} - {x^2} - 2\\;$$', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('360', '117', 'O conjunto solução da equação a seguir é $${x^3} + {x^2} - 6x = 0\\;$$ ', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('361', '117', 'O conjunto solução do sistema abaixo é: $$\\left\\{ {\\begin{array}{*{20}{c}}{3x + y = 5}\\\\{2x - 5y = 9}\\end{array}} \\right.$$', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('362', '117', 'Das expressões algébricas seguintes, indique a que é racional inteira.', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('363', '117', 'Sendo dados os polinómios $$A\\left( x \\right) = {x^4} - 5{x^3} + 10x - 2$$ e $$\\;B\\left( x \\right) = 2{x^4} - 5{x^3} + 10{x^2} + 8$$ Então $$B - 2A$$ será igual a: ', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('364', '117', 'Dado o polinómio $$P\\left( x \\right) = 2{x^3} - 5{x^2} - x + 5$$  $$P\\left( 2 \\right)$$ é igual:', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('365', '117', 'O domínio da seguinte expressão abaixo é: $$\\frac{{3{x^5} + 1}}{{{x^3} - 4{x^2} - 5x}}$$', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('366', '117', 'Uma das soluções da equação abaixo é: $$\\left| {x - 3} \\right| = 1$$', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('367', '117', 'A solução da inequação abaixo é: $$\\left| {x + 2} \\right| < 5$$', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('368', '117', 'O número abaixo é: $$\\frac{{6! - 4!}}{{4!}}$$', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('369', '117', 'A solução da equação abaixo é: $$C_2^n = 78$$', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('370', '117', 'Pretende-se escolher três alunos entre cinco candidatos, para formar uma comissão desportiva da escola, sem tarefas diferenciadas. De quantas maneiras diferentes é possível fazer a relação?', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('371', '117', 'É lançado um dado perfeito com as faces enumeradas de1 a 6. Qual é a probabilidade de se obter um número não inferior a 3.', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('372', '117', 'O limite da sucessão abaixo é igual: $$\\begin{array}{*{20}{c}}{\\lim }\\\\{{\\rm{n}} \\to \\infty }\\end{array}{\\left( {\\frac{{2n +3}}{{2n - 1}}} \\right)^{\\frac{{3n}}{2}}}$$', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('373', '117', 'Sendo $${a_4} = 14\\;e\\;{a_{16}} = 62$$ termos de uma progressão aritmética, então os valores do primeiro termo (a1) e a razão (d) são respectivamente:', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('374', '117', 'O limite abaixo é igual a: $$\\begin{array}{*{20}{c}}{lim}\\\\{x \\to 3\\;}\\end{array}\\frac{{{x^2} - 9}}{{{x^2} - 5x + 6}}$$', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('375', '117', 'A derivada da função abaixo é: $$f\\left( x \\right) = \\sqrt {3x - 5} $$', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('376', '117', 'A segunda derivada da função abaixo é: $$h\\left( x \\right) = {e^{ - 2x}}$$', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('377', '117', 'Os valores de x para os quais a função abaixo é decrescente são:', '/images/qa/117_377.png', null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('378', '118', 'A que frações correspondem as percentagens 4%, 24% respetivamente', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('379', '118', 'A que percentagem correspondem as fracções a seguir, respectivamente: $$\\frac{3}{{10}},\\;\\frac{4}{5},\\frac{1}{2},\\;\\frac{1}{4},\\frac{7}{{20}}$$', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('380', '118', 'Qual é a medida de lado de uma sala quadrangular cujo perímetro mede 262,8dm', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('381', '118', 'Qual é o valor numérico da expressão $$\\left( {\\frac{5}{2} - \\frac{4}{2}x\\frac{4}{3}} \\right) + 1x\\frac{5}{6}$$', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('382', '118', 'Qual é a solução da expressão $$ - 3\\sqrt 8 \\; + \\sqrt {32} $$', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('383', '118', 'Qual é o algarismo que pode substituir a letra s de modo que o número 4788s seja divisível simultaneamente por 5, 6, 9, 10 e 15', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('384', '118', 'O produto de dois números é 0,155, sabendo que um deles é 0,2. Qual é o outro número.', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('385', '118', 'Dada a progressão aritmética 12,9,6,3,0,-3,-6,…. A razão desta progressão é,', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('386', '118', 'O decimo termo da progressão do numero anterior é.', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('387', '118', 'A soma dos 9 primeiros termos da progressão do numero 8  é.', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('388', '118', 'O termo geral da progressão do numero 8 é.', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('389', '118', 'A peça de um pano que o caixa mediu tinha 25,6m. Para quantos vestidos dará se cada vestido necessitar de 3,2m?', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('390', '118', 'Custando cada metro 38,5mt, por quanto ficará o pano de cada vestido?', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('391', '118', 'Um dado rectângulo tem 84cm de perímetro. Sabendo que o comprimento tem o dobro da largura. O comprimento e a largura são:', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('392', '118', 'Dividiu-se por seis herdeiros uma propriedade de forma rectangular que tinha 400m de comprimento e 300m de largura. Qual foi a área locado a cada herdeiro.', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('393', '118', 'Indique o quarto termo da progressão geométrica em que: $${a_1} = \\; - 3\\;e\\;q = 2.$$', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('394', '118', 'Indique o valor do $$\\mathop {{\\rm{lim}}}\\limits_{x \\to 0} \\frac{{{e^x} - {e^{5x}}}}{{2x}}$$', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('395', '118', 'A derivada da função abaixo é: $$f\\left( x \\right) = \\sqrt {3x - 5} $$', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('396', '118', 'A segunda derivada da função abaixo  é: $$h\\left( x \\right) = {e^{ - 2x}}$$', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('397', '118', 'Os valores de x para os quais a função abaixo é decrescente são:', '/images/qa/118_397.png', null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('418', '119', 'Em qual tipo de controlo de processo o scrum é baseado?', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('419', '119', 'Quando diferentes equipes de desenvolvimento estão a trabalhar num único producto, qual seria a melhor descrição de definição de \"feito\"', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('420', '119', 'O CEO pede a equipe de desenvolvimento adicionar um item “Muito Importante” na Sprint em progresso. O que a equipe de desenvolvimento deve fazer? ', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('421', '119', 'É obrigatório que um incremento do produto seja laçado para produção no final de cada Sprint', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('422', '119', 'Qual é a duração da reunião Spring Planning?', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('423', '119', 'A equipe de desenvolvimento deve selecionar e colocar no Product Backlog pelo menos um dos processos de melhorias identificados na reunião de Retrospectiva ', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('424', '119', 'A Equipe de desenvolvimento deve possuir todas competências para :', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('425', '119', 'Quando é quem um membro da equipe de desenvolvimento se apropria de um dos items do Sprint Backlog?', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('426', '119', 'Os três pilares do processo de controlo empírico são:', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('427', '119', 'A Equipe de desenvolvimento não deve ser interrompida durante o Sprint. O Sprint deve manter o objectivo intacto. Estas são as condições para alavancar criatividade, qualidade e produtividade.', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('428', '119', 'Quais das seguintes afirmações', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('429', '119', 'Quem deve entender melhor o pregresso em relação perspectiva do negócio, e conseguir explicar de forma clara', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('430', '119', 'Quais das seguintes afirmações melhor descreve o Scrum', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('431', '119', 'Quando é que o Sprint termina', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('432', '119', 'Qual é a tarefa da gestão em uma empresa que adopta o Scrum?', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('433', '119', 'Quando é que o próximo Sprint começa', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('434', '119', 'Quando equipes múltiplas estiverem a trabalhar no mesmo produto, cada equipa deve gerir Product Backlog separados', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('435', '119', 'Durante o Sprint a equipe de desenvolvimento determina que não vai conseguir terminar todas tarefas atribuídas. Quem deve estar presente na revisão e ajuste das tarefas selecionadas para o Sprint?', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('436', '119', 'Uma organização decidiu adpotar o Scrum, mas a gestão quer mudar os nomes e terminologia de modo a se enquadrar as terminologias actualmente em uso. Quais serão as consequências?', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('437', '119', 'De quem é a responsabilidade de gerir o progresso do trabalho durante um Sprint', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('438', '119', 'Quais dos seguintes serviços são adequados para um Scrum Master em relação ao Daily Scrum?', null, null, '2', null, null, null, null, null, null, null);
INSERT INTO `question` VALUES ('439', '119', 'Quando é que uma Sprint deve ser cancelada totalmente?', null, null, '2', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'ADMIN');
INSERT INTO `role` VALUES ('2', 'USER');
INSERT INTO `role` VALUES ('4', 'PREREGISTED');

-- ----------------------------
-- Table structure for `tag`
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------

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
INSERT INTO `university` VALUES ('12', 'Universidade Lúrio', 'UniLúrio');
INSERT INTO `university` VALUES ('22', 'Universidade Zambenze', 'UniZambeze');
INSERT INTO `university` VALUES ('32', 'Universidade Pedagógica', 'UP');
INSERT INTO `university` VALUES ('33', 'Universidade Lurio - Bussiness School', 'UBS');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  `hash` varchar(255) DEFAULT NULL,
  `district` int(11) DEFAULT NULL,
  `university` int(11) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `pin` varchar(255) DEFAULT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `pre_registation_code` varchar(255) DEFAULT NULL,
  `marital_status` int(11) DEFAULT NULL,
  `gpa` int(11) DEFAULT NULL,
  `high_school_name` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `last_access` datetime DEFAULT NULL,
  `preregisted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `district` (`district`),
  KEY `university` (`university`),
  KEY `marital_status` (`marital_status`),
  KEY `gender` (`gender`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`district`) REFERENCES `district` (`id`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`university`) REFERENCES `university` (`id`),
  CONSTRAINT `user_ibfk_3` FOREIGN KEY (`marital_status`) REFERENCES `marital_status` (`id`),
  CONSTRAINT `user_ibfk_4` FOREIGN KEY (`gender`) REFERENCES `gender` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1322 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('236', 'Dario', 'Mario', 'felasbe@hotmail.com', '$2a$10$1DI/wpMmgCi/TPC0BoNL9O9Y9u.rLixWPNbn/bH7V7JbdKSAQoPyy', '2019-10-09 19:37:52', '1', null, '1', '2', '825407883', '1576', null, null, '1', '11', 'ESN', '1', '2020-01-21', null, '0');
INSERT INTO `user` VALUES ('237', 'Teste', 'Teste', 'osoma.mz@gmail.com', '$2a$10$5.R2WHIolwyY6CRCEs0llOiKfmCOIUeVYDMFeFzVY4RJVXxCA96eW', '2020-01-13 13:11:13', '1', null, '66', '2', '846689637', '1057', null, null, '1', '15', 'lllll', '1', '2020-01-21', null, '0');
INSERT INTO `user` VALUES ('271', 'job', 'Luanda', 'jobluanda@gmail.com', '$2a$10$EGkJRc4Ev3lT3nyN7rZUl.6kVE9XUNWG6toRlX6jXK5nhgahXG7LW', '2020-02-05 09:28:22', '1', null, '86', '33', '847060591', null, null, '1271', '1', '12', 'Instituto Industrial e Comercial de Nampula', '1', '1995-09-30', '2020-03-02 06:55:43', '1');
INSERT INTO `user` VALUES ('291', 'Ancha', 'Mecurão', 'Anchasalimo93@gmail.com', '$2a$10$1Vk.NOt28sTqkjZBOlIJDeVeNeiqMQobSLKucCunyleHdScQ3VYk6', '2020-02-05 13:45:59', '1', null, '86', '33', '849274251', null, null, '1291', '1', '10', 'EIC Nampula', '2', '2001-08-01', '2020-02-12 11:09:20', '1');
INSERT INTO `user` VALUES ('401', 'James', 'Moreno', 'morenojaes02@gmail.com', '$2a$10$dLxn0JOOPrCEcAclRITkc.EYYRm/K/kWtbiPaOOf754N6G7nzqDVC', '2020-02-06 14:35:00', '1', null, '86', '33', '848192854', null, null, '1401', '1', '12', 'ECCI', '1', '2003-02-16', '2020-02-12 10:11:28', '1');
INSERT INTO `user` VALUES ('411', 'Hulda Mussenga', 'Abudala', 'esmaelmussenga@gmail.com', '$2a$10$npB4rC6ql/twnQqLxYS38eRy/4ObsqCcXMP7XRpakZNPiYPU.SPYW', '2020-02-06 14:39:43', '1', null, '86', '33', '840467749', null, null, '1411', '1', '15', 'IPCP', '2', '2000-01-11', null, '1');
INSERT INTO `user` VALUES ('421', 'Eugenio Julio', 'Setemane', 'Setemaneeugenio@gmail.com', '$2a$10$MXtzCqlwaAs3LQ1hpfZ0.uyex0Tw2e4eVJJ9SnqrNBJixoMm7CY4W', '2020-02-07 07:05:43', '1', null, '86', '33', '844727923', null, null, '1421', '1', '11', 'ESM', '1', '1984-05-10', '2020-02-12 09:47:49', '1');
INSERT INTO `user` VALUES ('431', 'Fátima ', 'Francisco', null, '$2a$10$iBhxf0UffTGtjBZDKN8CT.2BRKYn340BJucW6MYWYTh0Kot81aaPW', '2020-02-07 07:08:58', '1', null, '86', '33', '852872030', null, null, '1431', '1', '11', 'ESM', '2', '2000-02-20', '2020-02-12 08:57:42', '1');
INSERT INTO `user` VALUES ('441', 'Vilma Cristina Lot Marvin', 'Kamanga', null, '$2a$10$y6trG85s7d0rzLzGLBmDCO1JEA80Woswqe5PlQjQZbjex/YgaCoRm', '2020-02-07 07:38:26', '1', null, '86', '33', '843633596', null, null, '1441', '1', '14', 'Instituto Criança', '2', '2003-11-07', '2020-02-12 09:28:02', '1');
INSERT INTO `user` VALUES ('461', 'Adelina dos Anjos', 'Dimande', 'adelinadosanjos.ada@gmail.com', '$2a$10$iipOSYxI4BL9qJDt.1.Dn.POcDJYOnb5LudZAi/HSXCGHweAbX5g2', '2020-02-07 08:36:35', '1', null, '86', '33', '842046084', null, null, '1461', '1', '16', 'INSTITUTO INDUSTRIAL E COMERCIAL ', '2', '1999-05-30', '2020-02-11 09:48:12', '1');
INSERT INTO `user` VALUES ('471', 'Scarleth Nuria de Faria', 'Gonsalves', 'scarlethfaria05@gmail.com', '$2a$10$70/2QFPuaZPah0.ngxcfs.eBwH0if3GJ.mg.k85w0FnDOZOuN8SEu', '2020-02-07 08:52:27', '1', null, '86', '33', '850678839', null, null, '1471', '1', '16', 'IMEP', '2', '2000-10-10', null, '1');
INSERT INTO `user` VALUES ('481', 'Betulia Faria', 'Antonio', null, '$2a$10$K10PU/OHvF8AE.svqTlG6uzQfOh4VxxbrOIkE/3tsbAxK9P1H/8PC', '2020-02-07 08:57:12', '1', null, '86', '33', '844181514', null, null, '1481', '1', '13', 'ESGN', '2', '2001-04-21', '2020-02-12 11:15:33', '1');
INSERT INTO `user` VALUES ('491', 'Argentina Moises Ihala ', 'Sulemane', null, '$2a$10$9r7pJ/4izA/g3iVWzMmb2OM7OxGcQCQvfh6Vsn5eLoTveIfsU3KwS', '2020-02-07 09:01:44', '1', null, '86', '33', '846190539', null, null, '1491', '1', '15', 'I.P.C.FEMENINA', '2', '2000-03-12', '2020-02-13 07:44:37', '1');
INSERT INTO `user` VALUES ('501', 'Chelsea', 'Ferreira', 'Chelsiaferreira210@gmail.com', '$2a$10$RvbPKwa5NXDg0wsywO90rO9HvQlMNtvykwxYOj94wcJ6ipsdSLVGK', '2020-02-07 09:07:26', '1', null, '86', '33', '844604942', null, null, '1501', '1', '12', 'E.S.12 DE OUTUBRO', '2', '2002-10-14', null, '1');
INSERT INTO `user` VALUES ('511', 'Ana Maria Francisco', 'Alfredo', null, '$2a$10$DecFD5Q1wNifjpuGlP6UqOUFiZ5cReuBzHqmpKtMqFt8egIeGVLcK', '2020-02-07 09:11:25', '1', null, '86', '33', '847825639', null, null, '1511', '1', '11', 'E.S.Muatala', '2', '1980-09-12', '2020-02-13 12:06:25', '1');
INSERT INTO `user` VALUES ('521', 'Suzete Pedro Francisco ', 'Matequenha', null, '$2a$10$DLMx2xNTzHqEgwiQR6c4HeDOVmOA3l9k4kORPDWMuVXb2FMFwtsIG', '2020-02-07 09:14:34', '1', null, '86', '33', '843732973', null, null, '1521', '1', '10', 'E.S.Nampula', '2', '2001-11-10', '2020-02-13 08:55:34', '1');
INSERT INTO `user` VALUES ('531', 'Genoveva Dos Santos', 'Marehera', null, '$2a$10$tEtk3ZKA86h6Feqozx5uLu6.y2G0KRORGcB4ldf8kpH37FzBINLGa', '2020-02-07 09:18:08', '1', null, '86', '33', '846411111', null, null, '1531', '1', '12', 'E.S.Napipine', '2', '2002-02-15', '2020-02-12 12:49:36', '1');
INSERT INTO `user` VALUES ('541', 'Sequera Miranda Armando', 'Zambo', null, '$2a$10$CDBn2Fk5QvGiwj/pkTDVvOdxsrPkl/NhscRl2XuDTMebMQ58jgaPO', '2020-02-07 09:22:42', '1', null, '86', '33', '850309594', null, null, '1541', '1', '10', 'E.s.Nampaco', '2', '1999-02-17', '2020-02-13 13:52:44', '1');
INSERT INTO `user` VALUES ('551', 'Rosa Issufo Issufo', 'Selemane', null, '$2a$10$IksvO4e/f5Lww5RNjflOj.VX.PbF37imAJTqGME0L1qSKaLB6jpCu', '2020-02-07 09:26:18', '1', null, '86', '33', '849628048', null, null, '1551', '1', '10', 'E.S 12 de Outubro', '2', '1997-05-10', '2020-02-12 09:33:38', '1');
INSERT INTO `user` VALUES ('561', 'Germano Cacildo Colaco', 'Lopes', null, '$2a$10$UVE9syus3cZTwkCAL0AzBuVQOO1fYy/V/B9qc2Jp7ljxROuul6sUC', '2020-02-07 09:35:49', '1', null, '86', '33', '845098514', null, null, '1561', '1', '12', 'I.I.da BEIRA', '1', '1992-07-07', '2020-02-12 13:52:15', '1');
INSERT INTO `user` VALUES ('571', 'Armando Jamal', 'Joaquim', null, '$2a$10$76tikpPsY9dIoQL7Zsl5p.GEQpnCBILlkMyRCwXakt/L5ecGdVtZ6', '2020-02-07 09:43:15', '1', null, '86', '33', '844675257', null, null, '1571', '1', '11', 'E.S.Napipne', '1', '1999-10-05', '2020-02-14 17:41:27', '1');
INSERT INTO `user` VALUES ('581', 'Aluais Ernesto', 'Joao', null, '$2a$10$uMZH5Pk1nGMPSzN5ML9nmemewV73l1j/eXEKnYW2tfdmBJj6shyL.', '2020-02-07 09:47:10', '1', null, '86', '33', '847488025', null, null, '1581', '1', '13', 'E.S.E.S.Nihia', '1', '1996-11-24', '2020-02-11 15:45:07', '1');
INSERT INTO `user` VALUES ('591', 'Ermelinda Jose', 'Fernando', null, '$2a$10$I8wnpXt7LqzIBkd9yKfZA.QNW.PbWkiGO96M8suX/tCasHa3rpDlu', '2020-02-07 09:52:02', '1', null, '86', '33', '870638124', null, null, '1591', '1', '12', 'E.S.Nampula', '2', '1998-12-09', '2020-02-13 07:31:14', '1');
INSERT INTO `user` VALUES ('601', 'Arlete Agostinho', 'Hilario', null, '$2a$10$F3uhJ10mK3OiqadyHhWGLuPcF30j2oqXPO5q8v/DyiRcCnt26E922', '2020-02-07 09:54:54', '1', null, '86', '33', '845029158', null, null, '1601', '1', '12', 'E.S.Nampula', '2', '2001-02-22', null, '1');
INSERT INTO `user` VALUES ('611', 'Veronica Augusto Serafim', 'Marqueza', null, '$2a$10$xV16jr71qODGrxXcusHgBex1/SBL644aJ5NRaC8AClQ2dWYsnbBTm', '2020-02-07 09:59:39', '1', null, '1', '33', '844640702', null, null, '1611', '1', '11', 'E.S.Muatala', '2', '2000-11-16', '2020-02-14 07:20:32', '1');
INSERT INTO `user` VALUES ('621', 'Ruth da Rosa Amade Joao', 'Uahova', null, '$2a$10$vqvxOianiYnWeHScrxOOZ.So3Nnw3qF9xc7Z.E/ApYUsInygoP.0a', '2020-02-07 10:04:22', '1', null, '86', '33', '848312248', null, null, '1621', '1', '11', 'E.S.Napipine', '2', '2001-01-13', '2020-02-13 09:03:01', '1');
INSERT INTO `user` VALUES ('631', 'Anifa Sebastiao', 'Jaime', null, '$2a$10$dc8xKULZ1QxDGDCZzgH7q.ql1GAnW6ymX/TgI8T.b9rTtkIw21xy.', '2020-02-07 10:07:03', '1', null, '86', '33', '846894241', null, null, '1631', '1', '16', 'I.I.C.NAMPULA', '2', '1999-11-22', '2020-02-11 10:44:48', '1');
INSERT INTO `user` VALUES ('641', 'Puna Alberto Elias', 'Germano', 'Punaalberto@gmail.com', '$2a$10$VhHmuHSrItRZdxmWFKzJQ.gGtdNhum/XjBacRJWFZlZ1hnNJCe8L6', '2020-02-07 10:24:59', '1', null, '86', '33', '845860240', null, null, '1641', '1', '13', 'I.M.P', '2', '1999-06-05', '2020-02-11 20:52:17', '1');
INSERT INTO `user` VALUES ('651', 'Ricardo Aine Ernesto', 'Amade', 'ricardoainy@gmail.com', '$2a$10$Op5of5/Ac5G9wl5JUFkdMu02pix2nnMdu8poRo/N9acO/osgF8IGm', '2020-02-07 10:32:30', '1', null, '86', '33', '846370034', null, null, '1651', '1', '11', 'E.S.M', '1', '1995-05-19', '2020-02-13 23:31:20', '1');
INSERT INTO `user` VALUES ('661', 'Adelia Jose ', 'Mulungo', 'adjmulungo@gmail.com', '$2a$10$74bPfFYYKgVYaNNhDHknuOq3Xnfxi3vXjnnbdltBszGk3K64lHZZe', '2020-02-07 10:39:18', '1', null, '86', '33', '876326195', null, null, '1661', '1', '10', 'E.S.MAPUTO', '2', '1983-04-12', null, '1');
INSERT INTO `user` VALUES ('671', 'Aurelio Hilton', 'Sardinha', 'Aureliohilton49@gmail.com', '$2a$10$6y9AtWXWuLUnmY/rzEuKke3zA96WNZgyHlTOxzwLLDGcLiZeXn.C2', '2020-02-07 10:43:11', '1', null, '86', '33', '849508032', null, null, '1671', '1', '11', 'E.S.de Angoche', '1', '2002-10-11', '2020-02-12 12:19:21', '1');
INSERT INTO `user` VALUES ('681', 'Manuela da Pascoa Ema Bernardo Julio', 'Teimoso', null, '$2a$10$LzZy72vypRCzhkgJEXBcnu0Fr0lXRj1DFMs5McxXgrWNN1kfB.cYS', '2020-02-07 10:47:30', '1', null, '86', '33', '826104894', null, null, '1681', '1', '17', 'I.P.7 nacala', '2', '2002-03-30', '2020-02-11 14:06:15', '1');
INSERT INTO `user` VALUES ('691', 'Mercy Mariano', 'Rebelo', 'mercymarianorebelo@gmail.com', '$2a$10$FPwpa0L7SBtGS/n8m4L0Ku/nDsLDXNGkXrxZhDuzAj/nCoRgJdAYC', '2020-02-07 10:51:50', '1', null, '86', '33', '846886178', null, null, '1691', '1', '10', 'E.S.N', '2', '2002-05-27', '2020-02-13 13:09:43', '1');
INSERT INTO `user` VALUES ('701', 'Julia Mariza JORGE', 'MENEZES', null, '$2a$10$Buf0mG4wF0dFebevTtByuuC2OiW1231IWqe6XEO/rTKb8o4vHKWKm', '2020-02-07 10:56:45', '1', null, '86', '33', '842619856', null, null, '1701', '1', '12', 'E.S.NAMPULA', '2', '1984-04-18', '2020-02-15 03:35:09', '1');
INSERT INTO `user` VALUES ('711', 'Ema Luis Mario ', 'Gigueira', null, '$2a$10$OOtVLHCBWsBTUeMtRBc7/eFzcx590TX.nC4uno/Ew9qhvStFvQ27m', '2020-02-07 11:01:32', '1', null, '131', '33', '8447711672', null, null, '1711', '1', '14', 'Colegio Mungulune', '2', '2002-09-20', '2020-02-12 14:33:41', '1');
INSERT INTO `user` VALUES ('721', 'Sisaltina da Gresta Sopa', 'Wilson', null, '$2a$10$jhxaTEA8Fo99be7ODFK1fO9UGqeYG1cEifqsbFtyZ8pEyfjZnLpG6', '2020-02-07 11:04:38', '1', null, '86', '33', '847272555', null, null, '1721', '1', '10', 'Instituto Crianca', '2', '2002-04-03', null, '1');
INSERT INTO `user` VALUES ('731', 'Leonildes Angelo ', 'Fafetine', null, '$2a$10$GqDVEJQr8ZqCkdjPnZjivuhBGCftNYl7Q4VLElpKv9QDknDYBdGri', '2020-02-07 11:07:43', '1', null, '86', '33', '843917985', null, null, '1731', '1', '11', 'E.S.G.II CICLO 3 DE FEVERREIRO', '1', '1994-05-04', '2020-02-12 10:13:06', '1');
INSERT INTO `user` VALUES ('741', 'Faizal Luciano Marcelino', 'Meconta', null, '$2a$10$vw04FR4/JHao5GfGfKQKXOXEwFWFR9.uLIDuGb6mZgbpLICYbfo9O', '2020-02-07 11:21:54', '1', null, '86', '33', '845439573', null, null, '1741', '1', '11', 'E.S.nampaco', '1', '1998-01-06', '2020-02-12 11:06:49', '1');
INSERT INTO `user` VALUES ('751', 'Erica Moises Freitas', 'Pedro', null, '$2a$10$P49DjS2DrCCa0opivOIcy.0XlqOGMNnio1VXoApPdKDesM5xdn3EG', '2020-02-07 11:25:37', '1', null, '131', '33', '842629143', null, null, '1751', '1', '12', 'E.P.C.F.NACALA', '2', '2002-09-01', null, '1');
INSERT INTO `user` VALUES ('761', 'Nelson Sarita Tome', 'Benfica', 'nelsonbenfica8@gmail.com', '$2a$10$vNHY/RKzK1eH0.ImCPv5X.cagS9Lc1BRvJ3YCoC1aQ5o/EufG8aPq', '2020-02-07 11:29:26', '1', null, '86', '33', '849368601', null, null, '1761', '1', '10', 'E.S.NAMPULA', '1', '2001-11-26', '2020-02-13 06:19:48', '1');
INSERT INTO `user` VALUES ('771', 'Temodio Albino', 'Manuel', null, '$2a$10$uiWAhLU4asnJIGxsqKJRJeedrOdHiL/XTp4.YHp0e/ihl6oxeN0wa', '2020-02-07 11:33:03', '1', null, '86', '33', '840363901', null, null, '1771', '1', '12', 'E.S.NETIA', '1', '2000-12-25', '2020-02-11 12:00:31', '1');
INSERT INTO `user` VALUES ('781', 'Maria Estefania Carlos Mchatine', 'Muhate', null, '$2a$10$wKNmcRAnaFcC27xn3dmzveKjreZrSF9PNR9H2dDIluBhoiI8rosCu', '2020-02-07 11:37:26', '1', null, '86', '33', '847250818', null, null, '1781', '2', '14', 'I.G.C.S NAMPULA', '2', '1989-12-30', null, '1');
INSERT INTO `user` VALUES ('791', 'Janaina Nunes ', 'Catarro', null, '$2a$10$XyExt6q6d4TLXau0109XKeKYP.0qZmLG2maBQf/abQjFkJY05JJta', '2020-02-07 11:44:09', '1', null, '86', '33', '845205992', null, null, '1791', '1', '11', 'E.S.NAMPULA', '2', '2001-08-13', '2020-02-12 08:10:09', '1');
INSERT INTO `user` VALUES ('801', 'Albertina Monica', 'Matos', null, '$2a$10$OVm8fLTZGg96/c1Ts9U8.upC80gAaJ2oWWpAJK3lzx6IZp/XAxq7.', '2020-02-07 11:54:29', '1', null, '86', '33', '849111953', null, null, '1801', '1', '10', 'E.S.LIUPO', '2', '1997-05-26', '2020-02-13 11:12:29', '1');
INSERT INTO `user` VALUES ('811', 'Cica Fernando', 'Simango', null, '$2a$10$LzIL5GpzEOFumWz1LOuW8.cEDv1LqEOc7dLmDYPQ.I/SBxhGvxuQe', '2020-02-07 11:57:24', '1', null, '86', '33', '840198306', null, null, '1811', '1', '9', 'l.PITAGORAS', '2', '2003-05-10', '2020-02-13 07:48:08', '1');
INSERT INTO `user` VALUES ('821', 'Jeronimo', 'Alice', null, '$2a$10$OayS4lmLPrpNXQ9Q.lYvLe2LnlPvH9XXu7hXzpcWz/LQWDGM1bctm', '2020-02-07 12:01:59', '1', null, '66', '33', '847306933', null, null, '1821', '1', '12', 'E.S XAI-XAI', '1', '1992-05-05', '2020-02-13 20:05:19', '1');
INSERT INTO `user` VALUES ('831', 'Jalina Abdul ', 'Amido', null, '$2a$10$qSZo3zN205RyHi.qurnybe9xuPywCli0uDJ5xpR.U0o2msXVH6Rkq', '2020-02-07 12:11:52', '1', null, '86', '33', '846311056', null, null, '1831', '1', '16', 'I.I.COMERCIAL DE NAMPULA', '2', '2001-05-16', '2020-02-13 12:13:01', '1');
INSERT INTO `user` VALUES ('841', 'Erica Amina Leonardo', 'Sataca', 'Erycka69leonard@gmail.com', '$2a$10$2nWkjJOfM965eoMT3oRiquUt8mXCo40muBh/8Q7YK3Ic02MEBLDEy', '2020-02-07 12:17:59', '1', null, '86', '33', '844603456E', null, null, '1841', '1', '14', 'I.CRIANCA', '2', '2002-09-11', '2020-02-11 16:51:26', '1');
INSERT INTO `user` VALUES ('851', 'Janeto', 'Anibal', null, '$2a$10$n9Ge67u9FRCtw/sLJYNUyOIm7TFt6oFU4BJp9LPGWOMmhBgxW07RS', '2020-02-07 12:23:36', '1', null, '1', '33', '842045255', null, null, '1851', '1', '10', 'E.S.NAMPACO', '1', '1999-10-27', '2020-02-12 17:11:36', '1');
INSERT INTO `user` VALUES ('861', 'Aiuba Momade', 'Faquira', 'yuramfaquira@gmail.com', '$2a$10$bfTMhhXKsreaU5slQvsgNe5KqjcbAsYm6Rr8JstEey7o6IJmx3i.G', '2020-02-08 09:19:14', '1', null, '86', '33', '848899537', null, null, '1861', '1', '10', 'ESN', '1', '1980-07-04', '2020-02-12 09:01:30', '1');
INSERT INTO `user` VALUES ('871', 'Celso Francisco', 'Abudo', 'celsofranciscoabudo@gmail.com', '$2a$10$GuNhJiUd/BlZvC24xS7XfOU7Wtqez2M/4DilhGoWPYi1BHVFJlQxi', '2020-02-08 09:23:59', '1', null, '86', '33', '848957526', null, null, '1871', '1', '10', 'ITC', '1', '1999-08-02', '2020-02-13 07:34:50', '1');
INSERT INTO `user` VALUES ('881', 'Lola Cipriano', 'António', null, '$2a$10$a1YzrsMumrMrxMwh7SGp0O7dVojtTDsyLEwzHpnMMc8oSYWBlqMLy', '2020-02-09 09:32:34', '1', null, '86', '33', '846397595', null, null, '1881', '1', '11', 'ES De Liupo', '2', '1997-10-11', '2020-02-12 09:37:55', '1');
INSERT INTO `user` VALUES ('891', 'Kelly Manuel', 'Nóe', null, '$2a$10$I7yFXAiBjuBcZdQUModKAelH3FvyYQQn.9XWT8gX5utk1EEYMKDJ6', '2020-02-09 09:36:29', '1', null, '86', '33', '842866181', null, null, '1891', '1', '11', 'ES Clave doSol', '2', '2002-02-20', '2020-02-13 06:03:35', '1');
INSERT INTO `user` VALUES ('901', 'Sílvia Cássimo', 'Ali', 'Silviaali523@gmail.com', '$2a$10$3cIzLk.uoN/88ohmoISfR.dVOXrgVWNPPIXh8SelrilVG0J0cP9Gq', '2020-02-09 09:42:32', '1', null, '86', '33', '844912713', null, null, '1901', '1', '10', 'ES 12 de Outubro', '2', '1999-07-12', '2020-02-11 20:10:12', '1');
INSERT INTO `user` VALUES ('911', 'Esménia Vicente Saira', 'Sousa', 'esmeniavicente8@gmail.com', '$2a$10$TBWHgnaIY4Idqzvd0K7KDOT2YZIFFKDUFusaPoZCNxw45iyvt9VaG', '2020-02-09 09:51:28', '1', null, '86', '33', '844449783', null, null, '1911', '1', '12', 'Industrial', '2', '2000-08-02', '2020-02-13 08:57:17', '1');
INSERT INTO `user` VALUES ('921', 'Laquina Eufemia Antanásio de ', 'Castro', 'laquinadecastro@gmail.com', '$2a$10$pQw8ZgHEajQa2/Xt5HLEYOOvv4Bovei9TthEGu40tU0ZKyF4k0HcC', '2020-02-09 09:57:23', '1', null, '66', '33', '842874346', null, null, '1921', '1', '10', 'Industrial', '2', '2000-06-04', '2020-02-27 12:35:08', '1');
INSERT INTO `user` VALUES ('931', 'Paulo Vali', 'Luciano', 'paulovali@yahoo.com', '$2a$10$0oK8haFDuuO8v6S3modMdOLDyrkmzxQFf/5xQ7UGDJaa1pRunRHhy', '2020-02-09 10:01:44', '1', null, '86', '33', '849255686', null, null, '1931', '2', '14', 'Instituto de Ciencias e Saude', '1', '1975-01-02', '2020-02-13 05:52:03', '1');
INSERT INTO `user` VALUES ('941', 'Issumail Francisco', 'Muanahumo', 'Issumail.0786@gmail.com', '$2a$10$CeRn0WuVfx/QRMARqN.DiuDTzrDWBpN.o016sEkYJKcF/g0NyLMAC', '2020-02-09 10:05:21', '1', null, '86', '33', '844176999', null, null, '1941', '1', '10', 'ES', '1', '1980-02-04', '2020-02-13 13:42:54', '1');
INSERT INTO `user` VALUES ('951', 'Geremias', 'Lino', 'geremiaslino20@gmail.com', '$2a$10$P6MdegrA6UIwYowC5pOOpOAjHDvamCO9.c0JqmSJm7fl/24YC7O3e', '2020-02-09 10:11:21', '1', null, '86', '33', '847101545', null, null, '1951', '1', '11', 'ES Napipine', '1', '1995-02-01', '2020-02-12 02:43:06', '1');
INSERT INTO `user` VALUES ('961', 'Edlson Geraldo Gilberto ', 'Ernesto', null, '$2a$10$.pBoc8mKfe6FVuFteYIFF.bhgT.DDbiFMtulCAbNJfV3EN/wxn4A2', '2020-02-09 10:14:46', '1', null, '86', '33', '846080393', null, null, '1961', '1', '14', 'Inst. Ind. e Com Eduardo Mondlane', '1', '1999-02-04', null, '1');
INSERT INTO `user` VALUES ('971', 'Esperança Constantino ', 'Luís', null, '$2a$10$9TgEdpcSapYU72RSFhLpVe5DaCoh3qEBGCghGWHI1pJICyQsHIadW', '2020-02-09 10:17:57', '1', null, '86', '33', '847392993', null, null, '1971', '1', '10', 'E S Napipine', '2', '2002-01-05', null, '1');
INSERT INTO `user` VALUES ('981', 'Margarida da Conceição', 'Almeida', null, '$2a$10$PyJFmozXKQEkcLN0OxWtYObfWqUrM0LUqHf43EZjIk1rO5tuC4TN6', '2020-02-09 10:27:08', '1', null, '86', '33', '845846117', null, null, '1981', '1', '10', 'E.S. Napipine', '2', '2002-02-06', null, '1');
INSERT INTO `user` VALUES ('991', 'Helena Babi ', 'Omar', null, '$2a$10$F6kUEXBFkkhTesDym0uBS.wNOeoTvNKPs91MT/U1HdwsMKdKjxwwG', '2020-02-09 10:29:18', '1', null, '86', '33', '845032440', null, null, '1991', '1', '11', 'E.S. Napipine', '2', '2002-02-07', '2020-02-14 04:12:08', '1');
INSERT INTO `user` VALUES ('1001', 'Graciosa Ernesto', 'Francisco', null, '$2a$10$Q1xrF/Hne/djY8WJcugXN.CpoO6QaADcDej9yVsy6OLHsWLLHT6WS', '2020-02-09 10:33:09', '1', null, '86', '33', '849640702', null, null, '2001', '1', '10', 'E. S. Napipine', '2', '2002-12-10', null, '1');
INSERT INTO `user` VALUES ('1011', 'Daniel Carlitos', 'José', null, '$2a$10$JzUWsik.MJVJ5McH7cojSedGCFlldC.SkPoGgEw38zuYAEr8pp.EC', '2020-02-09 10:36:18', '1', null, '66', '33', '852171350', null, null, '2011', '1', '10', 'E.S. Napipine', '1', '1999-02-04', null, '1');
INSERT INTO `user` VALUES ('1021', 'Flora Bonefacio  ', 'Vicente', null, '$2a$10$B06ibjF1dCvV2/GIt7KtB.Zo/rG8wuxz59gZBCMTimygQeT5j.ej.', '2020-02-09 10:39:28', '1', null, '86', '33', '846788964', null, null, '2021', '1', '10', 'E.S. Napipine', '2', '1997-02-04', '2020-02-11 10:26:28', '1');
INSERT INTO `user` VALUES ('1031', 'Sebastião Isidro', 'Mário', null, '$2a$10$SM.Zdfj8H3TPqSdeHHd75.NXhxgE84GfM/vjPjfjlG50G.vdyWlZy', '2020-02-09 10:46:44', '1', null, '86', '33', '844622048', null, null, '2031', '1', '10', 'E.S. Napipine', '1', '1998-05-05', null, '1');
INSERT INTO `user` VALUES ('1041', 'Inácio Samuel Mateus ', 'Methua', null, '$2a$10$G/oeQ5KUhwP3WIshP.ClWemvszEYAv/HIBnm2/ZkGHNGhxR9aZNlK', '2020-02-09 10:49:44', '1', null, '86', '33', '845360412', null, null, '2041', '1', '10', 'E.S. Napipine', '1', '2001-11-11', null, '1');
INSERT INTO `user` VALUES ('1051', 'Eunice Silvano', 'Solinho', null, '$2a$10$PeKgB168/PZJLGfR42QswOAQrc949IU.8FKerz4nvcvR3oCtfhlp.', '2020-02-09 10:52:02', '1', null, '86', '33', '846324487', null, null, '2051', '1', '10', 'E.S.Napipine', '1', '2001-02-03', '2020-02-11 19:54:06', '1');
INSERT INTO `user` VALUES ('1061', 'Abdul Francisco ', 'Muanahumo', null, '$2a$10$tXTlAPh2bp0njtbgN5UmZOGcYWIwzWPkbTaQH7C2P4wL8BWppRYoa', '2020-02-09 10:53:30', '1', null, '86', '33', '846038682', null, null, '2061', '1', '11', 'E.S. Napipine', '1', '2003-04-02', null, '1');
INSERT INTO `user` VALUES ('1071', 'Yara Filomena José', 'Xavier', null, '$2a$10$itkJt466VAAHA.ggc2PzZehiHU3quO216WnFqvV6eyH3pq5YKPyl6', '2020-02-09 11:06:08', '1', null, '86', '33', '844955402', null, null, '2071', '1', '10', 'E.S. Napipine', '1', '2000-03-09', null, '1');
INSERT INTO `user` VALUES ('1081', 'Mariza Victor de ', 'Andrade', null, '$2a$10$nvtinSJdpG8EaQgapxaIiu2UoacNyYJppvaHt95MfaGXgySe.zI/O', '2020-02-09 11:11:47', '1', null, '86', '33', '852506854', null, null, '2081', '1', '10', 'E.S. Napipine', '2', '1999-10-24', null, '1');
INSERT INTO `user` VALUES ('1091', 'Ednete da Lizete Alberto Agostinho', 'Rapeque', null, '$2a$10$UW/wSYySDpWI7szARJ5eC.LGFCrDQCEkKrAppYdLFiE747DaLqGQe', '2020-02-09 11:13:47', '1', null, '86', '33', '852395905', null, null, '2091', '1', '10', 'E.S. Napipine', '2', '2001-02-08', null, '1');
INSERT INTO `user` VALUES ('1101', 'Carlos Silva', 'Coelho', null, '$2a$10$JmxvH431fM3sXNoHznGdLe5RchhAORgkEi4eBl.z2lmBbmpYTqWlG', '2020-02-09 11:16:47', '1', null, '86', '33', '844975324', null, null, '2101', '1', '10', 'E.S. Napipine', '1', '1999-05-06', null, '1');
INSERT INTO `user` VALUES ('1111', 'Horácio Paulo ', 'Muluquima', null, '$2a$10$/kEX/rWYTLCSouVkqIYaF.2YFPi.ntMQ3eGcQ3Smtit4jgyAcTEe2', '2020-02-09 11:18:56', '1', null, '86', '33', '849031162', null, null, '2111', '1', '10', 'E,S. Napipine', '1', '1999-05-02', '2020-02-11 13:03:47', '1');
INSERT INTO `user` VALUES ('1121', 'Regina Francisco ', 'Alberto', null, '$2a$10$dz3ueNFuzcg5gRt0HUtNO.fOcQ9pnf5VWFmVoibTf9VRj/7EpbU9y', '2020-02-09 11:22:36', '1', null, '86', '33', '845561922', null, null, '2121', '1', '10', 'E.S. Napipine', '2', '2000-09-14', null, '1');
INSERT INTO `user` VALUES ('1141', 'Maria de Lurdes Vicente', 'Lourenço', 'Mariavicentelourenço@gmail.com', '$2a$10$jlwE6m8Y3oXxsptjZrVaQuK5arMWl8iLv1wNAyUdaXfgt0/1cubmu', '2020-02-10 07:42:05', '1', null, '86', '33', '843874844', null, null, '2141', '1', '11', 'E.P Nampaco', '2', '1994-11-16', '2020-02-11 20:13:48', '1');
INSERT INTO `user` VALUES ('1151', 'Amina Lázaro ', 'Momade', 'aminalazaro@gmail.com', '$2a$10$hz9aOgVyQsKro.RttZ2CWuUpeAt26yhNAgCtHPOr9l1BfwoiwhFEG', '2020-02-10 07:44:42', '1', null, '86', '33', '845097887', null, null, '2151', '1', '13', 'E.S. 12 de Outubro', '2', '2001-07-07', '2020-02-12 19:15:47', '1');
INSERT INTO `user` VALUES ('1161', 'Jacira Ussene', 'Emilio', null, '$2a$10$iiO1pgqraG8YTHbyj7tHQe.DR8L699WharPexOI6UqHeVfbqPQNGu', '2020-02-10 12:34:47', '1', null, '86', '33', '846719960', null, null, '2161', '1', '13', 'ES Nacala', '2', '2003-12-03', '2020-02-12 08:44:48', '1');
INSERT INTO `user` VALUES ('1171', 'Jaime Luís', 'Castomo', 'delfindanieljaime@gmail.com', '$2a$10$yFb/C.q5cGwToUOBhhnyV.GFv6jHdJiZ28PZz8jlHhihShBNY5eUy', '2020-02-10 12:39:17', '1', null, '86', '33', '847707951', null, null, '2171', '1', '10', 'Ints Ind. Comercial', '2', '1997-06-15', '2020-02-11 10:52:44', '1');
INSERT INTO `user` VALUES ('1181', 'Soraia Abdulrehemane ', 'Selemane', null, '$2a$10$ieW921Q2XBqC792MCRo/jO6JzFrrJpRzcU2UVbjmWNDw6yn/uKaZG', '2020-02-10 12:42:24', '1', null, '86', '33', '848554750', null, null, '2181', '1', '10', 'Inst Ind', '2', '1998-01-30', '2020-02-14 16:35:30', '1');
INSERT INTO `user` VALUES ('1191', 'Lajoie', 'Alidi', null, '$2a$10$VtNevcZ8eXUDvmmxlh8X8.ohpJ.AG1ry0gggKnsitNiPlxF4CFt2q', '2020-02-10 12:44:55', '1', null, '86', '33', '842056554', null, null, '2191', '1', '12', 'ESN', '2', '1995-11-09', null, '1');
INSERT INTO `user` VALUES ('1201', 'Rosita Rui', 'João', 'joaorosita@gmail.com', '$2a$10$/2vZecFwMWX3.IE0/EYSsOdluHf2CpXDLAGQy1y58nLMb3qzKMoYW', '2020-02-11 07:18:46', '1', null, '86', '33', '845599531', null, null, '2201', '1', '12', 'ES Ponta Gea', '2', '1998-03-23', '2020-02-11 15:51:53', '1');
INSERT INTO `user` VALUES ('1211', 'Test', 'Test', 'Silveriobomba@gmail.com', '$2a$10$zMdXdTmUVVuZSwaADlC/7O.3l0UiYeVj2mz2laE2mTbtJtWQ57Ij.', '2020-02-11 07:39:07', '1', null, '66', '33', '842114160', null, null, '2211', '1', '10', 'ES Nampula', '1', '1989-09-25', null, '1');
INSERT INTO `user` VALUES ('1221', 'Lúcia Estevão', 'Cucoyoyo', null, '$2a$10$SlUsnr1UXw6sY28phzV/..R2bW1Yz8eGKK/j7NfZN0LshDrXoNjvm', '2020-02-11 09:51:38', '1', null, '66', '33', '844333812', null, null, '2221', '1', '10', 'ESG', '2', '2000-02-08', '2020-02-12 07:59:37', '1');
INSERT INTO `user` VALUES ('1241', 'Rafael', 'Chaimuna', null, '$2a$10$m1RCDDD60/9btITktf4Ep.crEmo3oORDyca6umU5.HzBZEeglVsMq', '2020-02-12 06:56:19', '1', null, '16', '33', '846515413', null, null, '2241', '1', '14', 'E.S.M', '1', '1999-01-26', '2020-02-12 07:57:38', '1');
INSERT INTO `user` VALUES ('1251', 'Norton da Paz', 'Carlos', null, '$2a$10$NJVpX/5YzooqBAq.0FBBA.0nunhBOYt4FxU8eZ68yi3CvM.5u/Ihu', '2020-02-12 06:57:07', '1', null, '86', '33', '855289738', null, null, '2251', '1', '12', 'ES Nampaco', '1', '2000-10-07', '2020-02-13 07:40:10', '1');
INSERT INTO `user` VALUES ('1261', 'Evangelista Amândio', 'Joaquim', null, '$2a$10$nRmn7aW0CpIKHvWJJmDkBOXiutPmqj6twqrGWIMgz6jyqgEB9BUGK', '2020-02-12 07:00:24', '1', null, '86', '33', '850513420', null, null, '2261', '1', '11', 'ES mecia Macia', '1', '1997-05-09', '2020-02-12 08:04:32', '1');
INSERT INTO `user` VALUES ('1271', 'Saide', 'Samueli Eusébio', null, '$2a$10$WZKORCA3wXcdmLE5uFJK4OxDtSTFAz6TUM2YSbCUwu354QWjsoeR2', '2020-02-12 07:00:34', '1', null, '86', '33', '846417264', null, null, '2271', '1', '10', 'E.S.n', '1', '1998-05-20', '2020-02-12 08:06:00', '1');
INSERT INTO `user` VALUES ('1281', 'Marsane', 'Dionisia Beatriz Alberto', null, '$2a$10$uCiUgAs6PMxJFUB8K9btr.uHBg.D66hAGrt/oOp4EGKfHLJuUw8G6', '2020-02-12 08:53:18', '1', null, '92', '33', '846705666', null, null, '2281', '1', '12', 'E.s. Amizade', '2', '2002-04-17', '2020-02-12 09:01:14', '1');
INSERT INTO `user` VALUES ('1291', 'Ema Xavier ', 'Sábado', 'Emilya349@gmail.com', '$2a$10$Y3qtrU4.r0UwQr6U33ufKOM7/g8lMDJ2.XPABPRSUcM8Tpao1S4Du', '2020-02-12 09:09:37', '1', null, '86', '33', '846869238', null, null, '2291', '1', '12', 'IMEP', '2', '1995-02-17', '2020-02-13 11:35:38', '1');
INSERT INTO `user` VALUES ('1301', 'Rangeiro', 'Neidy Jucelin Alberto Castigo', null, '$2a$10$Z1Qbt.t1UASZqsr1oZTsE.f2IbkQNRZ8pqguRdVcnxOqqWe8GGdXO', '2020-02-14 07:10:49', '1', null, '141', '33', '847343443', null, null, '2301', '1', '14', 'I.M.E.P', '2', '2000-08-21', null, '1');
INSERT INTO `user` VALUES ('1311', 'Felermino', 'Ali', 'felerminoali@gmail.com', '$2a$10$drJhMdgysuhSVQzsXdTcJOPlj3psg47kA5tm.pv88.mNfxbmypKVu', '2020-02-28 07:55:30', '1', null, '120', '33', '777777777', null, null, '2311', '1', '1', '23', '1', '2020-02-28', '2020-02-28 07:56:06', '1');
INSERT INTO `user` VALUES ('1312', 'sidik Abdul', 'Momade', 'smomade@unilurio.ac.mz', '$2a$10$/Wtdf45w/zyIL2TIiStwWuDdaLU2FXjJFshYLfrYHeDdSV/WKDbXm', '2020-02-28 10:24:04', '1', null, '166', '33', '842062027', null, null, '2312', '1', '11', 'Escola Comunitaria Armando Emilio Guebuza', '1', '2020-02-10', '2020-03-02 07:45:53', '1');
INSERT INTO `user` VALUES ('1313', 'Ednilson', 'Sarmento', 'esarmento@unilurio.ac.mz', '$2a$10$tnwKI0nErjMCzmtoNuVDoOB2jSrP8DsC/aQsHXzo6Ee5aTZXejxWW', '2020-02-28 10:25:39', '1', null, '154', '33', '846731550', null, null, '2313', '1', '15', 'Escola Secundaria Sol de Mocambique', '1', '2020-02-26', '2020-03-02 07:46:04', '1');
INSERT INTO `user` VALUES ('1314', 'Aniceto De Carvalho', 'Massinguile', 'amassinguile@unilurio.ac.mz', '$2a$10$XX/i/VJw5qdrpRk9UAXRausAZh0UzXrP0DW8bwvGA37GIrRzSq4bS', '2020-02-28 10:26:15', '1', null, '41', '33', '849561508', null, null, '2314', '1', '14', 'Escola Secundaria 29 de Setembro', '1', '2020-02-28', '2020-03-02 07:45:53', '1');
INSERT INTO `user` VALUES ('1315', 'Aissa', 'Assane', 'auassene@unilurio.ac.mz', '$2a$10$qrdLG/N5WGlwL9V2YZEzfOrScIWvmXxgxcLjXKJTPD46KXnhWAmGy', '2020-02-28 10:27:07', '1', null, '16', '33', '855818586', null, null, '2315', '1', '15', 'Escola secundaria de Macomia', '2', '1998-05-27', '2020-03-02 07:48:59', '1');
INSERT INTO `user` VALUES ('1316', 'Quicas Chissano Mesa', 'Mesa', 'qmesa@unilurio.ac.mz', '$2a$10$F3Tjm3swrH1pRKaO0s/4Gei1v/yVYcRFrfwWW5DxkyoQJAqNJ8QoS', '2020-02-28 10:27:22', '1', null, '131', '33', '843746799', null, null, '2316', '1', '12', 'Escola secundaria de Mocuba', '1', '1996-08-05', '2020-03-02 07:49:31', '1');
INSERT INTO `user` VALUES ('1317', 'feliciana', 'manuel', 'fmanuel@unilurio.ac.mz', '$2a$10$H.MccrdTdoDyJY8w6B/9H./Dl4ULsReQt17SX4uoLXS2PxJktham6', '2020-02-28 10:30:48', '1', null, '154', '33', '846924928', null, null, '2317', '1', '13', 'ES', '2', '2020-02-12', '2020-03-02 07:45:54', '1');
INSERT INTO `user` VALUES ('1318', 'Lucia', 'Ruco', 'lruco@unilurio.ac.mz', '$2a$10$QXfH3G093Iwb6a0LsLIt4uUJZqFMthDGaDBom04u/p/XgljGIqIKy', '2020-02-28 10:31:48', '1', null, '62', '33', '876499227', null, null, '2318', '2', '19', 'jhjhbh', '2', '2020-02-04', '2020-03-02 07:46:06', '1');
INSERT INTO `user` VALUES ('1319', 'Barata', 'Barata', 'bbarata@unilurio.ac.mz', '$2a$10$cgEEA3WIzmIhq7hJKGBpwezhXs4HZ8OcbGaxJ12u229INcO5on0yW', '2020-02-28 10:32:31', '1', null, '86', '33', '845740722', null, null, '2319', '1', '11', 'Escola secundaria de Nampaco', '1', '2020-02-25', '2020-03-02 07:45:52', '1');
INSERT INTO `user` VALUES ('1320', 'soares', 'Domingos ', null, '$2a$10$xIwlbsMNgztsbr31Qp1j9Oy386pPft6andBPFSN1TsjjjdjAunwSy', '2020-03-02 07:44:36', '1', null, '131', '33', '222222222', null, null, '2320', '1', '12', 'uu', '1', '2020-02-27', '2020-03-02 07:48:20', '1');
INSERT INTO `user` VALUES ('1321', 'Clinton Maulito ', 'Uachave', 'cuachave@unilurio.ac.mz', '$2a$10$f/VpOP3eIu/ay99TfVAsa.lX.K.ClczJ4QWfA1pBxwS6lOTLFbusC', '2020-03-02 07:55:16', '1', null, '131', '33', '843679006', null, null, '2321', '1', '13', 'Escola secundaria de Mocuba', '1', '1995-03-31', '2020-03-02 07:56:30', '1');

-- ----------------------------
-- Table structure for `user_course`
-- ----------------------------
DROP TABLE IF EXISTS `user_course`;
CREATE TABLE `user_course` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `course_id` int(11) NOT NULL DEFAULT '0',
  `year` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`course_id`,`year`),
  KEY `user_course_ibfk_2` (`course_id`),
  CONSTRAINT `user_course_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_course
-- ----------------------------
INSERT INTO `user_course` VALUES ('291', '1', '2020');
INSERT INTO `user_course` VALUES ('411', '1', '2020');
INSERT INTO `user_course` VALUES ('421', '1', '2020');
INSERT INTO `user_course` VALUES ('431', '1', '2020');
INSERT INTO `user_course` VALUES ('441', '1', '2020');
INSERT INTO `user_course` VALUES ('481', '1', '2020');
INSERT INTO `user_course` VALUES ('491', '1', '2020');
INSERT INTO `user_course` VALUES ('501', '1', '2020');
INSERT INTO `user_course` VALUES ('521', '1', '2020');
INSERT INTO `user_course` VALUES ('531', '1', '2020');
INSERT INTO `user_course` VALUES ('541', '1', '2020');
INSERT INTO `user_course` VALUES ('571', '1', '2020');
INSERT INTO `user_course` VALUES ('601', '1', '2020');
INSERT INTO `user_course` VALUES ('621', '1', '2020');
INSERT INTO `user_course` VALUES ('631', '1', '2020');
INSERT INTO `user_course` VALUES ('671', '1', '2020');
INSERT INTO `user_course` VALUES ('681', '1', '2020');
INSERT INTO `user_course` VALUES ('811', '1', '2020');
INSERT INTO `user_course` VALUES ('831', '1', '2020');
INSERT INTO `user_course` VALUES ('841', '1', '2020');
INSERT INTO `user_course` VALUES ('861', '1', '2020');
INSERT INTO `user_course` VALUES ('881', '1', '2020');
INSERT INTO `user_course` VALUES ('1001', '1', '2020');
INSERT INTO `user_course` VALUES ('1081', '1', '2020');
INSERT INTO `user_course` VALUES ('1091', '1', '2020');
INSERT INTO `user_course` VALUES ('1221', '1', '2020');
INSERT INTO `user_course` VALUES ('1251', '1', '2020');
INSERT INTO `user_course` VALUES ('1261', '1', '2020');
INSERT INTO `user_course` VALUES ('1301', '1', '2020');
INSERT INTO `user_course` VALUES ('461', '2', '2020');
INSERT INTO `user_course` VALUES ('551', '2', '2020');
INSERT INTO `user_course` VALUES ('561', '2', '2020');
INSERT INTO `user_course` VALUES ('581', '2', '2020');
INSERT INTO `user_course` VALUES ('591', '2', '2020');
INSERT INTO `user_course` VALUES ('611', '2', '2020');
INSERT INTO `user_course` VALUES ('641', '2', '2020');
INSERT INTO `user_course` VALUES ('651', '2', '2020');
INSERT INTO `user_course` VALUES ('661', '2', '2020');
INSERT INTO `user_course` VALUES ('801', '2', '2020');
INSERT INTO `user_course` VALUES ('821', '2', '2020');
INSERT INTO `user_course` VALUES ('851', '2', '2020');
INSERT INTO `user_course` VALUES ('871', '2', '2020');
INSERT INTO `user_course` VALUES ('911', '2', '2020');
INSERT INTO `user_course` VALUES ('921', '2', '2020');
INSERT INTO `user_course` VALUES ('941', '2', '2020');
INSERT INTO `user_course` VALUES ('951', '2', '2020');
INSERT INTO `user_course` VALUES ('401', '3', '2020');
INSERT INTO `user_course` VALUES ('751', '3', '2020');
INSERT INTO `user_course` VALUES ('761', '3', '2020');
INSERT INTO `user_course` VALUES ('771', '3', '2020');
INSERT INTO `user_course` VALUES ('781', '3', '2020');
INSERT INTO `user_course` VALUES ('1241', '3', '2020');
INSERT INTO `user_course` VALUES ('471', '5', '2020');
INSERT INTO `user_course` VALUES ('691', '5', '2020');
INSERT INTO `user_course` VALUES ('711', '5', '2020');
INSERT INTO `user_course` VALUES ('721', '5', '2020');
INSERT INTO `user_course` VALUES ('741', '5', '2020');
INSERT INTO `user_course` VALUES ('791', '5', '2020');
INSERT INTO `user_course` VALUES ('891', '5', '2020');
INSERT INTO `user_course` VALUES ('901', '5', '2020');
INSERT INTO `user_course` VALUES ('961', '5', '2020');
INSERT INTO `user_course` VALUES ('971', '5', '2020');
INSERT INTO `user_course` VALUES ('981', '5', '2020');
INSERT INTO `user_course` VALUES ('1011', '5', '2020');
INSERT INTO `user_course` VALUES ('1021', '5', '2020');
INSERT INTO `user_course` VALUES ('1031', '5', '2020');
INSERT INTO `user_course` VALUES ('1041', '5', '2020');
INSERT INTO `user_course` VALUES ('1051', '5', '2020');
INSERT INTO `user_course` VALUES ('1061', '5', '2020');
INSERT INTO `user_course` VALUES ('1111', '5', '2020');
INSERT INTO `user_course` VALUES ('1191', '5', '2020');
INSERT INTO `user_course` VALUES ('1291', '5', '2020');
INSERT INTO `user_course` VALUES ('511', '6', '2020');
INSERT INTO `user_course` VALUES ('731', '6', '2020');
INSERT INTO `user_course` VALUES ('931', '6', '2020');
INSERT INTO `user_course` VALUES ('1201', '6', '2020');
INSERT INTO `user_course` VALUES ('271', '7', '2020');
INSERT INTO `user_course` VALUES ('1311', '7', '2020');
INSERT INTO `user_course` VALUES ('1312', '7', '2020');
INSERT INTO `user_course` VALUES ('1313', '7', '2020');
INSERT INTO `user_course` VALUES ('1314', '7', '2020');
INSERT INTO `user_course` VALUES ('1315', '7', '2020');
INSERT INTO `user_course` VALUES ('1316', '7', '2020');
INSERT INTO `user_course` VALUES ('1317', '7', '2020');
INSERT INTO `user_course` VALUES ('1318', '7', '2020');
INSERT INTO `user_course` VALUES ('1319', '7', '2020');
INSERT INTO `user_course` VALUES ('1320', '7', '2020');
INSERT INTO `user_course` VALUES ('1321', '7', '2020');

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_role_ibfk_2` (`role_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('236', '1');
INSERT INTO `user_role` VALUES ('237', '1');
INSERT INTO `user_role` VALUES ('237', '2');
INSERT INTO `user_role` VALUES ('1311', '4');
INSERT INTO `user_role` VALUES ('1312', '4');
INSERT INTO `user_role` VALUES ('1313', '4');
INSERT INTO `user_role` VALUES ('1314', '4');
INSERT INTO `user_role` VALUES ('1315', '4');
INSERT INTO `user_role` VALUES ('1316', '4');
INSERT INTO `user_role` VALUES ('1317', '4');
INSERT INTO `user_role` VALUES ('1318', '4');
INSERT INTO `user_role` VALUES ('1319', '4');
INSERT INTO `user_role` VALUES ('1320', '4');
INSERT INTO `user_role` VALUES ('1321', '4');
