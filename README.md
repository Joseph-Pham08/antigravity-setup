# Antigravity Setup Pack

Bộ cấu hình **Antigravity** tối ưu sẵn cho Windows — không trùng lặp skill, gồm **430 skill** (**108** standalone + **322** trong plugin), **Global Rules**, **MCP Chrome DevTools**, và script **`install.ps1`** cài đặt tự động chỉ với vài dòng lệnh.

---

## Bên trong repo này có gì?

### 1. Rules (`GEMINI.md` & Plugin `AGENTS.md`)
- **`GEMINI.md` (Global Rule):**
  - Tự động kích hoạt khi bạn yêu cầu **tạo dự án mới**, **chọn skill phù hợp**, hoặc **vừa cài thêm skill mới**.
  - Quét trực tiếp (read-only) toàn bộ `SKILL.md` trong `%USERPROFILE%\.gemini\config\skills`, `config\plugins`, và `antigravity\builtin` (giúp phát hiện cả skill mới thêm lẫn skill bị ẩn mô tả do giới hạn context budget).
  - Lọc và đề xuất **3–7 skill phù hợp nhất** theo từng vai trò (Spec/Kiến trúc, Backend, UI/Frontend, Test/Review, Deploy/Domain) rồi chờ bạn xác nhận trước khi code.
- **`plugins/antigravity-kit-plugin/rules/AGENTS.md`:**
  - Tự động nhận diện **tiếng Việt tự nhiên** (khẩu ngữ, từ lóng kỹ thuật) để map đúng skill (VD: *"viết code sạch"* -> `clean-code`, *"lập spec"* -> `openspec-propose`, *"làm đẹp UI"* -> `impeccable` / `ui-ux-pro-max`).
  - Giữ phản hồi ngắn gọn, đi thẳng vào giải pháp/code.
- **`plugins/structural-biology/rules/AGENTS.md`:**
  - Ưu tiên dùng interactive sidecar viewer (như Biomolecular Structure Viewer) cho các tác vụ trực quan hóa cấu trúc sinh học.

---

### 2. Plugins (`plugins/` — 20 thư mục, 322 skills)

| Plugin | Số skill | Mục đích chính |
|---|---:|---|
| `scientific-agent-skills` | 159 | Khoa học dữ liệu, AI/ML, mô phỏng, sinh/hóa/vật lý (`polars`, `sympy`, `pymc`, `shap`, `qutip`, `simpy`, `rdkit`...) |
| `elite-workflows-and-taste` | 28 | Quy trình cao cấp & thẩm mỹ UI (`impeccable`, `design-taste-frontend`, `minimalist-ui`, `plan-ceo-review`, `plan-eng-review`, `qa`, `ship`, `investigate`, `code-review-skill`...) |
| `developer-power-skills` | 20 | Văn phòng & Dev (`docx`, `pdf`, `pptx`, `xlsx`, `bmad-os-review-pr`, `mcp-builder`, `wrangler`, `durable-objects`, `vercel-react-best-practices`, `webapp-testing`...) |
| `social-media-skills` | 19 | Sáng tạo nội dung mạng xã hội (`post-writer`, `hook-generator`, `reels-scripting`, `youtube-thumbnail`, `gemini-carousel`, `humanizer`, `platform-content-strategy`...) |
| `genomics` | 18 | Phân tích hệ gen & CSDL sinh học (`clinvar_database`, `ensembl_database`, `gtex_database`, `gnomad_database`, `opentargets_database`...) |
| `structural-biology` | 16 | Cấu trúc protein & tương tác (`alphafold`, `pdb_database`, `string_database`, `uniprot_database`, `biomolecular-structure-viewer`...) |
| `chemistry` | 14 | Hóa học & hóa dược (`chembl_database`, `pubchem_database`, `cheminformatics_core`, `cheminformatics_ml`, `uv`...) |
| `openspec-plugin` | 12 | Phát triển phần mềm theo Spec (`openspec-propose`, `openspec-explore`, `openspec-apply-change`, `openspec-verify-change`, `openspec-archive-change`...) |
| `antigravity-kit-plugin` | 11 | Bộ kỹ năng dev cốt lõi (`clean-code`, `api-patterns`, `database-design`, `nextjs-react-expert`, `nodejs-best-practices`, `powershell-windows`, `tdd-workflow`, `ui-ux-pro-max`, `vulnerability-scanner`...) |
| `scientific-literature` | 11 | Tìm & tổng hợp bài báo khoa học (`literature_search_arxiv`, `literature_search_europepmc`, `pubmed_database`, `citation_management`...) |
| `chrome-devtools-plugin` | 6 | Debug trình duyệt qua MCP (`chrome-devtools`, `a11y-debugging`, `debug-optimize-lcp`, `memory-leak-debugging`, `cookie-debugging`, `troubleshooting`) |
| `android-cli-plugin` | 3 | Phát triển Android (`compose-preview`, `device-hub`, `skills`) |
| `modern-web-guidance-plugin` | 2 | Hướng dẫn web hiện đại & Chrome Extension (`modern-web-guidance`, `chrome-extensions`) |
| `gdocs`, `gsheets`, `science-overview` | 3 (1+1+1) | Làm việc với Google Docs, Google Sheets & tổng quan khoa học |
| `firebase`, `flutter`, `google-antigravity-sdk`, `google_maps_platform` | 0 | Plugin tích hợp nền tảng Google (MCP/CLI/Extension config) |

