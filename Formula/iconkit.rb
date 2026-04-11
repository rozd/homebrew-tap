class Iconkit < Formula
  desc "CLI tool for working with Apple .icon bundles"
  homepage "https://github.com/rozd/icon-kit"
  url "https://github.com/rozd/icon-kit/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "bd56f8f737c204b32ad8b0a10c32ee9f5eb261e3c9acce8c8df9a66a706bf34a"
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
