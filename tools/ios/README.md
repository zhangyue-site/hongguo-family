# iOS cloud build and TestFlight upload

The manually triggered `Flutter client preview` workflow builds `client/` using
Flutter 3.44.0 and explicitly selected Xcode 26.3 / iOS 26 SDK on macOS 15.
Apple requires Xcode 26 or later for uploads since 2026-04-28; the runner's
default Xcode 16.4 is insufficient. macOS produces an unsigned device IPA and a simulator ZIP;
Ubuntu produces an independent Android preview APK. This workflow does not
publish Android OTA or replace the existing signed Android release pipeline.

1. Complete App Store Connect app creation for `site.zhangyue.hongguo.ios`.
   Apple does not expose app creation through its public API.
2. Trigger the workflow with a marketing version and a unique ascending build
   number, then inspect analysis, tests, and both build jobs.
3. Download the unsigned iOS artifact to 106's restricted
   `/opt/hongguo-analysis/ios-release/` directory.
4. Run `bash tools/ios/sign-106.sh unsigned.ipa signed.ipa` on 106. The signing
   key, certificate, and App Store provisioning profile remain on that server.
5. Upload the signed artifact, substituting the app's numeric App Store ID:

   ```sh
   python3 tools/ios/upload-asc-106.py signed.ipa \
     --app-id APP_STORE_ID \
     --state /opt/hongguo-analysis/ios-release/upload-state.json --direct
   ```

Use the same state file only when resuming the same artifact. A new build needs
a new state filename. State records contain resource IDs and artifact hashes,
not credentials. The server uses its existing restricted App Store Connect API
key module. No Apple signing key or API key is required in GitHub Secrets.

The upload helper uses Apple's public [buildUploads API](https://developer.apple.com/documentation/appstoreconnectapi/build-uploads).
It validates the target App record, bundle identifier, and profile presence
before upload. Successful transport does not mean the build has passed Apple
processing. Verify processing status in App Store Connect, supply accurate beta
review details, and submit the build for external beta review before enabling
an external tester invitation or public link.

Signing preparation completed on 106: team `MWFPLU44U9`, distribution certificate
`H4FW83UZ5J`, bundle resource `JMHH7AD8NV`, App Store profile `XV622F5JAB`.
Certificate and profile expire on 2027-10-19. No other app's profile or
certificate was changed. This is preparation evidence; a real signed-build
upload and Apple processing must still be verified for each release.
