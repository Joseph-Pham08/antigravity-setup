# Global Project & Skill Discovery Rules

## Tự động quét & đề xuất Skill khi tạo dự án mới
Khi người dùng yêu cầu tạo/khởi tạo dự án mới, hỏi chọn skill phù hợp, hoặc vừa cài thêm skill mới:

1. **Quét trực tiếp (read-only) toàn bộ skill hiện có trên máy** bằng cách đọc YAML frontmatter (`name`, `description`) của các file `SKILL.md` trong:
   - `%USERPROFILE%\.gemini\config\skills`
   - `%USERPROFILE%\.gemini\config\plugins`
   - `%USERPROFILE%\.gemini\antigravity\builtin`
   *(Bước này đảm bảo phát hiện cả các skill mới thêm và các skill bị ẩn mô tả do giới hạn context budget.)*

2. **Lọc và đề xuất 3–7 skill phù hợp nhất** với mục tiêu/tech stack của dự án (chia ngắn gọn theo vai trò: Lập spec/kiến trúc, Backend/API, UI/Frontend, Test/Review, Deploy/Domain), kèm 1 dòng lý do cho mỗi skill.

3. **Chờ người dùng xác nhận** bộ skill muốn dùng rồi mới đọc chi tiết các `SKILL.md` được chọn để triển khai.
