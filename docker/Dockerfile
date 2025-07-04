# Use .NET 8 SDK ARM64 base image for clean dependency handling
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /src

# Copy projects
COPY src/HoloSimpCart-Net ./HoloSimpCart-Net
COPY src/MMOR.Utils ./MMOR.Utils

# Restore dependencies
RUN dotnet restore ./HoloSimpCart-Net

# Build and publish as single file, self-contained, without trimming
RUN dotnet publish ./HoloSimpCart-Net \
    -c Release \
    -r linux-arm64 \
    -o /app/publish

# Use smaller runtime image for final container
FROM mcr.microsoft.com/dotnet/runtime:8.0

WORKDIR /app

# Copy published files
COPY --from=build /app/publish .

# Copy .env if needed
COPY src/.env .env

# Ensure executable permission
RUN chmod +x ./RuTakingTooLong

# Use exec form to forward signals for graceful shutdown
ENTRYPOINT ["./RuTakingTooLong"]
