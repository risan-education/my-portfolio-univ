# 参照資料と確認範囲

確認日: 2026-09-27。外部本文は配布物に転載していません。リンク先には各サイトの条件が適用されます。

| 資料 | 確認・採用した範囲 |
| --- | --- |
| [ユーザー提供の要件定義書0.7](my-portfolio-university-requirements.md) | 原文をそのまま保存。今回の実装判断はacceptance.mdへ分離 |
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

GitHubの参照先はmainで取得し、返された最終更新時刻は3資料とも2026-09-26T23:06:08Zでした。固定コミットの照合は未実施です。将来の変更は再確認してください。

要件書にある小学生版・参考記事等の調査記述は提供された原文の記述です。今回それら全体を再検証したわけではありません。
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
