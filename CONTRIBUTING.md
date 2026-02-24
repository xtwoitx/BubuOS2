# Contributing to BubuOS

Thanks for your interest in BubuOS!

## Getting Started

1. Fork the repo
2. Clone to your machine: `git clone https://github.com/YOUR_USER/bubuos.git`
3. Follow the install instructions in [README.md](README.md)

## Development

BubuOS runs on **Python 3 + pygame** with a 640x480 screen and 10-button gamepad input (D-pad, A/B/X/Y, Start/Select).

**Project structure:**
```
bubuos/
  main.py          — entry point, splash screen, system loop
  core/            — shell, renderer, input handler, theme, widgets
  apps/            — each app in its own folder (weather/, snake/, etc.)
  assets/          — fonts, animations, icons
  setup/           — systemd services, install script
```

**To add a new app:**
1. Create a folder in `apps/` with `app.py` and `__init__.py`
2. Subclass `core.app.App` — implement `handle_input()` and `draw()`
3. Register it in `core/shell.py`

## Guidelines

- Keep it simple — this runs on a tiny screen with limited input
- Test on real hardware if possible (GPi Case 2 + CM4)
- No external API keys — use free/open APIs only
- Match the existing visual style (warm cream theme, DOS-like UI)

## Reporting Bugs

Use the [Bug Report](https://github.com/xtwoitx/bubuos/issues/new?template=bug_report.md) template. Include logs from `journalctl -u bubuos`.

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
