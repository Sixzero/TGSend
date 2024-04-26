import asyncio
from pyrogram import Client

api_id = "12345"
api_hash = "TELEGRAM_API_HASH"


async def main():
    async with Client("my_account", api_id, api_hash, session_string=TELEGRAM_SESSION_STRING) as app:
        await app.send_message("me", "Greetings from **Pyrogram**!!!")


asyncio.run(main())