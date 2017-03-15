require "language/haskell"

class HwaCi < Formula
  include Language::Haskell::Cabal

  desc "CI configuration tool"
  homepage "https://github.com/haskell-works/hwa-ci"
  url "https://github.com/haskell-works/hwa-ci/archive/v0.1.0.1.tar.gz"
  sha256 "70d9b28c073d59f3574da2cb0735d3556ec7605def38b3486dbc5981771781a0"
  head "https://github.com/haskell-works/hwa-ci"

  depends_on "ghc" => :build
  depends_on "cabal-install" => :build

  def install
    install_cabal_package

    # Build bash completion
    (bash_completion/"hwa-ci").write `#{bin}/hwa-ci --bash-completion-script hwa-ci`
  end

  bottle do
    root_url "https://github.com/haskell-works/homebrew-haskell-works/releases/download/hwa-ci-0.1.0.1"
    cellar :any_skip_relocation
    sha256 "b611873018d0cd9c291cc7660391d699c01037fa5d9068ae166e8a7606595568" => :sierra
  end

  test do
    assert_match "hwa-ci 0.1.0.0", pipe_output("#{bin}/hwa-ci version", "", 0)
  end
end
