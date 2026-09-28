# 実装・受入確認

対象版: 0.6.4 ／ 確認日: 2026-09-28

[要件定義書](my-portfolio-university-requirements.md)を現行仕様として直接更新します。日本語Markdownの用紙・ガイド・架空例をChatGPT・GitHub Copilotで使い、慣れている人向けにClaude Codeも案内します。過去の要件はGit履歴に残し、別の改訂要件書は廃止しました。

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
| CG-06 | 提出控え・移行fixture、配布検査 | 提出控えの固定ハッシュ、同一コピー、字数・事実整合の検査を継続。要件書は0.3.0から直接更新 |

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

## Copilot・Claude Codeと要件の統合（0.3.0）

| ID | 実装・証拠 | 確認方法 |
| --- | --- | --- |
| TOOL-01 | [Copilotの開始手順](copilot.md) | 学生認証・有効化、無料の利用枠、本人用保存先、VS Codeへの同一アカウントのログインを内容確認 |
| TOOL-02 | [Copilot用の指示](../.github/copilot-instructions.md)、[架空例](../examples/copilot-workflow.md) | AGENTS.mdの参照と、本文案・保存・追記・コミット・push・再読込の区別を内容確認。必須ファイル・リンクを検査 |
| TOOL-03 | [Claude Codeの案内](claude-code.md) | 公式導入先、別契約、現行指示、許可範囲、保存を内容確認 |
| REQ-01 | [現行要件](my-portfolio-university-requirements.md)、[保守](maintenance.md) | 一時コピーで要件の追記を許容し、要件書の欠落を検出する。提出控えの固定検査も継続 |

学生認証・特典有効化・VS Code・Claude Codeでの実操作は未検証です。架空例は実行ログではありません。

0.3.0のローカル検査では127件のMarkdown、561件の内部リンク、27種類の用紙、9件の活動記録、4件の同一移行コピーを確認しました。検査ツールの13シナリオが通過し、要件書の更新が許容されること・要件書の欠落が検出されることも確認しました。

## ガクチカのテーマ選び・業種別教材（0.4.0）

| ID | 実装・証拠 | 確認方法 |
| --- | --- | --- |
| GAK-01 | [README](../README.md)、[基本ガイド](gakuchika.md) | 主目的、自己PR等との違い、材料整理から面接・保存までの導線を内容確認 |
| GAK-02 | [テーマの決め方](choosing-gakuchika-theme.md)、[用紙](../templates/gakuchika-theme.md) | 過去の経験と未実施計画、本人の選択、根拠・回想・保留を内容確認 |
| GAK-03 | [10業種の例](../examples/gakuchika/README.md) | 各例の想定職種、作り方、材料F1〜F4と本文、面接質問を内容確認。指定10本文の400字上限と表示を自動検査 |
| GAK-04 | [調査資料](gakuchika-sources.md) | 採用側の公開情報、教材の解釈、中高生版6ページの参照版・改変内容・ライセンスを内容確認 |
| GAK-05 | [構成・確認用紙](../templates/gakuchika.md)、各例の応募条件 | 実応募のAI条件、主張と材料、本人確認、保存待ち・提出済みの区別を内容確認 |
| GAK-06 | scripts/check-docs.ps1、scripts/test-check-docs.ps1 | 一時コピーで字数超過、表示字数の不一致、指定した業種例の欠落を検出する回帰検査 |

ローカルのPowerShell 7で143件のMarkdown、29種類の用紙、10件の業種別文章、9件の新規活動記録、4件の同一移行コピーを検査しました。検査ツールの16シナリオが通過しました。10件の文章は300〜313字で、各ページの表示と一致しています。既存の提出控えと移行fixtureは保持しています。

公式資料の読解と架空の教材の検査までを確認したものです。実在の学生の応募、選考通過、面接官による評価、実応募先のAI利用条件は検証していません。400字は教材の仮の指定で、業種共通の応募条件ではありません。


## 企業別ガクチカ例（0.6.0〜0.6.4）

| ID | 実装・証拠 | 確認方法 |
| --- | --- | --- |
| GAK-07 | [企業別の例](../examples/gakuchika/companies/README.md)、[トヨタ自動車の例](../examples/gakuchika/companies/01-toyota.md)ほか17例（企業分析#2〜#18）、[調査資料](gakuchika-sources.md)、scripts/check-docs.ps1、scripts/check_docs.py、scripts/test-check-docs.ps1 | 番号がブログ記事と一致すること、公式情報の直リンク・確認日、Big Fiveの読み替えが点数化でないこと、面接質問を内容確認。`companies/` の全例（README以外）の400字上限と字数表示を自動検査し、一時コピーで超過を検出する回帰検査 |

