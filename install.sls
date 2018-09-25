utilitler:
  pkg.installed:
    {% if grains[‘os’] == ‘CentOS‘ %}
    – name: nload
    {% elif grains[‘os’] == ‘Ubuntu‘ %}
    – name: nload
    {% elif grains[‘os’] == ‘FreeBSD‘ %}
    – name: nload
    {% endif %}
