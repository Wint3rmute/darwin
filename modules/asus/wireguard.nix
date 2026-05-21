_: {
  age.secrets.wg2 = {
    file = ../../secrets/wireguard.age;
    path = "/etc/wireguard/wg2.conf";
    owner = "root";
    mode = "600";
    symlink = false;
  };
}
