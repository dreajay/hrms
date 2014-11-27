/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50145
Source Host           : localhost:3306
Source Database       : hrms

Target Server Type    : MYSQL
Target Server Version : 50145
File Encoding         : 65001

*/

SET FOREIGN_KEY_CHECKS=0;
DROP DATABASE IF EXISTS hrms;
CREATE DATABASE hrms;
USE hrms;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `employee_state`
-- ----------------------------
DROP TABLE IF EXISTS `employee_state`;
CREATE TABLE `employee_state` (
  `employeeStateId` int(11) NOT NULL AUTO_INCREMENT,
  `employeeState` varchar(45) DEFAULT NULL,
  `remark` text,
  PRIMARY KEY (`employeeStateId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `leavetype`
-- ----------------------------
DROP TABLE IF EXISTS `leavetype`;
CREATE TABLE `leavetype` (
  `leaveTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `leaveType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`leaveTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;


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
  `leaveTypeId` int(11) NOT NULL,
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
  CONSTRAINT `fk_leave_leaveTypeId` FOREIGN KEY (`leaveTypeId`) REFERENCES `leavetype` (`leaveTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `redeploy_type`
-- ----------------------------
DROP TABLE IF EXISTS `redeploy_type`;
CREATE TABLE `redeploy_type` (
  `redeployTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `redeployType` varchar(45) NOT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`redeployTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `traintype`
-- ----------------------------
DROP TABLE IF EXISTS `traintype`;
CREATE TABLE `traintype` (
  `trainTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `trainType` varchar(45) NOT NULL,
  `remark` text,
  PRIMARY KEY (`trainTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) NOT NULL,
  `roleDescription` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `action`
-- ----------------------------
DROP TABLE IF EXISTS `action`;
CREATE TABLE `action` (
  `actionId` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(45) NOT NULL,
  PRIMARY KEY (`actionId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8;



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
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB AUTO_INCREMENT=709 DEFAULT CHARSET=utf8;











-- init data

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
-- Records of traintype
-- ----------------------------
INSERT INTO traintype VALUES ('1', '公司内部培训', '公司内部培训');
INSERT INTO traintype VALUES ('2', '公司外部培训', '公司外部培训');
INSERT INTO traintype VALUES ('3', '其他公司培训', '其他公司培训');


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
-- Records of action
-- ----------------------------
INSERT INTO action VALUES ('1', '浏览');
INSERT INTO action VALUES ('2', '创建');
INSERT INTO action VALUES ('3', '更新');
INSERT INTO action VALUES ('4', '删除');
INSERT INTO action VALUES ('5', '审批');
INSERT INTO action VALUES ('6', '其他');


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
-- Records of dept 
-- ----------------------------
INSERT INTO dept VALUES ('1', '懂事会', '公司最高机构', null, '杰哥', '123456', '');
INSERT INTO dept VALUES ('2', '总裁', '总裁', '1', '杰哥', '123456', '');
INSERT INTO dept VALUES ('3', '总裁办', '公司总裁办', '2', '杰哥', '123456', '');
INSERT INTO dept VALUES ('4', '公司总部', '公司行政总部管理', '3', '杰哥', '123456', '');
INSERT INTO dept VALUES ('5', '人力资源部', '人力资源管理', '4', '杰哥', '123456', '');
INSERT INTO dept VALUES ('6', '财务部', '财务管理机构', '4', '杰哥', '123456', '');
INSERT INTO dept VALUES ('7', '生产部', '管理生产', '4', '杰哥', '123456', '管理生产');
INSERT INTO dept VALUES ('8', '资财部', '财务管理', '4', '杰哥', '123456', '');
INSERT INTO dept VALUES ('9', '行政部', '行政管理', '4', '杰哥', '123456', '');
INSERT INTO dept VALUES ('10', '研发部', '产品研发', '4', '杰哥', '123456', '');
INSERT INTO dept VALUES ('11', '财务部', '管理财务', '4', '杰哥', '123456', '');
INSERT INTO dept VALUES ('12', '采购部', '物品采购', '4', '杰哥', '123456', '');
INSERT INTO dept VALUES ('13', '采购组', '采购物品', '4', '杰哥', '123456', '');
INSERT INTO dept VALUES ('14', '市场部', '市场开发', '4', '杰哥', '123456', '');
INSERT INTO dept VALUES ('15', '销售部', '市场销售', '4', '杰哥', '123456', '');
INSERT INTO dept VALUES ('16', '营销事业部', '市场营销', '1', '杰哥', '123456', '');
INSERT INTO dept VALUES ('17', '生产一部', '管理生产一部', '7', '杰哥', '123456', '');
INSERT INTO dept VALUES ('18', '生产二部', '管理生产二部', '7', '杰哥', '123456', '');
INSERT INTO dept VALUES ('19', '生产三部', '管理生产三部', '7', '杰哥', '123456', '');
INSERT INTO dept VALUES ('20', '物流部', '物流运载', '4', '杰哥', '123456', '');
INSERT INTO dept VALUES ('21', '开发部', '开发', '4', 'djj', '123456', '开发');


-- ----------------------------
-- Records of post 
-- ----------------------------
INSERT INTO post VALUES ('1', '总经理', '负责公司运作', '10000', null, '');
INSERT INTO post VALUES ('2', '副经理', '协助总经理管理公司', '8000', '1', '');
INSERT INTO post VALUES ('3', '市场部经理', '管理市场', '8000', '1', '');
INSERT INTO post VALUES ('4', '营销部经理', '市场营销', '7000', '3', '');
INSERT INTO post VALUES ('5', '销售部经理', '市场销售', '7000', '3', '');
INSERT INTO post VALUES ('6', '生产副总', '市场管理', '7000', '1', '');

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




-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO user VALUES ('1', 'admin', '杰哥', 'A2GTdNkfWkw=', '2010-11-26 13:19:06', '1');


-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO role VALUES ('1', '管理员', '系统管理员');


-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO user_role VALUES ('1', '1');


-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO employee VALUES ('1', '马云', '男', '1965-10-18', '123456', '赣州', '123456', 'dai_junjie@163.com', '329258829', '汉', '福建', '未婚', '清白', null, '本科', '学士', '赣南师范学院', '2011-06-01', '网络工程', null, null, null, null, '1', '工程师', '0', '3', '1', '没有');
INSERT INTO employee VALUES ('2', '马化腾', '男', '1970-01-11', '23542134545', '是短发是', '1223434', '是短发是', null, '是短发是', '', '是短发是', '是短发是', null, '是短发是', '是短发是', '是短发是', '2011-01-24', '是短发是', null, null, null, null, '7', '是短发是', '0', '25', '6', '是短发是');
INSERT INTO employee VALUES ('3', '李彦宏', '男', '1969-01-04', '1232332', '赣州', '123322332', 'dai_junjie@163.com', '329258829', '汉', '福建', '未婚', '团员', null, '本科', '学士', '赣南师范学院', '2011-01-04', '网络工程', null, null, null, null, '1', '软件设计师', '0', '3', '6', '啊啊');


-- ----------------------------
-- Records of employee_redeploy
-- ----------------------------
INSERT INTO employee_redeploy VALUES ('1', '1', '2011-01-01', '', '2010-01-05', '开发部', '软件设计师', null, '3', '6', '1', null, null, '已提交');
INSERT INTO employee_redeploy VALUES ('2', '2', '2011-01-29', '', null, '生产一部', '生产副总', null, '1', '2', '3', '', null, '已提交');
INSERT INTO employee_redeploy VALUES ('3', '9', '2011-01-29', '戴总', null, '物流部', '副经理', '更改', '6', '4', '4', null, null, '已提交');
INSERT INTO employee_redeploy VALUES ('4', '9', '2011-01-29', '戴总', null, '物流部', '副经理', '更改', '6', '4', '4', null, null, '已提交');
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

-- ----------------------------
-- Records of leave
-- ----------------------------
-- INSERT INTO leave VALUES ('1', '杰哥', '人力资源部', '2011-04-28', '回校论文答辩', '1', '2011-05-16 18:24:53', '2011-06-24 18:25:07', '2011-04-27 18:26:33', '2011-04-28', '杰哥', '同意', 'asd发', '审批完毕');
-- INSERT INTO leave VALUES ('2', '杰哥', '人力资源部', '2011-04-28', '宿舍撒', '3', '2011-04-28 00:00:00', '2011-04-29 00:00:00', null, '2011-04-28', null, null, '', '待审批');

-- ----------------------------
-- Records of recruit
-- ----------------------------
INSERT INTO recruit VALUES ('1', 'java软件工程师', '开发部', '杰哥', null, '2011-04-01', '公司需求', '公司副总', '熟练开发流程和开发业务', '3', '大专以上', '3年以上工作经验', '7000', '全职', '网络招聘', '2011-04-17', '审批完毕', '杰哥', '不同意', '不同意', '2011-04-05', '2011-06-01');
INSERT INTO recruit VALUES ('2', '招聘c软件工程师', '办公室', '杰哥', 'idreamjay@gmail.com', '2011-04-15', '公司业务需要', 'c实习工程师', '软件开发', '5', '熟练c语言', '0', '2000-3000', '实习生', '校园招聘', '2011-04-17', '已发布', '杰哥', '同意', '同意', '2011-04-20', '2011-10-28');



-- ----------------------------
-- Records of jobseeker
-- ----------------------------
INSERT INTO jobseeker VALUES ('1', '1', '李伟', '男', '赣南师范学院', '本科', '123456', 'liwei@163.com', '20114211624843-29958655886912501261李伟registrationForm.doc', '2011421162484344623396012917783091李伟resume.doc');
INSERT INTO jobseeker VALUES ('2', '1', '陆毅', '男', '清华大学', '本科', '123456', 'ly@163.com', '20114211630281-61035574307658767942陆毅registrationForm.doc', '20114211630281-68685887650014779562陆毅resume.doc');





-- ----------------------------
-- Records of train
-- ----------------------------
INSERT INTO train VALUES ('1', 'java', 'java', '公司', '杰哥,djj', 'teachers', '达到公司用人要求', '2010-10-08 00:00:00', '2010-10-30 00:00:00', '1', null, 'good study');
INSERT INTO train VALUES ('2', 'struts2', 'study, java', 'aa', 'djj', 'teacher', '熟悉公司业务框架', '2010-10-08 00:00:00', '2010-10-30 00:00:00', '2', null, 'good');
INSERT INTO train VALUES ('8', '再续复杂的算法', '上大放大声的, 撒的发生大幅', '撒的发生的', '杰哥', '士大夫撒旦', '熟悉语言算法', '2010-12-02 00:00:00', '2011-01-12 00:00:00', '3', null, '撒的发生');




-- ----------------------------
-- Records of role_module
-- ----------------------------
INSERT INTO role_module VALUES ('1', '1', '6,3,1,2,7,8,39,40,11,41,12,13,19,20,21,42,43,44,45,9,23,24,25,27,28,10,14,22,36,4,46,47,48,49');
INSERT INTO role_module VALUES ('2', '2', '1,9,37');



-- ----------------------------
-- Records of user_module
-- ----------------------------
INSERT INTO user_module VALUES ('1', '1', '9,23,24,25,27,28,50,8,10,1,2,12,13,19,20,21,3,4,46,47,48,49,6,11,41,7,39,40,14,22,26,30,36,37,38,42,43,44,45');
INSERT INTO user_module VALUES ('2', '2', '1,2,19,20,21,3,43,44,45,8,36,9,23,24,25,27,6,11,41,7,39,40,10,14,28');



-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO role_permission VALUES ('1', '1',  '1', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('2', '1',  '2', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('3', '1',  '3', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('4', '1',  '4', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('5', '1',  '5', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('6', '1',  '6', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('7', '1',  '7', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('8', '1',  '8', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('9', '1',  '9', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('10', '1', '10', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('11', '1', '11', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('12', '1', '12', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('13', '1', '13', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('14', '1', '14', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('20', '1', '20', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('21', '1', '21', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('22', '1', '22', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('23', '1', '23', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('24', '1', '24', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('25', '1', '25', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('26', '1', '26', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('28', '1', '28', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('29', '1', '29', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('30', '1', '30', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('31', '1', '31', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('32', '1', '32', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('33', '1', '33', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('34', '1', '34', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('35', '1', '35', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('36', '1', '36', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('37', '1', '37', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('38', '1', '38', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('39', '1', '39', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('40', '1', '40', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('41', '1', '41', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('42', '1', '42', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('43', '1', '43', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('44', '1', '44', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('45', '1', '45', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO role_permission VALUES ('46', '1', '46', '1,2,3,4,5,6', '1,1,1,1,1,1,');





-- ----------------------------
-- Records of user_permission
-- ----------------------------
INSERT INTO user_permission VALUES ('1',  '1', '1', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('2',  '1', '2', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('3',  '1', '3', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('4',  '1', '4', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('5',  '1', '5', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('6',  '1', '6', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('7',  '1', '7', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('8',  '1', '8', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('9',  '1', '9', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('10', '1', '10', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('11', '1', '11', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('12', '1', '12', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('13', '1', '13', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('14', '1', '14', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('15', '1', '15', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('16', '1', '16', '1,2,3,4,5,6', '1,1,1,1,-1,1,');
INSERT INTO user_permission VALUES ('17', '1', '17', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('18', '1', '18', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('19', '1', '19', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('20', '1', '20', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('21', '1', '21', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('22', '1', '22', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('23', '1', '23', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('24', '1', '24', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('25', '1', '25', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('26', '1', '26', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('28', '1', '28', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('29', '1', '29', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('30', '1', '30', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('31', '1', '31', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('32', '1', '32', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('33', '1', '33', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('34', '1', '34', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('35', '1', '35', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('36', '1', '36', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('37', '1', '37', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('38', '1', '38', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('39', '1', '39', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('40', '1', '40', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('41', '1', '41', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('42', '1', '42', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('43', '1', '43', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('44', '1', '44', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('45', '1', '45', '1,2,3,4,5,6', '1,1,1,1,1,1,');
INSERT INTO user_permission VALUES ('46', '1', '46', '1,2,3,4,5,6', '1,1,1,1,1,1,');

