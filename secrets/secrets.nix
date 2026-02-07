let
  dell_laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL4J/z6NK0/aBQcei+rES1fLAOb2domvs/Iie5pdEeMt wint3rmute@baczek";
  m4 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM/OpGS/24hCbC+FJNhXkavCs2G15S/gpUHqlqiM77bn wint3rmute@x260";
  users = [dell_laptop m4];
in {
  "wireguard.age".publicKeys = users;
}
