### Install aliview
aliview.install.run:
  file.managed:
    - name: /tmp/aliview.install.run
    - source: 'http://ormbunkar.se/aliview/downloads/linux/linux-versions-all/linux-version-1.23/aliview.install.run'
    - source_hash: sha1=33cf8520d64c4e890ee0f66511485fa4cec05f48
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: /tmp/aliview.install.run

### Install T-COFFEE
t-coffee.install:
  file.managed:
    - name: /tmp/T-COFFEE_installer_Version_11.00.8cbe486_linux_x64.bin
    - source: 'http://www.tcoffee.org/Packages/Stable/Latest/linux/T-COFFEE_installer_Version_11.00.8cbe486_linux_x64.bin'
    - source_hash: sha1=fdea8b0c43b1c9fbb3bb5c861575f8fe54afa9c1
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: /tmp/T-COFFEE_installer_Version_11.00.8cbe486_linux_x64.bin --unattendedmodeui minimalWithDialogs --mode unattended --prefix /root/tcoffee/Version_11.00.8cbe486 --user_email rkimera@rhsp.org

