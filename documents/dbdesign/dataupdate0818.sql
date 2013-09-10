

DROP TABLE IF EXISTS `p_user_role`;
CREATE TABLE `p_user_role` (
  `UID` int(11) NOT NULL COMMENT '用户ID',
  `RoleID` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

insert into p_user_role(UID,RoleID)
values(1,5);

DROP TABLE IF EXISTS `info_sys_notice`;
CREATE TABLE `info_sys_notice` (
  `NoticeID` int(11) NOT NULL AUTO_INCREMENT COMMENT '告公ID',
  `Title` varchar(128) NOT NULL COMMENT '标题',
  `Content` longtext NOT NULL COMMENT '内容',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`NoticeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- View structure for `v_class_exam`
-- ----------------------------
DROP VIEW IF EXISTS `v_class_exam`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_class_exam` AS select `e`.`ExamID` AS `ExamID`,`e`.`ExamName` AS `ExamName`,`e`.`ExamTime` AS `ExamTime`,`e`.`SchoolID` AS `SchoolID`,`e`.`GradeID` AS `GradeID`,`e`.`ClassID` AS `ClassID`,`e`.`Type` AS `Type`,`e`.`Scope` AS `Scope`,`e`.`Rank1` AS `Rank1`,`e`.`Rank2` AS `Rank2`,`e`.`Rank3` AS `Rank3`,`e`.`CreatorID` AS `CreatorID`,`e`.`CreateTime` AS `CreateTime`,`e`.`State` AS `State`,`c`.`ClassID` AS `ClassIDq` from (`info_class` `c` join `info_exam` `e`) where ((`c`.`GradeID` = `e`.`GradeID`) and (`c`.`Type` = `e`.`Type`));

-- ----------------------------
-- View structure for `v_exam_subject`
-- ----------------------------
DROP VIEW IF EXISTS `v_exam_subject`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_exam_subject` AS select `es`.`ExamID` AS `ExamID`,`es`.`SubjectID` AS `SubjectID`,`es`.`FullScore` AS `FullScore`,`es`.`PassScore` AS `PassScore`,`es`.`YRefer` AS `YRefer`,`es`.`ScoreRange` AS `ScoreRange`,`es`.`State` AS `State`,`s`.`SubjectName` AS `subjectname` from (`info_exam_subject` `es` join `info_subject` `s`) where (`es`.`SubjectID` = `s`.`SubjectID`);

-- ----------------------------
-- View structure for `v_teacher`
-- ----------------------------
DROP VIEW IF EXISTS `v_teacher`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_teacher` AS select `t`.`UID` AS `UID`,`t`.`SchoolID` AS `SchoolID`,`t`.`SubjectID` AS `SubjectID`,`t`.`Name` AS `Name`,`t`.`Sex` AS `Sex`,`t`.`Position` AS `Position`,`t`.`EntryTime` AS `EntryTime`,`t`.`CreatorID` AS `CreatorID`,`t`.`CreateTime` AS `CreateTime`,`t`.`State` AS `State`,`tr`.`GradeID` AS `gradeid`,`tr`.`ClassID` AS `classid`,`cm`.`ClassID` AS `classidm`,`gm`.`GradeID` AS `gradeidm`,`ur`.`RoleID` AS `RoleID`,`u`.`UserName` AS `username` from (((((`info_teacher` `t` left join `info_teachrelation` `tr` on(((`t`.`UID` = `tr`.`UID`) and (`tr`.`State` = 1)))) left join `info_class_manage` `cm` on(((`t`.`UID` = `cm`.`UID`) and (`cm`.`State` = 1)))) left join `info_grade_manage` `gm` on(((`t`.`UID` = `gm`.`UID`) and (`gm`.`State` = 1)))) left join `p_user_role` `ur` on((`t`.`UID` = `ur`.`UID`))) left join `info_user` `u` on((`t`.`UID` = `u`.`UID`)));



