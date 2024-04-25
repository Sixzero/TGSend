using SendTG: app, send_msg
@show app
send_msg()
@show app

#%%
using SendTG: app_start
app = app_start()
#%%
using SendTG: get_dialogs
d = @async get_dialogs()
@show d
@show fetch(d)