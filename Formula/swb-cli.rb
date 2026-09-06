class SwbCli < Formula
  desc "Sprint analytics CLI for Scrum Workbench (Jira / GitHub metrics and reports)"
  homepage "https://scrumworkbench.com"
  url "https://github.com/koukibuu3/homebrew-tap/releases/download/swb-cli-v0.1.0/swb-cli-0.1.0.tar.gz"
  sha256 "56bd35277648434f333c6a3f812d9a41bf407d3582eefc576a1d98caafc0ba9d"
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
