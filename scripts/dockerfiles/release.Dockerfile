FROM mcr.microsoft.com/dotnet/sdk:5.0

COPY *.csproj .
COPY *.cs .

RUN mkdir /release \
 && mkdir /release/linux-x64 \
 && mkdir /release/win-x64

RUN dotnet publish \
    -c Release \
    -r win-x64 \
    --no-self-contained  \
    /p:PublishSingleFile=true \
    -o /release/win-x64

RUN dotnet publish \
    -c Release \
    -r linux-x64 \
    --no-self-contained  \
    /p:PublishSingleFile=true \
    -o /release/linux-x64

VOLUME /release