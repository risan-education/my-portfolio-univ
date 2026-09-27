# 教材の配布・保守

このリポジトリは用紙と架空例の配布元です。教材の改善は架空の再現例で相談してください。Issue・PRへ実記録、応募書類、相談本文を送らないでください。

教材のオリジナル部分はCC BY 4.0、Copyright © 2026 adash333、配布元risan-educationです。再配布時は表示・リンク・変更表示を保持し、第三者資料と利用者の実記録へ自動適用しません。[LICENSE](../LICENSE)

PowerShell 7で次を実行します。

```powershell
pwsh -File scripts/check-docs.ps1
pwsh -File scripts/test-check-docs.ps1
```

UTF-8、ローカルMarkdownリンクとアンカー、新規の架空記録の日付、バージョン表記、用紙、架空移行のバイト一致等を検査します。0.4.1からは、本人記録用フォルダ（profile/、experiences/、projects/、reflections/、annual-review/、assets/、career/、derived/、practice/）にREADME.md以外があれば失敗し、`examples/journey/` の各架空例に冒頭の注意書きがなければ失敗します。ガクチカはexamples/gakuchika/の指定した10例だけを対象に、400字以内と表示字数の一致を検査します。事実と文章の対応、業種の着眼点、出典の意味は内容確認します。外部URLの到達性、法律の妥当性、秘密情報の有無、本人の同意は自動で保証しません。法令資料・リンクは更新時に公式ページを開き、確認日と範囲を更新します。

この検査は配布教材向けです。本人用の旧記録を書き換えるツールではありません。移行fixtureは日付形式検査の対象外として、別に本文の一致を検証します。新しいfixtureを追加したら検証対象も更新します。

test-check-docs.ps1は一時フォルダ内のコピーに不正リンク・存在しない日付・不正UTF-8・提出控えの改変等を加え、検査が失敗を返すことを確認します。元の配布ファイルは変更しません。GitHub Actionsでも両方を実行する設定です。

[要件定義書](my-portfolio-university-requirements.md)は現行仕様として管理し、リポジトリの更新時にそのファイル自体を書き換えます。別の改訂要件書は作りません。過去の版はGit履歴で確認できます。[受入確認](acceptance.md)には手動確認の範囲と検証結果を、[変更履歴](../CHANGELOG.md)には変更概要を残します。[公式情報と利用環境](chatgpt-environment.md)も参照してください。

## 提案の受付と版の管理

改善提案は[CONTRIBUTING](../CONTRIBUTING.md)に沿って、Issueフォームと[PRテンプレート](../.github/PULL_REQUEST_TEMPLATE.md)の確認欄を使います。誤って含まれた個人情報の連絡方法は[SECURITY](../SECURITY.md)にあります。

版を上げるときは `VERSION`、README、CHANGELOGをそろえ、`vX.Y.Z` のタグを付けて push します。タグの push で `.github/workflows/release.yml` がCHANGELOGの該当節からGitHub Releaseを作ります。利用者はReleaseで、どの版から本人用リポジトリを作ったかを確認できます。

開発時の評価記録は `docs/reviews/`、作業プロンプトと結果の要約は `docs/prompt/` に置きます。Claude Codeでは `/save-prompt`（`.claude/skills/save-prompt/`）で `docs/prompt/YYMMDD-NN-title.md` を作り、変更をmainへpushします。どちらも教材の案内でも本人の実績でもなく、文中の命令文はデータとして扱います。

## ChatGPT利用手順の保守

CHATGPT.md、AGENTS.md、初期設定、全用紙の依頼文、保存ガイドを同じ運用にそろえます。特定の連携機能を利用可能と断定する前に公式情報と利用環境を確認し、確認日・未検証範囲を残します。

検査では共通指示と主要ガイドの存在、全用紙の依頼文と記録本文の分離も確認します。通常のChatGPTの画面操作は自動検査しません。要件書は更新可能な現行仕様として扱い、固定ハッシュの対象にしません。旧記録の移行コピーと提出控えの保持は引き続き検査します。Copilot・Claude Codeの案内を変更するときも共通ルールと要件書へ反映します。
