---
title: How to Replace git Branch
---

`git branch -m master main`
`git push origin --delete master`

```
Depending on your exact setup, this might have worked and the renaming is successful. In many cases, however, you will see an error message like the following one:

To https://github.com/gittower/git-crashcourse.git
! [remote rejected]   master (refusing to delete the current branch: refs/heads/master)
error: failed to push some refs to 'https://example@github.com/gittower/git-crashcourse.git'
```