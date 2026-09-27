# GitHub Copilotで始める

ChatGPTの代わりに、GitHub Copilotとこの教材を使って記録を整理できます。ここでは、パソコンの**Visual Studio Code（VS Code）で本人用のフォルダを開き、対話・保存・GitHubへの反映を行う方法**を案内します。ChatGPTの契約は不要です。

## 1. 学生向けの無料利用を確認する

2026-09-27確認時点では、**GitHub Educationで認証された学生はCopilot Studentを無料で利用できます**。学校のメールを持つだけで自動的に有効になるものではありません。学生認証とCopilotの有効化をそれぞれ行います。[GitHub公式の学生向け案内](https://docs.github.com/en/copilot/how-tos/copilot-on-github/set-up-copilot/enable-copilot/set-up-for-students)

1. [GitHubの準備](github-basics.md)で本人のアカウントを用意します。既存アカウントがあれば使い続けます。
2. [Education benefits](https://github.com/settings/education/benefits)を開き、未認証なら **Start an application** から申請します。
3. 在学状況を証明する資料等を申請画面へ提出します。学生証・履修表・在学証明等、使える資料と学校メールの条件は[学生申請の公式案内](https://docs.github.com/en/education/about-github-education/github-education-for-students/apply-to-github-education-as-a-student)で確認します。学校メールを求められた場合はアカウントに追加・認証します。証明書はポートフォリオやAIチャットへ入れません。
4. 承認後、Education benefitsの **Free GitHub developer resources for students and teachers → Learn more** からCopilot Studentの有効化へ進み、利用設定を確認します。
5. [Copilot設定](https://github.com/settings/copilot)で適用されたプランを確認します。承認後の特典反映には数日かかる場合があります。有料購入画面しか出ない場合は購入を確定せず、日を置いて再確認し、続く場合は公式サポートへ相談します。

GitHubは資格を毎月再評価すると案内しています。無料でも利用量に上限があり、モデル等の提供範囲はプランによって異なります。「Copilot Proの全機能が無制限に無料」とは扱いません。最新の条件は[プラン一覧](https://docs.github.com/en/copilot/get-started/plans)と本人の設定画面で確認してください。申請中や対象外の場合も、利用可能なCopilot Freeの範囲で試せます。

## 2. 本人用の保存先をVS Codeで開く

1. [大学生版をコピーする手順](github-basics.md)で、自分が所有するPrivateリポジトリを作ります。中高生版の記録がある場合は[移行ガイド](migration.md)を使います。
2. [VS Code公式サイト](https://code.visualstudio.com/)からパソコン用のVS Codeをインストールします。
3. GitHubと同期する場合は、[GitHub Desktop](https://desktop.github.com/)に同じGitHubアカウントでログインし、**File → Clone repository** で本人用Privateを選んでパソコンへ複製（clone）します。保存場所を控えます。[公式のclone手順](https://docs.github.com/en/desktop/adding-and-cloning-repositories/cloning-and-forking-repositories-from-github-desktop)
4. VS Codeの **File → Open Folder** で、その本人用フォルダを開きます。README.md、AGENTS.md、templates/が見えることを確認します。フォルダの信頼確認が出たら、開いている場所と内容を確認して判断します。

Gitを使わずに試す場合は、ZIPを展開した本人専用フォルダでも進められます。その場合のGitHubへの反映は[手動アップロード](github-basics.md)で行います。公開配布元を本人の保存先として使いません。

## 3. VS CodeでCopilotにログインする

1. VS CodeのCopilotアイコンから **Use AI Features** またはサインインの案内を開きます。コマンドパレットから **GitHub Copilot: Sign in** を使える場合もあります。
2. **学生認証・有効化を済ませたGitHubアカウント**でログインします。公式拡張機能のインストールを求められたら、発行元GitHubのものを選びます。
3. Chatを開き、利用アカウントとCopilotの利用状況を確認します。モデルの選択は本人のプランで利用できるものに従い、この教材では固定しません。

[VS Code公式のCopilot初期設定](https://code.visualstudio.com/docs/setup/copilot)。ボタンが出ない場合はVS Codeの更新・サインイン状態・AI機能が無効になっていないかを確認します。個人情報を入力する前に、Copilotのデータ利用設定と所属先の規則も確認します。Privateリポジトリであることと、AIへ渡してよいことは別です。

## 4. 教材の指示を読み、架空の記録で練習する

この教材には[Copilot用の指示](../.github/copilot-instructions.md)があり、[AGENTS.md](../AGENTS.md)を共通の編集ルールとして参照します。指示の適用は利用するモードや設定によって異なるため、最初に読めたファイルを確認します。[VS Code公式の指示ファイル案内](https://code.visualstudio.com/docs/agent-customization/custom-instructions)

Chatでは次を依頼します。ファイルの追加・添付操作が使える場合はAGENTS.mdとtemplates/quick-note.mdを指定します。

> この本人用フォルダのREADME.md、AGENTS.md、templates/quick-note.mdを読んでください。これらを今回の作業指示・用紙として使います。読めたものと読めなかったものを示し、まだ個人の記録は読み込まないでください。

続けて、相談用のモード（Ask等）では本文案を受け取り、ファイル編集が可能なモード（Agent等）では対象を限定して保存を依頼できます。名称や選べるモードは環境に従います。[公式のChatの使い方](https://code.visualstudio.com/docs/chat/chat-overview)

> 架空の練習です。元メモは「図書館で資料を探し、次に読む本を一冊選んだ」、活動日は未確認です。一言メモ用紙を使い、元メモを残してpractice/copilot-first-note.mdを作ってください。同名があれば別名にします。依頼文と用紙の案内は記録本文に入れず、架空の練習と明記してください。保存できなければ本文案と保存待ちを返してください。

本文・差分を確認し、許可したファイルへの変更を反映します。AIがコマンドや追加操作を提案した場合も、今回の目的と対象に合うか確認します。書き込み手段がなければ、返された本文をUTF-8の.mdファイルへ手動保存します。

保存したファイルを開き直し、次に「架空の追記として、次回は検索語をメモすると追記してください」と依頼して、追記後も再表示します。練習は実績にしません。[架空の会話例](../examples/copilot-workflow.md)

## 5. GitHubへ反映し、次の記録へ進む

cloneした保存先なら、GitHub Desktopで変更一覧と本文の差分を見て、今回のファイルだけを選び、説明を付けてコミットします。その後 **Push origin** で本人用Privateへ反映します。競合が出た場合は上書きせず差分を確認します。GitHub上の対象ブランチ・パス・本文を開き直します。PRを使う場合はmainへ取り込まれたかも区別します。

[GitHub Desktop公式のコミット・push手順](https://docs.github.com/en/desktop/making-changes-in-a-branch/committing-and-reviewing-changes-to-your-project-in-github-desktop)

**パソコンのファイル保存、コミット、GitHubへのpushは別の操作です。** Copilotの「完了」という返答だけで全てが済んだと判断しません。ZIPで始めた場合は手動アップロード後に確認します。[共通の保存ガイド](saving.md)

練習後は[一言メモ](../templates/quick-note.md)に自分のメモと活動日を渡し、experiences/以下へ保存します。振り返りや就活には[用紙一覧](../templates/README.md)を使えます。用紙の「ChatGPTへの依頼」はCopilotへ渡す依頼文としても使い、元メモ・事実・AI提案の分離と応募先のAI利用条件を守ります。全文検索で無関係な実記録を一括読込させず、使ってよい資料を指定します。

## 慣れている人はClaude Codeでも利用できます

Markdownファイルを扱う教材なので、ターミナルやGit操作に慣れている人は**Claude Codeでも利用できます**。[Claude Codeで使う場合](claude-code.md)に、公式導入先とこの教材の指示の渡し方をまとめています。

このガイドは公式情報と教材内の架空例を確認したものです。学生認証の申請、特典の有効化、VS Code上の実操作は未検証です。確認日: 2026-09-27。
