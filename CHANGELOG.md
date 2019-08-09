# 1.10.3-build2

Upgrades flask-appbuilder and adds superset.  Changes env name to `build`

## Included in the docker image and conda.yml
* Python (conda)
  - python=3.6.9

* ML (conda)
  - cerberus
  - jupyterlab
  - keras
  - matplotlib
  - numpy
  - scipy
  - seaborn
  - opencv
  - pandas
  - python-annoy
  - ipython

* Common (conda)
  - cryptography
  - pyasn1
  - pytest=5.0.1
  - pytest-runner
  - pytest-watch
  - pytest-arraydiff
  - pyyaml
  - pytz
  - pip
  - xz
  - yaml
  - zlib

* Web (conda)
  - gunicorn
  - waitress=1.3.0
  - superset=0.33.0rc1
  - redis-py=3.3.6
  - text-unidecode=1.2
  - autopep8=1.4.4
  - black=19.3b0
  - coverage=4.5.4
  - django=2.2.4
  - flake8=3.7.8
  - flask-jwt-extended=3.20.0
  - flask=1.0.3
  - isort=4.3.21
  - pyjwt=1.7.1
  - pylint=2.3.1

* Airflow (pip)
  - apache-airflow[async,celery,crypto,postgres,password,s3,redis,sendgrid,slack,ssh]==1.10.3

* Web (pip)
  - python-slugify==3.0.3
  - flask-appbuilder==2.1.9
  - sqlalchemy==1.3.6



# 1.10.3-build1

We now have a conda.yml and conda-production.yml.  conda-prod removes all the development dependencies that are included in conda.yml.  Use conda.yml on your dev machine.

## Python version
  This is still 3.6.9

## In the docker
* conda
  - ML & Data: `keras matplotlib numpy pandas python-annoy scipy seaborn opencv cerberus`
  - Web: `flask=1.0.3 waitress gunicorn alembic sqlalchemy`
  - other: `cryptography pyasn1 pytz pyyaml pyjwt sshtunnel xz yaml zlib pytest pytest-arraydiff pytest-runner pytest-watch pymysql`
  - development: `ipython jupyterlab`
* pip
  - airflow: `apache-airflow[crypto,celery,postgres,mysql,jdbc,ssh,s3,password,google_auth]==1.10.3`
  - other: `psycopg2-binary==2.8.3 redis==3.3.4 python-slugify==3.0.3`

# In conda.yml
The above and

* conda
  - Web: `django flask-appbuilder`
  - development: `autopep8 black flake8 pylint pylint-flask pylint-plugin-utils coverage isort`

# 1.10.3-build0

Moving to python 3.6.9

* conda
  - ML & Data: `keras matplotlib numpy pandas python-annoy scipy seaborn`
  - Web: `django djangorestframework flask=1.0.3 flask-admin flask-compress flask-cors flask-httpauth flask-jwt-extended flask-login flask-migrate flask-rest-jsonapi flask-sqlalchemy gunicorn waitress pymysql sqlite statsmodels alembic`
  - other: `cryptography pyasn1 pytz pyyaml sshtunnel xz yaml zlib`
  - development: `autopep8 black flake8 pylint pylint-flask pylint-plugin-utils jedi bandit mypy coverage isort pycodestyle pydocstyle vulture yapf pyflakes ipython ipython_genutils jupyterlab jupyterlab_server  pytest pytest-arraydiff pytest-cov pytest-django pytest-flake8 pytest-flask pytest-remotedata pytest-runner pytest-watch`

* pip
  - airflow: `apache-airflow[crypto,celery,postgres,jdbc,mysql,ssh,s3,password,google_auth]==1.10.3`
  - other: `psycopg2-binary==2.8.3 redis==3.3.4`
