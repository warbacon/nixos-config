{ den, ... }:
{
  den.aspects.warbacon = {
    includes = [ den.batteries.define-user ];

    user = {
      description = "Joaquín Guerra";
      extraGroups = [ "wheel" ];
    };
  };
}
