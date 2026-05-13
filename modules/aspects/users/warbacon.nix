{ den, ... }:
{
  den.aspects.warbacon = {
    includes = [
      den.batteries.primary-user
      den.batteries.host-aspects
    ];

    user.description = "Joaquín Guerra";
  };
}
