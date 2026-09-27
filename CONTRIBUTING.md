# 教材への提案・変更の送り方

このリポジトリは大学生向けポートフォリオ教材の配布元です。改善の提案は歓迎します。次の3点を守ってください。

1. **実記録・応募書類・相談本文・個人情報を送らない。** 提案は架空の再現例で説明します。Issueフォームの確認欄で同意します。
2. **架空例は架空と分かるようにする。** `examples/` の各ファイルには「架空」の表示と、記録形式の例には冒頭の注意書きが必要です。検査で確認します。
3. **本人記録用のフォルダには README.md 以外を置かない。** `experiences/`、`projects/`、`profile/`、`career/`、`derived/` 等は配布元では空のまま保ちます。検査で失敗します。

## 変更を送る前に

- PowerShell 7 で `pwsh -File scripts/check-docs.ps1` と `pwsh -File scripts/test-check-docs.ps1` を実行します。GitHub Actionsでも同じ検査が動くので、ローカルで実行できない場合はPRの結果を確認します。
- 用紙を追加・変更したら、対応するガイド・架空例・[受入確認](docs/acceptance.md)・[要件定義書](docs/my-portfolio-university-requirements.md)を同時に更新します。要件書は別の改訂版を作らず、同じファイルを更新します。
- 版を上げる場合は `VERSION`、README、[CHANGELOG](CHANGELOG.md) をそろえ、`vX.Y.Z` のタグを push するか、Actionsの「Release」ワークフローを手動実行します。CHANGELOGの該当節からGitHub Releaseが作られます。

詳しい保守手順は[保守ガイド](docs/maintenance.md)、ライセンスは[LICENSE](LICENSE)を参照してください。提案・変更はCC BY 4.0で配布される教材の一部になります。
