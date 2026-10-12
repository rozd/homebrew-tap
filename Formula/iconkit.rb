class Iconkit < Formula
  desc "CLI tool for working with Apple .icon bundles"
  homepage "https://github.com/rozd/icon-kit"
  url "https://github.com/rozd/icon-kit/archive/refs/tags/v1.2.2.tar.gz"
  sha256 "4409d83c252eb4077b295a3d2e5ab43e86ba46586e7abb49d30d62dd039448e3"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release"
    bin.install ".build/release/iconkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/iconkit --version")
  end
end
