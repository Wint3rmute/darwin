{ pkgs, ... }:
{
  services = {
    pipewire = {
      enable = true;
      jack.enable = true;

      # Force PipeWire's clock rate and quantum (buffer size) so the
      # auto-started JACK server runs at low latency. This is the persistent
      # equivalent of:
      #   pw-metadata -n settings 0 clock.force-rate 48000
      #   pw-metadata -n settings 0 clock.force-quantum 128
      extraConfig.pipewire = {
        "10-clock-rate" = {
          "context.properties" = {
            "default.clock.rate" = 48000;
            "default.clock.quantum" = 128;
          };
        };
      };

      # Set every ALSA card to the "pro-audio" profile, which disables
      # resampling and lets the device run at its native rate. Equivalent to
      # choosing "pro-audio" in pavucontrol's configuration tab.
      wireplumber.extraConfig = {
        "10-pro-audio" = {
          "monitor.alsa.rules" = [
            {
              matches = [ { "device.name" = "alsa_card_*"; } ];
              actions = {
                "update-props" = {
                  "api.alsa.card.profile" = "pro-audio";
                };
              };
            }
          ];
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    jamulus
  ];
}
