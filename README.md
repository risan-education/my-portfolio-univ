# Myポートフォリオ 大学生版

**ChatGPTとの対話で大学生活を記録し、自己分析・仕事選び・ES・面接につなげる教材です。**

授業、アルバイト、研究、趣味、生活の工夫を一言で伝えるところから始めます。ChatGPTが整理を手伝い、本人が確かめた記録を自分用の保存先へ残します。第一目的は就活対策。同じ記録から、次のChatGPT相談で使う背景情報も作れます。

版: **0.2.0** ／ [初期設定](docs/getting-started.md) ／ [ChatGPTへの共通指示](CHATGPT.md) ／ [依頼文を選ぶ](docs/chatgpt-prompts.md)

## 最初の1件をChatGPTと作る

1. [初期設定](docs/getting-started.md)でChatGPTと本人用の非公開保存先を用意します。
2. [CHATGPT.md](CHATGPT.md)の本文を最初のメッセージ、または利用するプロジェクトの指示として渡します。
3. 次の依頼と[一言メモ用紙](templates/quick-note.md)を渡します。ファイルを添付できなければ本文を貼り付けます。

> 今日のことを一言で残したいです。授業の後に疑問を友人と話して、質問がまとまりました。次は質問を先にメモしたいです。活動日は［日付／未確認］です。元メモを残して一言記録に整えてください。不足する日付は未確認のまま、保存予定のファイル名とMarkdown本文を見せてください。

内容を確認したら、[保存の手順](docs/saving.md)で `experiences/YYMMDD-class.md` などに保存し、開き直します。**チャットに文章が表示されただけでは、本人用リポジトリへの保存完了ではありません。**

全項目の入力や毎日の記録は不要です。ChatGPTの質問には答えられるところだけ答えます。[最初から保存までの架空会話](examples/chatgpt-workflow.md)を試せます。

## ChatGPTと進めること

| したいこと | 使うガイド |
| --- | --- |
| 日々の経験を残す・深める・振り返る | [記録と振り返り](docs/recording.md) |
| 経験を棚卸しし、応募の準備をする | [就活の流れ](docs/career.md) |
| 得意・苦手・好き・嫌いを整理する | [参考自己分析](docs/self-analysis.md) |
| 職場を比較し、内定後に選ぶ | [企業比較と意思決定](docs/workplace-and-offers.md) |
| 働くルールと相談先を調べる | [働く準備](docs/work-basics.md) |
| 生活費を整理し、支援者に相談する | [生活費](docs/living-budget.md) ／ [本人が選ぶ共有](docs/sharing.md) |
| 新しいチャットへ相談の背景を渡す | [ChatGPTへのコンテキスト](docs/ai.md) |
| 過去の記録を引き継ぐ・利用を止める | [移行](docs/migration.md) ／ [利用停止](docs/privacy.md) ／ [復元](docs/backup-and-restore.md) |

[全ての出力用紙](templates/README.md)には、そのまま使えるChatGPTへの依頼文があります。[一連の架空例](examples/README.md)で完成形と根拠を確認できます。

## 本人用の保存先

原記録は [experiences](experiences/README.md)、[projects](projects/README.md)、[reflections](reflections/README.md)、[annual-review](annual-review/README.md)。現在の自己紹介は [profile](profile/README.md)、就活の作業場所は [career](career/README.md)、原記録から作る文章は [derived](derived/README.md)。
[questions.md](questions.md)は問い、[assets](assets/README.md)は外部原本の所在です。

このリポジトリは教材の配布元です。本人の実記録は本人用の非公開リポジトリまたは非公開フォルダへ置き、ChatGPTには今回使う範囲を渡します。共有プロジェクトへ個人的な記録を入れる前に共有相手を確認します。

## この教材の前提

ChatGPTを利用する前提です。モデル・プラン・連携機能を固定せず、利用中の画面で使える方法を選びます。GitHub連携や直接保存が使えなくても、ChatGPTの出力をコピーして保存する経路で進められます。記録形式は持ち出せるUTF-8 Markdownです。

[当初の要件定義書](docs/my-portfolio-university-requirements.md)は原文として保管し、今回の方針を[ChatGPT利用前提の改訂要件](docs/chatgpt-requirements.md)へ記載しています。[受入確認](docs/acceptance.md) ／ [変更履歴](CHANGELOG.md) ／ [公式情報と利用環境](docs/chatgpt-environment.md)

教材の改善は架空の再現例で相談してください。Issue・PRへ実記録、応募書類、相談本文を送らないでください。[保守ガイド](docs/maintenance.md)

Copyright © 2026 adash333

教材の配布元: risan-education

オリジナル部分は **[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/deed.ja)**。本人の文章・写真・作品には自動適用しません。第三者資料は元の条件に従います。[LICENSE](LICENSE)
