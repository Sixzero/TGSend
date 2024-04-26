using TGSend: app, send_msg
@show app
send_msg()
@show app

#%%
using TGSend: app_start
app = app_start()
#%%
using TGSend: get_dialogs
d = @async get_dialogs()
@show d
@show fetch(d)