### i_erd 폴더 >>> '예제' 파일 ###

# 학교 관리 시스템 #

/*
	요구 사항
	school_db 데이터베이스 생성

	학생(Students) 테이블: 학생 ID, 이름, 전공, 입학년도를 포함
	교수(Professors) 테이블: 교수 ID, 이름, 학과, 사무실 위치를 포함
	강의(Courses) 테이블: 강의 ID, 강의명, 담당 교수 ID, 학점 수를 포함
	수강(Enrollments) 테이블: 수강 ID, 학생 ID, 강의 ID, 수강년도, 학기를 포함

	각 테이블의 ID는 기본 키로 설정
	교수 ID는 강의 테이블에서 외래 키로 설정되어야 하며, 교수와 강의 사이의 관계 작성
	학생 ID와 강의 ID는 수강 테이블에서 외래 키로 설정되어야 하며, 학생, 강의, 수강 사이의 다대다 관계 작성.
    
    cf) 컬럼명 위의 한글 그대로 사용 (띄어쓰기 없이)
*/
create database if not exists `school_db`;
use `school_db`;


create table `Students`(
	student_id bigint primary key,
    name varchar(100),
    specialty varchar(100),
    year_of_admission year
);

create table `Professors`(
	professors_id int primary key,
    name varchar(100),
    lesson varchar(100),
    office varchar(100)
);

create table `courses`(
	courses_id bigint primary key,
    courses_name varchar(100),
    professors_id int,
    grade char(10),
    
    foreign key (professors_id) references Professors(professors_id)
);
create table `Enrollments`(
	Enrollments_id bigint primary key,
    student_id bigint,
    courses_id bigint,
    year_of_attendance year,
    term int,
    
    foreign key (student_id) references students(student_id),
    foreign key (courses_id) references courses(courses_id)
);
drop table Enrollments;


-- Students
INSERT INTO Students VALUES (1, 'Alice', 'Computer Science', 2020);
INSERT INTO Students VALUES (2, 'Bob', 'Mathematics', 2021);
INSERT INTO Students VALUES (3, 'Charlie', 'Physics', 2022);

-- Professors
INSERT INTO Professors VALUES (1, 'Dr. Smith', 'Computer Science', 'Room 101');
INSERT INTO Professors VALUES (2, 'Dr. Johnson', 'Mathematics', 'Room 102');
INSERT INTO Professors VALUES (3, 'Dr. Williams', 'Physics', 'Room 103');

-- Courses
INSERT INTO Courses VALUES (1, 'Introduction to Programming', 1, 3);
INSERT INTO Courses VALUES (2, 'Calculus I', 2, 4);
INSERT INTO Courses VALUES (3, 'Mechanics', 3, 4);

-- Enrollments
INSERT INTO Enrollments VALUES (1, 1, 1, 2023, 1);
INSERT INTO Enrollments VALUES (2, 2, 2, 2023, 1);
INSERT INTO Enrollments VALUES (3, 3, 3, 2023, 1);


/*
	1. 전공이 컴퓨터 과학인 학생들의 이름과 입학년도를 조회하는 SQL 명령문을 작성
	2. 담당 교수 ID가 2인 강의의 강의명과 학점 수를 조회하는 SQL 명령문을 작성
	3. 2023년도 1학기에 수강하는 학생들의 목록을 조회하는 SQL 명령문을 작성 (학생 ID와 이름을 포함)
*/ 
select *
from
	`Students`
where
	specialty = 'Computer Science';

select *
from
	`courses`
where
	professors_id = 2;
    
select *
from `Enrollments` E
	join `students` S
    on E.student_id = S.student_id
where
	year_of_attendance = 2023
and term = 1;
