/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50145
Source Host           : localhost:3306
Source Database       : hrms

Target Server Type    : MYSQL
Target Server Version : 50145
File Encoding         : 65001

Date: 2011-05-30 14:14:30
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `action`
-- ----------------------------
DROP TABLE IF EXISTS `action`;
CREATE TABLE `action` (
  `actionId` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(45) NOT NULL,
  PRIMARY KEY (`actionId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of action
-- ----------------------------
INSERT INTO action VALUES ('1', '浏览');
INSERT INTO action VALUES ('2', '创建');
INSERT INTO action VALUES ('3', '更新');
INSERT INTO action VALUES ('4', '删除');
INSERT INTO action VALUES ('5', '审批');
INSERT INTO action VALUES ('6', '其他');

-- ----------------------------
-- Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `deptId` int(11) NOT NULL AUTO_INCREMENT,
  `deptName` varchar(50) NOT NULL,
  `deptResponsibility` varchar(250) DEFAULT NULL,
  `parentDeptId` int(11) DEFAULT NULL,
  `deptMan` varchar(45) DEFAULT NULL,
  `deptTel` varchar(45) DEFAULT NULL,
  `remark` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`deptId`),
  KEY `fk_dept_parentDeptId` (`parentDeptId`),
  CONSTRAINT `fk_dept_parentDeptId` FOREIGN KEY (`parentDeptId`) REFERENCES `dept` (`deptId`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO dept VALUES ('1', '懂事会', '公司最高机构', null, '杰哥', '123456', '');
INSERT INTO dept VALUES ('3', '总裁', '总裁', '1', '杰哥', '123456', '');
INSERT INTO dept VALUES ('4', '总裁办', '公司总裁办', '3', '杰哥', '123456', '');
INSERT INTO dept VALUES ('5', '人力资源部', '人力资源管理', '4', '杰哥', '123456', '');
INSERT INTO dept VALUES ('6', '行政部', '公司行政管理', '4', '杰哥', '123456', '');
INSERT INTO dept VALUES ('7', '财务部', '财务管理机构', '4', '杰哥', '123456', '');
INSERT INTO dept VALUES ('12', '生产部', '管理生产', '4', '杰哥', '123456', '管理生产');
INSERT INTO dept VALUES ('16', '资财部', '财务管理', '3', '杰哥', '123456', '');
INSERT INTO dept VALUES ('17', '行政部', '行政管理', null, '杰哥', '123456', '');
INSERT INTO dept VALUES ('18', '研发部', '产品研发', '3', '杰哥', '123456', '');
INSERT INTO dept VALUES ('19', '财务部', '管理财务', '16', '杰哥', '123456', '');
INSERT INTO dept VALUES ('20', '采购部', '物品采购', '16', '杰哥', '123456', '');
INSERT INTO dept VALUES ('21', '采购组', '采购物品', '20', '杰哥', '123456', '');
INSERT INTO dept VALUES ('22', '市场部', '市场开发', '24', '杰哥', '123456', '');
INSERT INTO dept VALUES ('23', '销售部', '市场销售', '24', '杰哥', '123456', '');
INSERT INTO dept VALUES ('24', '营销事业部', '市场营销', '1', '杰哥', '123456', '');
INSERT INTO dept VALUES ('25', '生产一部', '管理生产一部', '12', '杰哥', '123456', '');
INSERT INTO dept VALUES ('26', '生产二部', '管理生产二部', '12', '杰哥', '123456', '');
INSERT INTO dept VALUES ('27', '生产三部', '管理生产三部', '12', '杰哥', '123456', '');
INSERT INTO dept VALUES ('28', '物流部', '物流运载', '22', '杰哥', '123456', '');
INSERT INTO dept VALUES ('29', '开发', '开发', '12', 'djj', '123456', '开发');
INSERT INTO dept VALUES ('30', '美女组', '121231', '5', 'djj', '123123', '撒打开方式大幅');
INSERT INTO dept VALUES ('31', '渠道部', '渠道、网银开发', '3', '戴竣杰', '123456', '');

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `empId` int(11) NOT NULL AUTO_INCREMENT,
  `empName` varchar(45) NOT NULL,
  `empSex` varchar(45) DEFAULT NULL,
  `empBirthday` date DEFAULT NULL,
  `empIdNumber` varchar(50) DEFAULT NULL,
  `empAddress` varchar(100) DEFAULT NULL,
  `empTel` varchar(30) DEFAULT NULL,
  `empEmail` varchar(50) DEFAULT NULL,
  `empQQ` varchar(30) DEFAULT NULL,
  `empNational` varchar(50) DEFAULT NULL,
  `empNativePlace` varchar(45) DEFAULT NULL,
  `empMarriage` varchar(50) DEFAULT NULL,
  `empPoliticalVisage` varchar(50) DEFAULT NULL,
  `empPhoto` varchar(200) DEFAULT NULL,
  `empEducation` varchar(100) DEFAULT NULL,
  `empDegree` varchar(45) DEFAULT NULL,
  `empGraduationSchool` varchar(100) DEFAULT NULL,
  `empGraduationDate` date DEFAULT NULL,
  `empSpeciality` varchar(50) DEFAULT NULL,
  `empBankName` varchar(50) DEFAULT NULL,
  `empBankNumber` varchar(50) DEFAULT NULL,
  `empAccessionDate` datetime DEFAULT NULL,
  `empDimissionDate` date DEFAULT NULL,
  `empWorkStateId` int(11) DEFAULT NULL,
  `empTitle` varchar(100) DEFAULT NULL,
  `empWage` float DEFAULT NULL,
  `deptId` int(11) DEFAULT NULL,
  `postId` int(11) DEFAULT NULL,
  `remark` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`empId`),
  KEY `fk_employee_deptId` (`deptId`),
  KEY `fk_employee_postId` (`postId`),
  KEY `fk_employee_workStateId` (`empWorkStateId`),
  CONSTRAINT `fk_employee_deptId` FOREIGN KEY (`deptId`) REFERENCES `dept` (`deptId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_postId` FOREIGN KEY (`postId`) REFERENCES `post` (`postId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_workStateId` FOREIGN KEY (`empWorkStateId`) REFERENCES `employee_state` (`employeeStateId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO employee VALUES ('1', '杰哥', '男', '1987-10-18', '123456', '赣州', '123456', 'dai_junjie@163.com', '329258829', '汉', '福建', '未婚', '清白', null, '本科', '学士', '赣南师范学院', '2011-06-01', '网络工程', null, null, null, null, '1', '工程师', '0', '3', '1', '没有');
INSERT INTO employee VALUES ('2', '阿萨德', '男', '2011-01-11', '23542134545', '是短发是', '1223434', '是短发是', null, '是短发是', '', '是短发是', '是短发是', null, '是短发是', '是短发是', '是短发是', '2011-01-24', '是短发是', null, null, null, null, '7', '是短发是', '0', '25', '6', '是短发是');
INSERT INTO employee VALUES ('3', '戴竣杰', '男', '2011-01-04', '1232332', '赣州', '123322332', 'dai_junjie@163.com', '329258829', '汉', '福建', '未婚', '团员', null, '本科', '学士', '赣南师范学院', '2011-01-04', '网络工程', null, null, null, null, '1', '软件设计师', '0', '3', '6', '啊啊');
INSERT INTO employee VALUES ('6', '方国素', '女', '2011-01-12', '1232332', '赣州', '123322332', 'dai_junjie@163.com', '329258829', '汉', '福建', '未婚', '团员', null, '本科', '学士', '赣南师范学院', '2011-01-18', '网络工程', null, null, null, null, '3', '软件设计师', '0', '27', '2', '啊啊');
INSERT INTO employee VALUES ('8', '陈学敏', '男', '2011-01-04', '132132131', '赣州', '232323', 'asdkfasdf@16.com', '2340230', '汉', '江西', '未婚', '团员', null, '本科', '学士', '赣南师范学院', '2011-01-04', '网络工程', null, null, null, null, '1', '管理员', '0', '4', '4', '撒了点发生大幅');
INSERT INTO employee VALUES ('9', '魔', '女', '2011-01-13', '32323434343', 'sadflkj', '2342355', 'sdfgsdg', '423232323', 'sadfkj', 'sadfj', 'wei', 'sadfj', null, 'sdflkj', 'sdljfl', 'skdjfkl', '2011-01-21', 'fksadjl', null, null, null, null, '2', 'sadlkjfl', '0', '28', '2', 'alsdjfaksljdflasdfjl');
INSERT INTO employee VALUES ('10', '尹美', '女', '2011-01-26', '2309782300239', '撒的发生的', '123091093', 'saldkfjask.com', '129387132', '汉', '赣州', '未婚', '党员', null, '本科', '学士', '赣南', '2011-01-26', '数学', null, null, null, null, '1', '美工', '0', '3', '2', '撒了的房间奥斯');
INSERT INTO employee VALUES ('11', '撒地方', '男', '2011-01-27', '123243453535', 'gg', '1234554', 'sdfgsdfg', '34513245', 'gg', 'gg', 'sergfser', 'sdfadsf', null, 'asdf', 'asdf', 'asdf', '2011-01-29', 'asdf', null, null, null, null, '7', 'qewrtwe', '0', '27', '2', 'sdfgds');
INSERT INTO employee VALUES ('13', '魔道', '男', '2011-01-13', '23523423432', 'sadfasdf', '1231232', 'sadfasfd', '2343243', 'asdfdsaf', 'sadfasd', 'sdfasd', 'asdfasd', null, 'asdfasd', 'asdfasf', 'asdfsaf', '2011-01-27', 'asdfdsaf', null, null, null, null, '3', 'asefasdf', '0', '17', '4', 'asdfasdf');
INSERT INTO employee VALUES ('14', '斗战胜佛', '女', '2011-01-28', '23523423432', 'sadfasdf', '1231232', 'sadfasfd', '2343243', 'asdfdsaf', 'sadfasd', 'sdfasd', 'asdfasd', null, 'asdfasd', 'asdfasf', 'asdfsaf', '2011-01-28', 'asdfdsaf', null, null, null, null, '4', 'asefasdf', '0', '21', '4', 'asdfasdf');
INSERT INTO employee VALUES ('15', '国防生', '女', '2011-01-12', '23523423432', 'sadfasdf', '1231232', 'sadfasfd', '2343243', 'asdfdsaf', 'sadfasd', 'sdfasd', 'asdfasd', null, 'asdfasd', 'asdfasf', 'asdfsaf', '2011-01-22', 'asdfdsaf', null, null, null, null, '6', 'asefasdf', '0', '3', '4', 'asdfasdf');
INSERT INTO employee VALUES ('16', '打发', '男', '2011-01-07', '23523423432', 'sadfasdf', '123456789', 'sadfasfd', '2343243', 'asdfdsaf', 'sadfasd', 'sdfasd', 'asdfasd', null, 'asdfasd', 'asdfasf', 'asdfsaf', '2010-12-26', 'asdfdsaf', null, null, null, null, '8', 'd', '0', '4', '3', 'asdfasdf');
INSERT INTO employee VALUES ('17', '这些', '男', '2011-01-07', '23523423432', 'sadfasdf', '1234567890', 'sadfasfd', '2343243', 'asdfdsaf', 'sadfasd', 'sdfasd', 'asdfasd', null, 'asdfasd', 'asdfasf', 'asdfsaf', '2010-12-26', 'asdfdsaf', null, null, null, null, '8', 'd', '0', '4', '3', 'asdfasdf');
INSERT INTO employee VALUES ('18', '乐乐', '男', '2011-01-07', '23523423432', 'sadfasdf', '1234567890', 'sadfasfd', '2343243', 'asdfdsaf', 'sadfasd', 'sdfasd', 'asdfasd', null, 'asdfasd', 'asdfasf', 'asdfsaf', '2010-12-26', 'asdfdsaf', null, null, null, null, '8', 'd', '0', '4', '3', 'asdfasdf');
INSERT INTO employee VALUES ('19', '亲戚', '男', '2011-01-26', '28937238', 'asdflkjl', '1234567890', '324234df', '1234567890', 'asldkfj', 'asdfkj', 'saldfk', 'asdflk', null, 'saldfk', 'aslkjdf', 'lkdsafj', '2011-01-26', 'ldksafj', null, null, null, null, '6', 'sadfsadf', '0', '26', '3', 'dfgsdg');
INSERT INTO employee VALUES ('20', '慢慢', '男', '2011-01-26', 'lksadfj', 'asldkfj', '2938764', 'asdkfjh', '8909873754918327', 'sadkljfl', 'sdlakjf', 'lskadjf', 'sadklfj', null, 'lasdfj', 'dlksafj', 'asldkfj', '2011-01-26', 'lksadfj', null, null, null, null, '1', 'asd', '0', '1', '1', 'klasdf');
INSERT INTO employee VALUES ('21', '那你', '男', '2011-01-26', 'lksadfj', 'asldkfj', '123456789012345678901234567890', 'asdkfjh', '8909873754918327', 'sadkljfl', 'sdlakjf', 'lskadjf', 'sadklfj', null, 'lasdfj', 'dlksafj', 'asldkfj', '2011-01-26', 'lksadfj', null, null, null, null, '1', 'asd', '0', '1', '1', 'klasdf');
INSERT INTO employee VALUES ('22', '问问', '男', '2011-01-26', 'lksadfj', 'asldkfj', '0123456789012345678901', 'asdkfjh', '8909873754918327', 'sadkljfl', 'sdlakjf', 'lskadjf', 'sadklfj', null, 'lasdfj', 'dlksafj', 'asldkfj', '2011-01-26', 'lksadfj', null, null, null, null, '1', 'asd', '0', '1', '1', 'klasdf');
INSERT INTO employee VALUES ('23', '汪汪', '男', '2011-01-26', 'lksadfj', 'asldkfj', '0123456789012345678901', 'asdkfjh', '8909873754918327', 'sadkljfl', 'sdlakjf', 'lskadjf', 'sadklfj', null, 'lasdfj', 'dlksafj', 'asldkfj', '2011-01-26', 'lksadfj', null, null, null, null, '1', 'asd', '0', '1', '1', 'klasdf');
INSERT INTO employee VALUES ('24', '屁屁', '男', '2011-01-21', 'lkasdfj', 'kasjdfl', '293872-38987', 'skaldfj', '89q1374', 'lksadfj', 'slakdfj', 'asdfasf', 'asdfjl', null, 'kasjdfh', 'kasjdhf', 'asjkdfh', '2011-01-26', 'aslkdfj', null, null, null, null, '1', 'asfd', '0', '29', '1', 'asldfjlajf');
INSERT INTO employee VALUES ('26', '哦哦', '女', '2011-01-14', 'lsjakdfh', 'lksadfj', '28934723097', '8923749', '8239749', 'sakjdfh', 'sadkfjl', 'asdfl', 'lsakdfj', null, 'lkasjkdf', 'lkasdfj', 'lksadfj', '2011-01-26', 'asdkjf', null, null, null, null, '1', 'asdf', '0', '1', '1', 'sladifjkl');
INSERT INTO employee VALUES ('27', '爱上', '女', '2011-02-09', '2374209837', 'sdfa', '2323233', 'saldkjf', '239203323', 'skaljdf', 'asdfjl', 'sdalkf', 'asj', null, 'asdlkj', 'slkadjf', 'sdljkaf', '2011-02-09', 'sjdkl', null, null, null, null, '1', 'sadf', '0', '1', '1', 'asdfasd');
INSERT INTO employee VALUES ('28', '看看', '男', '2011-02-09', '2323098203', '离圣诞节', '203909', '23lsdkjf', '239290937', '加快了撒打发', '就算了将大幅', '撒离开的肌肤', '离开撒旦就', null, '束带结发', '街道口四六级', '撒娇的', '2011-02-09', '圣诞节', null, null, null, null, '1', 'sdfasd', '0', '29', '4', 'sdfasdasd');
INSERT INTO employee VALUES ('29', '', '男', null, '', '', '', '', '', '', '', '', '', null, '', '', '', null, '', null, null, null, null, null, '', '0', null, null, '');
INSERT INTO employee VALUES ('30', '', '男', null, '', '', '', '', '', '', '', '', '', null, '', '', '', null, '', null, null, null, null, null, '', '0', null, null, '');
INSERT INTO employee VALUES ('31', '1', '男', null, '11111111', '1', '', '', '', '1', '1', '', '', null, '', '', '', null, '', null, null, null, null, null, '', '0', null, null, '');
INSERT INTO employee VALUES ('32', '', '男', null, '', '', '', '', '', '', '', '', '', null, '', '', '', null, '', null, null, null, null, null, '', '0', null, null, '');
INSERT INTO employee VALUES ('33', 'jj', '男', '2010-11-11', '2309782300239', 'jj', '1234567', 'asdf@134.com', '124312321', 'jj', 'jj', '', '', null, 'be', 'sdf', 'sdfsad', '2011-01-12', 'sadfds', null, null, null, null, '1', '', '0', '27', '3', 'sdfsdsad');
INSERT INTO employee VALUES ('34', 'oo', '男', '2011-01-01', '2309782300239', 'ooo', '1234567', 'sdf@sdf.com', '1234567', 'oo', 'ooo', '12312', '', null, 'sad', 'sadf', 'sd', null, 'sad', null, null, null, null, '1', '345345', '0', '25', '3', 'sadfasdasdf');

-- ----------------------------
-- Table structure for `employee_redeploy`
-- ----------------------------
DROP TABLE IF EXISTS `employee_redeploy`;
CREATE TABLE `employee_redeploy` (
  `redeployId` int(11) NOT NULL AUTO_INCREMENT,
  `empId` int(11) NOT NULL,
  `applyDate` date DEFAULT NULL,
  `applyPerson` varchar(45) DEFAULT NULL,
  `redeployDate` date DEFAULT NULL,
  `deployDept` varchar(45) DEFAULT NULL,
  `deployPost` varchar(45) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `redeployDeptId` int(11) DEFAULT NULL,
  `redeployPostId` int(11) DEFAULT NULL,
  `redeployTypeId` int(11) NOT NULL,
  `transactor` varchar(45) DEFAULT NULL,
  `transactorOption` text,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`redeployId`),
  KEY `fk_employeeRedeploy_empId` (`empId`),
  KEY `fk_employeeRedeploy_redeployDeptId` (`redeployDeptId`),
  KEY `fk_employeeRedeploy_redeployPostId` (`redeployPostId`),
  KEY `fk_employeeRedeploy_redeployTypeId` (`redeployTypeId`),
  CONSTRAINT `fk_employeeRedeploy_empId` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employeeRedeploy_redeployDeptId` FOREIGN KEY (`redeployDeptId`) REFERENCES `dept` (`deptId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employeeRedeploy_redeployPostId` FOREIGN KEY (`redeployPostId`) REFERENCES `post` (`postId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employeeRedeploy_redeployTypeId` FOREIGN KEY (`redeployTypeId`) REFERENCES `redeploy_type` (`redeployTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of employee_redeploy
-- ----------------------------
INSERT INTO employee_redeploy VALUES ('1', '1', '2011-01-01', '', '2010-01-05', '开发部', '软件设计师', null, '3', '6', '1', null, null, '已提交');
INSERT INTO employee_redeploy VALUES ('2', '2', '2011-01-29', '', null, '生产一部', '生产副总', null, '1', '2', '3', '', null, '已提交');
INSERT INTO employee_redeploy VALUES ('3', '9', '2011-01-29', '戴总', null, '物流部', '副经理', '更改', '6', '4', '4', null, null, '已提交');
INSERT INTO employee_redeploy VALUES ('4', '9', '2011-01-29', '戴总', null, '物流部', '副经理', '更改', '6', '4', '4', null, null, '已提交');
INSERT INTO employee_redeploy VALUES ('5', '13', '2011-01-29', '警方规划局', null, '行政部', '营销部经理', '放放风', null, null, '6', null, null, '已提交');
INSERT INTO employee_redeploy VALUES ('6', '15', '2011-01-29', '说的', null, '生产部', '营销部经理', '阿德说', '7', '4', '5', null, null, '已提交');
INSERT INTO employee_redeploy VALUES ('8', '19', '2011-11-02', 'kklkk', null, '生产二部', '市场部经理', 'jkhkjkk', '18', '3', '7', null, null, '已提交');
INSERT INTO employee_redeploy VALUES ('10', '3', '2011-11-08', 'adsfads', null, '开发部', '生产副总', 'saerfa', '5', '5', '5', null, null, '已提交');
INSERT INTO employee_redeploy VALUES ('11', '3', '2011-11-08', 'adsfads', null, '开发部', '生产副总', 'saerfa', '5', '5', '5', null, null, '已提交');
INSERT INTO employee_redeploy VALUES ('12', '3', '2011-11-08', 'adsfads', null, '开发部', '生产副总', 'saerfa', '5', '5', '5', null, null, '已提交');
INSERT INTO employee_redeploy VALUES ('13', '3', '2011-11-08', 'aaa', null, '开发部', '生产副总', 'fff', '1', '5', '9', null, null, '未提交');
INSERT INTO employee_redeploy VALUES ('14', '3', '2011-11-17', 'lll', null, '开发部', '生产副总', 'kkk', '3', '1', '3', 'admin', '阿斯顿发生的', '审批中');
INSERT INTO employee_redeploy VALUES ('15', '3', '2011-11-08', 'adsfads', null, '开发部', '生产副总', 'll', '5', '5', '5', 'admin', '刚刚', '审批中');
INSERT INTO employee_redeploy VALUES ('16', '3', '2011-11-08', 'hhh', null, '开发部', '生产副总', 'hhh', '5', '5', '2', null, null, '未提交');
INSERT INTO employee_redeploy VALUES ('18', '3', '2011-11-08', 'hhh', null, '开发部', '生产副总', 'hhh', '5', '5', '2', null, null, '未提交');
INSERT INTO employee_redeploy VALUES ('19', '3', '2011-11-08', 'hhh', null, '开发部', '生产副总', 'hhh', '5', '5', '2', '戴竣杰', null, '未提交');
INSERT INTO employee_redeploy VALUES ('21', '3', '2011-11-08', 'hhh', null, '开发部', '生产副总', 'jjj', '5', '5', '2', 'asdfdasf', null, '未提交');
INSERT INTO employee_redeploy VALUES ('22', '3', '2011-11-08', 'hhh', null, '开发部', '生产副总', 'jjj', '5', '5', '4', '尹', null, '未提交');
INSERT INTO employee_redeploy VALUES ('23', '3', '2011-11-08', 'hhh', null, '开发部', '生产副总', 'dddd', '12', '5', '7', 'rq', '可以', '未提交');
INSERT INTO employee_redeploy VALUES ('25', '10', '2011-11-10', '尹', '2011-04-15', '办公室', '副经理', 'dfasdf', '5', '1', '1', 'admin', '同意', '同意');
INSERT INTO employee_redeploy VALUES ('32', '8', '2011-11-10', 'assasa', null, '人事部', '营销部经理', 'sca', '4', '4', '3', null, null, '未提交');
INSERT INTO employee_redeploy VALUES ('35', '27', '2011-03-29', 'admin', null, '办公室', '总经理', 'asdfa', '7', '6', '5', '陈学敏', '不能决定', '已报送');
INSERT INTO employee_redeploy VALUES ('37', '27', '2011-04-15', 'sadfasdf', null, '办公室', '总经理', 'sdfasdf', '4', '2', '2', '戴竣杰', '同意', '已报送');
INSERT INTO employee_redeploy VALUES ('38', '27', '2011-04-12', 'ADMIN', null, '办公室', '总经理', '阿SDFSDFAF', '12', '4', '1', 'admin', null, '审批中');
INSERT INTO employee_redeploy VALUES ('39', '1', '2011-04-22', '杰哥', null, '人力资源部', '总经理', 'asdfasdsad', '7', '4', '4', 'admin', null, '未提交');
INSERT INTO employee_redeploy VALUES ('40', '1', '2011-05-02', '杰哥', null, '人力资源部', '总经理', '爱的发声', '16', '5', '9', '杰哥', null, '审批中');
INSERT INTO employee_redeploy VALUES ('41', '34', '2011-05-20', 'oo', null, '生产一部', '市场部经理', '额外发热无法', '5', '3', '1', '杰哥', null, '已提交');

-- ----------------------------
-- Table structure for `employee_state`
-- ----------------------------
DROP TABLE IF EXISTS `employee_state`;
CREATE TABLE `employee_state` (
  `employeeStateId` int(11) NOT NULL AUTO_INCREMENT,
  `employeeState` varchar(45) DEFAULT NULL,
  `remark` text,
  PRIMARY KEY (`employeeStateId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of employee_state
-- ----------------------------
INSERT INTO employee_state VALUES ('1', '在职', null);
INSERT INTO employee_state VALUES ('2', '离职', null);
INSERT INTO employee_state VALUES ('3', '返聘', null);
INSERT INTO employee_state VALUES ('4', '退休', null);
INSERT INTO employee_state VALUES ('5', '留职查看', null);
INSERT INTO employee_state VALUES ('6', '停薪留职', null);
INSERT INTO employee_state VALUES ('7', '试用期', null);
INSERT INTO employee_state VALUES ('8', '试用延长期', null);

-- ----------------------------
-- Table structure for `jobseeker`
-- ----------------------------
DROP TABLE IF EXISTS `jobseeker`;
CREATE TABLE `jobseeker` (
  `jobSeekerId` int(11) NOT NULL AUTO_INCREMENT,
  `recruitId` int(11) NOT NULL,
  `jobSeekerName` varchar(10) NOT NULL,
  `jobSeekerSex` varchar(5) NOT NULL,
  `jobSeekerGraduationSchool` varchar(30) DEFAULT NULL,
  `jobSeekerEducation` varchar(10) DEFAULT NULL,
  `jobSeekerTel` varchar(20) NOT NULL,
  `jobSeekerEmail` varchar(30) DEFAULT NULL,
  `jobSeekerRegistrationForm` varchar(500) DEFAULT NULL,
  `jobSeekerResume` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`jobSeekerId`),
  KEY `fk_joobSeeker_recruitId` (`recruitId`),
  CONSTRAINT `fk_joobSeeker_recruitId` FOREIGN KEY (`recruitId`) REFERENCES `recruit` (`recruitId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of jobseeker
-- ----------------------------
INSERT INTO jobseeker VALUES ('1', '3', '李伟', '男', '赣南师范学院', '本科', '123456', 'liwei@163.com', '20114211624843-29958655886912501261李伟registrationForm.doc', '2011421162484344623396012917783091李伟resume.doc');
INSERT INTO jobseeker VALUES ('2', '3', '陆毅', '男', '清华大学', '本科', '123456', 'ly@163.com', '20114211630281-61035574307658767942陆毅registrationForm.doc', '20114211630281-68685887650014779562陆毅resume.doc');
INSERT INTO jobseeker VALUES ('3', '3', '刘明明', '男', '北京大学', '本科', '123456', 'lmm@163.com', '20114211637171-34009499545282040413刘明明registrationForm.doc', '');

-- ----------------------------
-- Table structure for `leave`
-- ----------------------------
DROP TABLE IF EXISTS `leave`;
CREATE TABLE `leave` (
  `leaveId` int(11) NOT NULL AUTO_INCREMENT,
  `applyPerson` varchar(20) NOT NULL,
  `applyDept` varchar(20) NOT NULL,
  `applyDate` date NOT NULL,
  `applyReason` varchar(250) DEFAULT NULL,
  `leaveTypeId` int(11) DEFAULT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `leaveTime` varchar(20) DEFAULT NULL,
  `approveDate` date DEFAULT NULL,
  `approver` varchar(20) DEFAULT NULL,
  `approveResult` varchar(10) DEFAULT NULL,
  `approveOption` varchar(250) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`leaveId`),
  KEY `fk_leave_leaveTypeId` (`leaveTypeId`),
  CONSTRAINT `fk_leave_leaveTypeId` FOREIGN KEY (`leaveTypeId`) REFERENCES `leavetype` (`leaveTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of leave
-- ----------------------------
INSERT INTO leave VALUES ('1', '杰哥', '人力资源部', '2011-04-28', '回校论文答辩', '1', '2011-05-16 18:24:53', '2011-06-24 18:25:07', '2011-04-27 18:26:33', '2011-04-28', '杰哥', '同意', 'asd发', '审批完毕');
INSERT INTO leave VALUES ('2', '杰哥', '人力资源部', '2011-04-28', '宿舍撒', '3', '2011-04-28 00:00:00', '2011-04-29 00:00:00', null, '2011-04-28', null, null, '', '待审批');
INSERT INTO leave VALUES ('3', '杰哥', '人力资源部', '2011-04-28', '啊来萨达收到', '4', '2011-04-29 00:00:00', '2011-04-30 00:00:00', null, '2011-04-28', '戴竣杰', null, null, '待审批');
INSERT INTO leave VALUES ('4', '杰哥', '人力资源部', '2011-05-02', '阿斯顿发生的', '1', '2011-05-27 00:00:00', '2011-06-10 00:00:00', null, '2011-05-02', '杰哥', '同意', '可以', '已审批');
INSERT INTO leave VALUES ('5', 'oo', '生产一部', '2011-05-20', 'wefasdasd', '1', '2011-11-01 00:00:00', '2011-12-23 00:00:00', null, '2011-05-20', '杰哥', '同意', 'sadfsdfsd', '审批完毕');

-- ----------------------------
-- Table structure for `leavetype`
-- ----------------------------
DROP TABLE IF EXISTS `leavetype`;
CREATE TABLE `leavetype` (
  `leaveTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `leaveType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`leaveTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of leavetype
-- ----------------------------
INSERT INTO leavetype VALUES ('1', '事假');
INSERT INTO leavetype VALUES ('2', '病假');
INSERT INTO leavetype VALUES ('3', '婚假');
INSERT INTO leavetype VALUES ('4', '产假');
INSERT INTO leavetype VALUES ('5', '丧假');
INSERT INTO leavetype VALUES ('6', '年假');
INSERT INTO leavetype VALUES ('7', '看护假');
INSERT INTO leavetype VALUES ('8', '调休假');
INSERT INTO leavetype VALUES ('9', '奖励假');
INSERT INTO leavetype VALUES ('10', '其他');

-- ----------------------------
-- Table structure for `module`
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `moduleId` int(11) NOT NULL AUTO_INCREMENT,
  `moduleName` varchar(45) NOT NULL,
  `moduleOrderNum` varchar(45) NOT NULL,
  `linkUrl` varchar(250) DEFAULT NULL,
  `parentModuleId` int(11) NOT NULL,
  `moduleDescription` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`moduleId`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO module VALUES ('1', '人力资源', '1000000', '', '0', '系统菜单');
INSERT INTO module VALUES ('2', '人事管理', '1010000', '', '1', '人事管理');
INSERT INTO module VALUES ('3', '招聘管理', '1020000', '', '1', '招聘管理');
INSERT INTO module VALUES ('4', '考勤管理', '1030000', '', '1', '考勤管理');
INSERT INTO module VALUES ('5', '薪资管理', '1040000', '', '1', '薪资管理');
INSERT INTO module VALUES ('6', '培训管理', '1050000', '', '1', '培训管理');
INSERT INTO module VALUES ('7', '机构管理', '1060000', '', '1', '机构管理');
INSERT INTO module VALUES ('8', '系统管理', '1070000', '', '1', '系统管理');
INSERT INTO module VALUES ('9', '个人办公', '1080000', '', '1', '个人办公');
INSERT INTO module VALUES ('10', '用户管理', '1071505', 'user', '8', '用户管理');
INSERT INTO module VALUES ('11', '培训列表', '1050300', 'train', '6', '培训列表');
INSERT INTO module VALUES ('12', '员工管理', '1010100', 'employee', '2', '员工管理');
INSERT INTO module VALUES ('13', '员工异动', '1010200', 'employeeRedeploy', '2', '员工异动');
INSERT INTO module VALUES ('14', '角色管理', '1070405', 'role', '8', '角色管理');
INSERT INTO module VALUES ('19', '异动申请', '1010400', 'employeeRedeploy_add', '2', '异动申请');
INSERT INTO module VALUES ('20', '异动审批', '1010300', 'employeeRedeploy_transactorList', '2', '异动审批');
INSERT INTO module VALUES ('21', '我的异动', '1010500', 'employeeRedeploy_my', '2', '我的异动');
INSERT INTO module VALUES ('22', '模块管理', '1070505', 'module', '8', '模块管理');
INSERT INTO module VALUES ('23', '我的招聘', '1080100', 'recruit_my', '9', '我的招聘');
INSERT INTO module VALUES ('24', '招聘审批', '1080200', 'recruit_approverList', '9', '招聘审批');
INSERT INTO module VALUES ('25', '请假审批', '1080300', 'leave_approverList', '9', '请假审批');
INSERT INTO module VALUES ('26', '角色模块', '1070510', 'roleModule', '8', '角色模块列表');
INSERT INTO module VALUES ('27', '异动审批', '1080400', 'employeeRedeploy_transactorList', '9', '异动审批');
INSERT INTO module VALUES ('28', '操作日志', '1080500', 'syslog_my', '9', '操作日志');
INSERT INTO module VALUES ('29', '删除角色模块', '1070513', 'roleModule_delete', '8', '删除角色模块');
INSERT INTO module VALUES ('30', '用户模块', '1070509', 'userModule', '8', '用户模块列表');
INSERT INTO module VALUES ('32', '添加用户模块', '1070514', 'userModule_add ', '8', '添加用户模块');
INSERT INTO module VALUES ('33', '更新用户模块', '1070515', 'userModule_update ', '8', '更新用户模块');
INSERT INTO module VALUES ('34', '删除用户模块', '1070516', 'userModule_delete ', '8', '删除用户模块');
INSERT INTO module VALUES ('35', '阿什顿', '1071605', 'dsfgs', '8', '阿什顿');
INSERT INTO module VALUES ('36', '系统日志', '1071205', 'syslog', '8', '系统日志');
INSERT INTO module VALUES ('37', '用户登入', '1071305', 'user_login.action', '8', '用户登入');
INSERT INTO module VALUES ('38', '用户退出', '1071405', 'user_loginOut', '8', '用户退出');
INSERT INTO module VALUES ('39', '部门管理', '1060100', 'dept', '7', '部门管理');
INSERT INTO module VALUES ('40', '职位管理', '1060200', 'post', '7', '职位管理');
INSERT INTO module VALUES ('41', '培训类型', '1050200', 'traintype', '6', '培训类型管理');
INSERT INTO module VALUES ('42', '全部招聘', '1020100', 'recruit', '3', '全部招聘');
INSERT INTO module VALUES ('43', '招聘申请', '1020200', 'recruit_add', '3', '招聘申请');
INSERT INTO module VALUES ('44', '我的招聘', '1020300', 'recruit_my', '3', '我的招聘');
INSERT INTO module VALUES ('45', '招聘审批', '1020400', 'recruit_approverList', '3', '招聘审批');
INSERT INTO module VALUES ('46', '请假管理', '1030100', 'leave', '4', '请假管理');
INSERT INTO module VALUES ('47', '我的请假', '1030200', 'leave_my', '4', '我的请假');
INSERT INTO module VALUES ('48', '请假申请', '1030300', 'leave_add', '4', '请假申请');
INSERT INTO module VALUES ('49', '请假审批', '1030400', 'leave_approverList', '4', '请假审批');
INSERT INTO module VALUES ('50', '我的信息', '1080600', 'user_detail', '9', '');
INSERT INTO module VALUES ('52', 'jjjj', '1220000', 'jjjj', '1', 'jjjj');
INSERT INTO module VALUES ('53', '蒙蒙', '1340000', '迷蒙蒙', '1', 'd迷蒙蒙');
INSERT INTO module VALUES ('55', '左菜单', '1230000', 'moduleTree', '1', '左菜单');
INSERT INTO module VALUES ('56', 'rrrr', '1350000', 'rrr', '1', 'asdfsadf');
INSERT INTO module VALUES ('66', '啊来sdk福建', '1440000', 'sjdlkfjsl', '1', '爱死了打开房间阿斯顿发生的');
INSERT INTO module VALUES ('67', '啊来sdk福建', '1450000', 'sjdlkfjsl', '1', '爱死了打开房间阿斯顿发生的');
INSERT INTO module VALUES ('68', '啊来sdk福建', '1460000', 'sjdlkfjsl', '1', '爱死了打开房间阿斯顿发生的');
INSERT INTO module VALUES ('70', '', '1480000', 'asdfa', '1', '撒了发达撒旦发生大幅');
INSERT INTO module VALUES ('71', '房管局的', '1490000', 'asdfa', '1', '撒了发达撒旦发生大幅');
INSERT INTO module VALUES ('72', '呵呵呵', '1500000', 'asdfa', '1', '撒了发达撒旦发生大幅');
INSERT INTO module VALUES ('73', '房管局的', '1510000', 'asdfa', '1', '撒了发达撒旦发生大幅');
INSERT INTO module VALUES ('74', '咯就', '1520000', 'asdfa', '1', '撒了发达撒旦发生大幅');
INSERT INTO module VALUES ('75', '房管局的', '1530000', 'asdfa', '1', '撒了发达撒旦发生大幅');
INSERT INTO module VALUES ('76', '房管局的', '1540000', 'asdfa', '1', '撒了发达撒旦发生大幅');
INSERT INTO module VALUES ('77', '房管局的', '1550000', 'asdfa', '1', '撒了发达撒旦发生大幅');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `newsId` int(11) NOT NULL AUTO_INCREMENT,
  `newsTitle` varchar(50) NOT NULL,
  `newsContent` text NOT NULL,
  `publishDate` datetime NOT NULL,
  `publisher` varchar(250) NOT NULL,
  `remark` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`newsId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for `post`
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `postId` int(11) NOT NULL AUTO_INCREMENT,
  `postName` varchar(50) NOT NULL,
  `postResponsibility` varchar(250) NOT NULL,
  `postSalary` float NOT NULL,
  `parentPostId` int(11) DEFAULT NULL,
  `remark` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`postId`),
  KEY `fk_post_parentPostId` (`parentPostId`),
  CONSTRAINT `fk_post_parentPostId` FOREIGN KEY (`parentPostId`) REFERENCES `post` (`postId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO post VALUES ('1', '总经理', '负责公司运作', '10000', null, '');
INSERT INTO post VALUES ('2', '副经理', '协助总经理管理公司', '8000', '1', '');
INSERT INTO post VALUES ('3', '市场部经理', '管理市场', '8000', '1', '');
INSERT INTO post VALUES ('4', '营销部经理', '市场营销', '7000', '3', '');
INSERT INTO post VALUES ('5', '销售部经理', '市场销售', '7000', '3', '');
INSERT INTO post VALUES ('6', '生产副总', '市场管理', '7000', '1', '');
INSERT INTO post VALUES ('8', '试试', '1212', '1222', null, '1212');
INSERT INTO post VALUES ('9', '啊啊', '的范德萨', '11202', '1', '');
INSERT INTO post VALUES ('11', '撒的发生大幅', '撒地方', '12212', null, '');
INSERT INTO post VALUES ('12', '撒的发生的', '撒的发生的', '2131', null, '');

-- ----------------------------
-- Table structure for `recruit`
-- ----------------------------
DROP TABLE IF EXISTS `recruit`;
CREATE TABLE `recruit` (
  `recruitId` int(11) NOT NULL AUTO_INCREMENT,
  `recruitTitle` varchar(50) DEFAULT NULL,
  `applyDept` varchar(10) NOT NULL,
  `applyPerson` varchar(10) NOT NULL,
  `applyPersonEmail` varchar(50) DEFAULT NULL,
  `applyDate` date DEFAULT NULL,
  `applyReason` text NOT NULL,
  `recruitPost` varchar(20) NOT NULL,
  `postRequire` text,
  `recruitCount` int(5) DEFAULT NULL,
  `personRequire` text,
  `workingAge` varchar(20) DEFAULT NULL,
  `wage` varchar(20) DEFAULT NULL,
  `recruitType` varchar(20) DEFAULT NULL,
  `recruitWay` varchar(20) DEFAULT NULL,
  `approveDate` date DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `approver` varchar(10) DEFAULT NULL,
  `approveResult` varchar(20) DEFAULT NULL,
  `approverOption` text,
  `publishDate` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  PRIMARY KEY (`recruitId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of recruit
-- ----------------------------
INSERT INTO recruit VALUES ('1', 'java软件工程师', '开发部', '杰哥', null, '2011-04-01', '公司需求', '公司副总', '熟练开发流程和开发业务', '3', '大专以上', '3年以上工作经验', '7000', '全职', '网络招聘', '2011-04-17', '审批完毕', '杰哥', '不同意', '不同意', '2011-04-05', '2011-06-01');
INSERT INTO recruit VALUES ('3', '招聘c软件工程师', '办公室', '杰哥', 'idreamjay@gmail.com', '2011-04-15', '公司业务需要', 'c实习工程师', '软件开发', '5', '熟练c语言', '0', '2000-3000', '实习生', '校园招聘', '2011-04-17', '已发布', '杰哥', '同意', '同意', '2011-04-20', '2011-10-28');
INSERT INTO recruit VALUES ('4', '招聘c软件工程师', '办公室', '杰哥', null, '2011-04-15', '公司业务需要2', 'c实习工程师2', '软件开发2', '2', '熟练c语言2', '2', '2000-3002', '兼职', '现场招聘', '2011-04-15', '审批中', '杰哥', null, '理了理', null, null);
INSERT INTO recruit VALUES ('5', '招聘c软件工程师', '办公室', '杰哥', 'dreamjay@163.com', '2011-04-12', '公司业务需要4', 'c实习工程师4', '软件开发4', '4', '熟练c语言4', '4', '2000-3002', '全职', '现场招聘', '2011-04-17', '已发布', '杰哥', '同意', '不错', '2011-04-22', '2011-04-22');
INSERT INTO recruit VALUES ('6', 'asp.net 工程师', '人力资源部', '杰哥', null, '2011-04-15', '就爱上了的开发商', '工程师', '金蛟剪', '3', '金蛟剪', '2', '50000', '实习生', '校园招聘', null, '待审批', '杰哥', null, null, null, null);
INSERT INTO recruit VALUES ('7', 'lllll', '人力资源部', '杰哥', null, '2011-04-15', 'lll', 'lll', 'lll', '3', 'lll\r\n', '3', '33333', '全职', '网络招聘', '2011-04-17', '审批中', '杰哥', null, '可以，批准', null, null);
INSERT INTO recruit VALUES ('8', '招聘java银行开发工程师', '人力资源部', '杰哥', null, '2011-04-17', '公司需要', '开发工程师', '熟悉银行业务开发', '4', '本科以上学历', '3-4年', '3000', '全职', '网络招聘', null, '未提交', null, null, null, null, null);
INSERT INTO recruit VALUES ('9', '咋撒旦发生大幅', '生产一部', 'oo', null, '2011-05-20', '阿斯顿发生的发', '121212', '阿斯顿发生的', '12', '撒地方撒旦发生大幅', '12', '212121', '全职', '网络招聘', null, '未提交', null, null, null, null, null);

-- ----------------------------
-- Table structure for `redeploy_type`
-- ----------------------------
DROP TABLE IF EXISTS `redeploy_type`;
CREATE TABLE `redeploy_type` (
  `redeployTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `redeployType` varchar(45) NOT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`redeployTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of redeploy_type
-- ----------------------------
INSERT INTO redeploy_type VALUES ('1', '部门调动', null);
INSERT INTO redeploy_type VALUES ('2', '岗位调整', null);
INSERT INTO redeploy_type VALUES ('3', '晋升', null);
INSERT INTO redeploy_type VALUES ('4', '降级', null);
INSERT INTO redeploy_type VALUES ('5', '轮岗', null);
INSERT INTO redeploy_type VALUES ('6', '休假', null);
INSERT INTO redeploy_type VALUES ('7', '待岗', null);
INSERT INTO redeploy_type VALUES ('8', '工伤', null);
INSERT INTO redeploy_type VALUES ('9', '其他', null);

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) NOT NULL,
  `roleDescription` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO role VALUES ('34', '总经理', '总经理');
INSERT INTO role VALUES ('35', '部门主管', '管理部门');
INSERT INTO role VALUES ('36', '职务长', '职务长');
INSERT INTO role VALUES ('37', '副经理', '副经理');
INSERT INTO role VALUES ('38', '秘书长', '秘书长');
INSERT INTO role VALUES ('39', '管理员', '系统管理员');
INSERT INTO role VALUES ('40', '普通员工', '公司一般员工');
INSERT INTO role VALUES ('41', 'llll', 'lll');
INSERT INTO role VALUES ('42', 'llll', 'lll');
INSERT INTO role VALUES ('43', 'lll', 'kkk');
INSERT INTO role VALUES ('44', 'lasdf', 'asldfj');
INSERT INTO role VALUES ('45', 'la ', 'asldfj');

-- ----------------------------
-- Table structure for `role_module`
-- ----------------------------
DROP TABLE IF EXISTS `role_module`;
CREATE TABLE `role_module` (
  `roleModuleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `moduleSum` varchar(250) NOT NULL,
  PRIMARY KEY (`roleModuleId`),
  KEY `fk_roleID` (`roleId`),
  CONSTRAINT `fk_roleID` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of role_module
-- ----------------------------
INSERT INTO role_module VALUES ('6', '34', '6,3,1,2,7,8,39,40,11,41,12,13,19,20,21,42,43,44,45,9,23,24,25,27,28,10,14,22,36,4,46,47,48,49');
INSERT INTO role_module VALUES ('7', '35', '1,9,37');
INSERT INTO role_module VALUES ('8', '40', '19,20,4,6');

-- ----------------------------
-- Table structure for `role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `rolePermissionId` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  `actionIds` varchar(45) DEFAULT NULL,
  `permission` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`rolePermissionId`),
  KEY `fk_rolePermission_moduleId` (`moduleId`),
  KEY `fk_rolePermission_roleId` (`roleId`),
  KEY `fk_rolePermission_actionId` (`actionIds`),
  CONSTRAINT `fk_rolePermission_moduleId` FOREIGN KEY (`moduleId`) REFERENCES `module` (`moduleId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rolePermission_roleId` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO role_permission VALUES ('1', '34', '1', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('2', '34', '2', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('3', '34', '3', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('4', '34', '4', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('5', '34', '5', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('6', '34', '6', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('7', '34', '7', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('8', '34', '8', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('9', '34', '9', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('10', '34', '10', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('11', '34', '11', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('12', '34', '12', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('13', '34', '13', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('14', '34', '14', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('15', '34', '19', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('16', '34', '20', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('17', '34', '21', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('18', '34', '22', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('19', '34', '23', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('20', '34', '24', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('21', '34', '25', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('22', '34', '26', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('23', '34', '27', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('24', '34', '28', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('25', '34', '29', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('26', '34', '30', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('28', '34', '32', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('29', '34', '33', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('30', '34', '34', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('31', '34', '35', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('32', '34', '36', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('33', '34', '37', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('34', '34', '38', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('35', '34', '39', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('36', '34', '40', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('37', '34', '41', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('38', '34', '42', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('39', '34', '43', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('40', '34', '44', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('41', '34', '45', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('42', '34', '46', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('43', '34', '47', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('44', '34', '48', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('45', '34', '49', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('46', '34', '50', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('48', '34', '52', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('49', '34', '53', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('50', '34', '55', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('51', '34', '56', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('52', '39', '1', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('53', '39', '2', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('54', '39', '3', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('55', '39', '4', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('56', '39', '5', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('57', '39', '6', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('58', '39', '7', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('59', '39', '8', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('60', '39', '9', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('61', '39', '10', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('62', '39', '11', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('63', '39', '12', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('64', '39', '13', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('65', '39', '14', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('66', '39', '19', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('67', '39', '20', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('68', '39', '21', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('69', '39', '22', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('70', '39', '23', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('71', '39', '24', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('72', '39', '25', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('73', '39', '26', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('74', '39', '27', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('75', '39', '28', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('76', '39', '29', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('77', '39', '30', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('78', '39', '32', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('79', '39', '33', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('80', '39', '34', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('81', '39', '35', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('82', '39', '36', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('83', '39', '37', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('84', '39', '38', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('85', '39', '39', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('86', '39', '40', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('87', '39', '41', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('88', '39', '42', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('89', '39', '43', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('90', '39', '44', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('91', '39', '45', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('92', '39', '46', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('93', '39', '47', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('94', '39', '48', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('95', '39', '49', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('96', '39', '50', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('97', '39', '52', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('98', '39', '53', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('99', '39', '55', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('100', '39', '56', '1,2,3,4', '1,1,1,1,');
INSERT INTO role_permission VALUES ('101', '34', '66', '1,2,3,4,5,6', '-1,-1,-1,-1,1,1,');
INSERT INTO role_permission VALUES ('102', '34', '67', '1,2,3,4,5,6', '-1,-1,-1,-1,1,1,');
INSERT INTO role_permission VALUES ('103', '34', '68', '1,2,3,4,5,6', '-1,-1,-1,-1,1,1,');
INSERT INTO role_permission VALUES ('104', '34', '70', '1,2,3,4,5,6', '-1,-1,-1,-1,1,1,');
INSERT INTO role_permission VALUES ('105', '34', '71', '1,2,3,4,5,6', '-1,-1,-1,-1,1,1,');
INSERT INTO role_permission VALUES ('106', '34', '72', '1,2,3,4,5,6', '-1,-1,-1,-1,1,1,');
INSERT INTO role_permission VALUES ('107', '34', '73', '1,2,3,4,5,6', '-1,-1,-1,-1,1,1,');
INSERT INTO role_permission VALUES ('108', '34', '74', '1,2,3,4,5,6', '-1,-1,-1,-1,1,1,');
INSERT INTO role_permission VALUES ('109', '34', '75', '1,2,3,4,5,6', '-1,-1,-1,-1,1,1,');
INSERT INTO role_permission VALUES ('110', '34', '76', '1,2,3,4,5,6', '-1,-1,-1,-1,1,1,');
INSERT INTO role_permission VALUES ('111', '34', '77', '1,2,3,4,5,6', '-1,-1,-1,-1,1,1,');

-- ----------------------------
-- Table structure for `syslog`
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `logId` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `date` datetime NOT NULL,
  `userId` int(11) NOT NULL,
  `moduleId` int(11) DEFAULT NULL,
  `action` varchar(45) NOT NULL,
  `accessIp` varchar(45) NOT NULL,
  PRIMARY KEY (`logId`),
  KEY `fk_syslog_moduleId` (`moduleId`),
  KEY `fk_syslog_userId` (`userId`),
  CONSTRAINT `fk_syslog_moduleId` FOREIGN KEY (`moduleId`) REFERENCES `module` (`moduleId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_syslog_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=709 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO syslog VALUES ('1', 'eee', '2010-10-11 00:00:00', '31', '1', 'aa', '127.0.0.1');
INSERT INTO syslog VALUES ('2', 'eee', '2010-10-11 12:22:33', '31', '1', 'aa', '127.0.0.1');
INSERT INTO syslog VALUES ('3', '信息', '2010-12-11 21:19:19', '31', '10', '浏览', '192.168.1.102');
INSERT INTO syslog VALUES ('4', '信息', '2010-12-11 21:20:02', '31', '10', '浏览', '192.168.1.102');
INSERT INTO syslog VALUES ('5', '信息', '2010-12-11 21:21:15', '31', '22', '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('6', '信息', '2010-12-11 21:22:45', '31', '22', '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('7', '信息', '2010-12-11 21:35:23', '31', null, '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('8', '信息', '2010-12-11 21:35:28', '31', null, '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('9', '信息', '2010-12-11 21:35:43', '31', '36', '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('10', '信息', '2010-12-11 21:54:13', '31', null, '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('11', '信息', '2010-12-11 21:54:14', '31', null, '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('12', '信息', '2010-12-11 21:54:58', '31', '22', '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('13', '信息', '2010-12-11 21:55:47', '31', '36', '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('14', '信息', '2010-12-11 21:57:37', '31', null, '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('15', '信息', '2010-12-11 21:57:37', '31', null, '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('16', '信息', '2010-12-11 21:57:59', '31', '36', '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('17', '信息', '2010-12-11 21:58:10', '31', '30', '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('18', '信息', '2010-12-11 21:58:22', '31', '22', '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('19', '信息', '2010-12-11 22:17:54', '31', '37', '登入', '127.0.0.1');
INSERT INTO syslog VALUES ('20', '信息', '2010-12-11 22:18:03', '31', null, '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('21', '信息', '2010-12-11 22:18:32', '31', '36', '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('22', '信息', '2010-12-11 22:19:16', '31', '38', '退出', '127.0.0.1');
INSERT INTO syslog VALUES ('23', '信息', '2010-12-12 13:57:56', '31', '10', '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('24', '信息', '2010-12-12 13:58:01', '31', '36', '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('25', '信息', '2010-12-12 13:58:06', '31', '36', '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('26', '信息', '2010-12-12 13:58:11', '31', '36', '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('27', '信息', '2010-12-12 13:58:13', '31', '36', '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('28', '信息', '2010-12-12 14:00:21', '31', '38', '退出', '127.0.0.1');
INSERT INTO syslog VALUES ('29', '信息', '2010-12-12 14:38:49', '31', null, '登入', '127.0.0.1');
INSERT INTO syslog VALUES ('30', '信息', '2010-12-12 14:38:50', '31', '55', '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('31', '信息', '2010-12-12 14:38:56', '31', '38', '退出', '127.0.0.1');
INSERT INTO syslog VALUES ('32', '信息', '2010-12-12 14:41:47', '29', null, '登入', '127.0.0.1');
INSERT INTO syslog VALUES ('33', '信息', '2010-12-12 14:41:47', '29', '55', '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('34', '信息', '2010-12-12 14:41:56', '29', '38', '退出', '127.0.0.1');
INSERT INTO syslog VALUES ('35', '信息', '2010-12-12 14:42:01', '31', null, '登入', '127.0.0.1');
INSERT INTO syslog VALUES ('36', '信息', '2010-12-12 14:42:02', '31', '55', '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('37', '信息', '2010-12-12 14:42:05', '31', '36', '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('38', '信息', '2010-12-12 14:42:08', '31', '36', '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('39', '信息', '2010-12-12 14:43:52', '31', '36', '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('40', '信息', '2010-12-20 19:31:43', '31', null, '登入', '127.0.0.1');
INSERT INTO syslog VALUES ('41', '信息', '2010-12-20 19:32:35', '31', '36', '浏览', '127.0.0.1');
INSERT INTO syslog VALUES ('42', '信息', '2010-12-20 19:37:03', '31', '11', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('43', '信息', '2010-12-20 19:37:17', '31', '11', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('44', '信息', '2010-12-20 19:38:28', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('45', '信息', '2010-12-20 19:39:01', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('46', '信息', '2010-12-20 19:52:34', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('47', '信息', '2010-12-20 19:52:37', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('48', '信息', '2010-12-20 19:53:02', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('49', '信息', '2010-12-20 19:53:13', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('50', '信息', '2010-12-20 19:53:28', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('51', '信息', '2010-12-20 19:53:57', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('52', '信息', '2010-12-20 19:54:02', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('53', '信息', '2010-12-20 19:54:22', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('54', '信息', '2010-12-20 19:55:00', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('55', '信息', '2010-12-20 19:55:13', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('56', '信息', '2010-12-20 19:55:25', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('57', '信息', '2010-12-20 20:18:24', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('58', '信息', '2010-12-20 20:18:45', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('59', '信息', '2010-12-20 20:18:49', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('60', '信息', '2010-12-20 20:19:47', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('61', '信息', '2010-12-22 14:53:50', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('62', '信息', '2010-12-22 14:54:00', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('63', '信息', '2010-12-22 14:54:26', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('64', '信息', '2010-12-22 14:58:45', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('65', '信息', '2010-12-22 15:04:06', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('66', '信息', '2010-12-22 15:04:22', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('67', '信息', '2010-12-22 15:04:42', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('68', '信息', '2010-12-22 15:07:11', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('69', '信息', '2010-12-22 15:07:49', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('70', '信息', '2010-12-22 15:08:01', '31', '20', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('71', '信息', '2010-12-22 15:17:46', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('72', '信息', '2010-12-22 15:17:58', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('73', '信息', '2010-12-22 15:18:08', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('74', '信息', '2010-12-22 15:18:22', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('75', '信息', '2010-12-22 15:19:18', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('76', '信息', '2010-12-22 15:19:27', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('77', '信息', '2010-12-22 15:24:36', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('78', '信息', '2010-12-22 15:24:49', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('79', '信息', '2010-12-22 15:33:17', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('80', '信息', '2010-12-22 15:34:14', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('81', '错误', '2010-12-22 15:34:52', '31', '11', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('82', '信息', '2010-12-22 16:14:24', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('83', '信息', '2010-12-22 16:15:07', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('84', '信息', '2010-12-22 16:15:44', '31', '27', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('85', '信息', '2010-12-28 21:03:04', '31', '27', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('86', '信息', '2010-12-28 22:22:09', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('87', '信息', '2010-12-28 22:27:41', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('88', '信息', '2010-12-29 21:41:46', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('89', '信息', '2010-12-29 22:21:48', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('90', '信息', '2010-12-29 22:24:48', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('91', '信息', '2010-12-29 22:59:27', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('92', '信息', '2010-12-29 22:59:57', '31', null, '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('93', '信息', '2010-12-29 23:00:05', '31', null, '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('94', '信息', '2010-12-29 23:02:40', '31', null, '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('95', '信息', '2010-12-29 23:02:45', '31', null, '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('96', '信息', '2010-12-29 23:03:21', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('97', '信息', '2010-12-29 23:04:14', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('98', '信息', '2010-12-31 13:31:46', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('99', '信息', '2010-12-31 13:33:11', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('100', '信息', '2010-12-31 14:35:36', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('101', '信息', '2010-12-31 14:39:50', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('102', '信息', '2010-12-31 14:44:35', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('103', '信息', '2010-12-31 14:47:17', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('104', '信息', '2010-12-31 15:09:09', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('105', '信息', '2010-12-31 15:09:27', '31', null, '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('106', '信息', '2010-12-31 15:10:15', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('107', '信息', '2010-12-31 15:10:37', '31', null, '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('108', '信息', '2010-12-31 15:10:52', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('109', '信息', '2011-01-01 10:13:18', '31', null, '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('110', '信息', '2011-01-01 10:16:49', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('111', '信息', '2011-01-01 10:17:35', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('112', '信息', '2011-01-01 10:19:18', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('113', '信息', '2011-01-01 10:21:43', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('114', '信息', '2011-01-01 10:24:36', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('115', '信息', '2011-01-01 10:25:39', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('116', '信息', '2011-01-01 10:26:18', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('117', '信息', '2011-01-01 10:27:27', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('118', '信息', '2011-01-01 10:29:13', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('119', '信息', '2011-01-01 10:30:34', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('120', '信息', '2011-01-01 10:31:48', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('121', '信息', '2011-01-01 10:33:07', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('122', '信息', '2011-01-01 10:34:13', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('123', '信息', '2011-01-01 10:35:04', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('124', '信息', '2011-01-01 10:36:42', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('125', '信息', '2011-01-01 10:37:34', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('126', '信息', '2011-01-01 10:39:13', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('127', '信息', '2011-01-01 10:39:32', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('128', '信息', '2011-01-01 10:43:27', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('129', '信息', '2011-01-01 10:43:32', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('130', '信息', '2011-01-01 10:43:46', '31', null, '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('131', '信息', '2011-01-01 11:59:50', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('132', '信息', '2011-01-01 12:00:55', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('133', '信息', '2011-01-01 12:02:29', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('134', '信息', '2011-01-01 12:07:13', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('135', '信息', '2011-01-01 12:07:20', '31', null, '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('136', '信息', '2011-01-01 12:07:39', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('137', '信息', '2011-01-01 12:08:30', '31', null, '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('138', '信息', '2011-01-01 12:13:47', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('139', '信息', '2011-01-01 12:14:33', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('140', '信息', '2011-01-01 12:14:45', '31', null, '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('141', '信息', '2011-01-01 12:15:03', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('142', '信息', '2011-01-01 12:15:37', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('143', '信息', '2011-01-01 12:15:42', '31', null, '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('144', '信息', '2011-01-01 16:02:04', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('145', '信息', '2011-01-01 16:02:32', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('146', '信息', '2011-01-01 16:04:29', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('147', '信息', '2011-01-01 16:05:40', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('148', '信息', '2011-01-01 16:06:18', '31', '27', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('149', '信息', '2011-01-01 16:06:45', '31', '27', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('150', '信息', '2011-01-01 16:13:43', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('151', '信息', '2011-01-01 19:28:46', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('152', '信息', '2011-01-01 19:30:44', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('153', '信息', '2011-01-01 19:31:32', '31', '27', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('154', '信息', '2011-01-01 19:45:31', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('155', '信息', '2011-01-01 19:47:09', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('156', '信息', '2011-01-01 19:49:29', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('157', '信息', '2011-01-01 21:25:31', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('158', '信息', '2011-01-01 21:27:25', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('159', '信息', '2011-01-01 21:28:11', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('160', '信息', '2011-01-01 21:29:25', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('161', '信息', '2011-01-01 21:29:32', '31', null, '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('162', '信息', '2011-01-01 21:29:37', '31', null, '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('163', '信息', '2011-01-01 21:30:42', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('164', '信息', '2011-01-01 21:32:33', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('165', '信息', '2011-01-01 21:34:17', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('166', '信息', '2011-01-01 21:34:20', '31', null, '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('167', '信息', '2011-01-01 21:34:35', '31', null, '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('168', '信息', '2011-01-01 21:34:40', '31', null, '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('169', '错误', '2011-01-01 21:42:08', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('170', '信息', '2011-01-01 21:43:48', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('171', '信息', '2011-01-02 13:36:37', '31', '24', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('172', '信息', '2011-01-02 14:05:12', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('173', '错误', '2011-01-02 14:07:42', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('174', '错误', '2011-01-02 14:22:08', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('175', '错误', '2011-01-02 14:22:50', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('176', '信息', '2011-01-02 14:26:37', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('177', '错误', '2011-01-02 14:26:48', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('178', '信息', '2011-01-02 14:27:10', '31', null, '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('179', '信息', '2011-01-02 14:27:41', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('180', '错误', '2011-01-02 14:29:19', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('181', '错误', '2011-01-02 14:30:37', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('182', '错误', '2011-01-02 14:31:09', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('183', '信息', '2011-01-02 14:34:32', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('184', '信息', '2011-01-02 14:36:14', '31', null, '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('185', '信息', '2011-01-02 14:36:50', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('186', '信息', '2011-01-02 14:58:08', '31', null, '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('187', '信息', '2011-01-02 15:14:07', '31', '41', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('188', '信息', '2011-01-02 15:19:49', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('189', '信息', '2011-01-02 16:59:11', '31', '6', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('190', '信息', '2011-01-02 16:59:31', '31', '6', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('191', '信息', '2011-01-02 19:24:25', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('192', '信息', '2011-01-02 19:24:43', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('193', '信息', '2011-01-03 15:44:43', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('194', '信息', '2011-01-03 15:45:16', '31', '26', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('195', '信息', '2011-01-03 15:46:18', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('196', '信息', '2011-01-03 15:52:38', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('197', '信息', '2011-01-03 15:52:51', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('198', '信息', '2011-01-03 22:33:32', '31', '12', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('199', '信息', '2011-01-04 10:49:32', '31', '12', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('200', '信息', '2011-01-26 10:27:22', '31', '12', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('201', '信息', '2011-01-26 10:45:10', '31', '12', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('202', '信息', '2011-01-26 12:02:06', '31', '12', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('203', '信息', '2011-01-26 12:45:33', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('204', '信息', '2011-01-26 12:46:58', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('205', '信息', '2011-01-26 12:47:06', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('206', '信息', '2011-01-26 12:57:26', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('207', '信息', '2011-01-26 12:57:43', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('208', '信息', '2011-01-26 12:58:42', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('209', '信息', '2011-01-26 12:58:49', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('210', '信息', '2011-01-26 12:58:57', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('211', '信息', '2011-01-26 12:59:07', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('212', '信息', '2011-01-26 12:59:21', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('213', '信息', '2011-01-26 13:42:43', '31', '12', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('214', '信息', '2011-01-26 13:57:26', '31', '12', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('215', '信息', '2011-01-26 13:58:11', '31', '12', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('216', '信息', '2011-01-26 13:58:49', '31', '12', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('217', '信息', '2011-01-26 14:12:36', '31', '12', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('218', '信息', '2011-01-26 14:13:00', '31', '12', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('219', '信息', '2011-01-26 14:13:52', '31', '12', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('220', '信息', '2011-01-26 14:14:06', '31', '12', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('221', '信息', '2011-01-26 14:14:10', '31', '12', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('222', '信息', '2011-01-26 14:14:54', '31', '12', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('223', '信息', '2011-01-26 14:16:00', '31', '12', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('224', '信息', '2011-01-26 14:16:39', '31', '12', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('225', '信息', '2011-01-26 14:17:24', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('226', '信息', '2011-01-29 16:02:56', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('227', '信息', '2011-01-29 16:03:53', '31', '26', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('228', '信息', '2011-01-29 17:18:21', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('229', '信息', '2011-01-29 17:18:24', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('230', '信息', '2011-01-29 17:55:44', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('231', '信息', '2011-01-29 22:28:38', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('232', '信息', '2011-01-29 22:32:36', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('233', '信息', '2011-01-29 22:38:00', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('234', '信息', '2011-01-29 22:44:34', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('235', '信息', '2011-01-29 22:50:23', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('236', '信息', '2011-02-02 13:25:24', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('237', '信息', '2011-02-02 13:27:14', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('238', '信息', '2011-02-02 14:36:30', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('239', '信息', '2011-02-02 14:39:15', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('240', '信息', '2011-02-02 14:51:08', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('241', '信息', '2011-02-08 10:26:10', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('242', '信息', '2011-02-08 10:31:23', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('243', '信息', '2011-02-08 10:31:32', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('244', '信息', '2011-02-08 11:17:53', '31', '12', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('245', '信息', '2011-02-08 11:18:01', '31', '12', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('246', '信息', '2011-02-08 11:20:41', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('247', '信息', '2011-02-08 11:20:42', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('248', '信息', '2011-02-08 11:20:43', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('249', '信息', '2011-02-08 11:22:17', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('250', '信息', '2011-02-08 11:23:08', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('251', '信息', '2011-02-08 11:25:12', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('252', '信息', '2011-02-08 11:28:54', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('253', '信息', '2011-02-08 11:30:43', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('254', '信息', '2011-02-08 11:31:13', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('255', '信息', '2011-02-08 11:31:39', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('256', '信息', '2011-02-08 11:33:08', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('257', '信息', '2011-02-08 11:33:14', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('258', '信息', '2011-02-08 11:33:20', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('259', '信息', '2011-02-08 11:36:35', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('260', '信息', '2011-02-08 11:36:50', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('261', '信息', '2011-02-08 11:40:20', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('262', '信息', '2011-02-08 11:40:57', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('263', '信息', '2011-02-08 11:41:16', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('264', '信息', '2011-02-08 13:01:05', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('265', '信息', '2011-02-08 13:14:26', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('266', '信息', '2011-02-08 13:15:03', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('267', '信息', '2011-02-09 10:08:45', '31', '12', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('268', '信息', '2011-02-09 10:44:32', '31', '39', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('269', '信息', '2011-02-09 10:47:03', '31', '39', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('270', '信息', '2011-02-09 11:01:39', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('271', '信息', '2011-02-09 11:03:36', '31', '12', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('272', '信息', '2011-02-09 11:08:59', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('273', '信息', '2011-02-09 19:53:35', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('274', '信息', '2011-02-09 19:54:32', '31', '26', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('275', '信息', '2011-02-09 19:56:42', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('276', '信息', '2011-02-09 19:57:49', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('277', '信息', '2011-02-09 19:58:24', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('278', '信息', '2011-02-09 19:58:58', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('279', '信息', '2011-02-09 19:59:18', '31', '26', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('280', '信息', '2011-02-09 20:00:20', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('281', '信息', '2011-02-09 20:46:24', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('282', '错误', '2011-02-09 22:48:53', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('283', '错误', '2011-02-09 22:49:38', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('284', '信息', '2011-02-10 11:25:13', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('285', '错误', '2011-02-10 11:37:51', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('286', '错误', '2011-02-10 11:37:55', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('287', '错误', '2011-02-10 14:50:11', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('288', '信息', '2011-02-10 14:55:30', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('289', '信息', '2011-02-10 14:56:55', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('290', '信息', '2011-02-10 14:57:59', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('291', '信息', '2011-02-10 15:01:25', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('292', '信息', '2011-02-10 15:04:23', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('293', '信息', '2011-02-10 15:08:18', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('294', '信息', '2011-02-10 15:11:11', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('295', '信息', '2011-02-10 15:14:45', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('296', '信息', '2011-02-10 15:18:18', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('297', '信息', '2011-02-10 15:20:10', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('298', '信息', '2011-02-10 15:22:24', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('299', '信息', '2011-02-10 15:24:22', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('300', '信息', '2011-02-10 15:24:33', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('301', '信息', '2011-02-10 15:24:36', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('302', '信息', '2011-02-10 15:24:38', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('303', '信息', '2011-02-10 15:24:42', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('304', '信息', '2011-02-10 15:24:45', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('305', '信息', '2011-02-10 15:24:49', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('306', '错误', '2011-02-10 15:26:48', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('307', '信息', '2011-03-26 20:13:58', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('308', '信息', '2011-03-26 20:17:06', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('309', '信息', '2011-03-26 20:20:40', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('310', '信息', '2011-03-26 20:24:55', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('311', '信息', '2011-03-26 21:13:20', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('312', '错误', '2011-03-26 21:14:22', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('313', '错误', '2011-03-26 21:15:34', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('314', '错误', '2011-03-26 21:17:07', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('315', '错误', '2011-03-26 21:18:17', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('316', '错误', '2011-03-26 21:18:50', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('317', '错误', '2011-03-26 21:19:59', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('318', '错误', '2011-03-26 21:22:46', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('319', '错误', '2011-03-26 21:23:47', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('320', '错误', '2011-03-26 21:24:28', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('321', '错误', '2011-03-26 21:31:19', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('322', '错误', '2011-03-26 21:36:18', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('323', '错误', '2011-03-26 21:37:33', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('324', '错误', '2011-03-26 21:38:35', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('325', '错误', '2011-03-26 21:39:34', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('326', '错误', '2011-03-26 21:39:59', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('327', '错误', '2011-03-26 21:41:34', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('328', '错误', '2011-03-26 21:42:17', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('329', '错误', '2011-03-26 21:42:35', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('330', '错误', '2011-03-26 21:42:55', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('331', '错误', '2011-03-26 21:43:12', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('332', '错误', '2011-03-26 21:43:52', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('333', '错误', '2011-03-26 21:45:10', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('334', '错误', '2011-03-26 21:46:08', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('335', '错误', '2011-03-26 21:50:56', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('336', '错误', '2011-03-26 21:51:31', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('337', '错误', '2011-03-26 21:53:45', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('338', '错误', '2011-03-26 21:59:13', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('339', '错误', '2011-03-26 21:59:32', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('340', '错误', '2011-03-26 21:59:47', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('341', '错误', '2011-03-27 11:24:49', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('342', '错误', '2011-03-27 11:25:59', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('343', '错误', '2011-03-27 11:26:10', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('344', '错误', '2011-03-27 11:26:14', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('345', '错误', '2011-03-27 11:26:35', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('346', '错误', '2011-03-27 11:29:10', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('347', '错误', '2011-03-27 11:29:32', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('348', '错误', '2011-03-27 11:29:45', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('349', '错误', '2011-03-27 11:29:57', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('350', '错误', '2011-03-27 11:33:05', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('351', '错误', '2011-03-27 11:33:56', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('352', '错误', '2011-03-27 11:35:15', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('353', '错误', '2011-03-27 11:37:37', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('354', '错误', '2011-03-27 11:38:04', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('355', '错误', '2011-03-27 11:39:18', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('356', '错误', '2011-03-27 11:42:50', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('357', '错误', '2011-03-27 12:53:12', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('358', '信息', '2011-03-27 13:04:30', '31', '14', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('359', '信息', '2011-03-27 13:06:07', '31', '26', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('360', '错误', '2011-03-27 13:06:39', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('361', '错误', '2011-03-27 13:08:33', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('362', '错误', '2011-03-27 13:12:28', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('363', '错误', '2011-03-27 13:13:37', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('364', '错误', '2011-03-27 13:13:46', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('365', '错误', '2011-03-27 13:13:50', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('366', '错误', '2011-03-27 13:14:34', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('367', '错误', '2011-03-27 13:15:00', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('368', '错误', '2011-03-27 13:17:18', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('369', '错误', '2011-03-27 13:17:34', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('370', '错误', '2011-03-27 13:18:13', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('371', '错误', '2011-03-27 13:18:32', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('372', '错误', '2011-03-27 13:18:47', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('373', '错误', '2011-03-27 13:19:24', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('374', '错误', '2011-03-27 13:19:47', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('375', '错误', '2011-03-27 13:21:17', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('376', '错误', '2011-03-27 13:21:38', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('377', '错误', '2011-03-27 13:21:59', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('378', '错误', '2011-03-27 13:22:18', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('379', '错误', '2011-03-27 13:22:34', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('380', '错误', '2011-03-27 13:23:51', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('381', '错误', '2011-03-27 13:24:02', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('382', '错误', '2011-03-27 13:24:13', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('383', '错误', '2011-03-27 13:24:43', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('384', '错误', '2011-03-27 13:29:09', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('385', '信息', '2011-03-27 14:02:17', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('386', '信息', '2011-03-27 14:34:38', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('387', '信息', '2011-03-27 14:35:12', '31', '30', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('388', '信息', '2011-03-27 14:36:18', '31', '30', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('389', '信息', '2011-03-27 14:36:28', '31', '30', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('390', '信息', '2011-03-27 14:36:39', '31', '30', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('391', '信息', '2011-03-27 14:36:46', '31', '30', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('392', '信息', '2011-03-27 14:38:00', '31', '30', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('393', '信息', '2011-03-27 14:53:46', '31', '30', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('394', '信息', '2011-03-27 15:00:36', '31', '26', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('395', '信息', '2011-03-27 15:01:50', '31', '26', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('396', '信息', '2011-03-27 15:02:49', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('397', '错误', '2011-03-27 15:14:32', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('398', '错误', '2011-03-27 15:15:52', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('399', '信息', '2011-04-08 19:30:42', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('400', '信息', '2011-04-08 19:32:54', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('401', '信息', '2011-04-08 19:33:11', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('402', '错误', '2011-04-08 19:33:33', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('403', '错误', '2011-04-08 19:33:45', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('404', '信息', '2011-04-08 19:36:48', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('405', '错误', '2011-04-08 20:24:52', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('406', '错误', '2011-04-08 20:26:08', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('407', '错误', '2011-04-08 20:28:10', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('408', '信息', '2011-04-09 17:43:35', '31', '22', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('409', '信息', '2011-04-09 17:44:08', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('410', '信息', '2011-04-09 17:45:27', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('411', '信息', '2011-04-09 17:47:42', '31', '22', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('412', '信息', '2011-04-09 17:48:03', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('413', '信息', '2011-04-09 17:48:29', '31', '26', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('414', '信息', '2011-04-10 14:22:19', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('415', '信息', '2011-04-10 14:23:43', '31', '26', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('416', '错误', '2011-04-10 14:25:17', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('417', '错误', '2011-04-10 14:26:10', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('418', '错误', '2011-04-10 14:43:22', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('419', '错误', '2011-04-10 14:43:51', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('420', '错误', '2011-04-10 14:43:55', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('421', '错误', '2011-04-10 14:44:01', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('422', '错误', '2011-04-10 14:44:16', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('423', '错误', '2011-04-10 14:45:03', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('424', '错误', '2011-04-10 14:45:49', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('425', '错误', '2011-04-10 14:46:32', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('426', '错误', '2011-04-10 14:46:57', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('427', '错误', '2011-04-10 14:47:52', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('428', '错误', '2011-04-10 14:48:11', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('429', '错误', '2011-04-10 14:48:29', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('430', '错误', '2011-04-10 14:49:26', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('431', '错误', '2011-04-10 14:50:16', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('432', '错误', '2011-04-10 14:51:14', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('433', '错误', '2011-04-10 14:51:18', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('434', '错误', '2011-04-10 14:51:44', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('435', '错误', '2011-04-10 14:51:58', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('436', '错误', '2011-04-10 14:53:07', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('437', '错误', '2011-04-10 14:54:10', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('438', '错误', '2011-04-10 14:55:32', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('439', '错误', '2011-04-10 14:58:02', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('440', '错误', '2011-04-10 14:59:34', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('441', '错误', '2011-04-10 15:00:01', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('442', '错误', '2011-04-10 15:02:19', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('443', '错误', '2011-04-10 15:03:03', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('444', '错误', '2011-04-10 15:03:29', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('445', '错误', '2011-04-10 15:04:06', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('446', '信息', '2011-04-10 21:46:32', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('447', '信息', '2011-04-10 21:47:08', '31', '26', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('448', '信息', '2011-04-10 21:49:15', '31', '42', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('449', '信息', '2011-04-11 22:21:58', '31', '42', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('450', '信息', '2011-04-11 22:45:50', '31', '42', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('451', '信息', '2011-04-11 22:48:11', '31', '12', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('452', '信息', '2011-04-11 22:48:55', '31', '42', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('453', '信息', '2011-04-11 22:51:05', '31', '39', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('454', '信息', '2011-04-11 22:52:30', '31', '42', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('455', '信息', '2011-04-11 22:52:35', '31', '42', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('456', '信息', '2011-04-11 23:09:36', '31', '42', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('457', '信息', '2011-04-12 21:30:18', '31', '42', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('458', '信息', '2011-04-12 21:31:14', '31', '42', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('459', '信息', '2011-04-12 21:44:10', '31', '42', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('460', '错误', '2011-04-12 21:56:51', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('461', '信息', '2011-04-12 21:57:18', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('462', '信息', '2011-04-12 22:33:27', '31', '42', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('463', '信息', '2011-04-12 22:45:13', '31', '42', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('464', '信息', '2011-04-12 22:51:04', '31', '42', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('465', '信息', '2011-04-12 22:51:16', '31', '42', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('466', '信息', '2011-04-12 22:51:34', '31', '42', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('467', '信息', '2011-04-14 19:34:14', '31', '39', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('468', '信息', '2011-04-14 20:08:10', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('469', '信息', '2011-04-14 20:08:32', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('470', '信息', '2011-04-15 19:16:34', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('471', '信息', '2011-04-15 19:17:00', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('472', '错误', '2011-04-15 19:18:06', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('473', '信息', '2011-04-15 19:23:35', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('474', '信息', '2011-04-15 19:40:35', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('475', '信息', '2011-04-15 19:41:11', '31', '26', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('476', '信息', '2011-04-15 19:57:22', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('477', '错误', '2011-04-15 20:22:26', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('478', '信息', '2011-04-15 20:46:15', '31', '42', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('479', '信息', '2011-04-15 21:47:43', '31', '42', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('480', '错误', '2011-04-17 13:56:10', '31', '42', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('481', '信息', '2011-04-17 17:50:46', '31', '42', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('482', '错误', '2011-04-17 17:55:51', '31', '42', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('483', '信息', '2011-04-21 21:27:39', '31', '22', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('484', '信息', '2011-04-21 21:31:59', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('485', '信息', '2011-04-21 21:44:09', '31', '26', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('486', '信息', '2011-04-22 09:27:18', '31', '22', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('487', '信息', '2011-04-22 09:27:30', '31', '22', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('488', '信息', '2011-04-22 09:30:19', '31', '22', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('489', '信息', '2011-04-22 09:31:13', '31', '22', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('490', '信息', '2011-04-22 09:35:10', '31', '22', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('491', '信息', '2011-04-22 09:36:38', '31', '22', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('492', '信息', '2011-04-22 09:37:11', '31', '22', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('493', '信息', '2011-04-22 09:37:53', '31', '22', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('494', '信息', '2011-04-22 09:55:36', '31', '22', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('495', '信息', '2011-04-22 09:55:43', '31', '22', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('496', '信息', '2011-04-22 09:55:49', '31', '22', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('497', '信息', '2011-04-22 09:55:53', '31', '22', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('498', '信息', '2011-04-22 09:55:59', '31', '22', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('499', '信息', '2011-04-22 09:56:04', '31', '22', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('500', '信息', '2011-04-22 09:56:08', '31', '22', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('501', '信息', '2011-04-22 09:56:14', '31', '22', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('502', '信息', '2011-04-22 09:56:19', '31', '22', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('503', '信息', '2011-04-22 10:15:30', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('504', '信息', '2011-04-22 10:17:22', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('505', '信息', '2011-04-22 10:17:39', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('506', '信息', '2011-04-22 10:19:51', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('507', '信息', '2011-04-22 10:20:32', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('508', '信息', '2011-04-22 10:24:39', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('509', '信息', '2011-04-22 10:28:54', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('510', '信息', '2011-04-22 10:32:16', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('511', '信息', '2011-04-22 10:33:23', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('512', '信息', '2011-04-22 10:34:25', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('513', '信息', '2011-04-22 10:34:37', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('514', '信息', '2011-04-22 10:36:16', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('515', '信息', '2011-04-22 10:37:03', '31', '26', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('516', '信息', '2011-04-22 10:37:29', '31', '26', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('517', '信息', '2011-04-22 10:41:42', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('518', '信息', '2011-04-22 10:43:23', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('519', '信息', '2011-04-22 10:43:42', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('520', '信息', '2011-04-22 10:44:07', '31', '26', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('521', '信息', '2011-04-22 10:44:22', '31', '26', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('522', '错误', '2011-04-22 10:45:35', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('523', '信息', '2011-04-22 10:52:11', '31', '30', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('524', '信息', '2011-04-22 10:58:33', '31', '30', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('525', '信息', '2011-04-22 11:07:31', '31', '30', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('526', '信息', '2011-04-22 11:07:39', '31', '30', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('527', '信息', '2011-04-22 11:07:46', '31', '30', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('528', '信息', '2011-04-22 11:08:05', '31', '30', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('529', '信息', '2011-04-22 11:09:09', '31', '30', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('530', '信息', '2011-04-22 11:09:22', '31', '30', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('531', '信息', '2011-04-22 11:09:47', '31', '30', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('532', '信息', '2011-04-22 11:09:54', '31', '30', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('533', '信息', '2011-04-22 11:10:30', '31', '30', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('534', '信息', '2011-04-22 11:13:12', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('535', '信息', '2011-04-22 11:27:14', '31', '26', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('536', '信息', '2011-04-22 11:36:25', '31', '30', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('537', '信息', '2011-04-22 11:38:35', '31', '30', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('538', '信息', '2011-04-22 11:46:46', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('539', '信息', '2011-04-22 11:49:19', '31', '26', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('540', '信息', '2011-04-22 11:49:47', '31', '26', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('541', '错误', '2011-04-22 13:30:44', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('542', '错误', '2011-04-22 13:31:30', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('543', '错误', '2011-04-22 13:39:00', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('544', '错误', '2011-04-22 13:39:49', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('545', '错误', '2011-04-22 13:44:02', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('546', '错误', '2011-04-22 13:59:15', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('547', '信息', '2011-04-22 14:19:24', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('548', '信息', '2011-04-22 14:19:41', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('549', '信息', '2011-04-22 14:23:46', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('550', '信息', '2011-04-22 14:23:51', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('551', '信息', '2011-04-22 14:24:11', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('552', '错误', '2011-04-22 14:32:44', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('553', '错误', '2011-04-22 14:35:32', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('554', '错误', '2011-04-22 14:35:42', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('555', '错误', '2011-04-22 14:35:47', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('556', '错误', '2011-04-22 14:35:52', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('557', '信息', '2011-04-22 14:35:57', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('558', '信息', '2011-04-22 14:49:38', '31', '14', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('559', '错误', '2011-04-22 14:55:39', '31', '14', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('560', '错误', '2011-04-22 14:58:13', '31', '14', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('561', '错误', '2011-04-22 14:59:21', '31', '14', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('562', '错误', '2011-04-22 14:59:25', '31', '14', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('563', '错误', '2011-04-22 15:01:04', '31', '14', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('564', '错误', '2011-04-22 15:02:12', '31', '14', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('565', '错误', '2011-04-22 15:02:28', '31', '14', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('566', '错误', '2011-04-22 15:02:36', '31', '14', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('567', '错误', '2011-04-22 15:02:48', '31', '14', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('568', '错误', '2011-04-22 15:02:50', '31', '14', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('569', '错误', '2011-04-22 15:06:34', '31', '14', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('570', '错误', '2011-04-22 15:07:09', '31', '14', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('571', '错误', '2011-04-22 15:10:04', '31', '14', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('572', '错误', '2011-04-22 15:10:28', '31', '14', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('573', '错误', '2011-04-22 15:11:06', '31', '14', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('574', '错误', '2011-04-22 15:11:19', '31', '14', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('575', '信息', '2011-04-22 15:11:33', '31', '14', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('576', '信息', '2011-04-22 15:12:46', '31', '14', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('577', '错误', '2011-04-22 15:14:13', '31', '14', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('578', '信息', '2011-04-22 15:23:47', '31', '14', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('579', '错误', '2011-04-22 15:23:54', '31', '14', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('580', '错误', '2011-04-22 15:25:00', '31', '14', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('581', '错误', '2011-04-22 15:31:02', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('582', '信息', '2011-04-22 15:33:27', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('583', '错误', '2011-04-22 15:39:50', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('584', '错误', '2011-04-22 16:00:24', '31', '13', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('585', '错误', '2011-04-22 16:00:30', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('586', '信息', '2011-04-22 16:24:29', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('587', '信息', '2011-04-22 16:24:36', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('588', '信息', '2011-04-22 16:24:56', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('589', '信息', '2011-04-22 16:25:09', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('590', '信息', '2011-04-22 16:25:16', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('591', '信息', '2011-04-22 16:25:22', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('592', '信息', '2011-04-22 16:25:40', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('593', '信息', '2011-04-22 16:27:03', '31', '12', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('594', '信息', '2011-04-22 16:27:57', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('595', '信息', '2011-04-22 16:33:44', '31', '41', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('596', '信息', '2011-04-22 16:34:06', '31', '41', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('597', '信息', '2011-04-22 16:34:19', '31', '41', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('598', '信息', '2011-04-22 16:34:49', '31', '41', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('599', '信息', '2011-04-22 19:59:07', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('600', '信息', '2011-04-22 19:59:40', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('601', '信息', '2011-04-22 20:05:56', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('602', '信息', '2011-04-22 20:09:51', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('603', '信息', '2011-04-22 20:10:21', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('604', '信息', '2011-04-22 20:11:12', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('605', '信息', '2011-04-22 20:12:00', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('606', '信息', '2011-04-22 20:12:37', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('607', '信息', '2011-04-22 20:12:54', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('608', '信息', '2011-04-22 20:29:08', '31', '11', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('609', '信息', '2011-04-22 20:30:17', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('610', '信息', '2011-04-22 20:30:29', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('611', '信息', '2011-04-22 20:31:07', '31', '11', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('612', '信息', '2011-04-22 20:39:06', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('613', '信息', '2011-04-22 20:40:53', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('614', '信息', '2011-04-22 20:41:15', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('615', '信息', '2011-04-22 20:41:23', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('616', '信息', '2011-04-22 20:42:09', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('617', '信息', '2011-04-22 20:44:29', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('618', '信息', '2011-04-22 20:44:49', '31', '11', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('619', '错误', '2011-04-23 14:01:43', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('620', '信息', '2011-04-23 14:06:45', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('621', '错误', '2011-04-23 14:07:07', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('622', '信息', '2011-04-23 14:10:06', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('623', '信息', '2011-04-23 14:31:37', '31', '30', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('624', '信息', '2011-04-23 14:31:58', '31', '30', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('625', '信息', '2011-04-23 14:32:45', '31', '30', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('626', '信息', '2011-04-23 14:33:21', '31', '30', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('627', '信息', '2011-04-23 14:33:38', '31', '30', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('628', '信息', '2011-04-23 14:34:14', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('629', '信息', '2011-04-23 20:15:43', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('630', '错误', '2011-04-23 20:33:19', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('631', '信息', '2011-04-28 19:40:59', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('632', '信息', '2011-04-28 19:42:01', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('633', '信息', '2011-04-28 19:42:37', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('634', '信息', '2011-04-28 19:43:42', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('635', '信息', '2011-04-28 19:44:21', '31', '26', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('636', '信息', '2011-04-28 19:45:14', '31', '26', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('637', '信息', '2011-04-28 20:46:30', '31', '46', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('638', '信息', '2011-04-28 20:49:52', '31', '46', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('639', '信息', '2011-04-28 20:59:05', '31', '46', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('640', '信息', '2011-04-28 21:07:39', '31', '46', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('641', '信息', '2011-04-28 21:08:17', '31', '46', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('642', '信息', '2011-04-28 21:09:07', '31', '46', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('643', '信息', '2011-04-28 21:09:11', '31', '46', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('644', '信息', '2011-04-28 21:30:59', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('645', '信息', '2011-04-28 22:19:06', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('646', '信息', '2011-04-28 22:19:24', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('647', '信息', '2011-04-28 22:20:25', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('648', '信息', '2011-04-28 22:20:46', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('649', '信息', '2011-05-02 17:48:46', '31', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('650', '信息', '2011-05-02 19:12:07', '31', '46', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('651', '信息', '2011-05-02 19:47:06', '31', '11', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('652', '信息', '2011-05-02 19:47:09', '31', '11', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('653', '信息', '2011-05-02 19:47:12', '31', '11', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('654', '信息', '2011-05-02 19:47:16', '31', '11', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('655', '信息', '2011-05-02 19:47:25', '31', '11', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('656', '信息', '2011-05-02 20:21:38', '31', '39', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('657', '信息', '2011-05-02 20:22:16', '31', '39', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('658', '信息', '2011-05-02 20:22:58', '31', '39', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('659', '信息', '2011-05-02 20:23:38', '31', '39', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('660', '信息', '2011-05-02 20:24:24', '31', '39', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('661', '信息', '2011-05-02 20:25:00', '31', '39', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('662', '信息', '2011-05-02 20:25:29', '31', '39', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('663', '信息', '2011-05-02 20:38:10', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('664', '信息', '2011-05-02 20:58:22', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('665', '信息', '2011-05-02 21:01:32', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('666', '信息', '2011-05-02 21:02:04', '31', '22', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('667', '信息', '2011-05-19 09:45:52', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('668', '信息', '2011-05-19 09:47:12', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('669', '信息', '2011-05-19 09:48:08', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('670', '信息', '2011-05-19 09:51:11', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('671', '信息', '2011-05-19 09:53:27', '31', '12', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('672', '信息', '2011-05-19 21:33:10', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('673', '信息', '2011-05-19 21:46:56', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('674', '信息', '2011-05-19 21:47:03', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('675', '信息', '2011-05-19 21:47:43', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('676', '信息', '2011-05-19 21:47:56', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('677', '信息', '2011-05-19 21:48:09', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('678', '信息', '2011-05-19 21:48:22', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('679', '信息', '2011-05-19 21:49:05', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('680', '信息', '2011-05-19 21:49:15', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('681', '信息', '2011-05-19 23:06:54', '31', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('682', '信息', '2011-05-20 14:52:52', '31', '12', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('683', '信息', '2011-05-20 14:53:27', '31', '12', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('684', '信息', '2011-05-20 15:02:44', '31', '12', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('685', '信息', '2011-05-20 15:05:43', '31', '12', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('686', '信息', '2011-05-20 15:06:52', '31', '10', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('687', '信息', '2011-05-20 15:09:42', '31', '30', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('688', '信息', '2011-05-20 15:10:45', '31', '30', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('689', '信息', '2011-05-20 15:10:54', '31', '30', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('690', '信息', '2011-05-20 15:11:10', '31', '30', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('691', '信息', '2011-05-20 15:11:18', '31', '30', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('692', '信息', '2011-05-20 15:11:53', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('693', '信息', '2011-05-20 15:12:12', '31', null, '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('694', '信息', '2011-05-20 15:13:07', '63', '10', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('695', '信息', '2011-05-20 15:16:12', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('696', '信息', '2011-05-20 15:16:36', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('697', '错误', '2011-05-20 15:18:28', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('698', '错误', '2011-05-20 15:18:54', '31', '13', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('699', '信息', '2011-05-20 15:29:44', '31', '30', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('700', '信息', '2011-05-20 15:31:22', '31', '30', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('701', '信息', '2011-05-20 15:31:32', '31', '30', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('702', '信息', '2011-05-20 15:31:53', '31', '30', '删除', '127.0.0.1');
INSERT INTO syslog VALUES ('703', '信息', '2011-05-20 15:32:52', '63', '42', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('704', '信息', '2011-05-20 15:37:11', '63', '13', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('705', '信息', '2011-05-20 15:39:27', '63', '46', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('706', '信息', '2011-05-20 15:39:38', '63', '46', '更新', '127.0.0.1');
INSERT INTO syslog VALUES ('707', '信息', '2011-05-20 15:47:37', '63', '11', '创建', '127.0.0.1');
INSERT INTO syslog VALUES ('708', '信息', '2011-05-20 15:48:15', '63', '11', '更新', '127.0.0.1');

-- ----------------------------
-- Table structure for `train`
-- ----------------------------
DROP TABLE IF EXISTS `train`;
CREATE TABLE `train` (
  `trainId` int(11) NOT NULL AUTO_INCREMENT,
  `trainCourse` varchar(250) NOT NULL,
  `trainContent` text,
  `trainUnit` varchar(250) DEFAULT NULL,
  `trainEmployee` varchar(500) DEFAULT NULL,
  `trainTutor` varchar(250) DEFAULT NULL,
  `trainTarget` varchar(500) DEFAULT NULL,
  `trainStartDate` datetime DEFAULT NULL,
  `trainEndDate` datetime DEFAULT NULL,
  `trainTypeId` int(11) DEFAULT NULL,
  `trainResult` varchar(250) DEFAULT NULL,
  `remark` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`trainId`),
  KEY `fk_train_trainTypeId` (`trainTypeId`),
  CONSTRAINT `fk_train_trainTypeId` FOREIGN KEY (`trainTypeId`) REFERENCES `traintype` (`trainTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of train
-- ----------------------------
INSERT INTO train VALUES ('1', 'java', 'java', '公司', '杰哥,djj', 'teachers', '达到公司用人要求', '2010-10-08 00:00:00', '2010-10-30 00:00:00', '5', null, 'good study');
INSERT INTO train VALUES ('2', 'struts2', 'study, java', 'aa', 'djj', 'teacher', '熟悉公司业务框架', '2010-10-08 00:00:00', '2010-10-30 00:00:00', '2', null, 'good');
INSERT INTO train VALUES ('8', '再续复杂的算法', '上大放大声的, 撒的发生大幅', '撒的发生的', '杰哥', '士大夫撒旦', '熟悉语言算法', '2010-12-02 00:00:00', '2011-01-12 00:00:00', '3', null, '撒的发生');
INSERT INTO train VALUES ('9', '发生大幅', '发生大幅, 发生大幅', '发生大幅', '杰哥，djj', '发生大幅', '', '2011-01-05 00:00:00', '2011-01-14 00:00:00', '23', null, '发生大幅');
INSERT INTO train VALUES ('10', '大幅撒打发', '发生大幅, 发生大幅', '发撒的发生的', '杰哥', '发生大幅', 'asd发啊三的发生地', '2011-01-05 00:00:00', '2011-01-20 00:00:00', '5', null, '发生大幅');
INSERT INTO train VALUES ('11', '大幅撒打发', '发生大幅, 发生大幅', '发撒的发生的', '杰哥', '发生大幅', '阿萨德法十分', '2011-01-11 00:00:00', '2011-01-19 00:00:00', '5', null, '发生大幅');
INSERT INTO train VALUES ('12', 'java', 'java se \r\njava ee\r\n框架', '北京尚学堂', '杰哥', '马士兵', '学好java开发\r\n银行方面开发', '2011-04-22 00:00:00', '2011-04-30 00:00:00', '5', null, '。。。\r\n');
INSERT INTO train VALUES ('13', 'saldfjsaldf', 'aaaaaaaaaaaaaaaaaaaaaa', 'sdfsadf', 'asdfasd', 'aaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2011-12-12 00:00:00', '2011-01-01 00:00:00', '2', null, 'asdfsadsd');

-- ----------------------------
-- Table structure for `traintype`
-- ----------------------------
DROP TABLE IF EXISTS `traintype`;
CREATE TABLE `traintype` (
  `trainTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `trainType` varchar(45) NOT NULL,
  `remark` text,
  PRIMARY KEY (`trainTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of traintype
-- ----------------------------
INSERT INTO traintype VALUES ('1', '企业文化', '企业文化内容培训');
INSERT INTO traintype VALUES ('2', '公司内部培训', '公司内部培训');
INSERT INTO traintype VALUES ('3', '语言培训', '语言培训');
INSERT INTO traintype VALUES ('5', '技能培训', '技能培训');
INSERT INTO traintype VALUES ('6', 'jhgjh', 'hgjhgh');
INSERT INTO traintype VALUES ('8', 'jhgjh', 'kk');
INSERT INTO traintype VALUES ('9', 'jhgjh', 'hgjhgh');
INSERT INTO traintype VALUES ('10', 'jhgjh', 'hgjhgh');
INSERT INTO traintype VALUES ('11', 'jhgjh', 'hgjhgh');
INSERT INTO traintype VALUES ('12', 'jhgjh', 'hgjhgh');
INSERT INTO traintype VALUES ('13', 'ddvcSDc', 'xcvbzdfbvzfd');
INSERT INTO traintype VALUES ('14', 'ddvcSDc', 'xcvbzdfbvzfd');
INSERT INTO traintype VALUES ('15', 'ddvcSDc', 'xcvbzdfbvzfd');
INSERT INTO traintype VALUES ('16', 'ddvcSDc', 'xcvbzdfbvzfd');
INSERT INTO traintype VALUES ('17', 'ddvcSDc', 'xcvbzdfbvzfd');
INSERT INTO traintype VALUES ('18', 'ddvcSDc', 'xcvbzdfbvzfd');
INSERT INTO traintype VALUES ('19', 'ddvcSDc', 'xcvbzdfbvzfd');
INSERT INTO traintype VALUES ('20', 'ddvcSDc', 'xcvbzdfbvzfd');
INSERT INTO traintype VALUES ('21', 'ddvcSDc', 'xcvbzdfbvzfd');
INSERT INTO traintype VALUES ('22', 'ddvcSDc', 'xcvbzdfbvzfd');
INSERT INTO traintype VALUES ('23', 'ddvcSDc', 'xcvbzdfbvzfd');
INSERT INTO traintype VALUES ('24', 'ddvcSDc', 'xcvbzdfbvzfd');
INSERT INTO traintype VALUES ('25', 'ddvcSDc', 'xcvbzdfbvzfd');
INSERT INTO traintype VALUES ('26', 'ddvcSDc', 'xcvbzdfbvzfd');
INSERT INTO traintype VALUES ('27', 'ddvcSDc', 'xcvbzdfbvzfd');
INSERT INTO traintype VALUES ('28', 'ddvcSDc', 'xcvbzdfbvzfd');
INSERT INTO traintype VALUES ('29', 'ddvcSDc', 'xcvbzdfbvzfd');
INSERT INTO traintype VALUES ('30', 'ddvcSDc', 'xcvbzdfbvzfd');
INSERT INTO traintype VALUES ('31', 'dsds', 'sss');
INSERT INTO traintype VALUES ('32', 'sdafasd', 'sdfasdfas');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `userTrueName` varchar(45) NOT NULL,
  `userPassword` varchar(100) NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `empId` int(11) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userName_UNIQUE` (`userName`),
  UNIQUE KEY `fk_user_empId` (`empId`),
  CONSTRAINT `fk_user_empId` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO user VALUES ('29', 'djj', '阿萨德', 'eukDt93h/Fg=', '2010-11-26 13:16:07', '2');
INSERT INTO user VALUES ('31', 'admin', '杰哥', 'A2GTdNkfWkw=', '2010-11-26 13:19:06', '1');
INSERT INTO user VALUES ('32', '撒的发生的', '戴竣杰', 'eukDt93h/Fg=', '2010-11-27 16:02:37', '3');
INSERT INTO user VALUES ('34', 'dlasdfasdfsadf', '那你', 'eukDt93h/Fg=', '2010-11-27 16:03:26', '21');
INSERT INTO user VALUES ('35', '斯芬三大', '汪汪', 'eukDt93h/Fg=', '2010-11-27 16:03:32', '23');
INSERT INTO user VALUES ('36', 'lokjhg', '方国素', 'eukDt93h/Fg=', '2010-11-27 16:03:37', '6');
INSERT INTO user VALUES ('41', 'ssss', '问问', 'eukDt93h/Fg=', '2010-11-27 17:32:53', '22');
INSERT INTO user VALUES ('42', 'cxm', '陈学敏', 'eukDt93h/Fg=', '2011-03-26 21:12:57', '8');
INSERT INTO user VALUES ('45', 'ggss', '魔', 'eukDt93h/Fg=', '2010-12-01 16:01:58', '9');
INSERT INTO user VALUES ('49', ' fff', '尹美', 'eukDt93h/Fg=', '2010-12-01 16:09:47', '10');
INSERT INTO user VALUES ('51', 'yudu', '撒地方', 'eukDt93h/Fg=', '2010-12-01 16:14:02', '11');
INSERT INTO user VALUES ('54', 'erersdd', '屁屁', 'eukDt93h/Fg=', '2010-12-03 13:49:19', '24');
INSERT INTO user VALUES ('55', 'ffffgg', '魔道', 'eukDt93h/Fg=', '2010-12-10 20:53:01', '13');
INSERT INTO user VALUES ('56', 'ttt', '斗战胜佛', 'eukDt93h/Fg=', '2010-12-11 10:48:11', '14');
INSERT INTO user VALUES ('57', 'eee', '国防生', 'eukDt93h/Fg=', '2010-12-11 10:48:24', '15');
INSERT INTO user VALUES ('58', 'rrrr', '打发', 'eukDt93h/Fg=', '2010-12-13 21:27:54', '16');
INSERT INTO user VALUES ('59', 'kkk', '这些', 'eukDt93h/Fg=', '2010-12-20 19:34:32', '17');
INSERT INTO user VALUES ('60', 'jjjjj', '乐乐', 'eukDt93h/Fg=', '2010-12-20 19:35:52', '18');
INSERT INTO user VALUES ('61', 'uuu', '亲戚', 'eukDt93h/Fg=', '2010-12-20 19:37:17', '19');
INSERT INTO user VALUES ('62', 'aasdfasdf', '慢慢', 'eukDt93h/Fg=', '2011-01-01 19:28:46', '20');
INSERT INTO user VALUES ('63', 'abc', 'oo', 'xT7iglVfdiY=', '2011-05-20 15:06:52', '34');

-- ----------------------------
-- Table structure for `user_module`
-- ----------------------------
DROP TABLE IF EXISTS `user_module`;
CREATE TABLE `user_module` (
  `userModuleId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `moduleSum` varchar(250) NOT NULL,
  PRIMARY KEY (`userModuleId`),
  KEY `fk_userId` (`userId`),
  CONSTRAINT `fk_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of user_module
-- ----------------------------
INSERT INTO user_module VALUES ('9', '31', '1,2,12,13,19,20,21');
INSERT INTO user_module VALUES ('10', '29', '1,2,19,20,21,3,43,44,45,8,36,9,23,24,25,27,6,11,41,7,39,40,10,14,28');
INSERT INTO user_module VALUES ('11', '63', '9,23,24,25,27,28,50,8,10,1,2,12,13,19,20,21,3,4,46,47,48,49,6,11,41,7,39,40,14,22,26,30,36,37,38,42,43,44,45');

-- ----------------------------
-- Table structure for `user_permission`
-- ----------------------------
DROP TABLE IF EXISTS `user_permission`;
CREATE TABLE `user_permission` (
  `userPermissionId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  `actionIds` varchar(45) DEFAULT NULL,
  `permission` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userPermissionId`),
  KEY `fk_userPermission_moduleId` (`moduleId`),
  KEY `fk_userPermission_userId` (`userId`),
  KEY `fk_userPermission_actionId` (`actionIds`),
  CONSTRAINT `fk_userPermission_moduleId` FOREIGN KEY (`moduleId`) REFERENCES `module` (`moduleId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_userPermission_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of user_permission
-- ----------------------------
INSERT INTO user_permission VALUES ('53', '54', '1', '1,2,3,4', '0,0,0,0');
INSERT INTO user_permission VALUES ('54', '31', '1', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('55', '31', '2', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('56', '31', '3', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('57', '31', '4', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('58', '31', '5', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('59', '31', '6', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('60', '31', '7', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('61', '31', '8', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('62', '31', '9', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('63', '31', '10', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('64', '31', '11', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('65', '31', '12', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('66', '31', '13', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('67', '31', '14', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('68', '31', '19', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('69', '31', '20', '1,2,3,4,5,6', '1,1,1,1,-1,1,');
INSERT INTO user_permission VALUES ('70', '31', '21', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('71', '31', '22', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('72', '31', '23', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('73', '31', '24', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('74', '31', '25', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('75', '31', '26', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('76', '31', '27', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('77', '31', '28', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('78', '31', '29', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('79', '31', '30', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('81', '31', '32', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('82', '31', '33', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('83', '31', '34', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('84', '31', '35', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('85', '31', '36', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('86', '31', '37', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('87', '31', '38', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('88', '31', '39', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('89', '31', '40', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('90', '31', '41', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('91', '31', '42', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('92', '31', '43', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('93', '31', '44', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('94', '31', '45', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('95', '31', '46', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('96', '31', '47', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('97', '31', '48', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('98', '31', '49', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('99', '31', '50', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('101', '31', '52', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('102', '31', '53', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('103', '31', '55', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('104', '31', '56', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('105', '29', '1', '1,2,3,4', '1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('106', '29', '2', '1,2,3,4', '1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('107', '29', '3', '1,2,3,4', '1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('108', '29', '4', '1,2,3,4', '1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('109', '29', '5', '1,2,3,4', '1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('110', '29', '6', '1,2,3,4', '1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('111', '29', '7', '1,2,3,4', '1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('112', '29', '8', '1,2,3,4', '1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('113', '29', '9', '1,2,3,4', '1,1,1,1,');
INSERT INTO user_permission VALUES ('114', '29', '10', '1,2,3,4', '1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('115', '29', '11', '1,2,3,4', '1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('116', '29', '12', '1,2,3,4', '1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('117', '29', '13', '1,2,3,4', '1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('118', '29', '14', '1,2,3,4', '1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('119', '29', '19', '1,2,3,4', '1,1,1,1,');
INSERT INTO user_permission VALUES ('120', '29', '20', '1,2,3,4', '1,1,1,1,');
INSERT INTO user_permission VALUES ('121', '29', '21', '1,2,3,4', '1,1,1,1,');
INSERT INTO user_permission VALUES ('122', '29', '22', '1,2,3,4', '1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('123', '29', '23', '1,2,3,4', '1,1,1,1,');
INSERT INTO user_permission VALUES ('124', '29', '24', '1,2,3,4', '1,1,1,1,');
INSERT INTO user_permission VALUES ('125', '29', '25', '1,2,3,4', '1,1,1,1,');
INSERT INTO user_permission VALUES ('126', '29', '26', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('127', '29', '27', '1,2,3,4', '1,1,1,1,');
INSERT INTO user_permission VALUES ('128', '29', '28', '1,2,3,4', '1,1,1,1,');
INSERT INTO user_permission VALUES ('129', '29', '29', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('130', '29', '30', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('131', '29', '32', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('132', '29', '33', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('133', '29', '34', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('134', '29', '35', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('135', '29', '36', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('136', '29', '37', '1,2,3,4', '1,1,1,1,');
INSERT INTO user_permission VALUES ('137', '29', '38', '1,2,3,4', '1,1,1,1,');
INSERT INTO user_permission VALUES ('138', '29', '39', '1,2,3,4', '1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('139', '29', '40', '1,2,3,4', '1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('140', '29', '41', '1,2,3,4', '1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('141', '29', '42', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('142', '29', '43', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('143', '29', '44', '1,2,3,4', '1,1,1,1,');
INSERT INTO user_permission VALUES ('144', '29', '45', '1,2,3,4', '1,1,1,1,');
INSERT INTO user_permission VALUES ('145', '29', '46', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('146', '29', '47', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('147', '29', '48', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('148', '29', '49', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('149', '29', '50', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('150', '29', '52', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('151', '29', '53', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('152', '29', '55', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('153', '29', '56', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('154', '29', '66', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('155', '29', '67', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('156', '29', '68', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('157', '29', '70', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('158', '29', '71', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('159', '29', '72', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('160', '29', '73', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('161', '29', '74', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('162', '29', '75', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('163', '29', '76', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('164', '29', '77', '1,2,3,4', '-1,-1,-1,-1,');
INSERT INTO user_permission VALUES ('165', '31', '66', '1,2,3,4,5,6', '-1,-1,-1,-1,1,1,');
INSERT INTO user_permission VALUES ('166', '31', '67', '1,2,3,4,5,6', '-1,-1,-1,-1,1,1,');
INSERT INTO user_permission VALUES ('167', '31', '68', '1,2,3,4,5,6', '-1,-1,-1,-1,1,1,');
INSERT INTO user_permission VALUES ('168', '31', '70', '1,2,3,4,5,6', '-1,-1,-1,-1,1,1,');
INSERT INTO user_permission VALUES ('169', '31', '71', '1,2,3,4,5,6', '-1,-1,-1,-1,1,1,');
INSERT INTO user_permission VALUES ('170', '31', '72', '1,2,3,4,5,6', '-1,-1,-1,-1,1,1,');
INSERT INTO user_permission VALUES ('171', '31', '73', '1,2,3,4,5,6', '-1,-1,-1,-1,1,1,');
INSERT INTO user_permission VALUES ('172', '31', '74', '1,2,3,4,5,6', '-1,-1,-1,-1,1,1,');
INSERT INTO user_permission VALUES ('173', '31', '75', '1,2,3,4,5,6', '-1,-1,-1,-1,1,1,');
INSERT INTO user_permission VALUES ('174', '31', '76', '1,2,3,4,5,6', '-1,-1,-1,-1,1,1,');
INSERT INTO user_permission VALUES ('175', '31', '77', '1,2,3,4,5,6', '-1,-1,-1,-1,1,1,');
INSERT INTO user_permission VALUES ('176', '63', '10', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('177', '63', '1', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('178', '63', '2', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('179', '63', '3', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('180', '63', '4', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('181', '63', '5', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('182', '63', '6', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('183', '63', '7', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('184', '63', '8', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('185', '63', '9', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('186', '63', '11', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('187', '63', '12', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('188', '63', '13', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('189', '63', '14', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('190', '63', '19', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('191', '63', '20', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('192', '63', '21', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('193', '63', '22', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('194', '63', '23', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('195', '63', '24', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('196', '63', '25', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('197', '63', '26', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('198', '63', '27', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('199', '63', '28', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('200', '63', '29', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('201', '63', '30', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('202', '63', '32', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('203', '63', '33', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('204', '63', '34', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('205', '63', '35', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('206', '63', '36', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('207', '63', '37', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('208', '63', '38', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('209', '63', '39', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('210', '63', '40', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('211', '63', '41', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('212', '63', '42', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('213', '63', '43', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('214', '63', '44', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('215', '63', '45', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('216', '63', '46', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('217', '63', '47', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('218', '63', '48', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('219', '63', '49', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('220', '63', '50', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('221', '63', '52', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('222', '63', '53', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('223', '63', '55', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('224', '63', '56', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('225', '63', '66', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('226', '63', '67', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('227', '63', '68', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('228', '63', '70', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('229', '63', '71', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('230', '63', '72', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('231', '63', '73', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('232', '63', '74', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('233', '63', '75', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('234', '63', '76', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('235', '63', '77', '1,2,3,4,5,6', '1,1,1,1,1,1,');

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `roleId` (`roleId`),
  KEY `userId` (`userId`),
  CONSTRAINT `fk_userRole_roleId` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_userRole_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO user_role VALUES ('31', '34');
INSERT INTO user_role VALUES ('42', '35');
INSERT INTO user_role VALUES ('34', '36');
INSERT INTO user_role VALUES ('59', '36');
INSERT INTO user_role VALUES ('60', '36');
INSERT INTO user_role VALUES ('29', '37');
INSERT INTO user_role VALUES ('58', '37');
INSERT INTO user_role VALUES ('61', '37');
INSERT INTO user_role VALUES ('56', '38');
INSERT INTO user_role VALUES ('57', '38');
