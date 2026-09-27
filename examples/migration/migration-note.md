# 移行確認メモ（架空例）

作成日・本人確認日: 2026-09-27。
コピー元: 架空のteens-private、教材fixture-v1（Gitコミットではない）。
コピー先: 架空のuniv-private、所有者は架空本人、main、Privateという設定。実際のリポジトリは作っていない。
許可: 以下4ファイルの移行。AI提供・提出・公開は別途選ぶ設定。検証ではこの架空fixtureのみを使用。
最新停止情報: この4件に停止対象なし、2026-09-27確認という設定。

| 元の相対パス | コピー先（target/以下） | 種類 | 通常参照する側 | 内容・参照 |
| --- | --- | --- | --- | --- |
| experiences/old-note.md | legacy/teens-01/experiences/old-note.md | 原記録 | コピー先 | 本文一致、日付追加なし |
| projects/library/README.md | legacy/teens-01/projects/library/README.md | 記入済み記録 | コピー先 | 内容と相対リンク一致 |
| questions.md | legacy/teens-01/questions.md | 問いの入口 | コピー先 | 保留の状態を保持、実績ではない |
| legacy/elementary-01/experiences/shadow.md | legacy/teens-01/legacy/elementary-01/experiences/shadow.md | 旧原記録 | コピー先 | 代筆・観察を保持 |

未解決: old-noteの外部写真は所有者・権限・控えが未確認。元の本文は変更せず、所有者への確認を次の行動にする。
旧AGENTS.md、CLAUDE.md、.github/、.claude/、.agents/、.codex/、.git/は通常移行から除外する設計。このfixtureには配置しない。
衝突時: teens-01を上書きせず、まとまり全体を未使用のteens-02へ。対応表も変更する。
元・コピー・要約は同じ活動。記入済みREADMEとquestions.mdは新しい空欄で置き換えない。
新規保存の例は[journeyの一言記録](../journey/experiences/240415-class.md)。旧日付や旧状態を書き換えない。
