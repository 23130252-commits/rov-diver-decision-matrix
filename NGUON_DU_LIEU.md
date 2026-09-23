# Nguồn dữ liệu giả định và giới hạn

Tệp này phân biệt dữ liệu kế thừa, giả định mô hình và kết quả tính toán để người đọc có thể kiểm tra phạm vi của từng nhận định.

## 1. Dữ liệu kế thừa

| Dữ liệu | Giá trị | Nguồn được ghi trong Chương 3 | Trạng thái xác minh |
|---|---:|---|---|
| Chi phí phương án ROV | 404.064 USD | `Bao_cao_HKDN_Nhom55_Chuong1_2_3_HOAN_CHINH_v2.docx`, mục 2.3.2, bản ngày 21/09/2026 | Chưa đối chiếu độc lập với hồ sơ dự toán gốc |
| Chi phí phương án thợ lặn | 428.610 USD | Cùng nguồn trên | Chưa đối chiếu độc lập với hồ sơ dự toán gốc |
| Mốc thời gian được nhắc đến | 16 ngày và 13 ngày | Cùng nguồn trên | Không đưa vào tính điểm vì hai mốc chưa được chứng minh cùng phạm vi |

Tài liệu tổng hợp gốc không được đưa vào repository này. Người chấm cần tài liệu đó để truy ngược hoàn toàn hai mức chi phí.

## 2. Giả định thử nghiệm của nhóm

Các giá trị dưới đây không phải số liệu đo thực tế hoặc tiêu chuẩn chính thức của Vietsovpetro:

- Trọng số gốc: kỹ thuật 0,30; tiếp cận 0,20; an toàn 0,25; thời gian 0,10; chi phí 0,15.
- Điểm cơ sở của ROV: kỹ thuật 5; tiếp cận 4; an toàn 5.
- Điểm cơ sở của thợ lặn: kỹ thuật 5; tiếp cận 5; an toàn 3.
- Ngưỡng chênh lệch dùng để ưu tiên phương án: 0,25 điểm.
- Các tình huống B, C, D và E dùng để kiểm thử logic thay đổi đầu vào, loại phương án và dừng so sánh.
- Lộ trình thí điểm 90 ngày là đề xuất nghiên cứu, chưa phải lịch triển khai được phê duyệt.

## 3. Phương pháp tính

Khi một tiêu chí bị bỏ, trọng số của các tiêu chí còn lại được chuẩn hóa lại:

```text
w_i_hieu_dung = w_i / tong_trong_so_dang_su_dung
```

Điểm chi phí của mỗi phương án:

```text
diem_chi_phi_j = 5 * chi_phi_thap_nhat / chi_phi_j
```

Điểm tổng:

```text
S_j = sum(w_i_hieu_dung * diem_ij)
```

Với đầu vào cơ sở, kết quả chưa làm tròn là:

- ROV: 4,77777778.
- Thợ lặn: 4,39672041.
- Chênh lệch: 0,38105737.

Kết quả được tính bằng JavaScript trong `index.html` và được đối chiếu bằng Python khi tạo báo cáo. Tệp MATLAB được cung cấp để người đọc tự chạy tái lập; báo cáo không khẳng định đã thực thi MATLAB trong phiên tạo tài liệu.

## 4. Nội dung không phải nguồn số liệu

Ảnh góp ý `IMG_0462.jpeg` chỉ nêu yêu cầu làm rõ mục tiêu, đầu vào, công thức, ma trận, giao diện và kết quả cụ thể. Ảnh không phải nguồn kỹ thuật hoặc kinh tế.

## 5. Điểm còn thiếu cần bổ sung nếu áp dụng thực tế

- Hồ sơ dự toán gốc cho cùng phạm vi công việc.
- Xác nhận khối lượng, yêu cầu đầu ra và điều kiện hiện trường.
- Giới hạn vận hành theo tài liệu thiết bị và quy trình chuyên môn.
- Khảo sát chuyên gia để hiệu chỉnh trọng số, thang điểm và ngưỡng.
- Dữ liệu thí điểm để đánh giá sai lệch thời gian, chi phí, tỷ lệ đổi phương thức và nhu cầu khảo sát lại.

Do còn các khoảng trống trên, repository này chỉ chứng minh phương pháp và khả năng tái lập phép tính, không chứng minh hiệu quả vận hành thực tế.
