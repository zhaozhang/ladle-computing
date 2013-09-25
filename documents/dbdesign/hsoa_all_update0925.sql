
-- ----------------------------
-- Procedure structure for `sp_exam_class_stat_update`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_exam_class_stat_update`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_exam_class_stat_update`(IN ExamID int(11))
    READS SQL DATA
    COMMENT '更新考试班级统计'
BEGIN
	DECLARE SeqID INT;  
	DECLARE SubjectID INT;  
	DECLARE GradeID INT;
	DECLARE ClassID INT;

	DECLARE AvgScore FLOAT;
	DECLARE MaxScore FLOAT;
	DECLARE MinScore FLOAT;
	DECLARE Count INT;
	DECLARE PassCount INT;
	DECLARE UID INT;
	DECLARE done INT DEFAULT 0;

	DECLARE ScoreRange VARCHAR(256) DEFAULT '';
	DECLARE ScoreRangeSet VARCHAR(256) DEFAULT '';
	DECLARE done2 INT DEFAULT 0;
	DECLARE ScoreTemp VARCHAR(20) DEFAULT '';
	DECLARE ScoreCount INT DEFAULT 0;
	DECLARE pos INT DEFAULT 0;
	DECLARE isfirst INT DEFAULT 1;

	DECLARE cur1 CURSOR FOR SELECT DISTINCT es.SubjectID, es.GradeID, es.ClassID FROM info_exam_score es WHERE es.ExamID = ExamID and es.Score > 0;  
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;  

	OPEN cur1;  
	FETCH cur1 INTO SubjectID,GradeID,ClassID;
	WHILE done <> 1 DO

		SET AvgScore = (SELECT AVG(es.Score) FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND es.Score > 0);
		SET MaxScore = (SELECT Max(es.Score) FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND es.Score > 0);
		SET MinScore = (SELECT Min(es.Score) FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND es.Score > 0);
		SET Count = (SELECT Count(es.SeqID) FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND es.Score > 0);
		SET PassCount = (SELECT Count(es.SeqID) FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID 
												AND es.Score > (SELECT s.PassScore FROM info_exam_subject s WHERE s.ExamID = ExamID AND s.SubjectID = SubjectID));

		SET ScoreRangeSet = '';
		SET ScoreRangeSet = (SELECT s.ScoreRange FROM info_exam_subject s WHERE s.ExamID = ExamID AND s.SubjectID = SubjectID);
		SET done2 = 0;
		SET ScoreRange = '';
		SET isfirst = 1;
		SET pos = 0;

		CALL sp_util_split(ScoreRangeSet,',');
		BEGIN
			DECLARE cur2 CURSOR FOR SELECT VALUE FROM splittable ORDER BY id;  
			DECLARE CONTINUE HANDLER FOR NOT FOUND SET done2=1;  

			OPEN cur2;  
			FETCH cur2 INTO ScoreTemp;
			WHILE done2 <> 1 DO
				SET pos = INSTR(ScoreTemp,'-');
			#	SELECT SUBSTRING(ScoreTemp,pos+1,LENGTH(ScoreTemp)-pos),SUBSTRING(ScoreTemp,1,pos-1);
				SET ScoreCount = (SELECT Count(es.SeqID) FROM info_exam_score es where es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID 
																				AND es.Score >= SUBSTRING(ScoreTemp,1,pos-1) AND es.Score <= SUBSTRING(ScoreTemp,pos+1,LENGTH(ScoreTemp)-pos));
				IF (isfirst) THEN
					SET ScoreRange = CONCAT(ScoreRange,ScoreCount);
				ELSE
					SET ScoreRange = CONCAT(ScoreRange,',',ScoreCount);
				END IF;

				SET isfirst = 0;
				FETCH cur2 INTO ScoreTemp;
			END WHILE;
		END;

		IF EXISTS(SELECT * FROM info_subject s WHERE s.SubjectID = SubjectID AND s.State = 1 AND s.ReferSubjectID <> '') THEN
			SET UID = (SELECT m.UID FROM info_class_manage m WHERE m.ClassID = ClassID AND m.State = 1);
		ELSE 
			SET UID = (SELECT m.UID FROM info_teachrelation m WHERE m.ClassID = ClassID AND m.SubjectID = SubjectID AND m.State = 1);
		END IF;

		IF EXISTS(SELECT c.ExamID FROM info_exam_class_stat c WHERE c.ExamID = ExamID AND c.GradeID = GradeID AND c.ClassID = ClassID AND c.SubjectID = SubjectID) THEN
			UPDATE info_exam_class_stat c SET c.ScoreRange = ScoreRange,c.Avg = AvgScore,c.Max = MaxScore,c.Min = MinScore,c.Count = Count,c.PassCount = PassCount,c.UID = UID WHERE  c.ExamID = ExamID AND c.GradeID = GradeID AND c.ClassID = ClassID AND c.SubjectID = SubjectID;
		ELSE 
			INSERT INTO info_exam_class_stat(ExamID,GradeID,ClassID,SubjectID,Avg,Max,Min,Count,PassCount,UID,ScoreRange) VALUES(ExamID,GradeID,ClassID,SubjectID,AvgScore,MaxScore,MinScore,Count,PassCount,UID,ScoreRange);
		END IF;

		FETCH cur1 INTO SubjectID,GradeID,ClassID;
		
	END WHILE;



	update info_exam_class_stat e
	set e.AvgRank =
	( select  t3.AvgRank  from
		(select  count(t2.Avg) as AvgRank,t1.ExamID,t1.SubjectID,t1.ClassID from info_exam_class_stat t2,info_exam_class_stat t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID
			and ( t1.Avg<t2.Avg or (t1.Avg=t2.Avg and t1.ClassID=t2.ClassID ))
    		 group by t1.ExamID, t1.SubjectID ,t1.ClassID
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.ClassID = e.ClassID
	)
	where e.ExamID = ExamID;

	update info_exam_class_stat e
	set MaxRank =
	( select  t3.MaxRank  from
		( select  count(t2.Max) as MaxRank,t1.ExamID,t1.SubjectID,t1.ClassID from info_exam_class_stat t2,info_exam_class_stat t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID
			and ( t1.Max<t2.Max or (t1.Max=t2.Max and t1.ClassID=t2.ClassID ))
    	 	group by t1.ExamID, t1.SubjectID ,t1.ClassID
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.ClassID = e.ClassID
	)
	where e.ExamID = ExamID;

	update info_exam_class_stat e
	set MinRank =
	( select  t3.MinRank  from
		( select  count(t2.Min) as MinRank,t1.ExamID,t1.SubjectID,t1.ClassID from info_exam_class_stat t2,info_exam_class_stat t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID
			and ( t1.Min<t2.Min or (t1.Min=t2.Min and t1.ClassID=t2.ClassID ))
    		 group by t1.ExamID, t1.SubjectID ,t1.ClassID
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.ClassID = e.ClassID
	)
	where e.ExamID = ExamID;

	update info_exam_class_stat e
	set PassRank =
	( select  t3.PassRank  from
		( select count(t2.PassCount/t2.Count) as PassRank,t1.ExamID,t1.SubjectID,t1.ClassID from info_exam_class_stat t2,info_exam_class_stat t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID
			and (( t1.PassCount/t1.Count)<(t2.PassCount/t2.Count) or ((t1.PassCount/t1.Count)=(t2.PassCount/t2.Count) and t1.ClassID=t2.ClassID ))
  	  	 group by t1.ExamID, t1.SubjectID ,t1.ClassID
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.ClassID = e.ClassID
	)
	where e.ExamID = ExamID;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_exam_grade_stat_update`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_exam_grade_stat_update`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_exam_grade_stat_update`(IN ExamID int(11))
    READS SQL DATA
    COMMENT '更新考试班级统计'
BEGIN
	DECLARE SubjectID INT;  
	DECLARE GradeID INT;

	DECLARE AvgScore FLOAT;
	DECLARE MaxScore FLOAT;
	DECLARE MinScore FLOAT;
	DECLARE Count INT;
	DECLARE PassCount INT;
	DECLARE done INT DEFAULT 0;  

	DECLARE ScoreRange VARCHAR(256) DEFAULT '';
	DECLARE ScoreRangeSet VARCHAR(256) DEFAULT '';
	DECLARE done2 INT DEFAULT 0;
	DECLARE ScoreTemp VARCHAR(20) DEFAULT '';
	DECLARE ScoreCount INT DEFAULT 0;
	DECLARE pos INT DEFAULT 0;
	DECLARE isfirst INT DEFAULT 1;

	DECLARE cur1 CURSOR FOR SELECT DISTINCT es.SubjectID, es.GradeID FROM info_exam_score es WHERE es.ExamID = ExamID and es.Score > 0;  
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;  

	OPEN cur1;  
	emp_loop: LOOP  
		FETCH cur1 INTO SubjectID,GradeID;
		IF done=1 THEN 
			LEAVE emp_loop;  
		END IF;
		SET AvgScore = (SELECT AVG(es.Score) FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.Score > 0);
		SET MaxScore = (SELECT Max(es.Score) FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.Score > 0);
		SET MinScore = (SELECT Min(es.Score) FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.Score > 0);
		SET Count = (SELECT Count(es.SeqID) FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.Score > 0);
		SET PassCount = (SELECT Count(es.SeqID) FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID 
												AND es.Score > (SELECT s.PassScore FROM info_exam_subject s WHERE s.ExamID = ExamID AND s.SubjectID = SubjectID));
		
		SET ScoreRangeSet = '';
		SET ScoreRangeSet = (SELECT s.ScoreRange FROM info_exam_subject s WHERE s.ExamID = ExamID AND s.SubjectID = SubjectID);
		SET done2 = 0;
		SET ScoreRange = '';
		SET isfirst = 1;
		SET pos = 0;
		CALL sp_util_split(ScoreRangeSet,',');
		BEGIN
			DECLARE cur2 CURSOR FOR SELECT VALUE FROM splittable ORDER BY id;  
			DECLARE CONTINUE HANDLER FOR NOT FOUND SET done2=1;  

			OPEN cur2;  
			FETCH cur2 INTO ScoreTemp;
			WHILE done2 <> 1 DO
				SET pos = INSTR(ScoreTemp,'-');
			#	SELECT SUBSTRING(ScoreTemp,pos+1,LENGTH(ScoreTemp)-pos),SUBSTRING(ScoreTemp,1,pos-1);
				SET ScoreCount = (SELECT Count(es.SeqID) FROM info_exam_score es where es.ExamID = ExamID AND es.SubjectID = SubjectID
																				AND es.Score >= SUBSTRING(ScoreTemp,1,pos-1) AND es.Score <= SUBSTRING(ScoreTemp,pos+1,LENGTH(ScoreTemp)-pos));
				IF (isfirst) THEN
					SET ScoreRange = CONCAT(ScoreRange,ScoreCount);
				ELSE
					SET ScoreRange = CONCAT(ScoreRange,',',ScoreCount);
				END IF;

				SET isfirst = 0;
				FETCH cur2 INTO ScoreTemp;
			END WHILE;
		END;
		

		IF EXISTS(SELECT c.ExamID FROM info_exam_grade_stat c WHERE c.ExamID = ExamID AND c.GradeID = GradeID AND c.SubjectID = SubjectID) THEN
			UPDATE info_exam_grade_stat c SET c.ScoreRange = ScoreRange,c.Avg = AvgScore,c.Max = MaxScore,c.Min = MinScore,c.Count = Count,c.PassCount = PassCount WHERE  c.ExamID = ExamID AND c.GradeID = GradeID AND c.SubjectID = SubjectID;
		ELSE 
			INSERT INTO info_exam_grade_stat(ExamID,GradeID,SubjectID,Avg,Max,Min,Count,PassCount,ScoreRange) VALUES(ExamID,GradeID,SubjectID,AvgScore,MaxScore,MinScore,Count,PassCount,ScoreRange);
		END IF;
	END LOOP emp_loop;  
	CLOSE cur1;  	


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_exam_rank_update`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_exam_rank_update`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_exam_rank_update`(IN ExamID int(11))
    READS SQL DATA
    COMMENT '更新考试排名'
BEGIN
	DECLARE SeqID INT;  
	DECLARE SubjectID INT;  
	DECLARE GradeID INT;
	DECLARE ClassID INT;
	DECLARE Score INT;
	DECLARE ClassRank INT;
	DECLARE GradeRank INT;
	DECLARE done INT DEFAULT 0;  

	DECLARE cur1 CURSOR FOR SELECT es.SeqID, es.SubjectID, es.GradeID, es.ClassID, es.Score FROM info_exam_score es WHERE es.ExamID = ExamID and es.Score > 0;  
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;  

	OPEN cur1;  
	emp_loop: LOOP  
		FETCH cur1 INTO SeqID,SubjectID,GradeID,ClassID,Score;
		IF done=1 THEN 
			LEAVE emp_loop;  
		END IF;
		SET ClassRank = (SELECT COUNT(es.SeqID)+1 FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND es.Score > Score);
		SET GradeRank = (SELECT COUNT(es.SeqID)+1 FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.GradeID = GradeID AND es.Score > Score);
		UPDATE info_exam_score es SET es.ClassRank = ClassRank,es.GradeRank = GradeRank WHERE es.SeqID = SeqID;
	END LOOP emp_loop;  
	CLOSE cur1;  
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_exam_score_update`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_exam_score_update`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_exam_score_update`(IN ExamID int(11))
    READS SQL DATA
    COMMENT '更新考试关联分数'
BEGIN
	DECLARE SeqID INT;  
	DECLARE SubjectID INT;  
	DECLARE ReferSubjectID VARCHAR(256);

	DECLARE done INT DEFAULT 0;  

	DECLARE cur1 CURSOR FOR SELECT es.SubjectID,es.ReferSubjectID FROM v_exam_subject es WHERE es.ExamID = ExamID AND es.State = 1 AND es.ReferSubjectID <>'';  
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;  

	OPEN cur1;  
	emp_loop: LOOP  
		FETCH cur1 INTO SubjectID,ReferSubjectID;
		IF done=1 THEN 
			LEAVE emp_loop;  
		END IF;

		SET ReferSubjectID = CONCAT('^[',ReferSubjectID,']{1}$');
		#先更新有的
		UPDATE info_exam_score e,
		(SELECT es.ExamID,es.UID,es.GradeID,es.ClassID,SubjectID AS SubjectID,SUM(es.Score) AS Score FROM info_exam_score es WHERE es.ExamID =ExamID  AND es.SubjectID REGEXP ReferSubjectID
		GROUP BY es.ExamID,es.UID,es.GradeID,es.ClassID) AS t
		SET e.Score = t.Score
		WHERE e.ExamID = t.ExamID AND e.UID = t.UID AND e.SubjectID = t.SubjectID;
		
		INSERT INTO info_exam_score(ExamID,UID,GradeID,ClassID,SubjectID,Score)
		SELECT es.ExamID,es.UID,es.GradeID,es.ClassID,SubjectID,SUM(es.Score) FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID REGEXP ReferSubjectID 
		AND NOT EXISTS (SELECT s.SeqID FROM info_exam_score s WHERE s.ExamID = ExamID AND s.UID = es.UID AND s.SubjectID = SubjectID)
		GROUP BY es.ExamID,es.UID,es.GradeID,es.ClassID;

	END LOOP emp_loop;  
	CLOSE cur1;  
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_util_split`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_util_split`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_util_split`(
    inputstring VARCHAR(1000),
    delim CHAR(1)
)
BEGIN
    DECLARE strlen INT;
    DECLARE last_index INT;
    DECLARE cur_index INT;
    DECLARE cur_char VARCHAR(200);
    DECLARE len INT;
    SET cur_index=1;
    SET last_index=0;
    SET strlen=LENGTH(inputstring);  
    DROP TABLE IF EXISTS splittable;
    CREATE TEMPORARY TABLE splittable(
        id INT AUTO_INCREMENT,
        VALUE VARCHAR(20),
        PRIMARY KEY (`ID`),
        UNIQUE KEY `ID` (`ID`)
    ) ;
    WHILE(cur_index<=strlen) DO    
    BEGIN
        IF SUBSTRING(inputstring FROM cur_index FOR 1)=delim OR cur_index=strlen THEN
            SET len=cur_index-last_index-1;
            IF cur_index=strlen THEN
               SET len=len+1;
            END IF;
            INSERT INTO splittable(`value`)VALUES(SUBSTRING(inputstring FROM (last_index+1) FOR len));
            SET last_index=cur_index;
        END IF;
        SET cur_index=cur_index+1;
    END;
    END WHILE;
END
;;
DELIMITER ;


CALL sp_exam_score_update(1);
CALL sp_exam_score_update(2);
CALL sp_exam_score_update(3);
CALL sp_exam_score_update(4);
CALL sp_exam_score_update(5);
CALL sp_exam_score_update(6);
CALL sp_exam_score_update(7);
CALL sp_exam_score_update(8);

CALL sp_exam_rank_update(1);
CALL sp_exam_rank_update(2);
CALL sp_exam_rank_update(3);
CALL sp_exam_rank_update(4);
CALL sp_exam_rank_update(5);
CALL sp_exam_rank_update(6);
CALL sp_exam_rank_update(7);
CALL sp_exam_rank_update(8);

CALL sp_exam_class_stat_update(1);
CALL sp_exam_class_stat_update(2);
CALL sp_exam_class_stat_update(3);
CALL sp_exam_class_stat_update(4);
CALL sp_exam_class_stat_update(5);
CALL sp_exam_class_stat_update(6);
CALL sp_exam_class_stat_update(7);
CALL sp_exam_class_stat_update(8);

CALL sp_exam_grade_stat_update(1);
CALL sp_exam_grade_stat_update(2);
CALL sp_exam_grade_stat_update(3);
CALL sp_exam_grade_stat_update(4);
CALL sp_exam_grade_stat_update(5);
CALL sp_exam_grade_stat_update(6);
CALL sp_exam_grade_stat_update(7);
CALL sp_exam_grade_stat_update(8);