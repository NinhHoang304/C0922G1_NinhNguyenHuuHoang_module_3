use furama;
insert into position (id, name) 
values 
  (1, 'Lễ tân'), 
  (2, 'Phục vụ'), 
  (3, 'Chuyên viên'), 
  (4, 'Giám sát'), 
  (5, 'Quản lý'), 
  (6, 'Giám đốc');
insert into education_degree (id, name) 
values 
  (1, 'Trung cấp'), 
  (2, 'Cao đẳng'), 
  (3, 'Đại học'), 
  (4, 'Sau đại học');
insert into division (id, name) 
values 
  (1, 'Sale-marketing'), 
  (2, 'Hành chính'), 
  (3, 'Phục vụ'), 
  (4, 'Quản lý');
insert into user 
values 
  ('user1', '123456'), 
  ('user2', '123456'), 
  ('user3', '123456'), 
  ('user4', '123456'), 
  ('user5', '123456'), 
  ('user6', '123456'), 
  ('user7', '123456'), 
  ('user8', '123456'), 
  ('user9', '123456'), 
  ('user10', '123456');
INSERT INTO employee 
VALUES 
  (
    1, 'Nguyễn Văn An', '1970-11-07', 
    '456231786', 10000000, '0901234121', 
    'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', 
    1, 3, 1, 'user1'
  ), 
  (
    2, 'Nguyễn Văn Huy', '1975-11-07', 
    '456291786', 11100000, '0901264121', 
    'huynguyen@gmail.com', '298 Nguyễn Tất Thành, Đà Nẵng', 
    2, 2, 2, 'user2'
  ), 
  (
    3, 'Nguyễn Văn Long', '1975-11-07', 
    '456291786', 11100000, '0901264121', 
    'longnguyen@gmail.com', '298 Nguyễn Tất Thành, Đà Nẵng', 
    1, 1, 3, 'user3'
  ), 
  (
    4, 'Nguyễn Văn Thành', '1975-11-07', 
    '456291786', 11100000, '0901264121', 
    'thanhnguyen@gmail.com', '298 Nguyễn Tất Thành, Đà Nẵng', 
    2, 1, 3, 'user4'
  ), 
  (
    5, 'Nguyễn Văn Công', '1975-11-07', 
    '456291786', 11100000, '0901264121', 
    'congnguyen@gmail.com', '298 Nguyễn Tất Thành, Đà Nẵng', 
    2, 1, 1, 'user5'
  ), 
  (
    6, 'Khúc Nguyễn An Nghi', '2000-11-08', 
    '964542311', '7000000', '0978653213', 
    'annghi20@gmail.com', '294 nguyễn tất thành, đà nẵng', 
    2, 2, 3, 'user6'
  ), 
  (
    7, 'Nguyễn Hữu Hà', '1993-01-01', 
    '534323231', '8000000', '0941234553', 
    'nhh0101@gmail.com', '4 nguyễn chí thanh, huế', 
    2, 3, 2, 'user7'
  ), 
  (
    8, 'Nguyễn Hà Đông', '1989-09-03', 
    '234414123', '9000000', '0642123111', 
    'donghanguyen@gmail.com', '111 hùng vương, hà nội', 
    2, 4, 4, 'user8'
  ), 
  (
    9, 'Tòng Hoang', '1982-09-03', '256781231', 
    '6000000', '0245144444', 'hoangtong@gmail.com', 
    '213 hàm nghi, đà nẵng', 2, 
    4, 4, 'user9'
  ), 
  (
    10, 'Nguyễn Công Đạo', '1994-01-08', 
    '755434343', '8000000', '0988767111', 
    'nguyencongdao12@gmail.com', '6 hoà khánh, đồng nai', 
    2, 3, 2, 'user10'
  );
INSERT INTO customer_type (id, name) 
values 
  (1, 'Diamond'), 
  (2, 'Platinium'), 
  (3, 'Gold'), 
  (4, 'Silver'), 
  (5, 'Member');
