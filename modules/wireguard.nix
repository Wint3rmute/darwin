{age, ...}: {
  age.identityPaths = ["/Users/wint3rmute/.ssh/id_ed25519"];
  age.secrets.wg2 = {
    file = ../secrets/wireguard.age;
    path = "/etc/wireguard/wg2.conf";
    owner = "root";
    mode = "600";
    symlink = false;
  };
}
