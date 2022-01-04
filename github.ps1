#!/usr/bin/env pwsh
<#
Coptyright 2021 The HongJiang Library Authors. All rights reserved.
Use of this source code is governed by a Apache-style
license that can be found in the LICNESE file.

command line utility for Git (Github.com)

@authors hjboss <hongjiangproject@gmail.com> 2021-07 $$
@version 1.0.0
#>
switch ($args[0])
{
  'add'
  {
    if ($args.Count -eq 2)
    {
      if ((Test-Path -Path $args[1]) -eq $True)
      {
        git add $args[1]
        Exit
      }

      Write-Warning "not found '$($args[1])'"
    }

    Write-Host '用法: github add <FILENAME>'
    Break
  }
  'cb'
  {
    if ($args.Count -ge 2)
    {
      if ($args.Count -ge 3)
      {
        git commit -a -m $args[2]
      }
      else
      {
        git commit -a -m 'Initial commit'
      }

      git push -u origin $args[1]
      Exit
    }

    Write-Host '用法: github cb <BRANCH> [COMMENT]'
    Break
  }
  'ci'
  {
    if ($args.Count -lt 3)
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
      Exit
    }

    Write-Host '用法: github ci [COMMENT]'
    Break
  }
  'co'
  {
    if ($args.Count -ge 3)
    {
      if ($args[3] -like '*:*')
      {
        git clone "https://$($args[3])@github.com/$($args[1])/$($args[2]).git"
      }
      else
      {
        git clone "https://github.com/$($args[1])/$($args[2]).git"
      }

      Exit
    }

    Write-Host '用法: github add <OWNER> <REPOSITORY> [USER:PASS]'
    Break
  }
  'rm'
  {
    if ($args.Count -eq 2)
    {
      if ((Test-Path -Path $args[1]) -eq $True)
      {
        git rm $args[1]
        Exit
      }

      Write-Warning "not found '$($args[1])'"
    }

    Write-Host '用法: github rm <FILENAME>'
    break
  }
  'up'
  {
    if ($args.Count -lt 2)
    {
      git pull
      Exit
    }

    Write-Host '用法: github up'
    break
  }
  'st'
  {
    if ($args.Count -lt 2)
    {
      git status
      Exit
    }

    Write-Host '用法: github st'
    break
  }
  'help'
  {
    Write-Host '用法: github <COMMAND> [OPTIONS]'
    Write-Host 'COMMAND:'
    Write-Host '  add 添加給定文件至本地分支'
    Write-Host '  ci  提交記錄信息且同步至遠程版本庫'
    Write-Host '  co  克隆給定名稱的版本庫至新建目錄'
    Write-Host '  rm  刪除本地分支裡給定文件'
    Write-Host '  up  更新本地分支至最新版本'
    Write-Host '  st  顯示本地分支記錄信息'
    Break
  }
  'version'
  {
    Write-Host 'github version 1.0.0'
    Break
  }
  default
  {
    Write-Host '使用github help得到用法'
  }
}