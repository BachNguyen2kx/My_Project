# **Dự án Phân tích Dữ liệu Kinh doanh Pizza**

## **1. Giới thiệu (Introduction)**

Dự án này thực hiện phân tích sâu bộ dữ liệu bán hàng của một chuỗi cửa hàng pizza. Mục tiêu chính là khám phá các xu hướng bán hàng, xác định các sản phẩm phổ biến, phân tích hành vi của khách hàng và tìm ra các insight (thông tin chi tiết) có giá trị. Từ đó, đưa ra các đề xuất chiến lược giúp tối ưu hóa hoạt động kinh doanh, cải thiện doanh thu và nâng cao sự hài lòng của khách hàng.

Các câu hỏi kinh doanh chính mà dự án muốn trả lời:
* Tổng doanh thu và số lượng đơn hàng là bao nhiêu?
* Pizza nào bán chạy nhất? Pizza nào mang lại doanh thu cao nhất?
* Khung giờ và ngày nào trong tuần có lượng khách đông nhất?
* Xu hướng bán hàng theo tháng như thế nào?
* Phân tích doanh thu theo danh mục (category) và kích cỡ (size) của pizza.

## **2. Bộ dữ liệu (Dataset)**

* **Nguồn dữ liệu:** `pizza_sales.csv`
* **Mô tả:** File CSV chứa dữ liệu giao dịch chi tiết của các đơn hàng pizza trong một khoảng thời gian nhất định.
* **Các cột dữ liệu chính:**
    * `pizza_id`: ID định danh của pizza.
    * `order_id`: ID của đơn hàng.
    * `pizza_name`: Tên của pizza.
    * `quantity`: Số lượng pizza trong một mục của đơn hàng.
    * `order_date`: Ngày đặt hàng.
    * `order_time`: Thời gian đặt hàng.
    * `unit_price`: Đơn giá của pizza.
    * `total_price`: Tổng giá của mục đó.
    * `pizza_size`: Kích cỡ pizza (S, M, L, XL, XXL).
    * `pizza_category`: Danh mục pizza (Classic, Chicken, Supreme, Veggie).

## **3. Công nghệ sử dụng (Tech Stack)**

* **Lưu trữ Dữ liệu (Data Storage):** **MySQL**
    * Sử dụng để lưu trữ dữ liệu đã được làm sạch và cấu trúc hóa, cho phép truy vấn hiệu quả.
* **Phân tích & Xử lý Dữ liệu (Data Analysis & Processing):** **Python**
    * **Thư viện:** Pandas, NumPy để xử lý và tính toán dữ liệu.
    * **Môi trường:** Jupyter Notebook để thực hiện Phân tích Dữ liệu Khám phá (EDA) một cách trực quan.
* **Trực quan hóa & Báo cáo (Visualization & Reporting):** **Microsoft Power BI**
    * Sử dụng để xây dựng các dashboard tương tác, trực quan hóa các chỉ số KPI và chia sẻ kết quả phân tích một cách dễ hiểu.

## **4. Luồng làm việc của dự án (Project Workflow)**

Dự án được thực hiện theo 3 giai đoạn chính:

### **Giai đoạn 1: ETL - Tải và Lưu trữ dữ liệu vào MySQL**

1.  **Tạo Database:** Tạo một cơ sở dữ liệu mới trong MySQL Server (ví dụ: `pizza_db`).
2.  **Tạo Bảng:** Thiết kế và tạo bảng `pizza_sales` với cấu trúc phù hợp với các cột trong file `pizza_sales.csv`.
3.  **Tải dữ liệu:** Sử dụng một script Python (với thư viện `pandas` và `SQLAlchemy`) hoặc công cụ MySQL Workbench để import dữ liệu từ file `pizza_sales.csv` vào bảng đã tạo.

### **Giai đoạn 2: Phân tích dữ liệu với Python & Jupyter Notebook**

1.  **Kết nối Database:** Trong Jupyter Notebook, thiết lập kết nối đến `pizza_db` trong MySQL.
2.  **Làm sạch dữ liệu (Data Cleaning):**
    * Tải dữ liệu từ MySQL vào một DataFrame của Pandas.
    * Kiểm tra và xử lý các giá trị bị thiếu (null/NaN).
    * Kiểm tra và xử lý dữ liệu trùng lặp.
    * Chuẩn hóa định dạng dữ liệu (ví dụ: chuyển đổi cột `order_date` và `order_time` sang kiểu datetime).
3.  **Phân tích Khám phá (EDA):**
    * Thực hiện các phép tính thống kê mô tả để hiểu tổng quan về dữ liệu.
    * Trả lời các câu hỏi kinh doanh đã đặt ra bằng cách sử dụng các hàm của Pandas để nhóm, tổng hợp và phân tích dữ liệu.
    * Sử dụng các thư viện như `Matplotlib` và `Seaborn` để tạo các biểu đồ ban đầu (ví dụ: biểu đồ doanh thu theo tháng, biểu đồ top 5 pizza bán chạy).

### **Giai đoạn 3: Xây dựng Dashboard với Power BI**

1.  **Kết nối Nguồn dữ liệu:**
    * Mở Power BI Desktop.
    * Kết nối trực tiếp đến database **MySQL** (`pizza_db`) hoặc sử dụng file CSV đã được làm sạch. Kết nối với MySQL được khuyến nghị để đảm bảo dữ liệu luôn được cập nhật.
