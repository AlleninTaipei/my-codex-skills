# Claude Code skills 同步紀錄

比對日期: 2026-10-15. 來源為本機 `~/.claude/skills`, `~/.claude/commands` 與已啟用 plugin 的安裝目錄.

## 同步結果

| 項目 | 處理 |
| --- | --- |
| `programmatic-video` | 新增完整 skill, scripts, references 與 examples. 將入口範例的 `.claude/skills` 路徑改為 `.codex/skills`. |
| `frontend-design` | 從已啟用的 `frontend-design@claude-plugins-official` 複製 skill 與 Apache 2.0 授權檔. 來源版本 `c2bdb427efe8`, commit `c2bdb427efe8673f190ae862c273cfa368d2390f`. |
| `video-to-editable-slides` | 同步新版指引, HTML/Markdown 建置工具, PDF 字型與 PPTX 調整. 保留 Codex 的 `agents/openai.yaml`. |
| `codebase-to-course`, `frontend-slides`, `knowledge-youtube-to-markdown` | 來源內容與 repo 相同, 保留 Codex 介面設定. |
| `learndoc`, `md2course` | Claude commands 已有對應的 Codex skills, 保留其 Codex 版本與拆分後的參考文件. |
| `knowledge-note-signal-review` | 保留 Codex 專用 skill. |

安裝時排除 Python 快取. 不同步帳號憑證, 模型設定, 權限設定或 Claude plugin 啟用設定. 本 repo 儲存 skills 本體, 不代表安裝了 Claude 的 plugin runtime.

## 未直接移植的 synced 內容

`~/.claude/skills/synced` 是另一批服務同步內容, 不視為可直接攜帶的自訂 skills:

- `built-in-browser`, `chrome-browser`, `computer-use`, `docx`, `pdf`, `pptx`, `xlsx`: 隨附 LICENSE.txt 明文限制服務外保留與複製.
- `docs`, `google-workspace`, `import-memory`, `morning`: 服務內文件, 整合或記憶工作流程, 不假設 Codex 有相同工具.
- `deep-research`: 依賴 Claude 的 Agent/Task 工作流程, 此次未移植.
- `skill-creator`: Codex 已提供同名系統技能, 保留系統版本.

## 使用限制與來源

`programmatic-video` 的純程式流程需要 NumPy, OpenCV, Pillow 與 PyAV. AI 混合流程另需對應的影片生成 MCP 與模型, 複製 skill 不會安裝這些服務. 範例中的素材檔案需依各案例準備.

本機安裝沿用現有 `~/.codex/skills`, 也支援透過安裝腳本的 `-Destination` 指定位置. Skill 格式與探索行為參考 [OpenAI 官方文件](https://learn.chatgpt.com/docs/build-skills).
