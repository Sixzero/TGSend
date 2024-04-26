# printing the environment variables whether to check julia can see them.
api_id = get(ENV, "TELEGRAM_API_ID", "")
@show api_id
api_hash = get(ENV, "TELEGRAM_API_HASH", "")
@show api_hash
session_string = get(ENV, "TELEGRAM_SESSION_STRING", "")
@show session_string
;
#%%
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