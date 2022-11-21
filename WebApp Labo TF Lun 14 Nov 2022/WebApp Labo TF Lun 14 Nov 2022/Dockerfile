FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["WebApp Labo TF Lun 14 Nov 2022/WebApp Labo TF Lun 14 Nov 2022.csproj", "WebApp Labo TF Lun 14 Nov 2022/"]
RUN dotnet restore "WebApp Labo TF Lun 14 Nov 2022/WebApp Labo TF Lun 14 Nov 2022.csproj"
COPY . .
WORKDIR "/src/WebApp Labo TF Lun 14 Nov 2022"
RUN dotnet build "WebApp Labo TF Lun 14 Nov 2022.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "WebApp Labo TF Lun 14 Nov 2022.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WebApp Labo TF Lun 14 Nov 2022.dll"]
