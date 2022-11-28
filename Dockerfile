
FROM amd64/buildpack-deps:jammy-curl  AS build
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
FROM $REPO:6.0.11-jammy-amd64
ENV ASPNET_VERSION=6.0.11
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "CalcApiAppCodeInsideDevOps.dll"]
