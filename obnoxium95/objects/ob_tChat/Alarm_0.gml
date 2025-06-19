alarm[0] = irandom_range(50,500)

var currTime = date_time_string(date_current_datetime())

array_push(currentChat,get_random_chat_message())

if (array_length(currentChat) > 20){
    array_delete(currentChat,0,1)
}