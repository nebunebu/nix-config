{
  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/etc/machine-id"
    ];
  };
}
