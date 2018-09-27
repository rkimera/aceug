{% for name, user in pillar.get('users', {}).items() if user.absent is not defined or not user.absent %}
{%- if user == None -%}
{%- set user = {} -%}
{%- endif -%}
{%- set home = user.get('home', "/home/%s" %name) -%}
{%- set user_group = name -%}

(% for group in user.get('groups', []) %}
users_{{name}}_{{group}}_group:
  group:
    - name: {{group}} 
    - present
{% endfor %}

users_{{name}}_user:
  group.present:
    - name: {{user_group}}
  user.present:
    - name: {{ name }}
    - home: {{ home }}
    - shell: {{ user.get('shell')}}
    - password: '{{ user['password'] }}'
    - fullname: {{ user['fullname'] }}
    - groups:
      - {{ user_group }}
      {% for group in user.get('groups', []) %}
      - {{ group }}
      {% endfor %}
      
{% if 'ssh_auth' in user %}
{% for auth in user['ssh_auth'] %}
users_ssh_auth_{{name}}_{{loop.index0 }}:
  ssh_auth.present:
    - user: {{ name }}
    - name: {{ auth }}
{% endfor %}
{% endif %}

