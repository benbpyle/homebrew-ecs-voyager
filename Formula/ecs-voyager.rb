class EcsVoyager < Formula
  desc "Terminal user interface (TUI) for exploring and managing AWS ECS resources"
  homepage "https://github.com/benbpyle/ecs-voyager"
  version "0.1.9"
  license "MIT"

  # This formula uses prebuilt binaries and does not require compilation
  def self.needs_compiler?
    false
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/benbpyle/ecs-voyager/releases/download/v0.1.9/ecs-voyager-v0.1.9-aarch64-apple-darwin.tar.gz"
    sha256 "c996f46f02e24281a7316f1b5602d2c8f5ebeded79e767345d5c57ba9638b2e9"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/benbpyle/ecs-voyager/releases/download/v0.1.9/ecs-voyager-v0.1.9-x86_64-apple-darwin.tar.gz"
    sha256 "972cefe943a0c9d945f470a64861a03e3fa5b0513eff42533591f3ad9d072456"
  end

  def install
    bin.install "ecs-voyager"
  end

  test do
    assert_match "ecs-voyager", shell_output("#{bin}/ecs-voyager --version 2>&1", 0)
  end
end
