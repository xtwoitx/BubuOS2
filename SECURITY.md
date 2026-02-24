# Security Policy

## Supported Versions

| Version | Supported |
|---------|-----------|
| main    | Yes       |

## Reporting a Vulnerability

If you discover a security vulnerability, please report it by [opening a private issue](https://github.com/xtwoitx/BubuOS2/issues/new) or emailing the maintainer directly.

Please do **not** open a public issue for security vulnerabilities.

## Scope

BubuOS runs as a local application on a Raspberry Pi. It does not expose any network-facing services (no open ports, no servers). Some apps make outgoing requests to public APIs (weather, web radio, geolocation) but no incoming connections are accepted.

Security considerations:
- Sudoers rules for `nmcli` and `rfkill` (required for WiFi/Bluetooth management)
- No API keys or credentials stored in the codebase
- All external APIs used are free and keyless (Open-Meteo, ip-api.com)
