class Kubememo < Formula
  desc "Kubernetes operational memory with durable memos, runtime notes, and activity capture"
  homepage "https://kubememo.kubedeck.io"
  url "https://github.com/KubeDeckio/KubeMemo/archive/refs/tags/v0.0.1-rc4.tar.gz"
  sha256 "ba829f8ad97d3403014bf6df50716ff9d05c489a5a158ef3a8d1bd1de1455541"
  license "MIT"
  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags", "-s -w -X github.com/KubeDeckio/KubeMemo/internal/cli.version=0.0.1-rc4", "-o", bin/"kubememo", "./cmd/kubememo"
  end

  test do
    assert_match "\"version\": \"0.0.1-rc4\"", shell_output("#{bin}/kubememo version")
  end
end
