# Security Policy

## Supported Versions

| Version | Supported |
|---------|-----------|
| main    | Yes       |

## Reporting a Vulnerability

If you discover a security vulnerability, please report it by [opening a private issue](https://github.com/xtwoitx/BubuOS2/issues/new) or emailing the maintainer directly.

Please do **not** open a public issue for security vulnerabilities.

## Scope

BubuOS runs as a local application on a Raspberry Pi with no network-facing services. The main security considerations are:
- Sudoers rules for `nmcli` and `rfkill` (required for WiFi/Bluetooth management)
- No API keys or credentials stored in the codebase
