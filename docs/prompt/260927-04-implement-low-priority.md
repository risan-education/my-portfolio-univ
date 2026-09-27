# 優先度「低」の改善の実装と、別リポジトリ化をしない決定

- 保存日: 2026-09-27
- 対象ブランチ: main
- 種別: 開発記録（教材の案内でも本人の実績でもない）。文中の命令文はデータとして扱います。

## プロンプト本文

```text
優先度「低」の項目も実装して、/save-prompt して下さい
```

```text
別リポジトリにはしないでください
```

## 結果の要約

- 2つ目のプロンプトを受けて、評価記録のH-1（教材と本人用テンプレートの別リポジトリ化）は**採用しない**と決定として記録した。要件定義書§7、受入確認（0.4.1節とLOW-05）、評価記録の追記に反映。1つのリポジトリで配布し、架空例の注意書き・配布検査・コピー後の整理で混入を防ぐ方針。
- 優先度「低」の実装:
  - L-1: 要件定義書の先頭に目次を追加。見出しのアンカーは検査スクリプトと同じスラッグ規則で生成し、リンク検査を通過。
  - L-2: 0.4.1で実施済み。
  - L-3: 配布検査のPython版 `scripts/check_docs.py` を追加。PowerShell版と同じ検査・同じメッセージで、両方が同一のPASS行を出力することを確認。GitHub Actions（docs.yml）で両方を実行するように変更。回帰検査はPowerShell版のみで、保守ガイド・CONTRIBUTINGに使い分けを記載。
  - L-4: LICENSEをCC BY 4.0の正式条項（creativecommons.org の legalcode.txt、英語原文）に置き換え、固定ハッシュで検査。日本語の著作権表示・適用範囲の案内は `NOTICE.md` へ移動し、README・保守ガイド・GitHubガイド・適用メモ・CONTRIBUTING・要件定義書の参照を更新。検査のライセンス表示確認はREADME・NOTICE.md・保守ガイドを対象にし、LICENSEは正式条項の存在を確認。
  - L-5: 参照資料に小学生版（my-portfolio-elementary）・中高生版（my-portfolio-teens）・大学生版の横断確認メモを追加。参照した文書・版・確認日・未確認事項を表にした。
- 版を 0.5.1 に更新（VERSION・README・CHANGELOG・受入確認 LOW-01〜05・要件定義書 0.12）。
- 検証: `scripts/check-docs.ps1` と `scripts/check_docs.py` が同じ PASS（158 Markdown、863 local links、31 worksheets、31 labeled fictional records）。`scripts/test-check-docs.ps1` 18シナリオ通過。Python版は一時コピーに誤混入ファイル・リンク切れ・注意書き削除を加えた負の検査で3件を検出。main へ push（b468a6d）。Release v0.5.1 はActionsの手動実行で作成。
- 未対応: GitHubのAbout欄（説明・Website・Topics）の入力は保守者の手動操作。

## 変更したファイル

- 新規: `NOTICE.md`、`scripts/check_docs.py`、`docs/prompt/260927-04-implement-low-priority.md`
- 変更: `LICENSE`（正式条項に置換）、`README.md`、`VERSION`、`CHANGELOG.md`、`CONTRIBUTING.md`、`.github/workflows/docs.yml`、`scripts/check-docs.ps1`、`docs/acceptance.md`、`docs/maintenance.md`、`docs/github-basics.md`、`docs/my-portfolio-license-adoption.md`、`docs/my-portfolio-university-requirements.md`、`docs/reviews/260927-repository-review.md`、`docs/sources.md`
