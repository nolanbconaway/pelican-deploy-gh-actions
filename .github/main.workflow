workflow "Build" {
  on = "push"
  resolves = [
    "Deploy",
  ]
}

action "Upgrade Pip" {
  args = "pip install --upgrade pip"
  uses = "jefftriplett/python-actions@master"
}

action "Pipenv" {
  args = "pip install pipenv && pipenv install"
  uses = "jefftriplett/python-actions@master"
  env = {
    PIPENV_VENV_IN_PROJECT = "true"
  }
  needs = ["Upgrade Pip"]
}

action "Deploy" {
  args = "./deploy-to-gh-pages.sh"
  uses = "jefftriplett/python-actions@master"
  needs = ["Pipenv"]
  secrets = ["ACCESS_TOKEN"]
}
