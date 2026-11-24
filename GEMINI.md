# Global Antigravity Rules — Smart Skill Routing & Engineering

## 1. Ưu tiên Skill thông minh (Domain-First Routing)
- **Mặc định ưu tiên:** Các skill và plugin về **Lập trình, Kiến trúc, Spec, UI/UX, Test/QA, Bảo mật, Deploy, Content & Văn phòng** (`config\skills`, `antigravity-kit-plugin`, `elite-workflows-and-taste`, `developer-power-skills`, `openspec-plugin`, `chrome-devtools-plugin`, `modern-web-guidance-plugin`, `android-cli-plugin`, `social-media-skills`).
- **Nhóm Nghiên cứu khoa học (`scientific-agent-skills`, `genomics`, `structural-biology`, `chemistry`, `scientific-literature`, `science-overview`):** Chỉ quét và nạp khi yêu cầu thực sự liên quan đến khoa học, y sinh, hóa học, mô phỏng, hoặc khi người dùng gọi đích danh.

## 2. Tự động quét & đề xuất Skill khi tạo dự án mới
Khi người dùng yêu cầu tạo/khởi tạo dự án mới, hỏi chọn skill phù hợp, hoặc vừa cài thêm skill mới:
1. **Quét trực tiếp (read-only)** YAML frontmatter (`name`, `description`) của `SKILL.md` trong:
   - `%USERPROFILE%\.gemini\config\skills`
   - `%USERPROFILE%\.gemini\config\plugins` *(bỏ qua các plugin nghiên cứu khoa học ở mục 1 nếu không phải tác vụ khoa học)*
   - `%USERPROFILE%\.gemini\antigravity\builtin`
   *(Đảm bảo phát hiện 100% skill mới thêm và các skill bị ẩn mô tả do giới hạn context budget.)*
2. **Đề xuất 3–7 skill sát nhất** theo vai trò (Spec/Kế hoạch, Kiến trúc/Backend, UI/Frontend, Test/Review, Deploy/Domain), kèm 1 dòng lý do cho mỗi skill.
3. **Chờ người dùng xác nhận** bộ skill muốn dùng rồi mới đọc chi tiết các `SKILL.md` được chọn để triển khai.

## 3. Thư viện mở rộng ECC (On-Demand)
- Khi người dùng yêu cầu đổi chế độ (`dev` / `research` / `review`), gọi vai trò agent chuyên biệt hoặc workflow chuẩn, đọc trực tiếp từ:
  - `%USERPROFILE%\.gemini\ecc\contexts\` (`dev.md`, `research.md`, `review.md`)
  - `%USERPROFILE%\.gemini\ecc\agents\` (72 agent profiles)
  - `%USERPROFILE%\.gemini\ecc\commands\` (99 workflow templates)

## 4. Kỷ luật Code, Bảo mật & Kiểm chứng
- **Spec trước, code sau (với tác vụ lớn/mơ hồ):** Gợi ý chốt spec/kế hoạch (`openspec-propose`, `spec`, hoặc `/plan`) trước khi sửa nhiều file.
- **Coding & Security Checklist:** Ưu tiên immutability, hàm nhỏ gọn, validate dữ liệu đầu vào ở boundary, fail loudly với lỗi rõ ràng; **không** hardcode secrets/API keys, luôn dùng parameterized DB queries, sanitize HTML, kiểm tra authz/authn, và dùng Conventional Commits (`feat`, `fix`, `refactor`, `docs`, `test`, `chore`, `perf`, `ci`).
- **Kiểm chứng thực tế:** Sau khi sửa code hoặc cấu hình, luôn chạy lệnh/test kiểm tra thực tế; không suy đoán kết quả chưa chạy.
- **An toàn thay đổi:** Không tự ý xóa dữ liệu hoặc ghi đè cấu hình quan trọng của người dùng; backup trước khi thao tác hàng loạt.
- **Giao tiếp:** Ngắn gọn, đi thẳng vào vấn đề, dùng tiếng Việt tự nhiên (trừ khi người dùng dùng tiếng Anh).
