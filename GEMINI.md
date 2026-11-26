# Global Antigravity Rules — Smart Skill Routing & Engineering

## 1. Ưu tiên Skill thông minh (Domain-First Routing)
- **Mặc định ưu tiên:** Các skill và plugin về **Lập trình, Kiến trúc, Spec, UI/UX, Test/QA, Bảo mật, Deploy, Content & Văn phòng** (`config\skills`, `antigravity-kit-plugin`, `elite-workflows-and-taste`, `developer-power-skills`, `openspec-plugin`, `chrome-devtools-plugin`, `modern-web-guidance-plugin`, `android-cli-plugin`, `social-media-skills`).
- **Nhóm Nghiên cứu khoa học (`scientific-agent-skills`, `genomics`, `structural-biology`, `chemistry`, `scientific-literature`, `science-overview`):** Chỉ quét và nạp khi yêu cầu thực sự liên quan đến khoa học, y sinh, hóa học, mô phỏng, hoặc khi người dùng gọi đích danh.

## 2. Quy trình 4 pha khi tạo dự án mới / tính năng lớn
*(Với task nhỏ, sửa lỗi lẻ hoặc câu hỏi đơn giản: bỏ qua quy trình này và xử lý trực tiếp.)*

1. **Pha 1 — Phân tích & Chốt Kỹ thuật (ưu tiên trắc nghiệm):**
   - Tóm tắt ngắn bài toán và đặt **3–5 câu hỏi trắc nghiệm** (dùng tool hỏi trắc nghiệm nếu có, hoặc đánh số `1a/1b...` kèm phương án khuyến nghị) về: hình thức sản phẩm (Web/App/CLI, có cần SEO/Realtime?), Tech stack, Database, và nơi Deploy. Chờ người dùng chọn.
2. **Pha 2 — Quét & Đề xuất từ 10 Skill trở lên:**
   - Quét trực tiếp (read-only) YAML frontmatter (`name`, `description`) của `SKILL.md` trong `%USERPROFILE%\.gemini\config\skills`, `%USERPROFILE%\.gemini\config\plugins` *(bỏ qua nhóm nghiên cứu khoa học nếu không liên quan)*, và `%USERPROFILE%\.gemini\antigravity\builtin`.
   - Đề xuất **10+ skill phù hợp nhất** chia làm 2 tầng:
     - **Tầng Core (4–6 skill):** Nạp ngay để định hình Spec, Kiến trúc, Backend/Frontend chính.
     - **Tầng Theo pha (5–8 skill):** Mở khi đụng tới UI/Animation, Test, Security, Performance, SEO, Deploy.
   - Kèm 1 dòng lý do ngắn cho mỗi skill và **chờ người dùng xác nhận (`ok` / thêm / bớt)**.
3. **Pha 3 — Phân tích & Chốt Trải nghiệm (ưu tiên trắc nghiệm):**
   - Dựa trên stack & skill đã chốt, đặt **4–6 câu hỏi trắc nghiệm** về: phong cách giao diện (Minimalist / Brutalist / Glass / SaaS...), luồng thao tác chính, trạng thái rỗng/lỗi, và hiệu ứng/tốc độ. Chờ người dùng chọn.
4. **Pha 4 — Triển khai:**
   - Sau khi người dùng chốt Pha 3 mới đọc chi tiết các `SKILL.md` tầng Core và bắt đầu tạo dự án / viết code.

*(Nếu người dùng chỉ hỏi tìm/đề xuất skill hoặc vừa cài thêm skill mới, thực hiện ngay bước quét ở Pha 2 và đề xuất.)*

## 3. Thư viện mở rộng (On-Demand)
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
