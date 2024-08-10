{ config, ... }:

{
  palette = base: config.stylix.base16Scheme.palette.${base};
}
