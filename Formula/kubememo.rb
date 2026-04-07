class Kubememo < Formula
  desc "Kubernetes operational memory with durable memos, runtime notes, and activity capture"
  homepage "https://kubememo.kubedeck.io"
  url "https://github.com/KubeDeckio/KubeMemo/archive/refs/tags/v0.0.1-rc6.tar.gz"
  sha256 "3f8b69f6bef80e1171792d8bf58c124fd7572dd655ed5ebc8897da6ecb91b622"
  license "MIT"
  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags", "-s -w -X github.com/KubeDeckio/KubeMemo/internal/cli.version=0.0.1-rc6", "-o", bin/"kubememo", "./cmd/kubememo"
  end

  test do
    assert_match "\"version\": \"0.0.1-rc6\"", shell_output("#{bin}/kubememo version")
  end
end
