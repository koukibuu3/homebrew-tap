class SwbCli < Formula
  desc "Sprint analytics CLI for Scrum Workbench (Jira / GitHub metrics and reports)"
  homepage "https://scrumworkbench.com"
  url "https://github.com/koukibuu3/homebrew-tap/releases/download/swb-cli-v0.1.4/swb-cli-0.1.4.tar.gz"
  sha256 "900acfda4a7dd5197e4e248e84defd016c328fa11d445f8845eb20ee5570fcad"
  license "MIT"

  depends_on "gh"
  depends_on "node"

  def install
    libexec.install "cli.mjs", "LICENSE", "README.md"
    (bin/"swb").write <<~SH
      #!/bin/bash
      exec "#{formula_opt_bin("node")}/node" "#{libexec}/cli.mjs" "$@"
    SH
  end

  def caveats
    <<~EOS
      swb は Jira の取得に TWG CLI（twg）を使います。Homebrew では配布されていないため、
      別途導入して `twg login` を済ませてください。GitHub の取得には `gh auth login` が必要です。
    EOS
  end

  test do
    assert_match "swb #{version}", shell_output("#{bin}/swb --version")
    assert_match "Usage:", shell_output("#{bin}/swb --help")
  end
end
