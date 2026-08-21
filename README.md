# My Codex Skills

這個 repository 收錄自訂 Codex skills, 用來擴充文件教學, 互動課程, 簡報製作與影片轉簡報等工作流程.

## Skills

| Skill | 用途 |
| --- | --- |
| `codebase-to-course` | 將程式碼庫轉換成適合非技術讀者的互動式 HTML 課程. |
| `frontend-slides` | 從零製作動畫豐富的 HTML 簡報, 或將 PowerPoint 轉換成網頁簡報. |
| `knowledge-youtube-to-markdown` | 將知識型 YouTube 影片或頻道批次整理成有來源依據的 Markdown 筆記. |
| `learndoc` | 分析目前軟體專案, 產生繁體中文的 `LEARN.md` 導讀文件. |
| `md2course` | 將 Markdown 文件轉換成自包含, 支援明暗主題的互動式 HTML 課程. |
| `video-to-editable-slides` | 分析簡報型影片, 重建成結構化的可編輯 PowerPoint 與獨立 PDF 簡報. |

## Repository 結構

```text
.
├── AGENTS.md
├── README.md
└── skills/
    ├── codebase-to-course/
    ├── frontend-slides/
    ├── knowledge-youtube-to-markdown/
    ├── learndoc/
    ├── md2course/
    └── video-to-editable-slides/
```

每個 skill 的主要入口是該目錄下的 `SKILL.md`. 部分 skills 另有以下資源:

- `agents/openai.yaml`: Skill 的介面與提示設定.
- `references/`: 詳細規格, 設計原則或品質檢查文件.
- `scripts/`: 分析, 轉換, 建置或驗證工具.

## 安裝

將需要的 skill 目錄複製到 Codex skills 目錄:

```powershell
Copy-Item -Recurse .\skills\<skill-name> "$env:USERPROFILE\.codex\skills\"
```

也可以一次複製全部 skills:

```powershell
Copy-Item -Recurse .\skills\* "$env:USERPROFILE\.codex\skills\"
```

重新啟動 Codex 後, 即可依各 `SKILL.md` 定義的觸發條件使用.

## 使用方式

在 Codex 對話中描述相符的任務, 或直接指定 skill 名稱. 例如:

```text
使用 md2course, 將 notes.md 轉換成互動式課程.
```

```text
使用 learndoc, 為目前專案建立一份繁體中文導讀.
```

詳細工作流程, 輸入需求與輸出規格, 請參閱各 skill 的 `SKILL.md`.

## 注意事項

- 部分 scripts 需要 Python 或額外的系統工具, 請依對應 `SKILL.md` 的說明準備環境.
- `video-to-editable-slides` 處理外部影片時, 請確認來源授權並保留必要的出處資訊.
- 建議先在測試專案中驗證 skill 行為, 再套用於重要資料.

