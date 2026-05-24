# ❄️ My NixOS configuration

> [!NOTE]
> This configuration is purely for personal use. Use this repository as
> reference material at your own risk.

I hate the arbitrary separation between my NixOS and Home Manager configs. At
the end of the day, it's all my system. Since I'm the only user on my machines,
I've bundled NixOS and Home Manager settings into the exact same file per
module. It makes importing them a breeze and kills the need for redundant
options.

Is this setup weird and unconventional? Absolutely. Does it work flawlessly for
me? You bet. Funny story: this was actually my very first approach when I jumped
into NixOS, but I abandoned it back then because it felt "too weird" and nobody
else was doing it. I thought I was doing it wrong. Oh boy, I didn't know I
cooked.

## What's included

- Machine profiles for `zenix`, `desktop`, `vm`, and `wsl`.
- A single main user: `warbacon`, with Home Manager deeply integrated.
