-- 내 스키마
DROP SCHEMA IF EXISTS MY_SCHEMA;

-- 내 스키마
CREATE SCHEMA MY_SCHEMA;

-- 학생개인정보
CREATE TABLE MY_SCHEMA.studentData (
	stdNo INT(8) NOT NULL COMMENT '학번' -- 학번
)
COMMENT '학생개인정보';

-- 학생개인정보
ALTER TABLE MY_SCHEMA.studentData
	ADD CONSTRAINT PK_studentData -- 학생개인정보 기본키
		PRIMARY KEY (
			stdNo -- 학번
		);

-- 학생성적
CREATE TABLE MY_SCHEMA.studentScore (
	stdNo    INT(8) NOT NULL COMMENT '학번', -- 학번
	subject1 INT(3) NULL     COMMENT '1과목', -- 1과목
	subject2 INT(3) NULL     COMMENT '2과목', -- 2과목
	subject3 INT(3) NULL     COMMENT '3과목' -- 3과목
)
COMMENT '학생성적';

-- 학생성적
ALTER TABLE MY_SCHEMA.studentScore
	ADD CONSTRAINT PK_studentScore -- 학생성적 기본키
		PRIMARY KEY (
			stdNo -- 학번
		);

-- 병역
CREATE TABLE MY_SCHEMA.militaryState (
	militaryCode VARCHAR(3)  NOT NULL COMMENT '병역코드', -- 병역코드
	militaryName VARCHAR(13) NOT NULL COMMENT '병역구분' -- 병역구분
)
COMMENT '병역';

-- 병역
ALTER TABLE MY_SCHEMA.militaryState
	ADD CONSTRAINT PK_militaryState -- 병역 기본키
		PRIMARY KEY (
			militaryCode -- 병역코드
		);

-- 학적상태
CREATE TABLE MY_SCHEMA.stdState (
	stateCode VARCHAR(3) NOT NULL COMMENT '학적코드', -- 학적코드
	stateName VARCHAR(2) NOT NULL COMMENT '학적구분' -- 학적구분
)
COMMENT '학적상태';

-- 학적상태
ALTER TABLE MY_SCHEMA.stdState
	ADD CONSTRAINT PK_stdState -- 학적상태 기본키
		PRIMARY KEY (
			stateCode -- 학적코드
		);

-- 성적 환산표
CREATE TABLE MY_SCHEMA.gradeConvertion (
	scoreMin   INT(3)     NOT NULL COMMENT '최소실점수', -- 최소실점수
	scoreMax   INT(3)     NOT NULL COMMENT '최대실점수', -- 최대실점수
	grade      VARCHAR(1) NOT NULL COMMENT '평어', -- 평어
	gradescore DOUBLE     NOT NULL COMMENT '평점' -- 평점
)
COMMENT '성적 환산표';

-- 학생정보
CREATE TABLE MY_SCHEMA.studentManagement (
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
ALTER TABLE MY_SCHEMA.studentManagement
	ADD CONSTRAINT PK_studentManagement -- 학생정보 기본키
		PRIMARY KEY (
			stdNo -- 학번
		);

-- 과목
CREATE TABLE MY_SCHEMA.TABLE (
	COL  <데이터 타입 없음> NOT NULL COMMENT '과목코드', -- 과목코드
	COL2 <데이터 타입 없음> NULL     COMMENT '과목명', -- 과목명
	COL3 <데이터 타입 없음> NULL     COMMENT '교수코드' -- 교수코드
)
COMMENT '과목';

-- 과목
ALTER TABLE MY_SCHEMA.TABLE
	ADD CONSTRAINT PK_TABLE -- 과목 기본키
		PRIMARY KEY (
			COL -- 과목코드
		);

-- 교수
CREATE TABLE MY_SCHEMA.TABLE2 (
	COL  <데이터 타입 없음> NOT NULL COMMENT '교수코드', -- 교수코드
	COL2 <데이터 타입 없음> NULL     COMMENT '교수명' -- 교수명
)
COMMENT '교수';

-- 교수
ALTER TABLE MY_SCHEMA.TABLE2
	ADD CONSTRAINT PK_TABLE2 -- 교수 기본키
		PRIMARY KEY (
			COL -- 교수코드
		);

-- 학과
CREATE TABLE MY_SCHEMA.depatment (
	deptCode INT(1) NOT NULL COMMENT '학과코드', -- 학과코드
	deptName INT(1) NOT NULL COMMENT '학과명' -- 학과명
)
COMMENT '학과';

-- 학과
ALTER TABLE MY_SCHEMA.depatment
	ADD CONSTRAINT PK_depatment -- 학과 기본키
		PRIMARY KEY (
			deptCode -- 학과코드
		);

-- 학생개인정보
ALTER TABLE MY_SCHEMA.studentData
	ADD CONSTRAINT FK_studentManagement_TO_studentData -- 학생정보 -> 학생개인정보
		FOREIGN KEY (
			stdNo -- 학번
		)
		REFERENCES MY_SCHEMA.studentManagement ( -- 학생정보
			stdNo -- 학번
		);

-- 학생성적
ALTER TABLE MY_SCHEMA.studentScore
	ADD CONSTRAINT FK_studentManagement_TO_studentScore -- 학생정보 -> 학생성적
		FOREIGN KEY (
			stdNo -- 학번
		)
		REFERENCES MY_SCHEMA.studentManagement ( -- 학생정보
			stdNo -- 학번
		);

-- 학생정보
ALTER TABLE MY_SCHEMA.studentManagement
	ADD CONSTRAINT FK_stdState_TO_studentManagement -- 학적상태 -> 학생정보
		FOREIGN KEY (
			stateCode -- 학적코드
		)
		REFERENCES MY_SCHEMA.stdState ( -- 학적상태
			stateCode -- 학적코드
		);

-- 학생정보
ALTER TABLE MY_SCHEMA.studentManagement
	ADD CONSTRAINT FK_militaryState_TO_studentManagement -- 병역 -> 학생정보
		FOREIGN KEY (
			militaryCode -- 병역코드
		)
		REFERENCES MY_SCHEMA.militaryState ( -- 병역
			militaryCode -- 병역코드
		);

-- 학생정보
ALTER TABLE MY_SCHEMA.studentManagement
	ADD CONSTRAINT FK_depatment_TO_studentManagement -- 학과 -> 학생정보
		FOREIGN KEY (
			deptName -- 학과명
		)
		REFERENCES MY_SCHEMA.depatment ( -- 학과
			deptCode -- 학과코드
		);

-- 과목
ALTER TABLE MY_SCHEMA.TABLE
	ADD CONSTRAINT FK_TABLE2_TO_TABLE -- 교수 -> 과목
		FOREIGN KEY (
			COL3 -- 교수코드
		)
		REFERENCES MY_SCHEMA.TABLE2 ( -- 교수
			COL -- 교수코드
		);