require "language/haskell"

class CabalCache < Formula
  include Language::Haskell::Cabal

  desc "CI configuration tool"
  homepage "https://github.com/haskell-works/cabal-cache"
  url "https://github.com/haskell-works/cabal-cache/archive/v1.0.0.1.tar.gz"
  sha256 "ec1cf96935e5d69b9554270b11f13261ef7b0e890d32d9be8b6cb53af31f93a3"
  head "https://github.com/haskell-works/cabal-cache"

  depends_on "ghc" => :build
  depends_on "cabal-install" => :build

  def install
    install_cabal_package

    # Build bash completion
    (bash_completion/"cabal-cache").write `#{bin}/cabal-cache --bash-completion`
  end

  bottle do
    root_url "https://github.com/haskell-works/homebrew-haskell-works/releases/download/cabal-cache-1.0.0.1"
    cellar :any_skip_relocation
    rebuild 1
    sha256 "0ee131962af50b97bc90cb51500de18bf0769416c56c112948f9effd8d15911a" => :mojave
  end

  bottle do
    root_url "https://github.com/haskell-works/homebrew-haskell-works/releases/download/cabal-cache-1.0.0.1"
    cellar :any_skip_relocation
    rebuild 1
    sha256 "0ee131962af50b97bc90cb51500de18bf0769416c56c112948f9effd8d15911a" => :high_sierra
  end

  test do
    assert_match "cabal-cache 0.2.0.2", pipe_output("#{bin}/cabal-cache version", "", 0)
  end
end
