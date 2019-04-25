require "language/haskell"

class CabalCache < Formula
  include Language::Haskell::Cabal

  desc "CI configuration tool"
  homepage "https://github.com/haskell-works/cabal-cache"
  url "https://github.com/haskell-works/cabal-cache/archive/v0.2.0.2.tar.gz"
  sha256 "e7706709e90b6f184fa9ceee2b8a8643b145c15f3c1bde9ad2a1362d57797918"
  head "https://github.com/haskell-works/cabal-cache"

  depends_on "ghc" => :build
  depends_on "cabal-install" => :build

  def install
    install_cabal_package

    # Build bash completion
    (bash_completion/"cabal-cache").write `#{bin}/cabal-cache --bash-completion`
  end

  bottle do
    root_url "https://github.com/haskell-works/homebrew-haskell-works/releases/download/cabal-cache-0.2.0.2"
    cellar :any_skip_relocation
    rebuild 1
    sha256 "93e60f6adb2b981d0a1e148f6a7793438ce3e2cafb57f2a77abf142233e3965a" => :mojave
  end

  test do
    assert_match "cabal-cache 0.2.0.2", pipe_output("#{bin}/cabal-cache version", "", 0)
  end
end
