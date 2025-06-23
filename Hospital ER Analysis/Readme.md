# Phân Tích Dữ Liệu Phòng Cấp Cứu Bệnh Viện (Hospital ER Analysis)

Dự án này thực hiện phân tích chi tiết bộ dữ liệu về hoạt động của phòng cấp cứu (ER) tại một bệnh viện. Mục tiêu là khám phá các chỉ số hiệu suất chính (KPIs), tìm ra các xu hướng quan trọng và xây dựng một dashboard tương tác để hỗ trợ việc ra quyết định.

---

## Mục lục
1. [Giới thiệu](#1-giới-thiệu)
2. [Công nghệ sử dụng](#2-công-nghệ-sử-dụng)
3. [Quy trình thực hiện](#3-quy-trình-thực-hiện)
4. [Trực quan hóa với Power BI](#4-trực-quan-hóa-với-power-bi)
5. [Phân tích với Python (Jupyter)](#5-phân-tích-với-python-jupyter)
6. [Cơ sở dữ liệu MySQL](#6-cơ-sở-dữ-liệu-mysql)
7. [Kết quả và Phát hiện](#7-kết-quả-và-phát-hiện)

---

## 1. Giới thiệu

Phòng cấp cứu là một trong những bộ phận quan trọng và áp lực nhất của bệnh viện. Việc phân tích dữ liệu hoạt động có thể giúp:

* **Tối ưu hóa quy trình:** Giảm thời gian chờ đợi của bệnh nhân.
* **Nâng cao sự hài lòng:** Cải thiện trải nghiệm của bệnh nhân.
* **Quản lý nguồn lực:** Phân bổ nhân sự và trang thiết bị hiệu quả hơn.
* **Dự báo xu hướng:** Nắm bắt các mô hình bệnh tật và lượng bệnh nhân theo thời gian.

Dự án này sử dụng một quy trình end-to-end, từ việc lưu trữ dữ liệu trong CSDL quan hệ, phân tích khám phá bằng Python, đến việc tạo báo cáo tương tác với Power BI.

## 2. Công nghệ sử dụng

* **Ngôn ngữ lập trình:** Python (trong Jupyter Notebook)
* **Thư viện Python:** Pandas, NumPy, Matplotlib, Seaborn
* **Cơ sở dữ liệu:** MySQL Server
* **Trực quan hóa & Báo cáo:** Microsoft Power BI

## 3. Quy trình thực hiện

Dự án được thực hiện theo 3 bước chính:

1.  **Lưu trữ (Storage):** Dữ liệu thô từ file `Hospital ER_Data.csv` được làm sạch sơ bộ và nạp vào một bảng trong cơ sở dữ liệu MySQL. Điều này giúp quản lý dữ liệu một cách có cấu trúc và an toàn.
2.  **Phân tích (Processing & Analysis):** Sử dụng Jupyter Notebook, kết nối tới CSDL MySQL để truy vấn dữ liệu. Thư viện Pandas được dùng để xử lý, tính toán các KPI, và phân tích thống kê. Matplotlib và Seaborn được dùng để tạo các biểu đồ tĩnh ban đầu.
3.  **Trực quan hóa (Visualization):** Kết nối Power BI trực tiếp tới CSDL MySQL. Dữ liệu được làm mới tự động và được sử dụng để xây dựng một dashboard tương tác, cho phép người dùng tự khám phá dữ liệu qua các bộ lọc và biểu đồ động.

## 4. Trực quan hóa với Power BI

Dashboard Power BI là sản phẩm cuối cùng, cung cấp một cái nhìn tổng quan và đa chiều về hoạt động của phòng cấp cứu. Các thành phần chính trên dashboard bao gồm:

* **Thẻ KPIs:** Hiển thị các chỉ số quan trọng như Tổng số bệnh nhân, Tuổi trung bình, Thời gian chờ trung bình (phút), Mức độ hài lòng trung bình.
* **Biểu đồ tròn/cột:** Phân bổ bệnh nhân theo Giới tính, Nhóm tuổi, Khoa điều trị.
* **Biểu đồ đường:** Theo dõi xu hướng lượng bệnh nhân theo từng tháng và theo các ngày trong tuần.

## 5. Phân tích với Python (Jupyter)

File `hospital_er_analysis.ipynb` thực hiện các nhiệm vụ:

* Kết nối và truy vấn dữ liệu từ MySQL.
* Làm sạch dữ liệu (xử lý giá trị thiếu, chuyển đổi kiểu dữ liệu).
* Tính toán KPI theo yêu cầu ban đầu.
* Tạo các biểu đồ tĩnh để kiểm tra và xác thực các giả thuyết trước khi đưa lên Power BI.

## 6. Cơ sở dữ liệu MySQL

Dữ liệu được lưu trong một bảng có tên `er_data` trong database `hospital_db`. Cấu trúc bảng như sau:
```sql
CREATE TABLE `hospital er_data` (
  `Patient Id` text,
  `Patient Admission Date` text,
  `Patient First Inital` text,
  `Patient Last Name` text,
  `Patient Gender` text,
  `Patient Age` int DEFAULT NULL,
  `Patient Race` text,
  `Department Referral` text,
  `Patient Admission Flag` text,
  `Patient Satisfaction Score` text,
  `Patient Waittime` int DEFAULT NULL,
  `Patients CM` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
```

## 7.Kết quả và Phát hiện
Phân tích trên 9,216 lượt khám tại phòng cấp cứu đã đưa ra những thông tin chi tiết về hiệu suất hoạt động và các yếu tố ảnh hưởng đến sự hài lòng của bệnh nhân.
Phân Tích Hoạt Động & Đề Xuất Hành Động
1. Cao điểm hoạt động vào cuối tuần
Phát hiện: Phòng cấp cứu trải qua cường độ và khối lượng bệnh nhân cao nhất vào cuối tuần, đặc biệt là Thứ Bảy (1,368 lượt) và Chủ Nhật (1,361 lượt).
Đề xuất: Tối ưu hóa việc phân bổ nhân sự và nguồn lực cho các ngày cuối tuần. Điều chỉnh lịch làm việc để đảm bảo đủ nhân lực trong giai đoạn cao điểm này.
2. Hồ sơ bệnh nhân và nhu cầu chuyên khoa
Phát hiện: Nhóm bệnh nhân lớn nhất là Người cao tuổi (Seniors, 50-79 tuổi), chiếm 37.52% tổng số lượt khám. Nguồn bệnh nhân lớn nhất là tự đến (Walk-in), chiếm 58.59%. Các khoa được yêu cầu giới thiệu nhiều nhất sau cấp cứu là Y đa khoa (General Practice) và Chấn thương chỉnh hình (Orthopedics).
Đề xuất: Xây dựng quy trình hội chẩn nhanh với các chuyên gia Chấn thương chỉnh hình và Y đa khoa, đặc biệt là vào các ngày cuối tuần bận rộn.
3. Xu hướng theo tháng và sự biến động của mức độ hài lòng
Phát hiện: Các chỉ số hoạt động cốt lõi như Thời gian chờ trung bình (luôn ở mức 34-37 phút) và Tỷ lệ nhập viện (khoảng 50%) rất ổn định trong suốt hai năm. Tuy nhiên, điểm hài lòng của bệnh nhân lại biến động mạnh theo từng tháng (cao nhất 5.64, thấp nhất 4.37).
Phát hiện cốt lõi: Sự biến động này khẳng định mạnh mẽ rằng sự hài lòng không phụ thuộc vào thời gian chờ, mà bị quyết định bởi các yếu tố khác như tương tác và chăm sóc.
Đề xuất hành động chiến lược
Nâng cao trải nghiệm chăm sóc toàn diện:
Hành động: Thay vì chỉ tập trung vào thời gian chờ, hãy triển khai các chương trình đào tạo nâng cao về kỹ năng mềm, giao tiếp rõ ràng và chăm sóc lấy bệnh nhân làm trung tâm để tác động trực tiếp đến sự hài lòng.
Tối ưu hóa nguồn lực cho cuối tuần:
Hành động: Điều chỉnh lịch trình và phân bổ thêm nhân viên, trang thiết bị cho các ngày cao điểm Thứ Bảy và Chủ Nhật.
Đảm bảo sẵn có nguồn lực tư vấn chuyên khoa:
Hành động: Xây dựng quy trình hội chẩn nhanh với các chuyên gia Chấn thương chỉnh hình và Y đa khoa, đặc biệt trong các giai đoạn bận rộn cuối tuần.

