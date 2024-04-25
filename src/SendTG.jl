module SendTG
using PyCall

export send_msg, send_doc

greet() = print("Hello World!")


api_id = get(ENV, "TELEGRAM_API_ID", "")
api_hash = get(ENV, "TELEGRAM_API_HASH", "")
session_string = get(ENV, "TELEGRAM_SESSION_STRING", "")

app::PyObject = PyNULL()
app_start() = begin
  global app
  pygram = pyimport("pyrogram")
  if app == PyNULL()
    phone_number = ""
    #  && (@sync @async app.stop())
    app = pygram.Client("sessions/$api_id", api_id=api_id, api_hash=api_hash, session_string=session_string)
    @sync @async app.start()
  end
end 
app_stop() = begin
  global app
  app = PyNULL()
end
#%%
send_msg(user="me", text="Hi") = @sync begin
  app_start()
  @time @async app.send_message(user, text)
  app_stop()
end
send_doc(user, filepath) = @sync begin
  app_start()
  @time @async app.send_document(user, filepath)
  app_stop()
end
function __init__()
  app_start()
  py"""
  async def get_dialogs_py(app):
    print("OK GOT CALLED")
    print("app,", app)
    dialogs = []
    # async for dialog in app.get_dialogs():
    #   dialogs.append(dialog)
    return dialogs
  """
end

function get_dialogs()
  app_start()
  res = py"""get_dialogs_py"""(app)
  # app_stop()
  res
end
end # module SendTG
