require "language/haskell"

class CabalCache < Formula
  include Language::Haskell::Cabal

  desc "CI configuration tool"
  homepage "https://github.com/haskell-works/cabal-cache"
  url "https://github.com/haskell-works/cabal-cache/archive/v1.0.0.11.tar.gz"
  sha256 "b5dd02bc5f05c8b7afc955dbe33fd75c2ddda187603a8c19ae92fdbec6a398c5"
  head "https://github.com/haskell-works/cabal-cache"

  depends_on "ghc" => :build
  depends_on "cabal-install" => :build

  def install
    install_cabal_package

    # Build bash completion
    (bash_completion/"cabal-cache").write `#{bin}/cabal-cache --bash-completion`
  end

  bottle do
    root_url "https://github.com/haskell-works/homebrew-haskell-works/releases/download/cabal-cache-1.0.0.11"
    cellar :any_skip_relocation
    rebuild 1
    sha256 "50ef881bb16affb94f6289d8d7bd3da0cbdc47e6b791bb8ec4f6d7a5817a69a7" => :mojave
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
