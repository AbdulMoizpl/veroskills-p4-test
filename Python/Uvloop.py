import asyncio
import uvloop
loop = uvloop.new_event_loop()
asyncio.set_event_loop(loop)