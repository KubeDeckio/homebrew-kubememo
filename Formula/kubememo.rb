class Kubememo < Formula
  desc "Kubernetes operational memory with durable memos, runtime notes, and activity capture"
  homepage "https://kubememo.kubedeck.io"
  url "https://github.com/KubeDeckio/KubeMemo/archive/refs/heads/main.tar.gz"
  sha256 "116261d3d7314c79ccda948801c6149061d4e5f726bf848828dbf138626264b7"
  license "MIT"
  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags", "-s -w", "-o", bin/"kubememo", "./cmd/kubememo"
  end

  test do
    assert_match "kubememo", shell_output("#{bin}/kubememo version")
  end
end
