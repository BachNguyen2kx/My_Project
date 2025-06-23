-- CÁC CHỈ SỐ TỔNG QUAN (KPIs)
-- 1. Tổng số bệnh nhân (Total Patients)
SELECT COUNT(DISTINCT `Patient Id`) AS total_patients
FROM hospital_analysis.`hospital er_data`;

-- 2. Tuổi trung bình (Average Patient Age):
SELECT ROUND(AVG(`Patient Age`), 1) AS average_age
FROM hospital_analysis.`hospital er_data`;

-- 3. Mức độ hài lòng trung bình (Average Satisfaction):
SELECT ROUND(AVG(CAST(`Patient Satisfaction Score` AS DECIMAL(10, 2))), 3) 
		AS average_satisfaction
FROM hospital_analysis.`hospital er_data`
WHERE `Patient Satisfaction Score` IS NOT NULL 
AND `Patient Satisfaction Score` <> '';
    
-- 4. Thời gian chờ trung bình (Average Wait Time):
SELECT ROUND(AVG(`Patient Waittime`), 2) AS average_wait_time_mins
FROM hospital_analysis.`hospital er_data`;

-- 5. Số lượng bệnh nhân theo Giới tính (Patient by Gender)
SELECT
    `Patient Gender`,
    COUNT(*) AS number_of_patients
FROM hospital_analysis.`hospital er_data`
GROUP BY `Patient Gender`;

-- 6. Tổng số khoa (Total Department):
SELECT COUNT(DISTINCT `Department Referral`) AS total_departments
FROM hospital_analysis.`hospital er_data`;

-- 7. Bệnh nhân theo Khoa (Patient by Department)
SELECT `Department Referral`,
    COUNT(*) AS number_of_patients
FROM hospital_analysis.`hospital er_data`
GROUP BY `Department Referral`;

-- 8. Số bệnh nhân nhập viện (Patient Admission):
SELECT COUNT(*) AS total_admissions
FROM hospital_analysis.`hospital er_data`
WHERE `Patient Admission Flag` = 'TRUE';

-- 9. Số bệnh nhân theo độ tuổi
SELECT
    CASE
        WHEN `Patient Age` >= 80 THEN 'Very Elderly'
        WHEN `Patient Age` >= 50 THEN 'Seniors'
        WHEN `Patient Age` >= 30 THEN 'Middle_aged Adults'
        WHEN `Patient Age` >= 20 THEN 'Young Adults'
        WHEN `Patient Age` >= 10 THEN 'Teenagers'
        ELSE 'Children'
    END AS age_group,
    COUNT(`Patient Id`) AS total_patients
FROM hospital_analysis.`hospital er_data`
GROUP BY age_group
ORDER BY
    -- Sắp xếp các nhóm tuổi theo thứ tự logic từ nhỏ đến lớn
    CASE age_group
        WHEN 'Children' THEN 1
        WHEN 'Teenagers' THEN 2
        WHEN 'Young Adults' THEN 3
        WHEN 'Middle_aged Adults' THEN 4
        WHEN 'Seniors' THEN 5
        WHEN 'Very Elderly' THEN 6
    END;
-- 10.Số bệnh nhân theo thứ trong tuần
SELECT
    -- Lấy tên ngày trong tuần
    DAYNAME(STR_TO_DATE(`Patient Admission Date`, '%d-%m-%Y %H:%i')) AS day_of_week,
    -- Đếm tổng số bệnh nhân
    COUNT(`Patient Id`) AS total_patients
FROM
    hospital_analysis.`hospital er_data`
GROUP BY
    day_of_week
ORDER BY
    -- Sắp xếp theo thứ tự đúng của tuần (Chủ Nhật -> Thứ Bảy)
    CASE
        WHEN day_of_week = 'Sunday' THEN 1
        WHEN day_of_week = 'Monday' THEN 2
        WHEN day_of_week = 'Tuesday' THEN 3
        WHEN day_of_week = 'Wednesday' THEN 4
        WHEN day_of_week = 'Thursday' THEN 5
        WHEN day_of_week = 'Friday' THEN 6
        WHEN day_of_week = 'Saturday' THEN 7
    END;
    
-- 11. Thống kê dữ liệu theo  từng tháng
SELECT YEAR(STR_TO_DATE(`Patient Admission Date`, '%d-%m-%Y %H:%i')) AS visit_year,
		MONTH(STR_TO_DATE(`Patient Admission Date`, '%d-%m-%Y %H:%i')) AS visit_month,
            CASE
        WHEN `Patient Age` >= 80 THEN 'Very Elderly'
        WHEN `Patient Age` >= 50 THEN 'Seniors'
        WHEN `Patient Age` >= 30 THEN 'Middle_aged Adults'
        WHEN `Patient Age` >= 20 THEN 'Young Adults'
        WHEN `Patient Age` >= 10 THEN 'Teenagers'
        ELSE 'Children'
    END AS age_group,
		COUNT(`Patient Id`) AS total_patients,
		SUM(CASE WHEN `Patient Admission Flag` = 'TRUE' THEN 1 ELSE 0 END) AS admitted,
		SUM(CASE WHEN `Patient Admission Flag` = 'FALSE' THEN 1 ELSE 0 END) AS not_admitted,
		ROUND(AVG(`Patient Waittime`), 1) AS average_wait_time
FROM hospital_analysis.`hospital er_data`
GROUP BY
    visit_year,
    visit_month,
    age_group
ORDER BY
    visit_year,
    visit_month,
    MIN(`Patient Age`);
    
