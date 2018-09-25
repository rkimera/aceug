/etc/testfile:
 file.managed:
        – source: salt://rodgers/testfile
        – user: root
        – mode: 644
