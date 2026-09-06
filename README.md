# homebrew-tap

koukibuu3 が配布する CLI の Homebrew tap です。

## swb-cli

[Scrum Workbench](https://scrumworkbench.com) のチーム分析 CLI。Jira / GitHub から Sprint のデータを取得し、
指標と Markdown / JSON のレポートを出力します。

```bash
brew install koukibuu3/tap/swb-cli
swb inspect --board <boardId>
swb run --board <boardId> --repo <owner/repo>
```

### 前提

- TWG CLI（`twg`）を導入し、`twg login` を済ませていること。Homebrew では配布されていません。
- GitHub CLI（`gh`）で `gh auth login` を済ませていること（`--repo` を使う場合）。

設定ファイルは持たず、利用者自身の `twg` / `gh` の認証だけで動きます。
出力先（既定 `.analytics/`）には人物名を含むデータが入るため、Git 管理しないでください。

### 更新

```bash
brew upgrade swb-cli
```

## Formula の更新

Formula は本体リポジトリのリリース workflow が更新します。手で編集するのは修正が必要なときだけです。

## License

MIT
