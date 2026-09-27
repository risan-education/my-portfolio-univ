# 実装・受入確認

対象版: 0.2.1 ／ 確認日: 2026-09-27

[要件定義書0.7](my-portfolio-university-requirements.md)は提供された原文のまま保存しています。「実装は範囲外」「現在は要件定義」は当時の工程の記述で、今回のリポジトリ作成依頼とは区別しました。現在は[ChatGPT利用前提の改訂要件](chatgpt-requirements.md)を適用し、日本語Markdownの用紙・ガイド・架空例をChatGPTとの対話で使う構成です。

独自アプリ、質問紙の採点、税・社会保険の自動計算、自動応募・通知、保護者への自動報告は含めません。ChatGPTの添付・本文貼付を基本経路にし、直接保存の手段がある場合はその権限の範囲で使う設計です。独自の連携機能は実装していません。

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
| A-10（改訂） | [用紙一覧](../templates/README.md)、[保守](maintenance.md) | ChatGPTへの依頼→本人確認→保存の導線を確認。ローカルリンク・架空表示・UTF-8を検査 |
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


## ChatGPT前提の受入確認（0.2.0）

| ID | 実装・証拠 | 確認方法 |
| --- | --- | --- |
| CG-01 | [README](../README.md)、[初期設定](getting-started.md)、[共通指示](../CHATGPT.md)、[架空会話](../examples/chatgpt-workflow.md) | 対話→本人確認→保存→再開の手順を内容確認 |
| CG-02 | [全27種類の用紙](../templates/README.md)、[依頼文一覧](chatgpt-prompts.md) | 各用紙の依頼文と出力欄の分離を検査 |
| CG-03 | [環境確認](chatgpt-environment.md)、[保存ガイド](saving.md) | 本文貼付・ファイル添付・直接保存・保存できない場合の経路を内容確認 |
| CG-04 | [共通指示](../CHATGPT.md)、[保存状況の表](saving.md)、[相談コンテキスト](ai.md) | 未読・未保存を完了としないルールを確認 |
| CG-05 | [利用範囲・利用停止](privacy.md)、[復元](backup-and-restore.md) | ChatGPTへ既に渡した添付・資料・次回の出力も見直す手順を確認 |
| CG-06 | 原文・提出控え・移行fixture、配布検査 | 固定ハッシュ、同一コピー、字数・事実整合の既存検査を継続 |

ChatGPTの実アカウントでのUI操作・プランごとの添付・GitHub書き込みは未検証です。架空会話は教材の説明例であり、実行ログや機能保証ではありません。公式情報は[参照元](sources.md)に記載しています。

0.2.0のローカル検査では、123件のMarkdown、494件の内部リンク、27種類のChatGPT用紙、9件の活動記録、4件の移行コピーを確認しました。検査ツールの11シナリオ（共通指示の欠落と用紙の依頼文・本文の境界の欠落を含む）も期待どおり成功・失敗しました。

## 登録・契約と中高生版からの継続（0.2.1）

| ID | 実装・証拠 | 確認方法 |
| --- | --- | --- |
| START-01 | [登録・契約からの開始手順](getting-started.md) | 既存ログイン／新規登録、無料／任意の有料契約、決済条件と契約後確認の流れを内容確認 |
| START-02 | [GitHub準備](github-basics.md) | テンプレートがある場合とZIPの場合、Private・所有者・ルート配置・分割アップロードを内容確認 |
| START-03 | [開始手順](getting-started.md)、[環境確認](chatgpt-environment.md) | 共通指示・権限確認・架空の新規保存と追記・再読込への導線を内容確認 |
| MOVE-01 | [移行ガイド](migration.md)、[確認用紙](../templates/migration-checklist.md) | 本人用の元／先、停止・許可範囲、手動／直接操作、内容比較、同じ保存先の続用を内容確認 |
| MOVE-02 | [架空例](../examples/migration/README.md) | 4組の相対配置とバイト一致を自動検査。例の原記録は変更しない |

登録・課金・解約画面、実アカウントでのPrivate作成・アップロード・移行は操作検証していません。公式資料の本文確認と教材の検査を区別しています。

0.2.1のローカル検査では、124件のMarkdown、523件の内部リンク、27種類のChatGPT用紙、9件の活動記録、4件の同一移行コピーを確認しました。要件書・提出控えの固定ハッシュと、検査ツールの11シナリオも通過しました。

## 検証の範囲と限界

0.1.0時点ではPowerShell 7で配布検査を実行し、117件のMarkdown、313件の内部リンク、9件の新規活動記録、4件の移行コピーの一致を確認しました。提出控え・要件書の固定ハッシュ、応募字数・共通事実、ライセンス表示も検査しています。

0.1.0の検査ツール自身について、正常な教材、不正リンク、不正アンカー、存在しない日付、移行コピーの変更、提出控えの変更、応募間の事実の変更、不正UTF-8、変更を戻した教材の9通りを一時コピーで実行し、期待どおり成功・失敗することを確認しました。GitHub Actionsの実行結果はこのローカル確認とは別です。

原文のSHA-256は検査スクリプトに固定し、入力ファイルとの一致を確認しています。中高生版の共通仕様・移行・索引は本文を照合しましたが、実際のPrivate間の移行やGit履歴の持ち出しは実施していません。[参照元と確認範囲](sources.md)

検査はファイルを書き換えません。外部ページの全リンク到達性、未知の個人情報、法令の全条項、AIサービス固有の動作を保証しません。個別の提出・共有・移行では、本人が選んだ範囲と現行の条件を改めて確認します。
