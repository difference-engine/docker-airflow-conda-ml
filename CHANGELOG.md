# 1.10.3-build0

Moving to python 3.6.9

* conda
  - ML & EDA: `keras matplotlib numpy pandas python-annoy scipy seaborn`
  - Web: `django djangorestframework flask=1.0.3 flask-admin flask-compress flask-cors flask-httpauth flask-jwt-extended flask-login flask-migrate flask-rest-jsonapi flask-sqlalchemy gunicorn waitress pymysql sqlite statsmodels alembic`
  - other: `cryptography pyasn1 pytz pyyaml sshtunnel xz yaml zlib`
  - development: `autopep8 black flake8 pylint pylint-flask pylint-plugin-utils jedi bandit mypy coverage isort pycodestyle pydocstyle vulture yapf pyflakes ipython ipython_genutils jupyterlab jupyterlab_server  pytest pytest-arraydiff pytest-cov pytest-django pytest-flake8 pytest-flask pytest-remotedata pytest-runner pytest-watch`

* pip
  - airflow: `apache-airflow[crypto,celery,postgres,jdbc,mysql,ssh,s3,password,google_auth]==1.10.3`
  - other: `psycopg2-binary==2.8.3 redis==3.3.4`
