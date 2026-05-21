# ❄️ My NixOS configuration

Personal NixOS configuration based on flakes and [Den](https://den.denful.dev/)
to build a configuration following the dendritic pattern.

The goal is to structure the system into modular aspects so each profile only
inherits what it needs, avoiding a hard-to-maintain monolith.

## What's included

- Machine profiles for `zenix`, `desktop`, `vm`, and `wsl`.
- A single main user: `warbacon`, with Home Manager integrated.

> [!NOTE]
> This configuration is intended for personal use. Use this repository as
> reference material at your own risk.
