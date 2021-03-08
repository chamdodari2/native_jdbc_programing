-- 학생관리
DROP SCHEMA IF EXISTS StudentMgn;

-- 학생관리
CREATE SCHEMA StudentMgn;

-- 학생개인정보
CREATE TABLE StudentMgn.studentData (
	stdNo INT(8) NOT NULL COMMENT '학번' -- 학번
)
COMMENT '학생개인정보';

-- 학생개인정보
ALTER TABLE StudentMgn.studentData
	ADD CONSTRAINT PK_studentData -- 학생개인정보 기본키
		PRIMARY KEY (
			stdNo -- 학번
		);

-- 학생성적
CREATE TABLE StudentMgn.studentScore (
	stdNo    INT(8) NOT NULL COMMENT '학번', -- 학번
	subject1 INT(3) NULL     COMMENT '1과목', -- 1과목
	subject2 INT(3) NULL     COMMENT '2과목', -- 2과목
	subject3 INT(3) NULL     COMMENT '3과목' -- 3과목
)
COMMENT '학생성적';

-- 학생성적
ALTER TABLE StudentMgn.studentScore
	ADD CONSTRAINT PK_studentScore -- 학생성적 기본키
		PRIMARY KEY (
			stdNo -- 학번
		);

-- 병역
CREATE TABLE StudentMgn.militaryState (
	militaryCode VARCHAR(3)  NOT NULL COMMENT '병역코드', -- 병역코드
	militaryName VARCHAR(13) NOT NULL COMMENT '병역구분' -- 병역구분
)
COMMENT '병역';

-- 병역
ALTER TABLE StudentMgn.militaryState
	ADD CONSTRAINT PK_militaryState -- 병역 기본키
		PRIMARY KEY (
			militaryCode -- 병역코드
		);

-- 학적상태
CREATE TABLE StudentMgn.stdState (
	stateCode VARCHAR(3) NOT NULL COMMENT '학적코드', -- 학적코드
	stateName VARCHAR(2) NOT NULL COMMENT '학적구분' -- 학적구분
)
COMMENT '학적상태';

-- 학적상태
ALTER TABLE StudentMgn.stdState
	ADD CONSTRAINT PK_stdState -- 학적상태 기본키
		PRIMARY KEY (
			stateCode -- 학적코드
		);

-- 성적 환산표
CREATE TABLE StudentMgn.gradeConvertion (
	scoreMin   INT(3)     NOT NULL COMMENT '최소실점수', -- 최소실점수
	scoreMax   INT(3)     NOT NULL COMMENT '최대실점수', -- 최대실점수
	grade      VARCHAR(1) NOT NULL COMMENT '평어', -- 평어
	gradescore DOUBLE     NOT NULL COMMENT '평점' -- 평점
)
COMMENT '성적 환산표';

-- 학생정보
CREATE TABLE StudentMgn.studentManagement (
	stdNo        INT(8)      NOT NULL COMMENT '학번', -- 학번
	stdName      VARCHAR(5)  NOT NULL COMMENT '이름', -- 이름
	deptName     INT(1)      NOT NULL COMMENT '학과명', -- 학과명
	grade        INT(1)      NOT NULL COMMENT '학년', -- 학년
	stateCode    VARCHAR(3)  NOT NULL COMMENT '학적코드', -- 학적코드
	militaryCode VARCHAR(3)  NOT NULL COMMENT '병역코드', -- 병역코드
	idNo         INT(13)     NOT NULL COMMENT '주민번호', -- 주민번호
	gender       VARCHAR(1)  NOT NULL COMMENT '성별', -- 성별
	hpNo         VARCHAR(11) NULL     COMMENT '연락처', -- 연락처
	dayNighShift VARCHAR(1)  NOT NULL COMMENT '주야' -- 주야
)
COMMENT '학생정보';

-- 학생정보
ALTER TABLE StudentMgn.studentManagement
	ADD CONSTRAINT PK_studentManagement -- 학생정보 기본키
		PRIMARY KEY (
			stdNo -- 학번
		);

-- 학과
CREATE TABLE StudentMgn.depatment (
	deptCode INT(1) NOT NULL COMMENT '학과코드', -- 학과코드
	deptName INT(1) NOT NULL COMMENT '학과명' -- 학과명
)
COMMENT '학과';

-- 학과
ALTER TABLE StudentMgn.depatment
	ADD CONSTRAINT PK_depatment -- 학과 기본키
		PRIMARY KEY (
			deptCode -- 학과코드
		);

-- 학생개인정보
ALTER TABLE StudentMgn.studentData
	ADD CONSTRAINT FK_studentManagement_TO_studentData -- 학생정보 -> 학생개인정보
		FOREIGN KEY (
			stdNo -- 학번
		)
		REFERENCES StudentMgn.studentManagement ( -- 학생정보
			stdNo -- 학번
		);

-- 학생성적
ALTER TABLE StudentMgn.studentScore
	ADD CONSTRAINT FK_studentManagement_TO_studentScore -- 학생정보 -> 학생성적
		FOREIGN KEY (
			stdNo -- 학번
		)
		REFERENCES StudentMgn.studentManagement ( -- 학생정보
			stdNo -- 학번
		);

-- 학생정보
ALTER TABLE StudentMgn.studentManagement
	ADD CONSTRAINT FK_stdState_TO_studentManagement -- 학적상태 -> 학생정보
		FOREIGN KEY (
			stateCode -- 학적코드
		)
		REFERENCES StudentMgn.stdState ( -- 학적상태
			stateCode -- 학적코드
		);

-- 학생정보
ALTER TABLE StudentMgn.studentManagement
	ADD CONSTRAINT FK_militaryState_TO_studentManagement -- 병역 -> 학생정보
		FOREIGN KEY (
			militaryCode -- 병역코드
		)
		REFERENCES StudentMgn.militaryState ( -- 병역
			militaryCode -- 병역코드
		);

-- 학생정보
ALTER TABLE StudentMgn.studentManagement
	ADD CONSTRAINT FK_depatment_TO_studentManagement -- 학과 -> 학생정보
		FOREIGN KEY (
			deptName -- 학과명
		)
		REFERENCES StudentMgn.depatment ( -- 학과
			deptCode -- 학과코드
		);
		
	