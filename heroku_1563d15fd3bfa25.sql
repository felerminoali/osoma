/*
Navicat MySQL Data Transfer

Source Server         : ouloookheroku
Source Server Version : 50646
Source Host           : us-mm-dca-b7add399344a.g5.cleardb.net:3306
Source Database       : heroku_c7035568cd423c2

Target Server Type    : MYSQL
Target Server Version : 50646
File Encoding         : 65001

Date: 2020-02-05 08:56:21
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
) ENGINE=InnoDB AUTO_INCREMENT=1975 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of attempt_result
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=1504 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'Licenciatura em Contabilidade Fiscalidade e Auditoria', '1', '33');
INSERT INTO `course` VALUES ('2', 'Licenciatura em Contabilidade Fiscalidade e Auditoria', '2', '33');
INSERT INTO `course` VALUES ('3', 'Economia', '1', '33');
INSERT INTO `course` VALUES ('4', 'Economia', '2', '33');
INSERT INTO `course` VALUES ('5', 'Gestão Empresarial', '1', '33');
INSERT INTO `course` VALUES ('6', 'Gestão Empresarial', '2', '33');

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
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `exam_ibfk_2` (`university`),
  CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `exam_ibfk_2` FOREIGN KEY (`university`) REFERENCES `university` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

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
INSERT INTO `exam` VALUES ('115', '102', '2020', 'Exame de Português  (Variante A)', '3600', '20', null, null, null, '33', '1');
INSERT INTO `exam` VALUES ('116', '62', '2020', 'Exame de Inglês (Variante A)', '3600', '20', null, null, null, '33', '1');
INSERT INTO `exam` VALUES ('117', '2', '2020', 'Exame de Matemática (Variante A)', '3600', '20', null, null, null, '33', '1');
INSERT INTO `exam` VALUES ('118', '2', '2020', 'Exame de Matemática (Variante B)', '3600', '20', null, null, null, '2', '1');

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
INSERT INTO `exam_attempts` VALUES ('116', '237', '2020-02-05 06:43:25', '2020-02-05 06:42:34', '0');
INSERT INTO `exam_attempts` VALUES ('117', '237', '2020-02-05 06:53:57', '2020-02-05 06:52:33', '0');

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
  PRIMARY KEY (`id`),
  KEY `qtype` (`qtype`),
  KEY `createdby` (`createdby`),
  KEY `modifiedby` (`modifiedby`),
  KEY `exam` (`exam`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`qtype`) REFERENCES `qtype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `question_ibfk_2` FOREIGN KEY (`createdby`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `question_ibfk_3` FOREIGN KEY (`modifiedby`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `question_ibfk_4` FOREIGN KEY (`exam`) REFERENCES `exam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=398 DEFAULT CHARSET=utf8;

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
INSERT INTO `question` VALUES ('318', '115', 'A opção que melhor completa a frase “O efeito do casamento prematuro nas raparigas é nefasto, na medida em que”', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null);
INSERT INTO `question` VALUES ('319', '115', 'Segundo o texto, a decisão de as raparigas se casarem é geralmente tomada…', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null);
INSERT INTO `question` VALUES ('320', '115', 'De acordo com o texto, a informação acerca da decisão sobre o futuro das raparigas é tomada por si mesmas encontra-se no…', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null);
INSERT INTO `question` VALUES ('321', '115', 'Qual das alternativas apresenta as causas da alta taxa de prevalência dos casamentos prematuros?', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null);
INSERT INTO `question` VALUES ('322', '115', 'A informação antecedida pela expressão “Por outro lado” junta-se a que ocorre na alternativa…', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null);
INSERT INTO `question` VALUES ('323', '115', 'Que alternativa justifica adequadamente a utilização da expressão “no entanto” no enunciado “Há, no entanto, evidências de que as raparigas e os pais tomam certas escolhas”?', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null);
INSERT INTO `question` VALUES ('324', '115', 'Em Moçambique, a prática tradicional que pode afectar precoce e negativamente a vida tanto das raparigas quanto dos rapazes é:', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null);
INSERT INTO `question` VALUES ('325', '115', 'Tendo em consideração o texto, qual das opções justifica melhor a frase “Os casamentos prematuros são uma das piores violações dos direitos humanos e da criança”?', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null);
INSERT INTO `question` VALUES ('326', '115', 'Um dos efeitos do casamento prematuro nas raparigas incide sobre a educação e saúde. A opção que melhor sustenta esta afirmação é:', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null);
INSERT INTO `question` VALUES ('327', '115', 'Segundo o texto, o que origina os casos alarmantes de fístula obstétrica nas raparigas?', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null);
INSERT INTO `question` VALUES ('328', '115', 'O provável impacto para as raparigas que se sujeitam ao casamento prematuro é detalhadamente apresentado no:', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null);
INSERT INTO `question` VALUES ('329', '115', 'Conforme a informação textual, o que leva as raparigas à discriminação e ao desprezo familiar e da sociedade?', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null);
INSERT INTO `question` VALUES ('330', '115', 'O título que melhor reflecte o conteúdo do texto é:', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><b></b><strong>TEXTO:</strong></b></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Os efeitos dos casamentos prematuros nas raparigas t&ecirc;m sido alvo de investiga&ccedil;&atilde;o e profundo debate no seio dos sectores da sociedade interessados na protec&ccedil;&atilde;o dos direitos humanos das crian&ccedil;as e das raparigas. &Eacute; facto que o efeito do casamento prematuro nas raparigas &eacute; nefasto, comprometendo o futuro das raparigas no que respeita &agrave; sua sobreviv&ecirc;ncia, desenvolvimento e enquadramento na sociedade.</p>\r\n<p style=\"text-align: justify;\">O casamento prematuro prejudica a rapariga no que respeita ao acesso, perman&ecirc;ncia e conclus&atilde;o do sistema educativo. Estudos nacionais indicam que a decis&atilde;o de casar &eacute; tomada muitas vezes ou quase sempre pelos pais da menina, o que evidencia que os pais e ou parentes directos da menina continuam a exercer uma forte influ&ecirc;ncia sobre o futuro das suas filhas. H&aacute;, no entanto, evid&ecirc;ncias de que as raparigas e os pais, a fim de assegurar a sua pr&oacute;pria fam&iacute;lia ou o bem-estar e sobreviv&ecirc;ncia, tomam certas escolhas que, no final, afectam negativamente a escolaridade, a sa&uacute;de e o futuro das pr&oacute;prias raparigas. Pr&aacute;ticas culturais nocivas, onde as crian&ccedil;as s&atilde;o consideradas aptas para o casamento ap&oacute;s os ritos de inicia&ccedil;&atilde;o, tamb&eacute;m t&ecirc;m contribu&iacute;do para a alta taxa de casamentos prematuros.</p>\r\n<p style=\"text-align: justify;\">Por outro lado, a maioria dos pais que enviam os seus filhos para a escola tem um n&iacute;vel de escolaridade bastante limitado ou s&atilde;o analfabetos (em particular nas zonas rurais), significando que a sua pr&oacute;pria experi&ecirc;ncia com a escola &eacute; limitada e as suas expectativas para que os seus filhos aprendam s&atilde;o reduzidas &agrave;s compet&ecirc;ncias de base. Na vida da maioria dos pais rurais, a escola n&atilde;o &eacute;, no entanto, uma solu&ccedil;&atilde;o vi&aacute;vel e, portanto, um modo de sustentabilidade e empoderamento da fam&iacute;lia a m&eacute;dio e longo prazo. Isto significa que as meninas s&atilde;o muitas vezes impedidas de ir a escola ou uma vez l&aacute;, s&atilde;o retiradas por causa de decis&otilde;es dos seus pais relacionadas com pr&aacute;ticas culturais nocivas como o <em>lobolo</em> e o casamento for&ccedil;ado, provocando quase sempre gravidez precoce.</p>\r\n<p style=\"text-align: justify;\">Dados qualitativos relativos &agrave; viol&ecirc;ncia contra crian&ccedil;as e dispon&iacute;veis em cerca de 80 estudos realizados na &uacute;ltima d&eacute;cada em Mo&ccedil;ambique revelam que as causas apontadas para a alta preval&ecirc;ncia do casamento prematuro no pa&iacute;s s&atilde;o as pr&aacute;ticas tradicionais existentes tais como os ritos de inicia&ccedil;&atilde;o, o incesto, a poligamia, as leis costumeiras, o <em>lobolo</em>, para al&eacute;m do vazio legal na legisla&ccedil;&atilde;o nacional concernente &agrave; pr&aacute;tica dessas uni&otilde;es for&ccedil;adas. Algumas pr&aacute;ticas espec&iacute;ficas, como os ritos de inicia&ccedil;&atilde;o, por exemplo, a partir dos quais as crian&ccedil;as s&atilde;o consideradas prontas para o casamento, t&ecirc;m contribu&iacute;do de forma determinante para a alta taxa de casamentos prematuros em Mo&ccedil;ambique.</p>\r\n<p style=\"text-align: justify;\">Os casamentos prematuros s&atilde;o uma das piores formas de viola&ccedil;&atilde;o dos direitos humanos e da crian&ccedil;a, pois coloca as raparigas sob um elevado risco de viol&ecirc;ncia e de doen&ccedil;as, prejudicando todo um processo de potenciais oportunidades que as raparigas deveriam ter, privando-as dos seus direitos &agrave; sa&uacute;de, educa&ccedil;&atilde;o, desenvolvimento e igualdade de g&eacute;nero.</p>\r\n<p style=\"text-align: justify;\">As raparigas sujeitas ao casamento prematuro enfrentam uma maior probabilidade de desist&ecirc;ncia da escola, separa&ccedil;&atilde;o precoce dos progenitores, infec&ccedil;&atilde;o com doen&ccedil;as de transmiss&atilde;o sexual incluindo o HIV e SIDA, viol&ecirc;ncia dom&eacute;stica e sexual, trabalho infantil, mortalidade materna e infantil e gravidez precoce, que tem resultado em casos alarmantes de f&iacute;stula obst&eacute;trica que exp&otilde;e as raparigas &agrave; discrimina&ccedil;&atilde;o e desprezo familiar e da sociedade. O casamento prematuro, para al&eacute;m de aumentar a mortalidade materna e infantil, tem uma forte liga&ccedil;&atilde;o com a incid&ecirc;ncia da pobreza e tem um impacto negativo na produtividade nacional.</p>\r\n<p style=\"text-align: justify;\">Portanto, o casamento prematuro &eacute; uma s&eacute;ria viola&ccedil;&atilde;o dos direitos humanos, da crian&ccedil;a e da rapariga em particular:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem tido um impacto devastador na sa&uacute;de, educa&ccedil;&atilde;o, mortalidade materna e infantil, seguran&ccedil;a e demais direitos de milhares de crian&ccedil;as mo&ccedil;ambicanas, em particular raparigas;</li>\r\n<li style=\"text-align: justify;\">A cultura e as tradi&ccedil;&otilde;es s&atilde;o importantes para um povo e para uma comunidade, no entanto, quando algumas pr&aacute;ticas dentro da cultura e da tradi&ccedil;&atilde;o s&atilde;o prejudiciais, elas n&atilde;o representam os princ&iacute;pios e os valores da dignidade humana, por isso devem ser mudadas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro &eacute; uma pr&aacute;tica prejudicial que resulta em danos f&iacute;sicos, mentais e emocionais graves para as raparigas;</li>\r\n<li style=\"text-align: justify;\">O casamento prematuro tem influ&ecirc;ncia directa e negativa no alcance de pelo menos seis dos oito Objectivos de Desenvolvimento do Mil&eacute;nio e de outras pol&iacute;ticas e estrat&eacute;gias de redu&ccedil;&atilde;o da pobreza em implementa&ccedil;&atilde;o no pa&iacute;s.</li>\r\n</ul>\r\n<p style=\"text-align: center;\"><em>Coliga&ccedil;&atilde;o para a Elimina&ccedil;&atilde;o dos Casamentos Prematuros </em></p>\r\n<p style=\"text-align: center;\"><em>Texto adaptado</em></p>', null);
INSERT INTO `question` VALUES ('331', '115', 'Escolha a opção que corresponde ao discurso indirecto da frase “O casamento prematuro prejudica a rapariga”.', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('332', '115', 'A frase gramaticalmente correcta é:', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('333', '115', 'Assinale a opção que apresenta as palavras adequadas para completar as frases “Eu sinto __________ por ti” e “O ________ apropriado para o Papa se sentar comodamente é este”, respectivamente.', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('334', '115', 'As palavras gramaticalmente escritas ocorrem em:', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('335', '115', 'Os nomes que significam o conjunto de peixes e ilhas encontram-se, respectivamente, na alternativa….', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('336', '115', 'Qual das alternativas completa correctamente a frase “Se _______ o teu irmão, peço que me digas”?', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('337', '115', 'A alternativa que evita a repetição do verbo sublinhado na frase “O casamento prematuro tem uma forte ligação com a incidência da pobreza e tem um impacto negativo na produtividade nacional” é:', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('338', '116', 'The text is describing the importance of________________.', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><strong>Text:</strong></p>\r\n<p style=\"text-align: justify;\">Text message advertising is an easy way for businesses to connect with customers about sales, special promotions, or important news. It is a great way for businesses to connect with consumers about deals, promotions, upcoming events, and other offers and opportunities. It&rsquo;s also an underutilized platform of communication with lots of potential and excellent results. You may have heard of text message advertising referred to as SMS advertising. They&rsquo;re the same exact thing. SMS stands for &ldquo;Short Message Service,&rdquo; which is an industry term for a text message. According to statistical data from Innovista Law&rsquo;s April 2018 TCPA Survival Guide, 99% of text messages are opened, 90% are read within 3 minutes and 40% get a response within 15 minutes. It is believed that &nbsp;compared with email&rsquo;s 20% open rate and much lower response rates, text message advertising is one of the marketing methods that businesses should utilize for connecting with their customers and being top of mind.</p>\r\n<p style=\"text-align: justify;\">For text message advertising route, the SMS examples below should give you an idea about the direction you should take:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">VIP Pizza-20% off large pizza pie Thursday only! http://vippizza-url.here</li>\r\n<li style=\"text-align: justify;\">Invitation: Business Management Summit on Friday 01/11/2019 at 8:30AM, Grand Plaza-Nampula. Special speaker Dr. Mitha &ndash; Chairman and CEO. Open enrollment.</li>\r\n<li style=\"text-align: justify;\">Recharge with 20mts and get more talking time, just text 84211 and enjoy free talk-time every Monday.</li>\r\n</ul>', null);
INSERT INTO `question` VALUES ('339', '116', 'What is meant by the phrase “to connect with?”', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><strong>Text:</strong></p>\r\n<p style=\"text-align: justify;\">Text message advertising is an easy way for businesses to connect with customers about sales, special promotions, or important news. It is a great way for businesses to connect with consumers about deals, promotions, upcoming events, and other offers and opportunities. It&rsquo;s also an underutilized platform of communication with lots of potential and excellent results. You may have heard of text message advertising referred to as SMS advertising. They&rsquo;re the same exact thing. SMS stands for &ldquo;Short Message Service,&rdquo; which is an industry term for a text message. According to statistical data from Innovista Law&rsquo;s April 2018 TCPA Survival Guide, 99% of text messages are opened, 90% are read within 3 minutes and 40% get a response within 15 minutes. It is believed that &nbsp;compared with email&rsquo;s 20% open rate and much lower response rates, text message advertising is one of the marketing methods that businesses should utilize for connecting with their customers and being top of mind.</p>\r\n<p style=\"text-align: justify;\">For text message advertising route, the SMS examples below should give you an idea about the direction you should take:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">VIP Pizza-20% off large pizza pie Thursday only! http://vippizza-url.here</li>\r\n<li style=\"text-align: justify;\">Invitation: Business Management Summit on Friday 01/11/2019 at 8:30AM, Grand Plaza-Nampula. Special speaker Dr. Mitha &ndash; Chairman and CEO. Open enrollment.</li>\r\n<li style=\"text-align: justify;\">Recharge with 20mts and get more talking time, just text 84211 and enjoy free talk-time every Monday.</li>\r\n</ul>', null);
INSERT INTO `question` VALUES ('340', '116', 'Short Message Service  can be abbreviated as ____________________ ', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><strong>Text:</strong></p>\r\n<p style=\"text-align: justify;\">Text message advertising is an easy way for businesses to connect with customers about sales, special promotions, or important news. It is a great way for businesses to connect with consumers about deals, promotions, upcoming events, and other offers and opportunities. It&rsquo;s also an underutilized platform of communication with lots of potential and excellent results. You may have heard of text message advertising referred to as SMS advertising. They&rsquo;re the same exact thing. SMS stands for &ldquo;Short Message Service,&rdquo; which is an industry term for a text message. According to statistical data from Innovista Law&rsquo;s April 2018 TCPA Survival Guide, 99% of text messages are opened, 90% are read within 3 minutes and 40% get a response within 15 minutes. It is believed that &nbsp;compared with email&rsquo;s 20% open rate and much lower response rates, text message advertising is one of the marketing methods that businesses should utilize for connecting with their customers and being top of mind.</p>\r\n<p style=\"text-align: justify;\">For text message advertising route, the SMS examples below should give you an idea about the direction you should take:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">VIP Pizza-20% off large pizza pie Thursday only! http://vippizza-url.here</li>\r\n<li style=\"text-align: justify;\">Invitation: Business Management Summit on Friday 01/11/2019 at 8:30AM, Grand Plaza-Nampula. Special speaker Dr. Mitha &ndash; Chairman and CEO. Open enrollment.</li>\r\n<li style=\"text-align: justify;\">Recharge with 20mts and get more talking time, just text 84211 and enjoy free talk-time every Monday.</li>\r\n</ul>', null);
INSERT INTO `question` VALUES ('341', '116', 'Statistical data from Innovista Law’s April 2018 TCPA Survival Guide show that ___________ are opened.', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><strong>Text:</strong></p>\r\n<p style=\"text-align: justify;\">Text message advertising is an easy way for businesses to connect with customers about sales, special promotions, or important news. It is a great way for businesses to connect with consumers about deals, promotions, upcoming events, and other offers and opportunities. It&rsquo;s also an underutilized platform of communication with lots of potential and excellent results. You may have heard of text message advertising referred to as SMS advertising. They&rsquo;re the same exact thing. SMS stands for &ldquo;Short Message Service,&rdquo; which is an industry term for a text message. According to statistical data from Innovista Law&rsquo;s April 2018 TCPA Survival Guide, 99% of text messages are opened, 90% are read within 3 minutes and 40% get a response within 15 minutes. It is believed that &nbsp;compared with email&rsquo;s 20% open rate and much lower response rates, text message advertising is one of the marketing methods that businesses should utilize for connecting with their customers and being top of mind.</p>\r\n<p style=\"text-align: justify;\">For text message advertising route, the SMS examples below should give you an idea about the direction you should take:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">VIP Pizza-20% off large pizza pie Thursday only! http://vippizza-url.here</li>\r\n<li style=\"text-align: justify;\">Invitation: Business Management Summit on Friday 01/11/2019 at 8:30AM, Grand Plaza-Nampula. Special speaker Dr. Mitha &ndash; Chairman and CEO. Open enrollment.</li>\r\n<li style=\"text-align: justify;\">Recharge with 20mts and get more talking time, just text 84211 and enjoy free talk-time every Monday.</li>\r\n</ul>', null);
INSERT INTO `question` VALUES ('342', '116', '“Use” can mean the same as ___________ in the text.', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><strong>Text:</strong></p>\r\n<p style=\"text-align: justify;\">Text message advertising is an easy way for businesses to connect with customers about sales, special promotions, or important news. It is a great way for businesses to connect with consumers about deals, promotions, upcoming events, and other offers and opportunities. It&rsquo;s also an underutilized platform of communication with lots of potential and excellent results. You may have heard of text message advertising referred to as SMS advertising. They&rsquo;re the same exact thing. SMS stands for &ldquo;Short Message Service,&rdquo; which is an industry term for a text message. According to statistical data from Innovista Law&rsquo;s April 2018 TCPA Survival Guide, 99% of text messages are opened, 90% are read within 3 minutes and 40% get a response within 15 minutes. It is believed that &nbsp;compared with email&rsquo;s 20% open rate and much lower response rates, text message advertising is one of the marketing methods that businesses should utilize for connecting with their customers and being top of mind.</p>\r\n<p style=\"text-align: justify;\">For text message advertising route, the SMS examples below should give you an idea about the direction you should take:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">VIP Pizza-20% off large pizza pie Thursday only! http://vippizza-url.here</li>\r\n<li style=\"text-align: justify;\">Invitation: Business Management Summit on Friday 01/11/2019 at 8:30AM, Grand Plaza-Nampula. Special speaker Dr. Mitha &ndash; Chairman and CEO. Open enrollment.</li>\r\n<li style=\"text-align: justify;\">Recharge with 20mts and get more talking time, just text 84211 and enjoy free talk-time every Monday.</li>\r\n</ul>', null);
INSERT INTO `question` VALUES ('343', '116', 'The phrase “open enrollment” means...', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><strong>Text:</strong></p>\r\n<p style=\"text-align: justify;\">Text message advertising is an easy way for businesses to connect with customers about sales, special promotions, or important news. It is a great way for businesses to connect with consumers about deals, promotions, upcoming events, and other offers and opportunities. It&rsquo;s also an underutilized platform of communication with lots of potential and excellent results. You may have heard of text message advertising referred to as SMS advertising. They&rsquo;re the same exact thing. SMS stands for &ldquo;Short Message Service,&rdquo; which is an industry term for a text message. According to statistical data from Innovista Law&rsquo;s April 2018 TCPA Survival Guide, 99% of text messages are opened, 90% are read within 3 minutes and 40% get a response within 15 minutes. It is believed that &nbsp;compared with email&rsquo;s 20% open rate and much lower response rates, text message advertising is one of the marketing methods that businesses should utilize for connecting with their customers and being top of mind.</p>\r\n<p style=\"text-align: justify;\">For text message advertising route, the SMS examples below should give you an idea about the direction you should take:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">VIP Pizza-20% off large pizza pie Thursday only! http://vippizza-url.here</li>\r\n<li style=\"text-align: justify;\">Invitation: Business Management Summit on Friday 01/11/2019 at 8:30AM, Grand Plaza-Nampula. Special speaker Dr. Mitha &ndash; Chairman and CEO. Open enrollment.</li>\r\n<li style=\"text-align: justify;\">Recharge with 20mts and get more talking time, just text 84211 and enjoy free talk-time every Monday.</li>\r\n</ul>', null);
INSERT INTO `question` VALUES ('344', '116', 'On which day of the week is the Summit on Business Management? ', null, null, '2', null, null, null, null, '<p style=\"text-align: center;\"><strong>Text:</strong></p>\r\n<p style=\"text-align: justify;\">Text message advertising is an easy way for businesses to connect with customers about sales, special promotions, or important news. It is a great way for businesses to connect with consumers about deals, promotions, upcoming events, and other offers and opportunities. It&rsquo;s also an underutilized platform of communication with lots of potential and excellent results. You may have heard of text message advertising referred to as SMS advertising. They&rsquo;re the same exact thing. SMS stands for &ldquo;Short Message Service,&rdquo; which is an industry term for a text message. According to statistical data from Innovista Law&rsquo;s April 2018 TCPA Survival Guide, 99% of text messages are opened, 90% are read within 3 minutes and 40% get a response within 15 minutes. It is believed that &nbsp;compared with email&rsquo;s 20% open rate and much lower response rates, text message advertising is one of the marketing methods that businesses should utilize for connecting with their customers and being top of mind.</p>\r\n<p style=\"text-align: justify;\">For text message advertising route, the SMS examples below should give you an idea about the direction you should take:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">VIP Pizza-20% off large pizza pie Thursday only! http://vippizza-url.here</li>\r\n<li style=\"text-align: justify;\">Invitation: Business Management Summit on Friday 01/11/2019 at 8:30AM, Grand Plaza-Nampula. Special speaker Dr. Mitha &ndash; Chairman and CEO. Open enrollment.</li>\r\n<li style=\"text-align: justify;\">Recharge with 20mts and get more talking time, just text 84211 and enjoy free talk-time every Monday.</li>\r\n</ul>', null);
INSERT INTO `question` VALUES ('345', '116', 'Choose the correct option on the following Grammar questions. What __________________ that? ', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('346', '116', 'Choose the correct option on the following Grammar questions. __________________ you Portuguese?   ', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('347', '116', 'Choose the correct option on the following Grammar questions. Maria  ____________ her books on the table now. ', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('348', '116', 'Choose the correct option on the following Grammar questions. We are ____________ for our examination this week.  ', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('349', '116', 'Choose the correct option on the following Grammar questions. They ___________ in the pool at Quinta Churrasco at the moment.', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('350', '116', 'Choose the correct option on the following Grammar questions. His name ____________________ Roberto', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('351', '116', 'Choose the correct option on the following Grammar questions. Where ____________________ she from?', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('352', '116', 'Choose the correct option on the following Grammar questions.  I always keep my money ________ my bag.  ', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('353', '116', 'Choose the correct option on the following Grammar questions. The dog is sleeping _______ the carpet.  ', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('354', '116', 'Choose the correct option on the following Grammar questions. My address ______________________ 90 Central Street, London.', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('355', '116', 'Choose the correct option on the following Grammar questions. This house is quite old, it _______________ in 1960.', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('356', '116', 'Choose the correct option on the following Grammar questions. This is ______ excellent business proposal you have written.', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('357', '116', 'Choose the correct option on the following Grammar questions. I _________________ her in the library yesterday. ', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('358', '117', 'O grau do polinómio da expressão a seguir é: $$3{x^5} - 7{x^3} - {x^2} + 8$$', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('359', '117', 'O resto da divisão dos polinómios a seguir é: $$3{x^4} - {x^2} - 2\\;$$', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('360', '117', 'O conjunto solução da equação a seguir é $${x^3} + {x^2} - 6x = 0\\;$$ ', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('361', '117', 'O conjunto solução do sistema abaixo é: $$\\left\\{ {\\begin{array}{*{20}{c}}{3x + y = 5}\\\\{2x - 5y = 9}\\end{array}} \\right.$$', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('362', '117', 'Das expressões algébricas seguintes, indique a que é racional inteira.', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('363', '117', 'Sendo dados os polinómios $$A\\left( x \\right) = {x^4} - 5{x^3} + 10x - 2$$ e $$\\;B\\left( x \\right) = 2{x^4} - 5{x^3} + 10{x^2} + 8$$ Então $$B - 2A$$ será igual a: ', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('364', '117', 'Dado o polinómio $$P\\left( x \\right) = 2{x^3} - 5{x^2} - x + 5$$  $$P\\left( 2 \\right)$$ é igual:', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('365', '117', 'O domínio da seguinte expressão abaixo é: $$\\frac{{3{x^5} + 1}}{{{x^3} - 4{x^2} - 5x}}$$', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('366', '117', 'Uma das soluções da equação abaixo é: $$\\left| {x - 3} \\right| = 1$$', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('367', '117', 'A solução da inequação abaixo é: $$\\left| {x + 2} \\right| < 5$$', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('368', '117', 'O número abaixo é: $$\\frac{{6! - 4!}}{{4!}}$$', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('369', '117', 'A solução da equação abaixo é: $$C_2^n = 78$$', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('370', '117', 'Pretende-se escolher três alunos entre cinco candidatos, para formar uma comissão desportiva da escola, sem tarefas diferenciadas. De quantas maneiras diferentes é possível fazer a relação?', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('371', '117', 'É lançado um dado perfeito com as faces enumeradas de1 a 6. Qual é a probabilidade de se obter um número não inferior a 3.', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('372', '117', 'O limite da sucessão abaixo é igual: $$\\begin{array}{*{20}{c}}{\\lim }\\\\{{\\rm{n}} \\to \\infty }\\end{array}{\\left( {\\frac{{2n +3}}{{2n - 1}}} \\right)^{\\frac{{3n}}{2}}}$$', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('373', '117', 'Sendo $${a_4} = 14\\;e\\;{a_{16}} = 62$$ termos de uma progressão aritmética, então os valores do primeiro termo (a1) e a razão (d) são respectivamente:', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('374', '117', 'O limite abaixo é igual a: $$\\begin{array}{*{20}{c}}{lim}\\\\{x \\to 3\\;}\\end{array}\\frac{{{x^2} - 9}}{{{x^2} - 5x + 6}}$$', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('375', '117', 'A derivada da função abaixo é: $$f\\left( x \\right) = \\sqrt {3x - 5} $$', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('376', '117', 'A segunda derivada da função abaixo é: $$h\\left( x \\right) = {e^{ - 2x}}$$', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('377', '117', 'Os valores de x para os quais a função abaixo é decrescente são:', '/images/qa/117_377.png', null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('378', '118', 'A que frações correspondem as percentagens 4%, 24% respetivamente', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('379', '118', 'A que percentagem correspondem as fracções a seguir, respectivamente: $$\\frac{3}{{10}},\\;\\frac{4}{5},\\frac{1}{2},\\;\\frac{1}{4},\\frac{7}{{20}}$$', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('380', '118', 'Qual é a medida de lado de uma sala quadrangular cujo perímetro mede 262,8dm', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('381', '118', 'Qual é o valor numérico da expressão $$\\left( {\\frac{5}{2} - \\frac{4}{2}x\\frac{4}{3}} \\right) + 1x\\frac{5}{6}$$', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('382', '118', 'Qual é a solução da expressão $$ - 3\\sqrt 8 \\; + \\sqrt {32} $$', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('383', '118', 'Qual é o algarismo que pode substituir a letra s de modo que o número 4788s seja divisível simultaneamente por 5, 6, 9, 10 e 15', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('384', '118', 'O produto de dois números é 0,155, sabendo que um deles é 0,2. Qual é o outro número.', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('385', '118', 'Dada a progressão aritmética 12,9,6,3,0,-3,-6,…. A razão desta progressão é,', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('386', '118', 'O decimo termo da progressão do numero anterior é.', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('387', '118', 'A soma dos 9 primeiros termos da progressão do numero 8  é.', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('388', '118', 'O termo geral da progressão do numero 8 é.', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('389', '118', 'A peça de um pano que o caixa mediu tinha 25,6m. Para quantos vestidos dará se cada vestido necessitar de 3,2m?', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('390', '118', 'Custando cada metro 38,5mt, por quanto ficará o pano de cada vestido?', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('391', '118', 'Um dado rectângulo tem 84cm de perímetro. Sabendo que o comprimento tem o dobro da largura. O comprimento e a largura são:', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('392', '118', 'Dividiu-se por seis herdeiros uma propriedade de forma rectangular que tinha 400m de comprimento e 300m de largura. Qual foi a área locado a cada herdeiro.', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('393', '118', 'Indique o quarto termo da progressão geométrica em que: $${a_1} = \\; - 3\\;e\\;q = 2.$$', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('394', '118', 'Indique o valor do $$\\mathop {{\\rm{lim}}}\\limits_{x \\to 0} \\frac{{{e^x} - {e^{5x}}}}{{2x}}$$', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('395', '118', 'A derivada da função abaixo é: $$f\\left( x \\right) = \\sqrt {3x - 5} $$', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('396', '118', 'A segunda derivada da função abaixo  é: $$h\\left( x \\right) = {e^{ - 2x}}$$', null, null, '2', null, null, null, null, null, null);
INSERT INTO `question` VALUES ('397', '118', 'Os valores de x para os quais a função abaixo é decrescente são:', '/images/qa/118_397.png', null, '2', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'ADMIN');
INSERT INTO `role` VALUES ('2', 'USER');
INSERT INTO `role` VALUES ('3', 'PREREGISTED');

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
  `email` varchar(255) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('236', 'Dario', 'Mario', 'felasbe@hotmail.com', '$2a$10$1DI/wpMmgCi/TPC0BoNL9O9Y9u.rLixWPNbn/bH7V7JbdKSAQoPyy', '2019-10-09 19:37:52', '1', null, '1', '2', '825407883', '1576', null, null, '1', '11', 'ESN', '1', '2020-01-21', null, '0');
INSERT INTO `user` VALUES ('237', 'Teste', 'Teste', 'osoma.mz@gmail.com', '$2a$10$5.R2WHIolwyY6CRCEs0llOiKfmCOIUeVYDMFeFzVY4RJVXxCA96eW', '2020-01-13 13:11:13', '1', null, '66', '2', '846689637', '1057', null, null, '1', '15', 'lllll', '1', '2020-01-21', null, '0');

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
