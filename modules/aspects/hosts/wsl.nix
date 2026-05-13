{ den, ... }:
{
  den.aspects.wsl = {
    includes = [
      den.aspects.common
      den.aspects.dev
    ];
  };
}
