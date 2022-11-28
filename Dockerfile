# https://hub.docker.com/_/microsoft-dotnet-core
FROM mcr.microsoft.com/dotnet/core/sdk:6.0 AS build
WORKDIR /CalcApiAppCodeInsideDevOps

# copy csproj and restore as distinct layers
COPY *.sln .
COPY CalcApiAppCodeInsideDevOps/*.csproj ./CalcApiAppCodeInsideDevOps/
RUN dotnet restore

# copy everything else and build app
COPY CalcApiAppCodeInsideDevOps/. ./CalcApiAppCodeInsideDevOps/
WORKDIR /CalcApiAppCodeInsideDevOps
RUN dotnet publish -c release -o /app --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "CalcApiAppCodeInsideDevOps.dll"]
