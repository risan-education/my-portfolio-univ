# 初版の実装・受入確認

対象版: 0.1.0 ／ 確認日: 2026-09-27

[要件定義書0.7](my-portfolio-university-requirements.md)は提供された原文のまま保存しています。「実装は範囲外」「現在は要件定義」は当時の工程の記述で、今回のリポジトリ作成依頼とは区別しました。今回は日本語Markdownの用紙・ガイド・架空例を実装しています。

未決事項は初版案を採用しました。独自アプリ、質問紙の採点、税・社会保険の自動計算、自動応募・通知、保護者への自動報告、特定AIサービスとの接続実装は含めません。手動とファイル受け渡しで使えます。

## 要件との対応

「内容確認」は用紙・手順・指定した架空例の確認です。実在の学生の操作テストや個別の法的判断を意味しません。「自動検査」はscripts/check-docs.ps1の範囲です。

| ID | 実装と確認する証拠 | 確認方法 |
| --- | --- | --- |
| A-01 | [初期設定](getting-started.md)、[一言メモ](../templates/quick-note.md)、[保存例](../examples/journey/experiences/240415-class.md) | 保存ファイル再読込・内容確認 |
| A-02 | [授業・アルバイト・制作の一連の例](../examples/README.md) | 共通の日付欄・役割・結果、数値未測定を内容確認 |
| A-03 | [棚卸し](../examples/journey/derived/inventory.md)から自己分析・接点・ES・面接へのリンク | 内容確認・リンク検査 |
| A-04 | [A社](../examples/journey/derived/application-a-v1.md)と[B社](../examples/journey/derived/application-b-v1.md) | 期間・役割・1枚・同僚2人を検査。創作成果なしを内容確認 |
| A-05 | [応募管理](../examples/journey/career/applications.md)、[提出控え](../examples/journey/derived/application-a-submitted.md)、[改善v2](../examples/journey/derived/application-a-v2.md) | 提出控えSHA-256・別版の内容を確認 |
| A-06 | [就活相談](../examples/journey/derived/ai-career.md)と[学習相談](../examples/journey/derived/ai-study.md) | 同じ原記録へのリンクと単体の背景を内容確認 |
| A-07 | [AIガイド](ai.md)、[日付不明の回想](../examples/journey/experiences/date-unknown-hobby.md) | 未読・古い希望・時期未確認の扱いを確認 |
| A-08 | [利用停止例](../examples/usage-stop.md)、[共有例](../examples/journey/derived/supporter.md) | 無関係な記録を持ち出さず停止参照を見直す手順を確認 |
| A-09 | [架空移行](../examples/migration/README.md) | 日付なし、保留、代筆・観察、入れ子、README、相対リンクの4ファイル一致検査 |
| A-10 | [用紙一覧](../templates/README.md)、[保守](maintenance.md) | ローカルリンク・架空表示・UTF-8を検査。秘密情報なしを内容確認 |
| A-11 | [自己分析レポート](../examples/journey/derived/self-analysis.md) | 得意・苦手・好き・嫌い、得意だが負担の例を内容確認 |
| A-12 | 同レポートのBig Five表 | 5特性、場面差、材料不足、無採点を内容確認 |
| A-13 | 同レポートの否定・保留と[現在版](../examples/journey/career/self-analysis.md) | 本人の選択と非自動転記を内容確認 |
| A-14 | [職場比較](../examples/journey/career/comparison.md)と[架空出典](../examples/journey/career/sources.md) | 法人・職種・年度・集計対象差・未確認・認定の限界を確認 |
| A-15 | [給与・固定残業代・退職の例](../examples/work-basics.md) | 公的資料の入口を実際に確認。適用条件と確認日を記載 |
| A-16 | [内定後の判断](../examples/journey/career/offer.md) | 書面との相違と保留する理由を確認 |
| A-17 | [生活費の2条件](../examples/journey/career/budget.md) | 既知支出85,000円／142,000円、暫定残額105,000円／48,000円を再計算。未確認と一時費用を分離 |
| A-18 | [相談準備](../examples/consultation-preparation.md)、[相談先](../examples/support-contacts.md) | 時系列・公式窓口の対象と連絡方法を確認。送信なし |
| A-19 | [支援者への1枚](../examples/journey/derived/supporter.md) | 選んだ5点のみ。性格推測・苦手一覧・原記録の添付なし |
| A-20 | [共通仕様](portfolio-format.md)、[同日2件目](../examples/journey/experiences/240415-class-02.md)、[日付不明](../examples/journey/experiences/date-unknown-hobby.md) | UTF-8・実在日付・命名検査、YAML・ID・索引不要を確認 |
| A-21 | [移行対応表](../examples/migration/migration-note.md) | 元リポジトリ・版・パス・通常参照側・同一活動の扱いを確認 |
| A-22 | [編集指示](../AGENTS.md)、[移行](migration.md)、[索引](record-index.md) | 旧指示・設定の除外と教材・管理メモを実績にしないルールを確認 |
| A-23 | [現在の自己紹介](../examples/journey/profile/current.md) | 確認日・相談範囲・経緯・根拠・見直し日を確認 |
| A-24 | [停止例](../examples/usage-stop.md)、[復元手順](backup-and-restore.md) | 最新停止情報の別保管・復元前照合・不明時の保留を確認 |
| A-25 | [外部所在](../examples/journey/assets/250620-guide.md)、[高校経験の別設問](../examples/journey/derived/application-legacy.md)、[面接原記録](../examples/journey/experiences/260925-interview.md) | 権限・控え・対象期間・条件・提出と面接の分離を確認 |
| A-26 | [README](../README.md)、[LICENSE](../LICENSE)、[適用メモ](my-portfolio-license-adoption.md) | 表示一致を検査。他リポジトリの変更を完了扱いにしない |

## 検証の範囲と限界

PowerShell 7で配布検査を実行し、117件のMarkdown、313件の内部リンク、9件の新規活動記録、4件の移行コピーの一致を確認しました。提出控え・要件書の固定ハッシュ、応募字数・共通事実、ライセンス表示も検査しています。

検査ツール自身について、正常な教材、不正リンク、不正アンカー、存在しない日付、移行コピーの変更、提出控えの変更、応募間の事実の変更、不正UTF-8、変更を戻した教材の9通りを一時コピーで実行し、期待どおり成功・失敗することを確認しました。GitHub Actionsの実行結果はこのローカル確認とは別です。

原文のSHA-256は検査スクリプトに固定し、入力ファイルとの一致を確認しています。中高生版の共通仕様・移行・索引は本文を照合しましたが、実際のPrivate間の移行やGit履歴の持ち出しは実施していません。[参照元と確認範囲](sources.md)

検査はファイルを書き換えません。外部ページの全リンク到達性、未知の個人情報、法令の全条項、AIサービス固有の動作を保証しません。個別の提出・共有・移行では、本人が選んだ範囲と現行の条件を改めて確認します。
