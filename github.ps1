#!/usr/bin/env pwsh
<#
Coptyright 2016 The HongJiang Library Authors. All rights reserved.
Use of this source code is governed by a Apache-style
license that can be found in the LICNESE file.

Git(Github.com) Client Commands.

@authors hjboss <hongjiangproject@gmail.com> 2018-04 $$
@version 1.0.0
#>
switch ($args[0]) {
  'add'
  {
    if (($args.Count -lt 2) -or ($args[1] -eq '*'))
    {
      git add --all
    }
    else
    {
      for ($idx = 1; $idx -lt $args.Count; $idx++)
      {
        git add $args[$idx]
      }
    }
    break
  }
  'ci'
  {
    if ($args.Count -lt 2)
    {
      git commit -a -m 'Initial commit'
    }
    else
    {
      git commit -a -m $args[1]
    }

    git push -u origin master
    break
  }
  Default
  {
    Write-Host '使用github help得到用法'
  }
}
