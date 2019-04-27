require "language/haskell"

class CabalCache < Formula
  include Language::Haskell::Cabal

  desc "CI configuration tool"
  homepage "https://github.com/haskell-works/cabal-cache"
  url "https://github.com/haskell-works/cabal-cache/archive/v1.0.0.0.tar.gz"
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
    root_url "https://github.com/haskell-works/homebrew-haskell-works/releases/download/cabal-cache-1.0.0.0"
    cellar :any_skip_relocation
    rebuild 1
    sha256 "2962040c149cdbec23e492245951cdb6c3d5c113aa5a648ec5f502901f32e328" => :mojave
  end

  test do
    assert_match "cabal-cache 0.2.0.2", pipe_output("#{bin}/cabal-cache version", "", 0)
  end
end