Python版の検査で184件のMarkdown、10件の業種別文章、18件の企業別文章を確認しました。花王・東京電力・ANA・東京海上日動・味の素の募集要項は2026-09-28に公式ページで確認し、積水ハウスの採用サイトは作成環境から本文を取得できずブログ記事の記載に依ります。第13〜18回のブログ記事は2026-09-28時点で公開前の下書きです。トヨタ自動車・ニトリ・キーエンス・サカタのタネ・任天堂・オリエンタルランドの募集要項、JR東日本の総合職ページ、三菱商事の選考プロセス・FAQ、リクルートの新卒採用サイト・FAQ、BCGの新卒採用ページ、三菱UFJ銀行のQ&A・職種紹介は2026-09-27に公式ページで確認しました。三菱UFJ銀行の初任給は募集要項がマイページ内のためブログ記事の記載に依ります。三菱商事の募集要項とGoogleの採用プロセスのページは本文を取得できず、BCGの5資質・リクルートの4つのスタンス・任天堂DNAは該当ページの本文を今回取得できなかったため、これらの項目はブログ記事の記載に依ります。PowerShell版の検査と回帰検査は、このセッションではpwshが使えず未実行で、GitHub Actionsでの通過を確認します。実在の応募・選考通過・同社のAI利用条件は検証していません。

## 配布元の安全策と版の管理（0.4.1）

