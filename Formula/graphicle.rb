# Formula/graphicle.rb of the graphicle-ai/homebrew-tap repository:
#   brew install graphicle-ai/tap/graphicle
# Written by packaging/homebrew/fill_formula.py from graphicle.rb.in in
# https://github.com/graphicle-ai/graphicle; edit the template, not the tap.
class Graphicle < Formula
  desc "Persistent source-backed memory and code knowledge graphs for your work"
  homepage "https://github.com/graphicle-ai/graphicle"
  version "0.1.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.6/graphicle-0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "1234148a76f759c739d171413a75a15f155692d6e02a7e8c3e78778221cab981"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.6/graphicle-0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "f8e116efb56d2905b8f28337b6e69d82a47cda51c0f8b645c08f7dbdec78e358"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.6/graphicle-0.1.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "31422ea671fafedcf8c081ac984fd1ae0e2a1c0efa1a06ce6cfa071a3ebae325"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.6/graphicle-0.1.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "68825b570adbb8b0ef1cf8762c8b3f7ae7fdd5772eae82b3c66d6fa803d0d432"
    end
  end

  def install
    bin.install "graphicle", "graphicle-graph"
    # LICENSE, NOTICE, README.md and CHANGELOG.md are installed with the
    # formula's metadata.
    prefix.install Dir["NOTICE.md", "licenses"]
  end

  def caveats
    <<~EOS
      After an upgrade, run graphicle doctor --fix: it repairs agent entries
      that still start the previous version.

      By default, graphicle checks GitHub for a newer release at most once a
      day; to turn this off, run: graphicle config set update_notifier false

      Next: cd your-repo && graphicle setup
    EOS
  end

  test do
    assert_match "graphicle #{version}", shell_output("#{bin}/graphicle --version")
    assert_match "graphicle-graph #{version}", shell_output("#{bin}/graphicle-graph --version")
    assert_match "graphicle-graph #{version}", shell_output("#{bin}/graphicle graph --version")
  end
end
