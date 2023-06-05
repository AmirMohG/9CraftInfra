import asyncio import os from aiohttp import web
v
app = web.Application()


async def run_build():
    await asyncio.sleep(0)
    os.system("./builder.sh")


async def subscription_handler(request):
    asyncio.create_task(run_build())
    return web.Response(status=200)

app.add_routes([web.post('/webhook', subscription_handler)])


if __name__ == "__main__":
    web.run_app(app, port=30007)

