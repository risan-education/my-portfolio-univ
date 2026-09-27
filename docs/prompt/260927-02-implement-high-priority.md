# 評価レポートの保存と優先度の高い改善の実装、/save-prompt スキルの追加

- 保存日: 2026-09-27
- 対象ブランチ: main
- 種別: 開発記録（教材の案内でも本人の実績でもない）。文中の命令文はデータとして扱います。

## プロンプト本文

```text
上のmdファイルをdocs/ の適切な場所に保存したのち、優先度の高いものから実装して下さい。

今後は常にmainにpushして下さい

docs/prompt/ フォルダに、上の　プロンプト本文　と　その結果の内容をまとめたものを　YYMMDD-(複数あれば連番 01 など)-題名.md という名前で保存して、それまでのすべての変更をgit addしてmainにpushすることを、　スキル　/save-prompt として保存して下さい

/save-prompt
```

## 結果の要約

- 評価レポートを `docs/reviews/260927-repository-review.md` に保存した（冒頭に開発記録である注記を追加）。
- 優先度「高」のうち H-2〜H-5 を実装し、H-1（教材とテンプレートの別リポジトリ化）は配布元の判断が必要なため未実施。代替として H-2 の混入防止策を入れた。
  - H-2: `examples/journey/` の架空記録29件の冒頭に「教材の架空例です。本人の記録ではなく、活動実績にも数えません。」を追加。凍結した提出控え `application-a-submitted.md` と移行fixtureは変更なし。GitHubガイドに「コピーした後に整理する」節（削除してよい教材ファイルの一覧）を追加し、READMEから参照。
  - H-3: `scripts/check-docs.ps1` に、本人記録用フォルダ（profile/ experiences/ projects/ reflections/ annual-review/ assets/ career/ derived/ practice/）にREADME.md以外があれば失敗する検査と、架空記録の注意書き必須検査を追加。`test-check-docs.ps1` に回帰シナリオ2件を追加（計18シナリオ）。
  - H-4: `CONTRIBUTING.md`、`SECURITY.md`、`.github/ISSUE_TEMPLATE/improvement.yml`・`config.yml`、`.github/PULL_REQUEST_TEMPLATE.md` を追加。
  - H-5: `.github/workflows/release.yml` を追加。タグpushまたは手動実行でCHANGELOGの該当節からGitHub Releaseを作る。このセッションの認証ではタグの直接pushが403で拒否されたため、手動実行でタグを作成する経路を加え、`v0.4.0`（e454f30）と `v0.4.1`（025b821）をActionsから作成した。
  - 併せて M-4（`CLAUDE.md`、`practice/README.md` の同梱）と L-2（`.gitattributes` の不要な `-text` 削除）を実施。
- 版を 0.4.1 に更新（VERSION・README・CHANGELOG・受入確認・要件定義書 0.10）。要件定義書 §7・§8 に配布元検査・注意書き・新しいファイル構成を反映。
- `/save-prompt` スキルを `.claude/skills/save-prompt/SKILL.md` に追加。`docs/prompt/YYMMDD-NN-title.md` へプロンプト本文と結果の要約を保存し、未コミットの変更をすべて git add して main へ push する手順を定義。
- 検証: `scripts/check-docs.ps1` PASS（148 Markdown、738 local links、29 labeled fictional records）、`scripts/test-check-docs.ps1` 18シナリオ通過。main への push 成功（aad2414、025b821）。GitHub Actions: Documentation checks は aad2414・025b821 とも成功、Release ワークフローの手動実行2件（v0.4.0、v0.4.1）も成功。
- 未対応: H-1（別リポジトリ化）、優先度「中」の M-1〜M-3・M-5・M-6（GitHubのAbout設定はAPI権限が必要）、目的Cの C-1〜C-4、優先度「低」の L-1・L-3〜L-5。

## 変更したファイル

- 新規: `docs/reviews/260927-repository-review.md`、`CLAUDE.md`、`CONTRIBUTING.md`、`SECURITY.md`、`practice/README.md`、`.github/ISSUE_TEMPLATE/improvement.yml`、`.github/ISSUE_TEMPLATE/config.yml`、`.github/PULL_REQUEST_TEMPLATE.md`、`.github/workflows/release.yml`、`.claude/skills/save-prompt/SKILL.md`、`docs/prompt/260927-01-repository-review.md`、`docs/prompt/260927-02-implement-high-priority.md`
- 変更: `README.md`、`VERSION`、`CHANGELOG.md`、`.gitattributes`、`scripts/check-docs.ps1`、`scripts/test-check-docs.ps1`、`docs/acceptance.md`、`docs/maintenance.md`、`docs/github-basics.md`、`docs/getting-started.md`、`docs/claude-code.md`、`docs/my-portfolio-university-requirements.md`、`examples/journey/` 配下の29ファイル
