base:  
  'I@environment:production and G@os_family:RedHat':
    - salt-minion
    - yum
    - hostname
