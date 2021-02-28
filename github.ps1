#!/usr/bin/env pwsh
<#
Coptyright 2016 The HongJiang Library Authors. All rights reserved.
Use of this source code is governed by a Apache-style
license that can be found in the LICNESE file.

Git(Github.com) Client Commands.

@authors hjboss <hongjiangproject@gmail.com> 2021-03 $$
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

      Write-Warning "'$($args[1])' not found"
    }

    Write-Host '用法: github add <filename>'
    break
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

    Write-Host '用法: github ci [comment]'
    break
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

    Write-Host '用法: github co <owner> <repository> [user:pass]'
    break
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

      Write-Warning "'$($args[1])' not found"
    }

    Write-Host '用法: github rm <filename>'
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
    Write-Host '用法: github <subcommand> [args]'
    Write-Host '常用的子命令:'
    Write-Host '  add 添加文件内容至索引'
    Write-Host '  ci  记录变更到版本库并且更新至github.com'
    Write-Host '  co  将给定名称的版本库克隆到一个新目录'
    Write-Host '  rm  从工作区和索引中删除文件'
    Write-Host '  up  本地分支更新到最新版本'
    Write-Host '  st  显示工作区状态'
    break
  }
  'version'
  {
    Write-Host 'github version 1.0.0'
    break
  }
  default
  {
    Write-Host '使用github help得到用法'
  }
}
