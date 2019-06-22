
FROM python:3.7

LABEL "com.github.actions.name"="GitHub Action for Python"
LABEL "com.github.actions.description"="Wraps the Python CLI to enable common python/pip commands."
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="blue"

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY LICENSE README.md entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]