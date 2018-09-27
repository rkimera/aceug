#### DEFAULTS/INIT.SLS --- Configuration settings common to all Salt minions

####
#### SALT-FORMULA
####

salt:
  minion:
    master: ip-172-31-26-84.us-west-2.compute.internal
    hash_type: sha256

    ## diagnose minion disconnect/return issues
    zmq_monitor: True
    ping_interval: 300
    auth_safemode: True

    ## stagger startup/re-auth attempts
    random_startup_delay: 300
    return_retry_timer_max: 300

    ## increase the 0mq reconnect window to 60s
    recon_default: 1000
    recon_max: 59000
    recon_randomize: True

    ## work around possible TCP connection issues
    tcp_keepalive: True
    tcp_keepalive_idle: 75
    tcp_keepalive_cnt: 9
    tcp_keepalive_intvl: 75

    
####
#### USERS-FORMULA
####

{%- import_text "defaults/ssh_rkimera_01.pub" as ssh_rkimera_01_pub %}
{%- import_text "defaults/ssh_rkimera_02.pub" as ssh_rkimera_02_pub %}

{%- if grains['os_family'] == 'Windows' %}

users:
  critical: &admin-user-template
    createhome:
      False
    prime_group:
      name:
        Administrators
    shell:
      False
    enforce_password:
      True

  Administrator: *admin-user-template

{%- else %}

users:
  critical: &root-user-template
    enforce_password:
      True
    ## Make sure to move revoked/replaced/compromised keys to the
    ## ssh_auth.absent list to ensure their deprovisioning.
    ssh_auth:
      - {{ ssh_rkimera_01_pub|yaml_encode }}
      - {{ ssh_rkimera_02_pub|yaml_encode }}
   
    
  root:
    <<: *root-user-template
    home: /root

{%- endif %}

####
#### SUDOERS-FORMULA
####

sudoers:
  aliases:
    commands:
      REBOOT:
        - /sbin/halt
        - /sbin/reboot
        - /sbin/poweroff
  defaults:
    generic:
      # - log_input             # enable command input logging (potentially insecure)
      - log_output              # enable command output logging
      - mail_badpass            # email root upon sudo login failures
      - env_reset               # reset the environment
      ## reset the executable search path
      - secure_path="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"
    command_list:
      ## don't log output of following commands
      /usr/sbin/sudoreplay: '!log_output'
      /usr/local/sbin/sudoreplay: '!log_output'
      REBOOT: '!log_output'
  users:
    critical:
      - 'ALL=(ALL) ALL'
    root:
      - 'ALL=(ALL) NOPASSWD: ALL'
  groups:
    'Domain\ Admins':
      - 'ALL=(ALL) ALL'
    'Unix\ Admins':
      - 'ALL=(ALL) ALL'

####
#### ALIASES SLS
####

aliases:
  root: root@ibrsp.org

####
#### FIREWALLD-FORMULA
####

firewalld:
  enabled:
    {{ not salt.grains.get('biosversion').endswith('amazon') }}
  default_zone: public
  services:
    mosh:
      description:
        Remote terminal application that allows roaming, supports
        intermittent connectivity, and provides intelligent local echo
        and line editing of user keystrokes.  Mosh is a replacement
        for SSH.  It\'s more robust and responsive, especially over
        Wi-Fi, cellular, and long-distance links.
      ports:
        udp:
          - 60000-61000
    salt-master:
      description:
        Salt is a new approach to infrastructure management built on a
        dynamic communication bus.  Salt can be used for data-driven
        orchestration, remote execution for any infrastructure,
        configuration management for any app stack, and much more.
      ports:
        tcp:
          - 4505-4506
  zones:
    public:
      short: Public
      description:
        For use in public areas.  You do not trust the other computers
        on networks to not harm your computer.  Only selected incoming
        connections are accepted.
      services:
        - mosh
        - ssh
        - dhcpv6-client
        - snmp



#### DEFAULTS/INIT.SLS ends here.