| ID | 実装・証拠 | 確認方法 |
| --- | --- | --- |
| DIST-01 | scripts/check-docs.ps1 の本人記録用フォルダ検査 | 一時コピーの experiences/ に架空のファイルを置き、検査が失敗することを回帰検査で確認 |
| DIST-02 | `examples/journey/` 各ファイル冒頭の注意書き | 注意書きを除いた一時コピーで検査が失敗することを回帰検査で確認。凍結した提出控えは除外 |
| DIST-03 | [コピー後の整理](github-basics.md#コピーした後に整理する)、[README](../README.md) | 削除してよいファイルと残すファイル、削除しない場合の依頼方法を内容確認 |
| DIST-04 | [CONTRIBUTING](../CONTRIBUTING.md)、[SECURITY](../SECURITY.md)、Issueフォーム、PRテンプレート | 実記録を送らない確認欄と、個人情報を見つけたときの連絡方法を内容確認 |
| DIST-05 | `.github/workflows/release.yml`、タグ `v0.4.0`・`v0.4.1` | タグpushまたは手動実行でタグとReleaseが作られることをActionsの結果で確認。0.4.1ではセッションの認証がタグpushを許可しなかったため手動実行で作成 |
| DIST-06 | [CLAUDE.md](../CLAUDE.md)、[practice/README.md](../practice/README.md)、[Claude Code案内](claude-code.md)、[開始手順](getting-started.md) | 同梱済みの案内へ更新。必須ファイルとして検査 |
| DIST-07 | [評価記録](reviews/260927-repository-review.md)、`docs/prompt/`、`.claude/skills/save-prompt/` | 開発記録の置き場所と、実績・案内から除外する扱いを[保守ガイド](maintenance.md)で確認 |

教材とテンプレートを別リポジトリへ分ける案（評価記録のH-1）は、2026-09-27に配布元の判断で採用しないことになりました。DIST-01〜03で架空例の混入を防ぎます。

ローカルのPowerShell 7.4.6で148件のMarkdown、738件の内部リンク、29種類の用紙、10件の業種別文章、9件の新規活動記録、4件の同一移行コピー、29件の架空記録の注意書きを検査しました。検査ツールの18シナリオ（誤混入ファイルの検出と注意書きの欠落を含む）が通過しました。

## 導線・接続手順・AIコンテキストの拡充（0.5.0）

| ID | 実装・証拠 | 確認方法 |
| --- | --- | --- |
| MID-01 | [README](../README.md)「5分で始める」 | 3手順で最初の1件に到達し、就活・比較・法令は後段に置いたことを内容確認。第二目的を冒頭で明示 |
| MID-02 | [共通指示の短縮版](../CHATGPT-short.md)、[開始手順](getting-started.md)、[環境確認](chatgpt-environment.md) | 全文と短縮版の使い分け、全文を資料として渡す経路を内容確認。文字数上限は環境依存のため未検証 |
| MID-03 | [ChatGPTとGitHubの接続手順](chatgpt-github.md) | 公式案内の記載範囲と未記載、読取・書込・再読込の区別、配布元へ接続しない、examples/ を読ませない、Codexの扱いを内容確認。実アカウントでの接続は未検証 |
| MID-04 | [記録の共通仕様](portfolio-format.md#紹介記事のフォルダ例との対応) | 記事の6フォルダと大学生版の対応を内容確認 |
| MID-05 | [保守ガイド](maintenance.md)のAbout設定、`.gitattributes` | 説明・Website・Topicsの例と、PowerShellを言語表示から除く設定を確認。About欄の入力は保守者の手動操作 |
| CTX-01 | [常設コンテキスト用紙](../templates/ai-context-current.md)、[架空例](../examples/journey/derived/ai-current.md) | 1,500字以内、本人確認日・見直し日・貼り付け先と版、採用した候補だけ、根拠リンクを内容確認 |
| CTX-02 | [AIへのコンテキスト](ai.md) | 貼り付け先ごとの渡し方、記憶機能を原記録の代わりにしない、見直しの周期を内容確認 |
| CTX-03 | [職務経験の記録用紙](../templates/work-experience.md)、[卒業後の架空例](../examples/after-university/date-unknown-work.md)、[卒業後も続ける](after-university.md) | AIに渡してよい範囲の確認欄、機密の除外、部署の成果と本人の貢献の区別、職務経歴書・事業計画書を対象外とする記述を内容確認 |
| CTX-04 | [README](../README.md)冒頭 | 卒業後の外部記憶としての位置づけを1文で明示 |

ローカルのPowerShell 7.4.6で配布検査と回帰検査（18シナリオ）を実行しました。新しい用紙2種類は依頼文と記録本文の境界検査、新しい架空例2件は注意書き検査の対象です。

## 保守性の改善（0.5.1）

| ID | 実装・証拠 | 確認方法 |
| --- | --- | --- |
| LOW-01 | [要件定義書](my-portfolio-university-requirements.md)の目次 | 全見出しへのアンカーが検査のスラッグ規則と一致し、リンク検査を通過 |
| LOW-02 | `scripts/check_docs.py`、`.github/workflows/docs.yml` | PowerShell版と同じPASS行を出力することをローカルで比較。CIで両方を実行 |
| LOW-03 | [LICENSE](../LICENSE)、[NOTICE.md](../NOTICE.md)、[適用メモ](my-portfolio-license-adoption.md) | LICENSEが公式のCC BY 4.0法的条項（英語原文）と一致することを固定ハッシュで検査。表示と適用範囲はNOTICE.mdで確認 |
| LOW-04 | [参照資料](sources.md)の3版横断メモ | 小学生版・中高生版・大学生版の参照関係と確認日、未確認事項を記載 |
| LOW-05 | [要件定義書](my-portfolio-university-requirements.md)§7、[評価記録](reviews/260927-repository-review.md) | 別リポジトリ化を採用しない決定と理由を記録 |

## 検証の範囲と限界

0.1.0時点ではPowerShell 7で配布検査を実行し、117件のMarkdown、313件の内部リンク、9件の新規活動記録、4件の移行コピーの一致を確認しました。提出控え・要件書の固定ハッシュ、応募字数・共通事実、ライセンス表示も検査しています。

0.1.0の検査ツール自身について、正常な教材、不正リンク、不正アンカー、存在しない日付、移行コピーの変更、提出控えの変更、応募間の事実の変更、不正UTF-8、変更を戻した教材の9通りを一時コピーで実行し、期待どおり成功・失敗することを確認しました。GitHub Actionsの実行結果はこのローカル確認とは別です。

0.3.0から要件定義書の固定ハッシュ検査を廃止し、要件書を更新できることと必須ファイルの存在を検査します。提出済み例の固定ハッシュと移行コピーの同一性は継続します。中高生版の共通仕様・移行・索引は本文を照合しましたが、実際のPrivate間の移行やGit履歴の持ち出しは実施していません。[参照元と確認範囲](sources.md)

検査はファイルを書き換えません。外部ページの全リンク到達性、未知の個人情報、法令の全条項、AIサービス固有の動作を保証しません。個別の提出・共有・移行では、本人が選んだ範囲と現行の条件を改めて確認します。
