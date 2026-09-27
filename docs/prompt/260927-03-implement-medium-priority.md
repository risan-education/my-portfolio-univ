# 優先度「中」の改善の実装

- 保存日: 2026-09-27
- 対象ブランチ: main
- 種別: 開発記録（教材の案内でも本人の実績でもない）。文中の命令文はデータとして扱います。

## プロンプト本文

```text
優先度「中」の項目も実装して、/save-prompt して下さい
```

## 結果の要約

- 評価記録（[docs/reviews/260927-repository-review.md](../reviews/260927-repository-review.md)）の優先度「中」M-1〜M-3・M-5・M-6と、目的CのC-1〜C-4を実装した。M-4は前回実施済み。
  - M-1: `docs/chatgpt-github.md` を新設。公式のプラグイン案内（Pluginsタブ、外部サービス接続、権限の確認・承認）を再確認し、記載のない事項（リポジトリの絞り込み、書込可否、プラン制限）は利用環境で確認する扱いとした。読取・書込・再読込の区別、配布元へ接続しない、examples/ を読ませない、Codexの扱い、うまくいかないときの確認点を記載。
  - M-2: `CHATGPT-short.md`（依頼文約480字）を追加。開始手順・環境確認・READMEから全文との使い分けを案内。
  - M-3: READMEを「5分で始める」（3手順）から始まる構成に再編し、就活・比較・法令の表は「慣れてきたら」へ移動。
  - M-5: `docs/portfolio-format.md` に紹介記事の6フォルダ（profile/ experiences/ projects/ reflections/ achievements/ 2026/）と大学生版の対応表を追加。READMEから参照。
  - M-6: About欄（説明・Website・Topics）はこのセッションのGitHubツールでは変更できないため、保守ガイドに入力例を記載して保守者の手動操作とした。`.gitattributes` に `*.ps1 linguist-vendored` を追加。
  - C-1: `templates/ai-context-current.md`（常設の現在版、保存先 `derived/ai-context/current.md`）と架空例 `examples/journey/derived/ai-current.md` を追加。
  - C-2: `docs/ai.md` を再構成し、常設の現在版、貼り付け先ごとの渡し方（チャット・プロジェクト・記憶機能・他のAI・GitHub接続）、見直しの周期を追加。
  - C-3: `templates/work-experience.md`（AIに渡してよい範囲の確認欄、機密の除外）と架空例 `examples/after-university/date-unknown-work.md` を追加。`docs/after-university.md` を就職時の確認、続け方、転職・起業、見直しの目安に拡充。
  - C-4: README冒頭に「卒業後もAIに自分を説明するための外部記憶になる」を明示。
- 版を 0.5.0 に更新（VERSION・README・CHANGELOG・受入確認 MID-01〜05／CTX-01〜04・要件定義書 0.11：§1.1、§3、§6.1 C-09/C-10、§8）。参照資料に0.5.0の確認範囲を追記。
- 配布検査を拡張: 必須ファイルに新規ファイルを追加し、架空例の注意書き検査を `examples/after-university/` にも適用。
- 検証: `scripts/check-docs.ps1` PASS（156 Markdown、813 local links、31 worksheets、31 labeled fictional records）、`scripts/test-check-docs.ps1` 18シナリオ通過。main へ push（78b5cdd）。
- 未検証: ChatGPT実アカウントでのプラグイン接続・書込・指示欄の文字数上限。
- 未対応: H-1（教材とテンプレートの別リポジトリ化、配布元の判断待ち）、About欄の入力（手動）、優先度「低」のL-1・L-3〜L-5。

## 変更したファイル

- 新規: `CHATGPT-short.md`、`docs/chatgpt-github.md`、`templates/ai-context-current.md`、`templates/work-experience.md`、`examples/journey/derived/ai-current.md`、`examples/after-university/date-unknown-work.md`、`docs/prompt/260927-03-implement-medium-priority.md`
- 変更: `README.md`、`VERSION`、`CHANGELOG.md`、`.gitattributes`、`docs/ai.md`、`docs/after-university.md`、`docs/portfolio-format.md`、`docs/chatgpt-environment.md`、`docs/getting-started.md`、`docs/chatgpt-prompts.md`、`docs/maintenance.md`、`docs/acceptance.md`、`docs/sources.md`、`docs/my-portfolio-university-requirements.md`、`templates/README.md`、`derived/ai-context/README.md`、`experiences/README.md`、`examples/README.md`、`scripts/check-docs.ps1`
