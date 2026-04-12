class Iconkit < Formula
  desc "CLI tool for working with Apple .icon bundles"
  homepage "https://github.com/rozd/icon-kit"
  url "https://github.com/rozd/icon-kit/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "30a63329b43721f45bde3c0da61096c5e9cc797413e836693d084540e1e96072"
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
