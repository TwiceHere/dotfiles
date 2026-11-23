{pkgs, ...}: {
  xdg.desktopEntries.whatsapp = {
    name = "Whatsapp";
    exec = "brave --app=https://web.whatsapp.com";
    icon = "whatsapp";
    terminal = false;
  };
}
