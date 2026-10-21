# Formula/graphicle.rb of the graphicle-ai/homebrew-tap repository:
#   brew install graphicle-ai/tap/graphicle
# Written by packaging/homebrew/fill_formula.py from graphicle.rb.in in
# https://github.com/graphicle-ai/graphicle; edit the template, not the tap.
class Graphicle < Formula
  desc "Persistent source-backed memory and code knowledge graphs for your work"
  homepage "https://github.com/graphicle-ai/graphicle"
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.3/graphicle-0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "f80ac69f51c7c59f7ec6b1afb5cd4d0cc7898102790da1e5a4a627794f25c0b4"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.3/graphicle-0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "8a3abb2b5f712ea6e4cb42b8f8c2bd6eeea2de3bab43958abd33c8512fa02b1b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.3/graphicle-0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d2a4b4f49f11c062f7b73e552798b82d4ee30d4b3d91626086093e7301264c02"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.3/graphicle-0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "97efc62ff01bec19b1c456fd2626593f3022ae0b89990b50b3d6ecdfdb0a6d7b"
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

      Next: cd your-repo && graphicle setup
    EOS
  end

  test do
    assert_match "graphicle #{version}", shell_output("#{bin}/graphicle --version")
    assert_match "graphicle-graph #{version}", shell_output("#{bin}/graphicle-graph --version")
    assert_match "graphicle-graph #{version}", shell_output("#{bin}/graphicle graph --version")
  end
end
