{ config, ... }:

{
  sops = {
    secrets = {
      openvpn-static = { };
      pia-auth = { };
      crl-verify = { };
      ca = { };
    };
  };

  services.openvpn.servers = {
    us-tennessee = {
      autoStart = false;
      config = ''
        client
        dev tun
        proto udp
        remote us-tennessee-pf.privacy.network 1198
        resolv-retry infinite
        nobind
        persist-key
        persist-tun
        cipher aes-128-cbc
        auth sha1
        tls-client
        remote-cert-tls server
        route 172.17.0.0 255.255.255.0 net_gateway

        auth-user-pass ${config.sops.secrets.pia-auth.path}
        compress
        verb 1
        reneg-sec 0
        crl-verify ${config.sops.secrets.crl-verify.path}
        ca ${config.sops.secrets.ca.path}

        disable-occ
      '';
    };

    us-newjersey = {
      autoStart = false;
      config = ''
        client
        dev tun
        proto udp
        remote us-newjersey-pf.privacy.network 1198
        resolv-retry infinite
        nobind
        persist-key
        persist-tun
        cipher aes-128-cbc
        auth sha1
        tls-client
        remote-cert-tls server
        route 172.17.0.0 255.255.255.0 net_gateway

        auth-user-pass ${config.sops.secrets.pia-auth.path}
        compress
        verb 1
        reneg-sec 0
        crl-verify ${config.sops.secrets.crl-verify.path}
        ca ${config.sops.secrets.ca.path}

        disable-occ
      '';
    };
  };
}
