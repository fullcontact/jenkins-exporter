FROM python:3.6

# Install vault
RUN wget -O vault.zip https://releases.hashicorp.com/vault/1.1.3/vault_1.1.3_linux_amd64.zip && \
    unzip vault.zip && chmod +x vault && mv vault /usr/local/bin && rm vault.zip

# Install envconsul
RUN wget -O envconsul.tgz https://releases.hashicorp.com/envconsul/0.8.0/envconsul_0.8.0_linux_amd64.tgz && \
    tar zxvf envconsul.tgz && mv envconsul /usr/local/bin/envconsul && \
    chmod +x /usr/local/bin/envconsul && rm envconsul.tgz

WORKDIR /root/
COPY . .
RUN pip3.6 install -r requirements.txt

EXPOSE 9118
ENTRYPOINT [ "/bin/bash",  "entrypoint.sh" ]
