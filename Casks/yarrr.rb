cask "yarrr" do
  version "0.1.7"
  sha256 "f5bb6f8e4cb78d33ae04d7904330555b5b28b37c1d46ba951624fd68eb36900b"

  url "https://github.com/minkyojung/realtime-assistance/releases/download/v#{version}/yarrr.zip"
  name "yarrr"
  desc "Apple Music from your terminal — ask for music in your own words"
  homepage "https://github.com/minkyojung/realtime-assistance"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Music.app 을 AppleScript 로 다룬다. 그 둘이 없는 곳에서는 켤 이유가 없다.
  depends_on macos: :monterey
  depends_on arch: :arm64

  binary "yarrr"

  caveats do
    <<~EOS
      처음 실행하면 macOS 가 "음악 제어" 권한을 묻는다. 승인해야 재생이 된다.
      AI 는 선택이다 — 앱 안에서 `/ai <key>` 로 켠다. 안 켜도 검색과 재생은 다 된다.
    EOS
  end

  zap trash: "~/.config/amcli"
end
