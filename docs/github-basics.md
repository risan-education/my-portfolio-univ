# GitHubの準備と教材のコピー

GitHubは、Markdownファイルを保存し、変更の履歴を残すサービスです。リポジトリは保存場所、Privateは閲覧相手を制限する設定、mainは通常使うブランチ、コミットは変更を履歴に記録する操作です。本人の実記録は自分のPrivateへ保存します。

## 1. アカウントを用意する

[GitHubの登録画面](https://github.com/signup)でアカウントを作り、画面の案内に沿ってメール等の確認を済ませます。既に中高生版で使っている人は同じアカウントでログインします。卒業後も使う場合は、登録した連絡先が引き続き使えるか確認します。

## 2. 大学生版から本人用リポジトリを作る

[大学生版の配布元](https://github.com/risan-education/my-portfolio-univ)を開きます。配布元の編集権限や組織への参加は不要です。

### Use this templateが表示される場合

1. **Use this template → Create a new repository** を選びます。
2. Ownerを自分のアカウントにし、名前を決めます（例: `my-university-portfolio`）。
3. **Private** を選び、Include all branchesは選ばず作成します。
4. 作成後の所有者・URL・Private表示を確認します。READMEと `docs/` があることも確かめます。

[GitHub公式のテンプレートからの作成手順](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template)

### ボタンがない場合：ZIPから作る

1. 配布元で **Code → Download ZIP** を選び、本人専用の場所で展開します。
2. [新規リポジトリ作成](https://github.com/new)でOwner・名前・**Private**を指定して作成します。README・ライセンス等の自動追加は選ばず、空の保存先を用意します。
3. 空のリポジトリに表示される既存ファイルのアップロードへのリンクを開きます。
4. 展開フォルダの**中身**をアップロードします。外側の `my-portfolio-univ-main` フォルダをそのまま入れず、README.md、CHATGPT.md、docs/、templates/等がリポジトリの直下に来るようにします。隠しファイル・フォルダも必要なものが選択されているか確認します。
5. 一度に載せられない場合は分割します。GitHubのブラウザアップロードは2026-09-27時点で1回100ファイル、1ファイル25 MiBまでです。最初のコミット後は **Add file → Upload files** から続けます。
6. 「大学生版の教材を追加」などの説明でコミットし、README、CHATGPT.md、AGENTS.md、docs/、templates/等を開き直します。ブランチ名も確認します。

ZIPはリポジトリの一時点のファイルで、全変更履歴は含みません。[ZIPの公式案内](https://docs.github.com/en/repositories/working-with-files/using-files/downloading-source-code-archives) ／ [新規作成の公式案内](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository)

## 3. 記録ファイルを手動で追加する

本人用リポジトリの対象ブランチを開き、**Add file → Upload files** でファイルやフォルダをアップロードします。例えばルートから `experiences/` フォルダをドラッグするときは、その中に入れたい記録だけを準備し、表示されたパスと変更一覧を確認してコミットします。同名ファイルがある場合は上書きせず、先に別名を付けます。

[GitHub公式のアップロード手順](https://docs.github.com/en/repositories/working-with-files/managing-files/adding-a-file-to-a-repository)。ルール等により直接コミットできない場合は、変更用ブランチ・PRを使い、mainへの取り込みまでを区別します。GitHubの画面でコミットした内容について追加のpushは不要ですが、パソコン上だけのコミットはpushして初めてGitHubへ反映されます。

スマートフォン等でフォルダのアップロードが難しい場合は、パソコンのブラウザで行えます。ChatGPTから直接保存できるかは[環境確認](chatgpt-environment.md)で確かめます。

## コピーした後に整理する

大学生版には、学生が使う用紙・ガイドのほかに、教材を保守するためのファイルと架空例が含まれています。本人用のPrivateでは、次のものを削除して構いません。ChatGPTなどを接続したときに、架空の記録が本人の記録と混ざるのを防ぐためです。

| 削除してよいもの | 理由 |
| --- | --- |
| `examples/` 全体 | すべて架空例。本人の記録と同じ形式のため、接続したAIが実績と混同しやすい。読みたいときは[配布元](https://github.com/risan-education/my-portfolio-univ)で開く |
| `scripts/`、`.github/workflows/`、`.github/ISSUE_TEMPLATE/`、`.github/PULL_REQUEST_TEMPLATE.md` | 配布元の検査・受付用。本人用では動かす必要がない |
| `docs/maintenance.md`、`docs/acceptance.md`、`docs/my-portfolio-university-requirements.md`、`docs/sources.md`、`docs/reviews/`、`docs/prompt/`、`CHANGELOG.md`、`CONTRIBUTING.md`、`SECURITY.md` | 教材の保守記録。本人の記録や相談には使わない |

残すものは、README.md、CHATGPT.md、AGENTS.md、CLAUDE.md、`.github/copilot-instructions.md`、LICENSE、VERSION、`templates/`、`docs/` の残りのガイド、記録用の各フォルダ、`practice/`、`questions.md` です。ガイド内の架空例へのリンクは、削除後は配布元で読みます。LICENSEは教材の著作権表示として残します。

削除せずに使う場合は、ChatGPTへの依頼で `examples/` を読む資料に含めないよう明示します。各架空例の冒頭には「教材の架空例です」という注意書きがあります。

## 4. 準備が終わったら

初めての人は[ChatGPTでの練習](getting-started.md)へ、中高生版の記録がある人は[移行手順](migration.md)へ進みます。学校名や本名をリポジトリ名に入れる必要はありません。公開用の教材リポジトリへ本人の記録を送らないよう、アップロードの前に毎回所有者とPrivate表示を確認します。
