  
# 1.Query the existence of 1 course
select * from student_course where courseId=1;

# 2.Query the presence of both 1 and 2 courses
select * from student_course where courseId=1 or courseId=2;

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select id,name,score from student as b join 
	(select studentId,avg(score) as score from student_course group by studentId having score>60)c
	on b.id=c.studentId;

# 4.Query the SQL statement of student information that does not have grades in the student_course table
select * from student where id not in (select studentId from student_course); 

# 5.Query all SQL with grades
select distinct name from student join student_course on studentId=student.id;

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select * from student
where id in (
    select t1.studentId
    from
        student_course t1,
        student_course t2
    where
        t1.studentId = t2.studentId
        and t1.courseId = '1'
        and t2.courseId = '2');

# 7.Retrieve 1 student score with less than 60 scores in descending order
select id,name,age,sex from student join student_course on studentId=student.id and score<60 and courseId=1 ORDER BY score desc;

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
select courseId,avg(score) from student_course group by courseId order by avg(score) desc,courseId asc;

# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
select name,score from student join student_course on studentId=student.id and score<60 and courseId in (select id from course where name='Math');
