#!/bin/bash

## DOC
## cat ~/.config/git/config | grep -A3 -B2 -E "template|alias"
##
## [commit]
##   template = "/tmp/git_commit_messagem"
##
## [alias]
##   a    = add -p
##   b    = branch
##   c    = "!f() { bash ~/.gitCOMMIT.sh ; }; f"
##



FZF='fzf
  --layout=reverse
  --border
  --margin=1
  --wrap
  --height 40%
  --highlight-line
  --color=border:red'

commit_type=$(mktemp /tmp/git.XXXXXX)
commit_scope=$(mktemp /tmp/git.XXXXXX)
commit_template='/tmp/git_commit_messagem'


echo "
build     Afetam o sistema de construção ou dependências externas (Ex: npm)
ci        Afetam configuração de Continus Integration e scripts (Ex: Travis, Pipe )
docs      Inclusão ou alteração somente de arquivos de documentação
feat      Novas funcionalidades e/ou novas implantações ao código
fix       Essencialmente definem o tratamento de correções de bugs
perf      Uma alteração de código que melhora o desempenho
style     Formatações na apresentação do código (Ex: espaço em branco)
test      Testes (Ex: TDD)
chore     Atualização de tarefas que não ocasionam alteração no código de produção
env       Modificações ou adições em arquivos de configuração
refactor  Mudanças no código, não alterem a funcionalidade (Ex: renames)
"| $FZF --prompt "Tipo " | awk -F ' ' '{print $1}' > $commit_type


git diff --name-only --cached |\
  $FZF --prompt "Escopo "     |\
  tr -d '\n| ' > $commit_scope

rm -rf $commit_template

paste ${commit_type} ${commit_scope} \
  | awk -F '\t' '{ printf "%s(%s): ", $1,$2 }' \
  >  $commit_template

\git commit
