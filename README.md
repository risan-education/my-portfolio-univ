# Myポートフォリオ 大学生版

大学1年から経験と考察を残し、自己分析・仕事選び・ES・面接へつなげる、Markdownの教材です。授業、アルバイト、研究、趣味、生活の工夫から始められます。

**第一目的は就活対策。** 同じ記録から、第二目的としてAIへの相談用コンテキストも作れます。AI、有料契約、Gitの知識は必須ではありません。

版: **0.1.0** ／ [変更履歴](CHANGELOG.md) ／ [用紙一覧](templates/README.md) ／ [架空例を順に読む](examples/README.md)

## まず一言、残してみる

1. [初期設定](docs/getting-started.md)を読み、自分だけが使える保存先を用意します。配布元へ実記録を投稿しないでください。
2. [一言メモ](templates/quick-note.md)をコピーし、例えば `experiences/260927-class.md` として保存します。同名があれば `-02` を付けます。
3. 「授業で分からない点を質問した。次は質問を先にメモする」のように一言だけ書き、保存したファイルをもう一度開きます。分からない日付は「未確認」で構いません。

全項目、最低文字数、毎日の記録は不要です。後から思い出して書くこともできます。詳しく残したくなったら[活動記録](templates/experience.md)へ。

## 必要なところから使う

| やりたいこと | 入口 |
| --- | --- |
| 日々の経験を残す・深める | [記録と振り返り](docs/recording.md) |
| 経験を就活に使う | [棚卸し → 自己分析 → 企業研究 → ES → 面接](docs/career.md) |
| 得意・苦手・好き・嫌いを整理する | [参考自己分析](docs/self-analysis.md) |
| 職場を比較し、内定後に選ぶ | [企業比較と意思決定](docs/workplace-and-offers.md) |
| 働くルールや相談先を調べる | [働く準備](docs/work-basics.md) |
| 暮らしを見積もる・家族に相談する | [生活費](docs/living-budget.md) ／ [本人が選ぶ共有](docs/sharing.md) |
| 記録をAIへの相談に再利用する | [AI活用と依頼例](docs/ai.md) |
| 中高生版から持ち込む | [移行ガイド](docs/migration.md) |
| 保存・利用停止・卒業後を考える | [バックアップ](docs/backup-and-restore.md) ／ [利用停止](docs/privacy.md) ／ [卒業後](docs/after-university.md) |

## 保存場所

原記録は [experiences](experiences/README.md)、[projects](projects/README.md)、[reflections](reflections/README.md)、[annual-review](annual-review/README.md)。
現在の自己紹介は [profile](profile/README.md)、就活の作業場所は [career](career/README.md)、原記録から作る文章は [derived](derived/README.md) です。
[questions.md](questions.md) は問いの入口、[assets](assets/README.md) は外部資料の所在です。

本人用は非公開を基本とし、見せたい文書だけを選びます。AIに渡さない情報は接続対象の外に保管します。架空例は本人の経験に混ぜません。

## 配布・保守

[要件定義書（原文）](docs/my-portfolio-university-requirements.md)に基づく初版です。要件定義時の状態と今回の実装状況は[実装・受入確認](docs/acceptance.md)で区別しています。
[共通形式](docs/portfolio-format.md)を採用し、旧記録の書き換えを要求しません。

教材の改善は歓迎します。Issue・PRへ本人の実記録、応募書類、相談本文を送らず、架空の再現例を使ってください。
保守用の検査は PowerShell 7 で `pwsh -File scripts/check-docs.ps1`。詳細は[保守ガイド](docs/maintenance.md)。

Copyright © 2026 adash333

教材の配布元: risan-education

権利を保有するオリジナル部分は **[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/deed.ja)**。利用者が追加する文章・写真・作品には自動適用されません。第三者資料はそれぞれの条件に従います。[ライセンス](LICENSE)
