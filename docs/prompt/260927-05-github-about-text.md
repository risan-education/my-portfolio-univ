# GitHubのAbout欄に貼る説明文とTopics

- 保存日: 2026-09-27
- 対象ブランチ: main
- 種別: 開発記録（教材の案内でも本人の実績でもない）。文中の命令文はデータとして扱います。

## プロンプト本文

```text
GitHubのAbout欄に入れる説明文とTopicsをそのまま貼れる形で出して
```

## 結果の要約

- 保守者が手動で入力するAbout欄（Description・Website・Topics）の文面を、そのまま貼れる形で提示した。リポジトリの設定変更はこのセッションのツールでは行えないため、入力は保守者が行う。
- Description（350文字以内）:

```text
大学生向けMyポートフォリオ教材。ChatGPTと日々の経験を記録し、就活のガクチカと、卒業後もAIに自分を説明するコンテキストを作る。用紙・ガイド・架空例をMarkdownで配布（CC BY 4.0）
```

- Website:

```text
https://risan.jpn.org/?p=14459
```

- Topics（英小文字・数字・ハイフンのみ。スペース区切り）:

```text
portfolio chatgpt job-hunting gakuchika self-analysis career university-students education japanese markdown template ai-context github-copilot claude-code cc-by-4
```

- 保守ガイド（docs/maintenance.md）のAbout設定の記述と整合する内容。入力後の反映確認は未実施。

## 変更したファイル

- 新規: `docs/prompt/260927-05-github-about-text.md`
- 変更: なし
