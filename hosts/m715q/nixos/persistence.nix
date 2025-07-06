{
  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/etc/machine-id"
      "/var/lib/NetworkManager/"
      "/var/log"
    ];
  };
}
