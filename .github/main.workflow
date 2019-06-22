workflow "Build" {
  on = "push"
  resolves = [
    "Pipenv",
  ]
}

action "Pipenv" {
  args = "pip install pipenv && pipenv install"
  uses = "jpeaceiris/actions-pipenv@3.7"
}
