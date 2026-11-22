# frozen_string_literal: true

class Shore < Formula
  desc "Terminal chat client for the shore AI character engine"
  homepage "https://github.com/mythofmeat/shore"
  url "https://github.com/mythofmeat/shore.git",
      tag:      "v4.64.0",
      revision: "1b546be7dcb7a956c807e5c14e891d566eb238bd"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "rust" => :build

  def install
    cd "client" do
      system "cargo", "install", "--root", prefix, "--path", "shore-cli"
    end

    generate_completions_from_executable(bin/"shore", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shore --version")
  end
end
