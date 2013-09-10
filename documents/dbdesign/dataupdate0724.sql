UPDATE info_subject
set SubjectName = '总分(理科)',type =0
where SubjectID = 12;

INSERT INTO `info_subject` 
VALUES(13,'总分(文科)',0,'1,2,3,7,8,9',0,750,450,NOW(),0,1);

INSERT INTO `info_subject` 
VALUES(14,'总分',0,'1,2,3,4,5,6,7,8,9',0,1050,630,NOW(),0,1);