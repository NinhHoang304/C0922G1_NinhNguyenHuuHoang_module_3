use student_management;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from subjects
where credit in (select max(credit) from subjects);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select s.sub_id, s.sub_name, s.credit, s.status, m.mark 
from subjects s
join mark m on s.sub_id = m.sub_id
where m.mark in (select max(mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.student_id, student_name, address, phone, status, class_id, ifnull(avg(m.mark), 0) as diem_trung_binh 
from student s
left join mark m on s.student_id = m.student_id
group by s.student_id
order by diem_trung_binh desc;

