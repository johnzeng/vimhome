#!/bin/bash

vimpath=`dirname ~`/`whoami`/.vim

# what if some body already has a post-checkout...
echo '#!/bin/bash' > .git/hooks/post-checkout
echo ${vimpath}"/bundle/vim-erlang-tags/bin/vim-erlang-tags.erl" > .git/hooks/post-checkout
chmod +x .git/hooks/post-checkout
cp -i .git/hooks/post-checkout .git/hooks/post-commit