2.  **Mô hình hóa Dữ liệu (Data Modeling):**
    * Kiểm tra và thiết lập mối quan hệ giữa các bảng (nếu có).
    * Sử dụng Power Query Editor để thực hiện các bước biến đổi dữ liệu bổ sung nếu cần.
    * Tạo các cột tính toán (Calculated Columns) và thước đo (Measures) bằng ngôn ngữ DAX (ví dụ: `Total Revenue = SUM(pizza_sales[total_price])`, `Total Orders = DISTINCTCOUNT(pizza_sales[order_id])`).
3.  **Xây dựng Báo cáo:**
    * Thiết kế một trang báo cáo tổng quan (Overview Dashboard).
    * Sử dụng các biểu đồ (charts, graphs), bảng (tables), và thẻ (cards) để trực quan hóa các KPI chính.
    * Thêm các bộ lọc (slicers) cho phép người dùng tương tác và lọc dữ liệu theo ngày, tháng, danh mục, hoặc kích cỡ pizza.

## **5. Kết quả chính (Key Findings)**

Báo cáo này cung cấp một phân tích chi tiết về các giao dịch bán pizza nhằm xác định các động lực kinh doanh chính và các cơ hội để tăng trưởng. Các chỉ số hiệu suất kinh doanh chính như sau:

Tổng Doanh Thu: $817,860.05

Tổng Số Pizza Đã Bán: 49,574

Tổng Số Đơn Hàng: 21,350

Giá Trị Đơn Hàng Trung Bình: $38.31

Số Pizza Trung Bình Mỗi Đơn: 2.32

Các phát hiện chính (Key Findings)
1. Hiệu suất Bán hàng theo Thời gian
Ngày cao điểm: Thứ Sáu tạo ra doanh thu cao nhất, theo sau là Thứ Bảy và Thứ Năm. Điều này cho thấy xu hướng khách hàng đặt bánh pizza tăng mạnh trước và trong những ngày cuối tuần.
Giờ cao điểm: Lượng đơn hàng liên tục tăng trong khoảng thời gian ăn trưa (12:00 PM - 2:00 PM) và đạt đỉnh đáng kể trong giờ cao điểm ăn tối (5:00 PM - 8:00 PM).
2. Hiệu suất Sản phẩm
Top 5 Pizza Bán Chạy Nhất:

The Classic Deluxe Pizza
The Barbecue Chicken Pizza
The California Chicken Pizza
The Spicy Italian Pizza
The Thai Chicken Pizza
Top 5 Pizza Bán Chậm Nhất:

The Brie Carre Pizza
The Green Garden Pizza
The Spinach Supreme Pizza
The Mediterranean Pizza
The Spinach Pesto Pizza
3. Doanh số theo Danh mục và Kích cỡ
Danh mục phổ biến nhất: Danh mục 'Classic' chiếm ưu thế về doanh số, vượt qua đáng kể các danh mục 'Supreme', 'Veggie' và 'Chicken'.
Kích cỡ phổ biến nhất: Cỡ 'L' (Lớn) là kích cỡ bán chạy nhất, cho thấy khách hàng thường xuyên mua cho các nhóm hoặc gia đình. Cỡ 'M' (Trung bình) là lựa chọn phổ biến thứ hai.
Đề xuất Chiến lược & Hành động
1. Tối ưu hóa Hoạt động Cuối tuần
Insight: Doanh thu tăng vọt vào các ngày Thứ Sáu và Thứ Bảy.
Hành động: Tăng cường nhân sự, chuẩn bị nguyên liệu và tối ưu hóa quy trình hoạt động cho các ngày cuối tuần để đáp ứng nhu cầu cao và duy trì chất lượng dịch vụ.
2. Tinh chỉnh Chiến lược Marketing và Thực đơn
Insight: 'The Classic Deluxe Pizza' là một sản phẩm ngôi sao, trong khi 'The Brie Carre Pizza' hoạt động kém hiệu quả.
Hành động: Đẩy mạnh quảng cáo cho các sản phẩm bán chạy nhất. Xem xét việc loại bỏ hoặc cải tiến các sản phẩm bán chậm để tối ưu hóa thực đơn.
3. Phát triển Chiến lược Giá và Combo
Insight: Pizza cỡ lớn (cỡ L) là phổ biến nhất (chiếm 45.89%).
Hành động: Tạo các gói combo hấp dẫn cho gia đình hoặc nhóm bạn tập trung vào pizza cỡ L để khuyến khích khách hàng chi tiêu nhiều hơn và tăng giá trị đơn hàng trung bình.
4. Tối ưu hóa Giờ hoạt động
Insight: Doanh nghiệp có hai giai đoạn cao điểm rõ rệt: giờ ăn trưa (12:00 PM - 2:00 PM) và giờ ăn tối (5:00 PM - 8:00 PM).
Hành động: Triển khai các chương trình khuyến mãi đặc biệt (ví dụ: "Happy Hour") vào các khung giờ thấp điểm (ví dụ: 2:00 PM - 5:00 PM) để thu hút thêm khách hàng và tăng doanh thu.