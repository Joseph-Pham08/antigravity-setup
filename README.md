# Antigravity Setup Pack

Bộ cấu hình **Antigravity** tối ưu sẵn cho Windows — không trùng lặp skill, gồm **751 skill** (**429** standalone đã gộp thêm **321 skill từ `affaan-m/ECC`** + **322** trong plugin), **72 agent profiles**, **99 workflow commands**, **3 context modes**, **Global Rules**, **MCP Chrome DevTools + Catalog**, và script **`install.ps1`** cài đặt tự động.

---

## Bên trong repo này có gì?

### 1. Rules (`GEMINI.md` & Plugin `AGENTS.md`)
- **`GEMINI.md` (Global Rule):**
  - **Domain-First Routing:** Mặc định ưu tiên skill Lập trình, Kiến trúc, UI/UX, Test/Review, Deploy, Content & Văn phòng; chỉ quét/nạp nhóm Nghiên cứu khoa học khi bài toán thực sự liên quan hoặc được gọi đích danh.
  - **Zero-Miss Skill Discovery:** Quét trực tiếp (read-only) toàn bộ `SKILL.md` trong `%USERPROFILE%\.gemini\config\skills`, `config\plugins`, và `antigravity\builtin`, lọc **3–7 skill phù hợp nhất** rồi chờ xác nhận trước khi code.
  - **ECC On-Demand & Engineering Discipline:** Hỗ trợ đọc `contexts/`, `agents/`, `commands/` theo yêu cầu; tích hợp Coding Standards, Security Checklist & Conventional Commits từ ECC.
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

### 3. Standalone Skills (`skills/` — 429 skills)
Gồm **108 skill gốc** đã lọc trùng + **321 skill mới từ `affaan-m/ECC`** (đã tự động bỏ qua 7 skill trùng tên):
- **Lập kế hoạch, Spec & Tư duy phản biện:** `spec-driven-development`, `planning-and-task-breakdown`, `to-spec`, `to-tickets`, `to-questionnaire`, `wayfinder`, `implement`, `implement-spec`, `idea-refine`, `grill-me`, `grilling`, `grill-with-docs`, `interview-me`, `doubt-driven-development`, `ask-matt`, `wait-what`.
- **Kiến trúc, Code Quality & Review:** `codebase-design`, `api-and-interface-design`, `backend-patterns`, `domain-modeling`, `code-review`, `code-review-and-quality`, `code-simplification`, `improve-codebase-architecture`, `incremental-implementation`, `deprecation-and-migration`, `setup-ts-deep-modules`, `health`, `source-driven-development`.
- **Testing, Debug, Bảo mật & Git/CI:** `tdd`, `test-driven-development`, `debugging-and-error-recovery`, `diagnosing-bugs`, `security-and-hardening`, `observability-and-instrumentation`, `performance-optimization`, `migrate-to-shoehorn`, `git-workflow-and-versioning`, `git-guardrails-claude-code`, `setup-pre-commit`, `ci-cd-and-automation`, `shipping-and-launch`, `pr`, `triage`, `retro`.
- **Frontend, UI/UX, GSAP & Web Testing:** `frontend-design`, `frontend-ui-engineering`, `motion-design`, `brand-guidelines`, `theme-factory`, `web-artifacts-builder`, `browser-testing-with-devtools`, `playwright-skill`, `web-perf`, cùng trọn bộ **8 skill GSAP** (`gsap-core`, `gsap-react`, `gsap-timeline`, `gsap-scrolltrigger`, `gsap-performance`, `gsap-plugins`, `gsap-frameworks`, `gsap-utils`).
- **Cloudflare, Vercel & Sandbox:** `cloudflare`, `agents-sdk`, `building-ai-agent-on-cloudflare`, `sandbox-sdk`, `deploy-to-vercel`, `vercel-cli-with-tokens`, `vercel-optimize`, `vercel-react-view-transitions`.
- **WordPress (13 skills):** `wordpress-router`, `wp-block-development`, `wp-block-themes`, `wp-plugin-development`, `wp-rest-api`, `wp-interactivity-api`, `wp-abilities-api`, `wp-performance`, `wp-phpstan`, `wp-playground`, `wp-wpcli-and-ops`, `wp-project-triage`, `wpds`.
- **Viết lách, Docs & Truyền thông:** `doc-coauthoring`, `documentation-and-adrs`, `writing-guidelines`, `writing-for-agents`, `writing-beats`, `writing-fragments`, `writing-shape`, `skill-deslop`, `internal-comms`, `slack-gif-creator`.
- **Điều phối Agent & Meta:** `chief-of-staff`, `claude-handoff`, `context-engineering`, `using-agent-skills`, `skill-creator`, `mem-search`, `research`, `loop-me`, `teach`, `wizard`, `scaffold-exercises`, `setup-matt-pocock-skills`, `prototype`, `science_skills_common`, `scienceskillscommon`.

---

### 4. Thư viện mở rộng ECC (`contexts/`, `agents/`, `commands/`)
*(Được cài vào `%USERPROFILE%\.gemini\ecc\` để nạp theo yêu cầu, không làm nặng context mặc định; phần `hooks.json` thử nghiệm của ECC được lược bỏ để đảm bảo an toàn, không chặn nhầm lệnh trên Windows.)*
- **`contexts/` (3 chế độ):** `dev.md`, `research.md`, `review.md`.
- **`agents/` (72 profiles):** `architect.md`, `code-architect.md`, `build-error-resolver.md`, `a11y-architect.md`, `agent-evaluator.md`...
- **`commands/` (99 templates):** `build-fix.md`, `code-review.md`, `checkpoint.md`, `cost-report.md`...

### 5. MCP Server (`mcp_config.json` & `mcp_servers.catalog.json`)
- **`mcp_config.json`:** Cấu hình sẵn **`chrome-devtools`** (`npx.cmd -y chrome-devtools-mcp@latest --autoConnect`) để debug DOM, console, network, performance trực tiếp trên Chrome.
- **`mcp_servers.catalog.json`:** Danh mục 38+ MCP server tham khảo từ ECC (Context7, GitHub, Cloudflare, Supabase, Playwright...) để copy thêm khi cần.

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
