docker buildx build --file Dockerfile --tag discord-bot:common --load .
docker run -d --name discord-bot-container discord-bot:common tail -f /dev/null
docker exec -d discord-bot-container bash -c "cd ~/discord-bot/HoloSimpCart-Net && ./run_discord_bot.sh"
