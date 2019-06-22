workflow "Build" {
  on = "push"
  resolves = [
    "Pipenv",
  ]
}

action "Export Env Variables" {
  args = "export PIPENV_VENV_IN_PROJECT=true"
  uses = "jefftriplett/python-actions@master"
}

action "Upgrade Pip" {
  args = "pip install --upgrade pip"
  uses = "jefftriplett/python-actions@master"
  needs = ["Export Env Variables"]
}

action "Pipenv" {
  args = " pip install pipenv && pipenv install"
  uses = "jefftriplett/python-actions@master"
  needs = ["Upgrade Pip"]
}
