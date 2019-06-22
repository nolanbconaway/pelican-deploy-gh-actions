workflow "Build" {
  on = "push"
  resolves = [
    "Another Command",
  ]
}

action "Pipenv Install" {
  args = "install"
  uses = "jpeaceiris/actions-pipenv@3.7"
}

action "Another Command" {
  args = "echo done"
  uses = "jpeaceiris/actions-pipenv@3.7"
  needs = ["Pipenv Install"]

}
