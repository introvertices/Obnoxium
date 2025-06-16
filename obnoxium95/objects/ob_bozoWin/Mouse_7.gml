image_index = 0

if (clickamount > 0){
    clickamount -=1
    text = "Hey Bozo! Ya got crumbs in my machine!!! You have 5 seconds to do " + string(clickamount) +" clicks on me or I'll 'splode ya dingus with a bunch of BAD STUFF!! HAHAH!!"
}

else if (clickamount <=0){
    clickamount = 0
    text = "Hey Bozo! Ya got crumbs in my machine!!! You have 5 seconds to do " + string(clickamount) +" clicks on me or I'll 'splode ya dingus with a bunch of BAD STUFF!! HAHAH!!"
    instance_destroy()
}
