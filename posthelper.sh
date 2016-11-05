newpost(){
    post_file="posts/$1.md"
    hugo new $post_file
    vi $HUGO_HOME/content/$post_file
}

lspost(){
   la $HUGO_HOME/content/posts
}

openpost(){
    vi $HUGO_HOME/content/posts/$1.md
}


alias newpost=newpost
alias lspost=lspost
alias openpost=openpost
