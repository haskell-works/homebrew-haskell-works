require "language/haskell"

class CabalCache < Formula
  include Language::Haskell::Cabal

  desc "CI configuration tool"
  homepage "https://github.com/haskell-works/cabal-cache"
  url "https://github.com/haskell-works/cabal-cache/archive/v1.0.0.10.tar.gz"
  sha256 "c6295a93019106939d0a91ea5ab5eebbe6f61fa431aa77f51af8107a9f3909c7"
  head "https://github.com/haskell-works/cabal-cache"

  depends_on "ghc" => :build
  depends_on "cabal-install" => :build

  def install
    install_cabal_package

    # Build bash completion
    (bash_completion/"cabal-cache").write `#{bin}/cabal-cache --bash-completion`
  end

  bottle do
    root_url "https://github.com/haskell-works/homebrew-haskell-works/releases/download/cabal-cache-1.0.0.10"
    cellar :any_skip_relocation
    rebuild 1
    sha256 "0c78b3301db11eba4717d96b8197e7fb2b75833c31327679fdadc1d378c32e6b" => :mojave
  end

  # bottle do
  #   root_url "https://github.com/haskell-works/homebrew-haskell-works/releases/download/cabal-cache-1.0.0.1"
  #   cellar :any_skip_relocation
  #   rebuild 1
  #   sha256 "0ee131962af50b97bc90cb51500de18bf0769416c56c112948f9effd8d15911a" => :high_sierra
  # end

  test do
    assert_match "cabal-cache 0.2.0.2", pipe_output("#{bin}/cabal-cache version", "", 0)
  end
end