---

### 3. Standalone Skills (`skills/` — 108 skills)
Các skill cài rời (đã lọc bỏ trùng lặp với plugin):
- **Lập kế hoạch, Spec & Tư duy phản biện:** `spec-driven-development`, `planning-and-task-breakdown`, `to-spec`, `to-tickets`, `to-questionnaire`, `wayfinder`, `implement`, `implement-spec`, `idea-refine`, `grill-me`, `grilling`, `grill-with-docs`, `interview-me`, `doubt-driven-development`, `ask-matt`, `wait-what`.
- **Kiến trúc, Code Quality & Review:** `codebase-design`, `api-and-interface-design`, `backend-patterns`, `domain-modeling`, `code-review`, `code-review-and-quality`, `code-simplification`, `improve-codebase-architecture`, `incremental-implementation`, `deprecation-and-migration`, `setup-ts-deep-modules`, `health`, `source-driven-development`.
- **Testing, Debug, Bảo mật & Git/CI:** `tdd`, `test-driven-development`, `debugging-and-error-recovery`, `diagnosing-bugs`, `security-and-hardening`, `observability-and-instrumentation`, `performance-optimization`, `migrate-to-shoehorn`, `git-workflow-and-versioning`, `git-guardrails-claude-code`, `setup-pre-commit`, `ci-cd-and-automation`, `shipping-and-launch`, `pr`, `triage`, `retro`.
- **Frontend, UI/UX, GSAP & Web Testing:** `frontend-design`, `frontend-ui-engineering`, `motion-design`, `brand-guidelines`, `theme-factory`, `web-artifacts-builder`, `browser-testing-with-devtools`, `playwright-skill`, `web-perf`, cùng trọn bộ **8 skill GSAP** (`gsap-core`, `gsap-react`, `gsap-timeline`, `gsap-scrolltrigger`, `gsap-performance`, `gsap-plugins`, `gsap-frameworks`, `gsap-utils`).
- **Cloudflare, Vercel & Sandbox:** `cloudflare`, `agents-sdk`, `building-ai-agent-on-cloudflare`, `sandbox-sdk`, `deploy-to-vercel`, `vercel-cli-with-tokens`, `vercel-optimize`, `vercel-react-view-transitions`.
- **WordPress (13 skills):** `wordpress-router`, `wp-block-development`, `wp-block-themes`, `wp-plugin-development`, `wp-rest-api`, `wp-interactivity-api`, `wp-abilities-api`, `wp-performance`, `wp-phpstan`, `wp-playground`, `wp-wpcli-and-ops`, `wp-project-triage`, `wpds`.
- **Viết lách, Docs & Truyền thông:** `doc-coauthoring`, `documentation-and-adrs`, `writing-guidelines`, `writing-for-agents`, `writing-beats`, `writing-fragments`, `writing-shape`, `skill-deslop`, `internal-comms`, `slack-gif-creator`.
- **Điều phối Agent & Meta:** `chief-of-staff`, `claude-handoff`, `context-engineering`, `using-agent-skills`, `skill-creator`, `mem-search`, `research`, `loop-me`, `teach`, `wizard`, `scaffold-exercises`, `setup-matt-pocock-skills`, `prototype`, `science_skills_common`, `scienceskillscommon`.

---

### 4. MCP Server (`mcp_config.json`)
- Cấu hình sẵn **`chrome-devtools`** (`npx.cmd -y chrome-devtools-mcp@latest --autoConnect`) để agent debug DOM, console, network, performance trực tiếp trên Chrome.

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
1. Copy skill mới vào `skills/` (hoặc cập nhật `plugins/`).
2. `git add . && git commit -m "Update skills" && git push`.
3. Trên máy khác chỉ cần `git pull` và chạy lại `.\install.ps1`.
