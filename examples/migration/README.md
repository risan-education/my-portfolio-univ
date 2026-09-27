# 架空の移行例

このフォルダだけを対象にコピー検査を行います。実際の本人の記録ではありません。
source/は架空の中高生版の一部、target/legacy/teens-01/は同じ名前と相対配置でコピーした例です。
[移行確認メモ](migration-note.md)で対応を管理します。

実際の操作は[移行ガイド](../../docs/migration.md)を参照します。手動ならsource/内のこの4ファイルを選び、target/に相当する本人用大学生版のlegacy/teens-01/以下へ同じ配置でコピーする、という関係です。この架空例ではアカウント契約、GitHubへのアップロード、実データの移行は行っていません。

| 元 | コピー先 |
| --- | --- |
| [日付欄のない原記録](source/experiences/old-note.md) | [保持されたコピー](target/legacy/teens-01/experiences/old-note.md) |
| [記入済みREADME](source/projects/library/README.md) | [保持されたREADME](target/legacy/teens-01/projects/library/README.md) |
| [問いと状態](source/questions.md) | [保持された問い](target/legacy/teens-01/questions.md) |
| [入れ子のlegacy](source/legacy/elementary-01/experiences/shadow.md) | [保持された入れ子](target/legacy/teens-01/legacy/elementary-01/experiences/shadow.md) |

[新しい問いの入口](target/questions.md)から、旧記録を変更せず参照します。
source/にも本物の旧指示書やGit設定を置いていません。除外対象の説明はデータとして[確認メモ](migration-note.md)に記載しています。
