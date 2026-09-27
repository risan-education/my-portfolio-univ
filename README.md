# Myポートフォリオ 大学生版

**大学新卒の就職活動に向けて、ChatGPTとの対話で経験を整理し、自分の言葉でガクチカを作る教材です。**

授業、アルバイト、研究、趣味、生活の工夫を一言で伝えるところから始めます。AIが整理を手伝い、本人が確かめた記録を自分用の保存先へ残します。主目的は、本人の経験に基づくガクチカの作成です。自己分析・仕事選び・ES・面接にもつなげます。同じ記録は、卒業後もAIに自分を説明するための「外部記憶」になり、次のChatGPT相談に渡す背景情報を作れます。

版: **0.5.0** ／ [ChatGPTの登録・契約から始める](docs/getting-started.md) ／ [ChatGPTへの共通指示](CHATGPT.md)（[短縮版](CHATGPT-short.md)） ／ [依頼文を選ぶ](docs/chatgpt-prompts.md)

## 5分で始める

1. ChatGPTを開き、[共通指示の短縮版](CHATGPT-short.md)の本文を最初のメッセージ、またはプロジェクトの指示として貼り付けます。
2. 今日の一言を送ります。例: 「授業の後に疑問を友人と話して、質問がまとまりました。次は質問を先にメモしたいです。活動日は［日付／未確認］です。元メモを残して一言記録に整えてください。」
3. 返ってきた本文を確認し、本人用の非公開フォルダまたはPrivateリポジトリの `experiences/YYMMDD-class.md` などへ保存して開き直します。**チャットに文章が表示されただけでは、保存完了ではありません。**

全項目の入力や毎日の記録は不要です。ChatGPTの質問には答えられるところだけ答えます。保存先をまだ用意していなければ[登録・契約からの初期設定](docs/getting-started.md)で本人用の非公開保存先を作り、`practice/` で架空の保存練習をしてから自分の記録へ進みます。[最初から保存までの架空会話](examples/chatgpt-workflow.md)と[一言メモ用紙](templates/quick-note.md)も使えます。ChatGPTを本人用のGitHubに接続するなら[接続手順](docs/chatgpt-github.md)へ。

## 初めての人・中高生版から続ける人

| 今の状況 | ここから進めます |
| --- | --- |
| ChatGPTを初めて使う | [アカウント登録・有料契約の選び方・初期設定](docs/getting-started.md) |
| ChatGPTをGitHubに接続したい | [本人用Privateへの接続と確認](docs/chatgpt-github.md) |
| GitHub Copilotを使いたい | [学生向け無料利用・VS Codeの初期設定・記録方法](docs/copilot.md) |
| 慣れているClaude Codeを使いたい | [Claude Codeで使う場合](docs/claude-code.md) |
| GitHubの保存先を作りたい | [GitHub登録・大学生版を本人用Privateへコピー](docs/github-basics.md) |
| 中高生版に自分の記録がある | [データを移して大学生版で続ける手順](docs/migration.md) |

中高生版から続ける人は、既存のChatGPT・GitHubアカウントを使えます。過去の記録は本人用の保存先から、新しい本人用Privateの `legacy/teens-01/` 等へ選んでコピーします。有料プランの再契約や、公開配布元への個人データのアップロードは不要です。

GitHub Educationで認証された学生はCopilot Studentを無料で利用できます。認証・有効化と利用上限は[Copilotの開始手順](docs/copilot.md)で確認してください。

## ガクチカを作りたい人へ

| 今の状況 | 進め方 |
| --- | --- |
| テーマが決まらない | [経験から選ぶ・これからの問いを考える](docs/choosing-gakuchika-theme.md) |
| 作り方を詳しく知りたい | [意味・自己PRとの違い・構成・事実確認・面接](docs/gakuchika.md) |
| 業種ごとの例を見たい | [10業種の作り方と400字以内の架空文章](examples/gakuchika/README.md) |
| ChatGPTと自分の材料を整理したい | [テーマ選び用紙](templates/gakuchika-theme.md) → [構成・確認用紙](templates/gakuchika.md) |
| 調査の根拠を確認したい | [採用側の公式情報と中高生版の参照箇所](docs/gakuchika-sources.md) |

IT、メーカー、金融、商社、小売、コンサルティング、広告、交通インフラ、教育、医療・福祉・介護を扱います。全例が架空で、本人の実績として転用しません。実際の提出本文をAIで作る前に、応募先の年度・職種・設問・字数・対象期間・AI利用条件を確認します。

## 慣れてきたら：ChatGPTと進めること

| したいこと | 使うガイド |
| --- | --- |
| 日々の経験を残す・深める・振り返る | [記録と振り返り](docs/recording.md) |
| 経験を棚卸しし、応募の準備をする | [就活の流れ](docs/career.md) |
| 得意・苦手・好き・嫌いを整理する | [参考自己分析](docs/self-analysis.md) |
| 職場を比較し、内定後に選ぶ | [企業比較と意思決定](docs/workplace-and-offers.md) |
| 働くルールと相談先を調べる | [働く準備](docs/work-basics.md) |
| 生活費を整理し、支援者に相談する | [生活費](docs/living-budget.md) ／ [本人が選ぶ共有](docs/sharing.md) |
| AIに自分を説明する背景を作る・貼る | [AIへのコンテキスト](docs/ai.md) ／ [常設の現在版用紙](templates/ai-context-current.md) |
| 卒業後・就職後も続ける | [卒業後も続ける](docs/after-university.md) ／ [職務経験の記録用紙](templates/work-experience.md) |
| 過去の記録を引き継ぐ・利用を止める | [移行](docs/migration.md) ／ [利用停止](docs/privacy.md) ／ [復元](docs/backup-and-restore.md) |

[全ての出力用紙](templates/README.md)には、そのまま使えるChatGPTへの依頼文があります。[一連の架空例](examples/README.md)で完成形と根拠を確認できます。

## 本人用の保存先

原記録は [experiences](experiences/README.md)、[projects](projects/README.md)、[reflections](reflections/README.md)、[annual-review](annual-review/README.md)。現在の自己紹介は [profile](profile/README.md)、就活の作業場所は [career](career/README.md)、原記録から作る文章は [derived](derived/README.md)。
[questions.md](questions.md)は問い、[assets](assets/README.md)は外部原本の所在、[practice](practice/README.md)は架空の保存練習です。紹介記事のフォルダ例との対応は[記録の共通仕様](docs/portfolio-format.md#紹介記事のフォルダ例との対応)にあります。

このリポジトリは教材の配布元です。本人の実記録は本人用の非公開リポジトリまたは非公開フォルダへ置き、ChatGPTには今回使う範囲を渡します。本人用にコピーした直後は、[教材専用のファイルを整理](docs/github-basics.md#コピーした後に整理する)して、架空例が本人の記録と混ざらないようにします。共有プロジェクトへ個人的な記録を入れる前に共有相手を確認します。

## この教材の前提

標準の案内はChatGPTです。GitHub Copilotも選べ、慣れている人はClaude Codeでも利用できます。用紙の「ChatGPTへの依頼」は、各ツールへ渡す依頼文としても使えます。モデル・プラン・連携機能を固定せず、利用中の画面で使える方法を選びます。GitHub連携や直接保存が使えなくても、ChatGPTの出力をコピーして保存する経路で進められます。記録形式は持ち出せるUTF-8 Markdownです。

Copyright © 2026 adash333

教材の配布元: risan-education

オリジナル部分は **[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/deed.ja)**。本人の文章・写真・作品には自動適用しません。第三者資料は元の条件に従います。[LICENSE](LICENSE)
