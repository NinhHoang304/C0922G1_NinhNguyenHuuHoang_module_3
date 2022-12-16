use quan_ly_sinh_vien;

insert into class (class_name, start_date, status) values 
('A1', '2008-12-20', 1), 
('A2', '2008-12-22', 1),
('B3', current_date(), 0);

insert into student (student_name, address, phone, status, class_id) values
('Hung', 'Ha Noi', '0912113113', 1, 1),
('Hoa', 'Hai phong','0912312323', 1, 1),
('Manh', 'HCM', '0123123123', 0, 2);

insert into subjects (sub_name, credit, status) values
('CF', 5, 1),
('C', 6, 1),
('HDJ', 5, 1),
('RDBMS', 10, 1);

insert into mark (sub_id, student_id, mark, exam_times) values
(1, 1, 8, 1),
(1, 2, 10, 2),
(2, 1, 12, 1);