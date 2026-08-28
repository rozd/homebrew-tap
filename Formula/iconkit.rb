class Iconkit < Formula
  desc "CLI tool for working with Apple .icon bundles"
  homepage "https://github.com/rozd/icon-kit"
  url "https://github.com/rozd/icon-kit/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "b6225f7edf1e9b725512d614e2b67f09c81e6f6a65797351fe154731ee46e723"
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
