FROM gitpod/workspace-full-vnc:latest

# install custom tools, runtime, etc.

# Install .NET CLI dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libc6 \
        libgcc1 \
        libgssapi-krb5-2 \
        libicu66 \
        libssl1.1 \
        libstdc++6 \
        zlib1g \
    && rm -rf /var/lib/apt/lists/*

# Install .NET Core SDK
ENV DOTNET_SDK_VERSION 6.0.100

RUN curl -SL --output dotnet.tar.gz https://aka.ms/dotnet/net6/preview1/daily/Sdk/dotnet-sdk-linux-x64.tar.gz \
    && mkdir -p /usr/share/dotnet \
    && tar -zxf dotnet.tar.gz -C /usr/share/dotnet \
    && rm dotnet.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

USER gitpod
# Apply user-specific settings
#ENV ...

# Give back control
USER root
