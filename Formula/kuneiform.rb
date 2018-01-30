require "language/haskell"

class Kuneiform < Formula
  include Language::Haskell::Cabal

  desc "CI configuration tool"
  homepage "https://github.com/haskell-works/kuneiform"
  url "https://github.com/haskell-works/kuneiform/archive/v0.1.0.0.tar.gz"
  sha256 "9b677344ba175ceabbaefbedfdbdc46318e4961aeebd2279fd1be7c2bb94a7c5"
  head "https://github.com/haskell-works/kuneiform"

  depends_on "ghc" => :build
  depends_on "cabal-install" => :build

  def install
    install_cabal_package

    # Build bash completion
    (bash_completion/"kuneiform").write `#{bin}/kuneiform --bash-completion-script kuneiform`
  end

  bottle do
    root_url "https://github.com/haskell-works/homebrew-haskell-works/releases/download/kuneiform-0.1.0.0"
    cellar :any_skip_relocation
    sha256 "d2d01f7f1e265ad50ea7cae6296089a52b22e0d866063b0379de49abec500118" => :high_sierra
  end

  test do
    assert_match "kuneiform 0.1.0.0", pipe_output("#{bin}/kuneiform version", "", 0)
  end
end
