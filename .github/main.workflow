workflow "Build" {
  on = "push"
  resolves = [
    "Deploy",
  ]
}

action "Pipenv" {
  args = "pip install --upgrade pip && pip install pipenv && pipenv install"
  uses = "jefftriplett/python-actions@master"
  env = {
    PIPENV_VENV_IN_PROJECT = "true"
  }
}

action "Theme Install" {
  args = "git clone --recursive https://github.com/getpelican/pelican-themes themes"
  uses = "jefftriplett/python-actions@master"
  needs = ["Pipenv"]
}

action "Deploy" {
  args = "./deploy-to-gh-pages.sh"
  uses = "jefftriplett/python-actions@master"
  needs = ["Pipenv", "Theme Install"]
  secrets = ["ACCESS_TOKEN"]
}
