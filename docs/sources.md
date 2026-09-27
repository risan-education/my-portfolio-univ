# 参照資料と確認範囲

確認日: 2026-09-27。外部本文は配布物に転載していません。リンク先には各サイトの条件が適用されます。

| 資料 | 確認・採用した範囲 |
| --- | --- |
| [現行の要件定義書](my-portfolio-university-requirements.md) | 提供された0.7を起点に、合意した仕様変更を同じファイルへ反映。過去の版はGit履歴、検証結果はacceptance.mdで管理 |
| [中高生版・共通仕様1.0](https://github.com/risan-education/my-portfolio-teens/blob/main/docs/portfolio-format.md) | GitHub接続経由で本文確認。新規形式、旧記録保持、コピー対応、指示分離を採用 |
| [中高生版・大学版への移行](https://github.com/risan-education/my-portfolio-teens/blob/main/docs/migration-to-univ.md) | 本文確認。legacy/teens-01/で相対配置を保持、衝突時にまとまりを変更する方式 |
| [中高生版・索引](https://github.com/risan-education/my-portfolio-teens/blob/main/docs/record-index.md) | 本文確認。任意、許可範囲、実績からの除外、停止の反映 |
| [厚生労働省・職場情報提供制度](https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000122234.html) | 職場研究の公的入口 |
| [厚生労働省・職場情報と認定の案内](https://www.mhlw.go.jp/roudou-navi/company/04.html) | 調査先の案内 |
| [知って役立つ労働法](https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/koyou_roudou/roudouzenpan/roudouhou/index.html) | 学生・若者向け教材の入口。個別PDFの全項目・改正履歴の検証はしていない |
| [労働条件の明示](https://www.check-roudou.mhlw.go.jp/study/roudousya_roudoujouken.html) | 求人・採用時の確認方法、契約類型による追加事項 |
| [総合労働相談コーナー](https://www.mhlw.go.jp/general/seido/chihou/kaiketu/soudan.html) | 学生・就活生も対象、面談・電話、地域別の連絡先案内 |
| [IPIP得点解釈](https://ipip.ori.org/InterpretingIndividualIPIPScaleScores.htm) | 比較集団による得点解釈。AI推測の妥当性の根拠にはしない |
| [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/deed.ja) | ライセンスの概要・正式条項への案内 |

0.1.0作成時は上記3資料をmainで取得し、返された最終更新時刻は2026-09-26T23:06:08Zでした。0.2.1では下記の開始・移行資料を追加確認しました。固定コミットの照合は未実施です。将来の変更は再確認してください。

小学生版・参考記事等の初期調査は提供された0.7時点の調査を起点にしています。今回それら全体を再検証したわけではありません。
別添の「3版共通のライセンス適用メモ」は未提供で、中高生版の同名URLでも取得できませんでした。[このリポジトリの適用メモ](my-portfolio-license-adoption.md)を別途作成し、他の2リポジトリは変更していません。

## ChatGPT利用手順の参照元（0.2.0）

2026-09-27に公式本文を確認しました。利用手順の設計は本教材独自のものです。実際のプラン・権限・機能は各利用環境で確認します。

| 公式資料 | 確認した範囲 |
| --- | --- |
| [Use ChatGPT](https://learn.chatgpt.com/docs/use-chatgpt) | 目的・資料を渡して対話し、結果を確認する使い方 |
| [Projects and chats](https://learn.chatgpt.com/docs/projects) | プロジェクトの指示・資料と、ローカルフォルダへのアクセスの区別 |
| [Work with files](https://learn.chatgpt.com/docs/artifacts-viewer) | ファイルを使った作成・確認。教材では本人用保存先への反映を別に確認する |
| [Plugins](https://learn.chatgpt.com/docs/plugins) | 外部サービスの情報や操作を使う連携の仕組み。個別GitHub書込権限は未検証 |
| [AGENTS.md](https://learn.chatgpt.com/docs/agent-configuration/agents-md) | Codexでの指示探索。通常のChatGPTへは共通指示を明示的に渡す設計 |

実アカウントでのプロジェクト作成・添付・GitHub書込の操作検証はしていません。[環境確認](chatgpt-environment.md)と[受入確認](acceptance.md)を参照してください。

## 登録・契約と移行手順の参照元（0.2.1）

確認日: 2026-09-27。中高生版はGitHub接続でmainの本文を取得しました。開始手順の段取りを参考に大学生向けに書き直し、料金・GitHub操作は公式案内を確認しています。

| 資料 | 確認した範囲 |
| --- | --- |
| [中高生版・開始手順](https://github.com/risan-education/my-portfolio-teens/blob/main/docs/getting-started.md) | アカウント・任意の契約・本人用Private・接続・練習の順序 |
| [中高生版・GitHubの基礎](https://github.com/risan-education/my-portfolio-teens/blob/main/docs/github-basics.md) | 配布元と本人用保存先の区別、既存アカウント利用 |
| [中高生版・移行手順](https://github.com/risan-education/my-portfolio-teens/blob/main/docs/migration-to-univ.md) | 新しいPrivateへのコピー、元の保持、同じ保存先での続用 |
| [中高生版・移行検証](https://github.com/risan-education/my-portfolio-teens/blob/main/docs/migration-verification.md) | 指定サンプルの検証と実データ移行の区別 |
| [中高生版・接続環境](https://github.com/risan-education/my-portfolio-teens/blob/main/docs/connection-environments.md) | 実際の読取・書込・再読込手段を確認する設計 |
| [OpenAI・Quickstart](https://learn.chatgpt.com/docs/quickstart) | Web／アプリの導入、アカウントでのサインイン |
| [OpenAI・Pricing](https://learn.chatgpt.com/docs/pricing) | FreeとPlusの参考価格。個別の税・通貨・決済・解約画面は未検証 |
| [GitHub・テンプレートから作成](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template) | Owner・名前・公開範囲・ブランチの選択 |
| [GitHub・新規作成](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository) | 空の本人用Private作成 |
| [GitHub・ZIP取得](https://docs.github.com/en/repositories/working-with-files/using-files/downloading-source-code-archives) | ZIPは一時点のスナップショットで全履歴を含まない |
| [GitHub・ファイル追加](https://docs.github.com/en/repositories/working-with-files/managing-files/adding-a-file-to-a-repository) | ブラウザでのアップロード・コミット、100ファイル／25 MiBの制限 |

中高生版にある大学生版の開発段階の記述は、このリポジトリの現行状態を示すものとして転記していません。他リポジトリのライセンスや設定を、この教材や本人の記録へ自動適用しません。

## Copilot・Claude Codeの参照元（0.3.0）

確認日: 2026-09-27。以下の公式本文を確認しました。学生認証・特典有効化・VS Code・Claude Codeの実アカウント操作は未検証です。

| 資料 | 確認した範囲 |
| --- | --- |
| [GitHub・学生向けCopilot](https://docs.github.com/en/copilot/how-tos/copilot-on-github/set-up-copilot/enable-copilot/set-up-for-students) | 学生認証・特典有効化の区別、反映待ち、毎月の資格再評価 |
| [GitHub・学生申請](https://docs.github.com/en/education/about-github-education/github-education-for-students/apply-to-github-education-as-a-student) | 在学証明と学校メールの条件、Education benefitsからの申請 |
| [GitHub・Copilotプラン](https://docs.github.com/en/copilot/get-started/plans) | Copilot StudentとFreeの区別、利用枠があること |
| [VS Code・Copilot設定](https://code.visualstudio.com/docs/setup/copilot) | サインイン、アカウント、利用状況とデータ取扱設定 |
| [VS Code・指示ファイル](https://code.visualstudio.com/docs/agent-customization/custom-instructions) | .github/copilot-instructions.mdの配置、環境・設定による適用 |
| [VS Code・Chat](https://code.visualstudio.com/docs/chat/chat-overview) | Chatでの相談とファイル編集の入口 |
| [GitHub Desktop・clone](https://docs.github.com/en/desktop/adding-and-cloning-repositories/cloning-and-forking-repositories-from-github-desktop) | 本人用リポジトリをパソコンへ複製する操作 |
| [GitHub Desktop・コミットとpush](https://docs.github.com/en/desktop/making-changes-in-a-branch/committing-and-reviewing-changes-to-your-project-in-github-desktop) | 差分の確認、対象ファイルの選択、コミットとPush origin |
| [Claude Code・開始手順](https://code.claude.com/docs/en/quickstart) | 導入、アカウント・課金経路、フォルダでの起動 |
| [Claude Code・指示ファイル](https://code.claude.com/docs/en/memory) | AGENTS.mdの適用条件、CLAUDE.mdからの参照 |

## ガクチカの調査資料（0.4.0）

確認日: 2026-09-27。[採用側の説明、10業種の公式資料、中高生版の参照箇所と固定版](gakuchika-sources.md)に確認範囲をまとめました。公式情報と教材の解釈、架空の応募条件と実際の提出条件を分けています。
