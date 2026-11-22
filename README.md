# Antigravity Setup Pack

Gói cấu hình Antigravity hoàn chỉnh gồm:
- `GEMINI.md`: Global Rule tự động quét & đề xuất skill phù hợp khi tạo dự án mới (kể cả skill mới cài thêm hoặc bị ẩn do context budget).
- `skills/`: Bộ skill cài rời (không trùng lặp với plugin).
- `plugins/`: Bộ plugin (kèm `AGENTS.md` / rules).
- `mcp_config.json`: Cấu hình MCP server (Chrome DevTools).
- `install.ps1`: Script cài đặt tự động cho Windows.

---

## Hướng dẫn cài đặt trên máy mới (Windows)

### Bước 1: Tải repo về máy
Mở **PowerShell** và chạy:
```powershell
git clone https://github.com/Joseph-Pham08/antigravity-setup.git
cd antigravity-setup
```
*(Nếu máy chưa cài Git, bấm **Code -> Download ZIP** trên GitHub, giải nén rồi mở PowerShell tại thư mục vừa giải nén.)*

### Bước 2: Chạy script cài đặt
```powershell
.\install.ps1
```
> **Nếu Windows báo lỗi chặn script (ExecutionPolicy):** chạy lệnh sau rồi chạy lại `.\install.ps1`:
> ```powershell
> Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
> ```

Script sẽ tự động:
1. Backup cấu hình cũ (nếu có) vào `%USERPROFILE%\.gemini\backup_<thoi-gian>`.
2. Cài `GEMINI.md`, `skills/`, `plugins/` và `mcp_config.json` vào `%USERPROFILE%\.gemini\`.
3. Kiểm tra `Git`, `Python`, `uv`, `Node.js` và hỏi bạn có muốn cài tự động các công cụ còn thiếu qua `winget` không.

### Bước 3: Hoàn tất
- Mở lại **Antigravity** (hoặc mở đoạn chat mới).
- Nếu dùng các plugin cần tài khoản cá nhân (Google Docs/Sheets...), hãy đăng nhập lại trong phần **Plugins Manager**.

---

## Cách cập nhật khi bạn cài thêm skill mới trên máy chính
Khi muốn đồng bộ thêm skill mới lên GitHub:
1. Copy skill mới vào `skills/` (hoặc cập nhật `plugins/`).
2. `git add . && git commit -m "Update skills" && git push`.
3. Trên máy khác chỉ cần `git pull` và chạy lại `.\install.ps1`.
