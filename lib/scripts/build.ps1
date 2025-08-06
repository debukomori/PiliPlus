# lib/scripts/build.ps1

$build_time = [int][double]::Parse((Get-Date -UFormat %s))
$commit_hash = git rev-parse HEAD

$content = @"
class BuildConfig {
  static const int buildTime = $build_time;
  static const String commitHash = '$commit_hash';
}
"@

$content | Out-File -FilePath "lib/build_config.dart" -Encoding UTF8
