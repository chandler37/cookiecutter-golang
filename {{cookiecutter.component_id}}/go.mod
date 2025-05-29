module github.com/{{cookiecutter.github_username}}/{{cookiecutter.component_id}}

go 1.22

require (
	{% if cookiecutter.use_logrus_logging == "y" -%}github.com/sirupsen/logrus v1.9.3{%- endif %}
	{% if cookiecutter.use_cobra_cmd == "y" -%}github.com/spf13/cobra v1.8.0{%- endif %}
	{% if cookiecutter.use_viper_config == "y" -%}github.com/spf13/viper v1.19.0{%- endif %}
)
