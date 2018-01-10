/*
Navicat MySQL Data Transferfacturacliente

Source Server         : MariaDBLenovo
Source Server Version : 50505
Source Host           : 127.0.0.1:3307
Source Database       : prueba

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-19 18:24:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cliente
-- ----------------------------
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text DEFAULT NULL,
  `cedula` varchar(10) DEFAULT '',
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cliente
-- ----------------------------
INSERT INTO `cliente` VALUES ('2', 'MARIO PALOMO', '1724395536');
INSERT INTO `cliente` VALUES ('3', 'JUAN CAZAREZ', '1755632547');

-- ----------------------------
-- Table structure for detalle_factura
-- ----------------------------
DROP TABLE IF EXISTS `detalle_factura`;
CREATE TABLE `detalle_factura` (
  `idDetalleFactura` int(11) NOT NULL AUTO_INCREMENT,
  `idProducto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `idFactura` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDetalleFactura`),
  KEY `pro_id` (`idProducto`),
  KEY `fac_id` (`idFactura`),
  CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `detalle_factura_ibfk_2` FOREIGN KEY (`idFactura`) REFERENCES `factura` (`idFactura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of detalle_factura
-- ----------------------------

-- ----------------------------
-- Table structure for factura
-- ----------------------------
DROP TABLE IF EXISTS `factura`;
CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL AUTO_INCREMENT,
  `numeroFactura` varchar(50) DEFAULT '',
  `fecha` date DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `iva` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFactura`),
  KEY `cli_id` (`idCliente`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of factura
-- ----------------------------

-- ----------------------------
-- Table structure for producto
-- ----------------------------
DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(10) DEFAULT '',
  `stock` int(11) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of producto
-- ----------------------------
facturafactura