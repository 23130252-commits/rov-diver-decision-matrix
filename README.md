# Ma trận hỗ trợ lựa chọn ROV và thợ lặn

Dự án học thuật xây dựng một ma trận đa tiêu chí để hỗ trợ so sánh hai phương án khảo sát công trình biển: ROV và thợ lặn. Công cụ giúp công khai đầu vào, trọng số, cách tính và lý do dẫn đến kết quả; không thay thế phê duyệt kỹ thuật, đánh giá rủi ro hoặc quy trình an toàn của doanh nghiệp.

## Chạy trực tuyến

Sau khi GitHub Pages được bật, công cụ được mở tại:

<https://23130252-commits.github.io/rov-diver-decision-matrix/>

Tệp `index.html` cũng có thể tải xuống và mở trực tiếp bằng trình duyệt, không cần cài đặt và không gửi dữ liệu nhập lên máy chủ.

## Kết quả trường hợp cơ sở

| Phương án | Điểm tổng |
|---|---:|
| ROV | 4,7778 |
| Thợ lặn | 4,3967 |

Chênh lệch là 0,3811 điểm, lớn hơn ngưỡng thử nghiệm 0,25 nên mô hình trả về **Ưu tiên ROV**. Kết quả này chỉ đúng với bộ đầu vào cơ sở đang công bố.

## Phương pháp

Mô hình sử dụng năm tiêu chí: kỹ thuật, tiếp cận, an toàn, thời gian và chi phí. Một tiêu chí chỉ được đưa vào tính điểm khi có dữ liệu đủ điều kiện so sánh. Trọng số của các tiêu chí còn lại được chuẩn hóa lại để tổng bằng 1.

Điểm tổng của phương án `j`:

```text
S_j = sum(w_i_hieu_dung * c_ij)
```

Trước khi chấm điểm, mỗi phương án phải vượt qua các điều kiện bắt buộc về kỹ thuật, tiếp cận và an toàn. Điểm kinh tế không được dùng để bù cho một điều kiện bắt buộc không đạt.

## Tệp trong dự án

| Tệp | Nội dung |
|---|---|
| `index.html` | Giao diện nhập liệu và chạy ma trận trên trình duyệt |
| `MaTran_ROV_ThoLan.m` | Mã MATLAB tái lập năm tình huống kiểm thử |
| `Chuong_3_Ma_tran_ROV_Tho_lan.pdf` | Bản Chương 3 ổn định để đọc và in |
| `Chuong_3_Ma_tran_ROV_Tho_lan.docx` | Bản Chương 3 có thể chỉnh sửa |
| `NGUON_DU_LIEU.md` | Nguồn số liệu, giả định và giới hạn sử dụng |
| `LICENSE` | Giấy phép MIT áp dụng cho mã nguồn |

## Chạy và kiểm tra

### Trên trình duyệt

1. Mở `index.html`.
2. Chọn tình huống hoặc nhập bộ dữ liệu mới.
3. Xác nhận điều kiện bắt buộc.
4. Bật những tiêu chí định lượng có dữ liệu cùng phạm vi.
5. Chọn **Phân tích phương án** và đối chiếu bảng đóng góp điểm.

### Trong MATLAB

```matlab
run('MaTran_ROV_ThoLan.m')
```

Kết quả kỳ vọng của tình huống A:

```text
ROV 4.7778; Tho lan 4.3967; Chenh lech 0.3811
Uu tien ROV
```

## Giới hạn quan trọng

- Hai mức chi phí 404.064 USD và 428.610 USD được kế thừa từ báo cáo tổng hợp của nhóm, chưa được đối chiếu độc lập với hồ sơ dự toán gốc.
- Hai mốc 13 ngày và 16 ngày không được đưa vào tiêu chí thời gian vì chưa chứng minh là thời gian hoàn thành của hai phương án có cùng phạm vi.
- Trọng số, điểm định tính, ngưỡng 0,25 và lộ trình thí điểm là đề xuất minh họa của nhóm, chưa được khảo sát chuyên gia hoặc doanh nghiệp phê duyệt.
- Công cụ chỉ hỗ trợ quyết định; kết luận cuối cùng thuộc người có thẩm quyền chuyên môn.

Xem chi tiết tại [`NGUON_DU_LIEU.md`](NGUON_DU_LIEU.md) và báo cáo Chương 3.

## Giấy phép

Mã trong `index.html` và `MaTran_ROV_ThoLan.m` được phát hành theo MIT License. Báo cáo, dữ liệu kế thừa và tên tổ chức không tự động thuộc phạm vi giấy phép này; việc sử dụng lại phải tuân theo quyền của tác giả và nguồn tương ứng.
