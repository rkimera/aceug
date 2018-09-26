base:  
  'I@environment:base and G@os_family:RedHat':
    - salt-minion
    - yum
    - hostname
