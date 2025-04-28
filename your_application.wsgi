services:
  - type: web
    name: my-playwright-app
    env: python
    buildCommand: pip install -r requirements.txt && playwright install
    startCommand: gunicorn -w 4 wsgi:app