INSERT INTO customer 
values 
  (
    1, 5, 'Nguyễn Thị Hào', '1970-11-07', 
    0, 643431213, 0945423362, 'thihao07@gmail.com', 
    '23 Nguyễn Hoàng, Đà Nẵng'
  ), 
  (
    2, 3, 'Phạm Xuân Diệu', '1992-08-08', 
    1, 865342123, 0954333333, 'xuandieu92@gmail.com', 
    'K77/22 Thái Phiên, Quảng Trị'
  ), 
  (
    3, 1, 'Trương Đình Nghệ', '1990-02-27', 
    1, 488645199, 0373213122, 'nghenhan2702@gmail.com', 
    'K323/12 Ông Ích Khiêm, Vinh'
  ), 
  (
    4, 1, 'Dương Văn Quan', '1981-07-08', 
    1, 543432111, 0490039241, 'duongquan@gmail.com', 
    'K453/12 Lê Lợi, Đà Nẵng'
  ), 
  (
    5, 4, 'Hoàng Trần Nhi Nhi', '1995-12-09', 
    0, 795453345, 0312345678, 'nhinhi123@gmail.com', 
    '224 Lý Thái Tổ, Gia Lai'
  ), 
  (
    6, 4, 'Tôn Nữ Mộc Châu', '2005-12-06', 
    0, 732434215, 0988888844, 'tonnuchau@gmail.com', 
    '37 Yên Thế, Đà Nẵng'
  ), 
  (
    7, 1, 'Nguyễn Mỹ Kim', '1984-04-08', 
    0, 856453123, 0912345698, 'kimcuong84@gmail.com', 
    'K123/45 Lê Lợi, Hồ Chí Minh'
  ), 
  (
    8, 3, 'Nguyễn Thị Hào', '1999-04-08', 
    0, 965656433, 0763212345, 'haohao99@gmail.com', 
    '55 Nguyễn Văn Linh, Kon Tum'
  ), 
  (
    9, 1, 'Trần Đại Danh', '1994-07-01', 
    1, 432341235, 0643343433, 'danhhai99@gmail.com', 
    '24 Lý Thường Kiệt, Quảng Ngãi'
  ), 
  (
    10, 2, 'Nguyễn Tâm Đắc', '1989-07-01', 
    1, 344343432, 0987654321, 'dactam@gmail.com', 
    '22 Ngô Quyền, Đà Nẵng'
  );
insert into rent_type (id, name) 
values 
  (1, 'Year'), 
  (2, 'Month'), 
  (3, 'Day'), 
  (4, 'Hour');
insert into facility_type (id, name) 
values 
  (1, 'Villa'), 
  (2, 'House'), 
  (3, 'Room');
insert into facility 
values 
  (
    1, 'Villa beach front', 250, 1000000, 
    6, 3, 1, 'Vip', 'Có hồ bơi', 50, 
    3, null
  ), 
  (
    2, 'House princess 01', 140, 500000, 
    5, 3, 2, 'Vip', 'Có thêm bếp nướng', 
    null, 2, null
  ), 
  (
    3, 'Room twin 01', 120, 300000, 2, 4, 
    3, null, null, null, null, 'wifi'
  ), 
  (
    4, 'Villa no beach front', 200, 9000000, 
    8, 3, 1, 'Normal', 'Có hồ bơi', 
    100, 4, null
  ), 
  (
    5, 'House princess 02', 150, 4000000, 
    5, 4, 2, 'Normal', 'Có thêm bếp nướng', 
    null, 2, null
  ), 
  (
    6, 'Room twin 02', 125, 900000, 2, 4, 
    3, null, null, null, null, '1 xe máy'
  );
insert into attach_facility (id, name, cost, unit, status) 
values 
  (
    1, 'Karaoke', 10000, 'Giờ', 'Tiện nghi, hiện tại'
  ), 
  (
    2, 'Thuê xe máy', 10000, 'Chiếc', 
    'Hỏng 1 xe'
  ), 
  (
    3, 'Thuê xe đạp', 20000, 'Chiếc', 
    'Tốt'
  ), 
  (
    4, 'Buffet buổi sáng', 15000, 'Suất', 
    'Đầy đủ đồ ăn, Tráng miệng'
  ), 
  (
    5, 'Buffet buổi trưa', 90000, 'Suất', 
    'Đầy đủ đồ ăn, Tráng miệng'
  ), 
  (
    6, 'Buffet buổi tối', 16000, 'Suất', 
    'Đầy đủ đồ ăn, Tráng miệng'
  );
insert into contract (
  id, start_date, end_date, deposit, 
  employee_id, customer_id, facility_id
) 
values 
  (
    1, '2020-12-08', '2020-12-08', 0, 3, 
    1, 3
  ), 
  (
    2, '2020-07-14', '2020-07-21', 200000, 
    7, 3, 1
  ), 
  (
    3, '2021-03-15', '2021-03-17', 50000, 
    3, 4, 2
  ), 
  (
    4, '2021-01-14', '2021-01-18', 100000, 
    7, 5, 5
  ), 
  (
    5, '2021-07-14', '2021-07-15', 0, 7, 
    2, 6
  ), 
  (
    6, '2021-06-01', '2021-06-03', 0, 7, 
    7, 6
  ), 
  (
    7, '2021-09-02', '2021-09-05', 100000, 
    7, 4, 4
  ), 
  (
    8, '2021-06-17', '2021-06-18', 150000, 
    3, 4, 1
  ), 
  (
    9, '2020-11-19', '2020-11-19', 0, 3, 
    4, 3
  ), 
  (
    10, '2021-04-12', '2021-04-14', 0, 
    10, 3, 5
  ), 
  (
    11, '2021-04-25', '2021-04-25', 0, 
    2, 2, 1
  ), 
  (
    12, '2021-05-25', '2021-05-27', 0, 
    7, 10, 1
  );
insert into contract_detail (
  id, contract_id, attach_facility_id, 
  quantity
) 
values 
  (1, 2, 4, 5), 
  (2, 2, 5, 8), 
  (3, 2, 6, 15), 
  (4, 3, 1, 1), 
  (5, 3, 2, 11), 
  (6, 1, 3, 1), 
  (7, 1, 2, 2), 
  (8, 12, 2, 2);