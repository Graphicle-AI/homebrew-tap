# Formula/graphicle.rb of the graphicle-ai/homebrew-tap repository:
#   brew install graphicle-ai/tap/graphicle
# Written by packaging/homebrew/fill_formula.py from graphicle.rb.in in
# https://github.com/graphicle-ai/graphicle; edit the template, not the tap.
class Graphicle < Formula
  desc "Persistent source-backed memory and code knowledge graphs for your work"
  homepage "https://github.com/graphicle-ai/graphicle"
  version "0.1.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.7/graphicle-0.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "ab3016762c619d27426b344ef49f759c282906fd619d75fe8d7773af82e6e20a"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.7/graphicle-0.1.7-x86_64-apple-darwin.tar.gz"
      sha256 "23137081a15437de46fa663ea9dc0c1c921362125a59c70d1c3f0165742960c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.7/graphicle-0.1.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6f58961e34f9889535e785f1ce1fe5a359d0d6dbfa9632f05f8dffd7c59ed27f"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.7/graphicle-0.1.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "262bea89b9dfa2efc6e6e243ba1fd4be1caabbd9c009c019c3337c2adb97683c"
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
